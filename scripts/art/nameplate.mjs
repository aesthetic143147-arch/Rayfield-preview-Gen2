// Renders the nameplate artwork in assets/. Dev-only, not part of the library:
//   node scripts/art/nameplate.mjs   (needs Playwright; CHROMIUM_PATH to use a local Chromium)
//
//   nameplate-galaxy.png  the default backdrop: a spiral galaxy tilted like the Omnity mark
//   nameplate-glow.png    a soft white radial glow, tinted in-game, for the halo behind the logo
// omnity-logo.png is the real logo, trimmed from the original artwork, not rendered here.
import { chromium } from 'playwright';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const out = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../../assets');

// Runs in the page. Seeded so the artwork is the same every render.
function drawGalaxy() {
    const c = document.createElement('canvas');
    c.width = 1024;
    c.height = 256;
    document.body.append(c);
    const g = c.getContext('2d');
    let seed = 7;
    const rand = () => ((seed = (seed * 16807) % 2147483647) / 2147483647);
    const gauss = () => (rand() + rand() + rand() - 1.5) / 1.5;

    // deep space, a shade lighter toward the galaxy
    const sky = g.createLinearGradient(0, 0, 1024, 0);
    sky.addColorStop(0, '#04060C');
    sky.addColorStop(0.55, '#070C1A');
    sky.addColorStop(1, '#0A1226');
    g.fillStyle = sky;
    g.fillRect(0, 0, 1024, 256);

    // nebula haze
    for (const [x, y, r, color] of [
        [720, 120, 260, 'rgba(59,130,246,0.16)'],
        [860, 60, 180, 'rgba(147,197,253,0.10)'],
        [560, 200, 200, 'rgba(99,102,241,0.08)'],
    ]) {
        const n = g.createRadialGradient(x, y, 0, x, y, r);
        n.addColorStop(0, color);
        n.addColorStop(1, 'rgba(0,0,0,0)');
        g.fillStyle = n;
        g.fillRect(0, 0, 1024, 256);
    }

    // background stars
    for (let i = 0; i < 380; i++) {
        const a = 0.15 + rand() * 0.6;
        g.fillStyle = `rgba(219,234,254,${a * a})`;
        const s = rand() < 0.06 ? 1.4 : 0.7;
        g.fillRect(rand() * 1024, rand() * 256, s, s);
    }

    // the galaxy: two logarithmic arms, flattened and tilted like the mark
    const cx = 760, cy = 128, tilt = -0.42, flat = 0.42;
    g.globalCompositeOperation = 'lighter';
    for (let arm = 0; arm < 2; arm++) {
        for (let i = 0; i < 9000; i++) {
            const t = Math.pow(rand(), 0.8) * 3.6;
            const angle = arm * Math.PI + t * 1.9 + gauss() * 0.25;
            const radius = 10 + t * 62 + gauss() * (6 + t * 5);
            const x0 = Math.cos(angle) * radius;
            const y0 = Math.sin(angle) * radius * flat;
            const x = cx + x0 * Math.cos(tilt) - y0 * Math.sin(tilt);
            const y = cy + x0 * Math.sin(tilt) + y0 * Math.cos(tilt);
            const heat = Math.max(0, 1 - t / 3.6);
            const alpha = 0.05 + heat * 0.12;
            const r = Math.round(150 + heat * 105), gg = Math.round(185 + heat * 70);
            g.fillStyle = `rgba(${r},${gg},255,${alpha})`;
            const s = rand() < 0.03 ? 1.8 : 1;
            g.fillRect(x, y, s, s);
        }
    }
    // bright core
    const core = g.createRadialGradient(cx, cy, 0, cx, cy, 70);
    core.addColorStop(0, 'rgba(255,255,255,0.85)');
    core.addColorStop(0.2, 'rgba(191,219,254,0.35)');
    core.addColorStop(1, 'rgba(59,130,246,0)');
    g.fillStyle = core;
    g.save();
    g.translate(cx, cy);
    g.rotate(tilt);
    g.scale(1, flat);
    g.translate(-cx, -cy);
    g.fillRect(cx - 80, cy - 80, 160, 160);
    g.restore();
    g.globalCompositeOperation = 'source-over';

    // film grain, so the gradients don't band on big screens
    const img = g.getImageData(0, 0, 1024, 256);
    for (let i = 0; i < img.data.length; i += 4) {
        const n = (rand() - 0.5) * 6;
        img.data[i] += n;
        img.data[i + 1] += n;
        img.data[i + 2] += n;
    }
    g.putImageData(img, 0, 0);
    return c.toDataURL('image/png');
}

function drawGlow() {
    const c = document.createElement('canvas');
    c.width = c.height = 256;
    const g = c.getContext('2d');
    const r = g.createRadialGradient(128, 128, 0, 128, 128, 128);
    r.addColorStop(0, 'rgba(255,255,255,1)');
    r.addColorStop(0.25, 'rgba(255,255,255,0.55)');
    r.addColorStop(0.6, 'rgba(255,255,255,0.12)');
    r.addColorStop(1, 'rgba(255,255,255,0)');
    g.fillStyle = r;
    g.fillRect(0, 0, 256, 256);
    return c.toDataURL('image/png');
}

const browser = await chromium.launch({ executablePath: process.env.CHROMIUM_PATH || undefined });
const page = await browser.newPage();
await page.setContent('<html><body style="margin:0"></body></html>');
const { writeFileSync } = await import('node:fs');
for (const [name, fn] of [['nameplate-galaxy', drawGalaxy], ['nameplate-glow', drawGlow]]) {
    const url = await page.evaluate(fn);
    writeFileSync(`${out}/${name}.png`, Buffer.from(url.split(',')[1], 'base64'));
}
await browser.close();
console.log('rendered to', out);
