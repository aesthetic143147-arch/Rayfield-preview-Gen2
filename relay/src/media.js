// Custom nameplate images and GIFs. Roblox can't play a GIF, so the relay turns one into a sprite
// sheet: every frame cut to the plate's shape and packed into a grid no bigger than 1024x1024
// (Roblox scales larger images down, which would break the grid). The script then steps through
// the grid. A still image is simply a one-frame sheet.
import { createHash } from 'node:crypto';
import sharp from 'sharp';

// Where images may come from. Keeps the relay from fetching arbitrary addresses on a player's say.
export const DEFAULT_HOSTS = [
    'cdn.discordapp.com',
    'media.discordapp.net',
    'i.imgur.com',
    'media.tenor.com',
    'c.tenor.com',
    'media.giphy.com',
    'i.giphy.com',
    'raw.githubusercontent.com',
    'tr.rbxcdn.com',
];

// Page links players paste; their scripts turn these into the image itself.
export const PAGE_HOSTS = ['tenor.com', 'giphy.com', 'imgur.com'];

const MAX_BYTES = 8 * 1024 * 1024;
const MAX_SIDE = 1024;

// frame size per shape: a banner fills the card, a square fills the logo spot
export const FITS = {
    banner: { width: 320, height: 80 },
    square: { width: 160, height: 160 },
};

export const mediaId = (url, fit) => createHash('sha1').update(`${fit}|${url}`).digest('hex').slice(0, 16);

// A player's link, checked before it's shared: https, from an allowed host (or a Tenor, Giphy or
// Imgur page), and not absurdly long.
export function checkLink(url, hosts = DEFAULT_HOSTS) {
    let parsed;
    try {
        parsed = new URL(url.trim());
    } catch {
        throw new MediaError('That isn’t a valid link.');
    }
    if (parsed.protocol !== 'https:') throw new MediaError('Links must start with https://');
    if (!allowedHost(parsed.hostname, [...hosts, ...PAGE_HOSTS])) {
        throw new MediaError(`Images can come from: ${[...hosts, ...PAGE_HOSTS].join(', ')}`);
    }
    if (parsed.href.length > 500) throw new MediaError('That link is too long.');
    return parsed.href;
}

function allowedHost(hostname, hosts) {
    return hosts.some((host) => hostname === host || hostname.endsWith(`.${host}`));
}

// Download an image from an allowed host, following at most three redirects, each of which must
// also land on an allowed host.
export async function fetchImage(url, { hosts = DEFAULT_HOSTS, fetcher = fetch, maxBytes = MAX_BYTES } = {}) {
    let target = url;
    for (let hop = 0; hop < 4; hop++) {
        let parsed;
        try {
            parsed = new URL(target);
        } catch {
            throw new MediaError('That isn’t a valid link.');
        }
        if (parsed.protocol !== 'https:') throw new MediaError('Links must start with https://');
        if (!allowedHost(parsed.hostname, hosts)) {
            throw new MediaError(`Images can come from: ${hosts.join(', ')}`);
        }
        const res = await fetcher(parsed.href, { redirect: 'manual' });
        if (res.status >= 300 && res.status < 400 && res.headers.get('location')) {
            target = new URL(res.headers.get('location'), parsed).href;
            continue;
        }
        if (!res.ok) throw new MediaError('Couldn’t download that image.');
        const type = res.headers.get('content-type') ?? '';
        if (!type.startsWith('image/')) throw new MediaError('That link isn’t an image.');
        const length = Number(res.headers.get('content-length') ?? 0);
        if (length > maxBytes) throw new MediaError('That image is too big (8 MB at most).');
        const buffer = Buffer.from(await res.arrayBuffer());
        if (buffer.length > maxBytes) throw new MediaError('That image is too big (8 MB at most).');
        return buffer;
    }
    throw new MediaError('Too many redirects.');
}

// Cut every frame to the fit's shape and pack them into one PNG grid. Long GIFs keep an evenly
// spaced selection of frames, with the frame rate adjusted so they still play at their speed.
export async function toSheet(buffer, fit = 'banner') {
    const size = FITS[fit] ?? FITS.banner;
    let meta;
    try {
        meta = await sharp(buffer, { animated: true }).metadata();
    } catch {
        throw new MediaError('That file couldn’t be read as an image.');
    }
    const pages = Math.max(meta.pages ?? 1, 1);
    const columns = Math.floor(MAX_SIDE / size.width);
    const rowsMax = Math.floor(MAX_SIDE / size.height);
    const capacity = columns * rowsMax;
    const count = Math.min(pages, capacity);
    const picks = Array.from({ length: count }, (_, i) => Math.floor((i * pages) / count));

    const delays = Array.isArray(meta.delay) ? meta.delay : [];
    const total = delays.length ? delays.reduce((sum, d) => sum + (d > 10 ? d : 100), 0) : pages * 100;
    const fps = pages > 1 ? Math.min(Math.max(count / (total / 1000), 1), 30) : 0;

    const tiles = await Promise.all(
        picks.map(async (page, i) => ({
            input: await sharp(buffer, { page, pages: 1 })
                .resize(size.width, size.height, { fit: 'cover', position: 'attention' })
                .png()
                .toBuffer(),
            left: (i % columns) * size.width,
            top: Math.floor(i / columns) * size.height,
        })),
    );
    const rows = Math.ceil(count / columns);
    const png = await sharp({
        create: {
            width: Math.min(count, columns) * size.width,
            height: rows * size.height,
            channels: 4,
            background: { r: 0, g: 0, b: 0, alpha: 0 },
        },
    })
        .composite(tiles)
        .png({ compressionLevel: 9 })
        .toBuffer();

    return {
        png,
        meta: {
            frames: count,
            columns: Math.min(count, columns),
            frameWidth: size.width,
            frameHeight: size.height,
            fps: Math.round(fps * 100) / 100,
            fit,
        },
    };
}

export class MediaError extends Error {}

// Converted sheets, by id, kept in memory and (with `dir`) on disk so a restart doesn't redo them.
export function createMediaStore({ dir, hosts = DEFAULT_HOSTS, fetcher = fetch, fs } = {}) {
    const metas = new Map();
    const pngs = new Map();
    const pending = new Map();
    return {
        hosts,
        async add(url, fit = 'banner') {
            if (!FITS[fit]) fit = 'banner';
            const id = mediaId(url, fit);
            if (metas.has(id)) return metas.get(id);
            if (pending.has(id)) return pending.get(id);
            const work = (async () => {
                const buffer = await fetchImage(url, { hosts, fetcher });
                const { png, meta } = await toSheet(buffer, fit);
                const full = { id, ...meta };
                metas.set(id, full);
                if (dir && fs) {
                    fs.mkdirSync(dir, { recursive: true });
                    fs.writeFileSync(`${dir}/${id}.png`, png);
                } else {
                    pngs.set(id, png);
                }
                return full;
            })();
            pending.set(id, work);
            try {
                return await work;
            } finally {
                pending.delete(id);
            }
        },
        read(id) {
            if (!/^[a-f0-9]{16}$/.test(id)) return null;
            if (pngs.has(id)) return pngs.get(id);
            if (dir && fs) {
                try {
                    return fs.readFileSync(`${dir}/${id}.png`);
                } catch {
                    return null;
                }
            }
            return null;
        },
    };
}
