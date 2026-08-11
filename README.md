# Numberscape

**The world is bigger, weirder and less scary than you think.**

An interactive data-visualisation essay in the spirit of *Information is Beautiful*.
Twelve chapters, 358 data points, one HTML file.

**Live:** https://claude28claude.github.io/numberscape/

## Chapters

| # | Chapter | What it does |
|---|---------|--------------|
| 1 | Guess First | A slider quiz that makes you commit to a number *before* the answer appears, then scores your calibration |
| 2 | Fear vs Reality | What kills people, what they Google, and what the press covers — with a per-cause distortion factor |
| 3 | Deadliest Animals | Deaths per year by animal, with a log/true-scale toggle that makes every feared predator vanish |
| 4 | Billion-Dollar-o-Gram | A squarified treemap of world spending against the cost of fixing things, at one scale |
| 5 | Snake Oil? | 18 supplements plotted by popularity against strength of evidence |
| 6 | Colours in Culture | What eight colours signify across seven cultural traditions |
| 7 | Warming Stripes | 175 years of global temperature with no axes, no numbers |
| 8 | How Long It Lasts | Decomposition times on a logarithmic scale |
| 9 | Every Minute | Live counters that start at zero when you open the page |
| 10 | Your Life in Dots | Enter your age, see it as 4,680 weekly dots |
| 11 | Mythconceptions | Twelve flip cards busting things everyone "knows" |
| 12 | Rhetological Fallacies | 22 ways an argument goes wrong, filed by failure mode |

## Install it

The site is a PWA. Open it in Chrome and use **Install** in the address bar (or
*Add to Home Screen* on mobile) and it runs in its own window with its own icon,
fully offline. The service worker is network-first for the page itself, so a
redeploy still reaches you on the next online visit.

## How it's built

No build step, no framework, no dependencies, no third-party requests, no
trackers. All the content and every chart live in a single `index.html` —
vanilla HTML, CSS and JavaScript, with hand-rolled SVG charts and a squarified
treemap layout. The only other files are the PWA wrapper (`manifest.webmanifest`,
`sw.js`) and the icons.

Run it locally by opening `index.html` directly — it works from `file://`, just
without the installable-app part — or serve it:

```bash
npx http-server . -p 8129 -c-1
```

Icons are generated from `tools/make-icons.ps1`; edit the palette or bar heights
there and re-run it rather than editing the PNGs by hand.

## A note on the data

Every chart is a simplification, and simplification is where charts lie. Sources
are listed under each section and in the footer. Where published estimates
disagree — and for "what it would cost to fix X" they disagree enormously — a
mid-range figure is used and labelled as an estimate. The warming-stripes series
is a close approximation of HadCRUT5: the trend and record years are right, but
individual years may differ by a few hundredths of a degree.

Nothing here is medical, legal or financial advice.

## Standing on

David McCandless (*Information is Beautiful*), Hans Rosling (*Factfulness*),
Ed Hawkins (warming stripes), Our World in Data, and Edward Tufte.
