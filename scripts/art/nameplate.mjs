// Renders the nameplate artwork in assets/ from SVG. Dev-only, not part of the library:
//   node scripts/art/nameplate.mjs   (needs Playwright; CHROMIUM_PATH to use a local Chromium)
import { chromium } from 'playwright';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const out = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../../assets');

// Layered ridgelines, far to near: smooth curves, each nearer layer darker and sharper, with mist
// between them, the way ink-wash mountains fade into haze.
function ridge(seed, base, amp, width = 1024) {
    let r = seed;
    const rand = () => ((r = (r * 16807) % 2147483647) / 2147483647);
    const points = [];
    for (let x = -40; x <= width + 80; x += 60 + rand() * 70) {
        points.push([x, base - amp * Math.pow(rand(), 1.6)]);
    }
    let d = `M-40 300 L${points[0][0]} ${points[0][1]}`;
    for (let i = 1; i < points.length; i++) {
        const [x0, y0] = points[i - 1];
        const [x1, y1] = points[i];
        const mx = (x0 + x1) / 2;
        d += ` C${mx.toFixed(1)} ${y0.toFixed(1)} ${mx.toFixed(1)} ${y1.toFixed(1)} ${x1.toFixed(1)} ${y1.toFixed(1)}`;
    }
    return `${d} L${width + 80} 300 Z`;
}

const layers = [
    // seed, base, amp, fill, blur, mist after
    [11, 140, 80, '#2A3C66', 3.5, 0.28],
    [29, 170, 75, '#1C2B4E', 2.2, 0.24],
    [47, 205, 70, '#121D38', 1.2, 0.18],
    [83, 240, 60, '#080D1A', 0, 0],
];

const backdrop = `
<svg xmlns="http://www.w3.org/2000/svg" width="1024" height="256" viewBox="0 0 1024 256">
  <defs>
    <linearGradient id="sky" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0" stop-color="#070B16"/><stop offset=".55" stop-color="#16244A"/><stop offset="1" stop-color="#0A1022"/>
    </linearGradient>
    <radialGradient id="moon" cx=".74" cy=".3" r=".5">
      <stop offset="0" stop-color="#BFDBFE" stop-opacity=".45"/><stop offset=".35" stop-color="#60A5FA" stop-opacity=".12"/><stop offset="1" stop-color="#3B82F6" stop-opacity="0"/>
    </radialGradient>
    <linearGradient id="mist" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0" stop-color="#D6E4FF" stop-opacity="0"/><stop offset=".55" stop-color="#D6E4FF" stop-opacity="1"/><stop offset="1" stop-color="#D6E4FF" stop-opacity="0"/>
    </linearGradient>
    ${layers.map(([, , , , blur], i) => `<filter id="b${i}" x="-5%" y="-20%" width="110%" height="140%"><feGaussianBlur stdDeviation="${blur}"/></filter>`).join('')}
    <filter id="haze" x="-10%" y="-50%" width="120%" height="200%"><feGaussianBlur stdDeviation="10"/></filter>
    <filter id="grain"><feTurbulence type="fractalNoise" baseFrequency=".85" numOctaves="2" seed="4"/><feColorMatrix values="0 0 0 0 1  0 0 0 0 1  0 0 0 0 1  0 0 0 .045 0"/></filter>
  </defs>
  <rect width="1024" height="256" fill="url(#sky)"/>
  <rect width="1024" height="256" fill="url(#moon)"/>
  ${Array.from({ length: 60 }, (_, i) => {
      const x = (i * 137.5) % 1024, y = (i * 53.3) % 110, o = 0.12 + ((i * 7) % 10) / 28;
      return `<circle cx="${x.toFixed(1)}" cy="${y.toFixed(1)}" r="${i % 11 === 0 ? 1.1 : 0.6}" fill="#DBEAFE" opacity="${o.toFixed(2)}"/>`;
  }).join('')}
  ${layers
      .map(([seed, base, amp, fill, , mist], i) => {
          const hill = `<path d="${ridge(seed, base, amp)}" fill="${fill}" filter="${layers[i][4] ? `url(#b${i})` : ''}"/>`;
          const band = mist
              ? `<rect x="-40" y="${base - 30}" width="1104" height="70" fill="url(#mist)" opacity="${mist}" filter="url(#haze)"/>`
              : '';
          return hill + band;
      })
      .join('\n  ')}
  <rect width="1024" height="256" filter="url(#grain)"/>
</svg>`;

const mark = `
<svg xmlns="http://www.w3.org/2000/svg" width="256" height="256" viewBox="0 0 400 400" fill="none">
  <defs>
    <linearGradient id="g" x1="60" y1="40" x2="340" y2="360" gradientUnits="userSpaceOnUse">
      <stop stop-color="#FFFFFF"/><stop offset=".45" stop-color="#BFDBFE"/><stop offset="1" stop-color="#3B82F6"/>
    </linearGradient>
  </defs>
  <circle cx="200" cy="200" r="130" stroke="url(#g)" stroke-width="40"/>
  <ellipse cx="200" cy="200" rx="176" ry="56" transform="rotate(-28 200 200)" stroke="url(#g)" stroke-width="14" opacity=".75"/>
  <circle cx="345" cy="124" r="18" fill="#FFFFFF"/>
</svg>`;

const browser = await chromium.launch({ executablePath: process.env.CHROMIUM_PATH || undefined });
const page = await browser.newPage();
for (const [name, svg, w, h, transparent] of [
    ['nameplate-backdrop', backdrop, 1024, 256, false],
    ['nameplate-mark', mark, 256, 256, true],
]) {
    await page.setViewportSize({ width: w, height: h });
    await page.setContent(`<html><body style="margin:0;background:transparent">${svg}</body></html>`);
    await page.locator('svg').screenshot({ path: `${out}/${name}.png`, omitBackground: transparent });
}
await browser.close();
console.log('rendered to', out);
