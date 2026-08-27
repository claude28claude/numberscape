# Numberscape

**The world is bigger, weirder and less scary than you think.**

An interactive data-visualisation essay in the spirit of *Information is Beautiful*.
Twenty-three chapters, 518 data points, one HTML file — including chapters that
measure the reader rather than the world.

**Live:** https://claude28claude.github.io/numberscape/

## Chapters

| # | Chapter | What it does |
|---|---------|--------------|
| 1 | The Perception Gap | What people believe their country looks like, plotted against what it actually looks like |
| 2 | Fear vs Reality | What kills people, what they Google, and what the press covers - with a per-cause distortion factor |
| 3 | Deadliest Animals | Deaths per year by animal, with a log/true-scale toggle that makes every feared predator vanish |
| 4 | Nobody Died at Forty | Two cohorts of 100 dots die along a shared age axis - why "life expectancy was 41" never meant what you think |
| 5 | The Income Ladder | Enter your household income and see your real position among everyone alive, PPP-adjusted |
| 6 | The Price In Hours | Hours of work to buy a thing, then and now - objects collapsed, rooms and classes did the opposite |
| 7 | Billion-Dollar-o-Gram | A squarified treemap of world spending against the cost of fixing things, at one scale |
| 8 | Snake Oil? | 18 supplements plotted by popularity against strength of evidence |
| 9 | What Measles Deletes | The infection that erases immune memory a child had already built, and the two-year shadow it casts |
| 10 | Life on Earth, by Weight | Every mammal alive, weighed. 96% of it is humans and their livestock |
| 11 | How We Use the Earth | Four zoom levels, from the whole planet down to what farmland actually feeds |
| 12 | Peak Child | Births peaked around 2012 - the extra billions are grown-up children, not new babies |
| 13 | Colours in Culture | What eight colours signify across seven cultural traditions |
| 14 | Warming Stripes | 176 years of global temperature with no axes, no numbers |
| 15 | How Long It Lasts | Decomposition times on a logarithmic scale |
| 16 | The Last Second | Earth's history as a single day, zoomed three times into the final second |
| 17 | Thirty Earths | Place the Moon where you think it belongs, then watch it slide far past your guess |
| 18 | Every Minute | Live counters that start at zero when you open the page |
| 19 | Your Life in Dots | Enter your age, see it as 4,680 weekly dots |
| 20 | Reaction Time | Five timed rounds, your median against sprinters and F1 drivers, and what it costs in metres |
| 21 | Guess the Correlation | Estimate *r* from a scatter of 90 points, scored against the real sample correlation |
| 22 | Mythconceptions | Sixteen flip cards busting things everyone "knows" |
| 23 | Rhetological Fallacies | 22 ways an argument goes wrong, filed by failure mode |

## On the numbers

In August 2026 every chapter was audited against primary sources, and a large
share of the site's figures turned out to be wrong. The corrections are in the
git history. The worst of them, for the record:

- **Fear vs Reality** had six of ten rows carrying values that appear nowhere in
  the Shen et al. dataset, and three of those *reversed the source's own
  conclusions* - drug overdose was shown as over-reported when it is one of the
  most under-reported causes; stroke was shown as badly under-reported when it
  is the best-calibrated cause on the chart. Rebuilt from the dataset itself,
  now with all 13 causes so each column actually sums to 100.
- **The Income Ladder** was running on the 2017-PPP distribution the World Bank
  retired in June 2025, while its footnote claimed 2021 PPP, and it never
  deflated the reader's current salary to 2021 prices. It overstated people's
  global percentile by up to nine points. Rebuilt from the live PIP API.
- **Warming Stripes** used a series reconstructed from memory rather than
  downloaded - wrong by 0.17 C in 2023, with 22 of 175 years out by more than
  0.1 C. Replaced with the published HadCRUT5 file.
- **Deadliest Animals** carried six unrevised figures from a 2014 blog post. The
  tsetse fly row contradicted its own tooltip by a factor of nine.
- **The Perception Gap** had seven of eight rows wrong, including two
  conflations and one "average guess" that does not exist, because the survey it
  came from was multiple choice.

Every chapter footnote now states what its data cannot support, not only what it
can. Several claims were deleted rather than corrected, because no source could
be found for them at all.

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
is the published HadCRUT.5.0.2.0 annual file, downloaded rather than
reconstructed; an earlier version approximated it and was wrong.

Nothing here is medical, legal or financial advice.

## Standing on

David McCandless (*Information is Beautiful*), Hans Rosling (*Factfulness*),
Ed Hawkins (warming stripes), Our World in Data, and Edward Tufte.
