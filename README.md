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
| 14 | Warming Stripes | 175 years of global temperature with no axes, no numbers |
| 15 | How Long It Lasts | Decomposition times on a logarithmic scale |
| 16 | The Last Second | Earth's history as a single day, zoomed three times into the final second |
| 17 | Thirty Earths | Place the Moon where you think it belongs, then watch it slide far past your guess |
| 18 | Every Minute | Live counters that start at zero when you open the page |
| 19 | Your Life in Dots | Enter your age, see it as 4,680 weekly dots |
| 20 | Reaction Time | Five timed rounds, your median against sprinters and the drink-drive limit, and what it costs in metres |
| 21 | Guess the Correlation | Estimate *r* from a scatter of 90 points, scored against the real sample correlation |
| 22 | Mythconceptions | Sixteen flip cards busting things everyone "knows" |
| 23 | Rhetological Fallacies | 22 ways an argument goes wrong, filed by failure mode |

## On the numbers

Five chapters here (Nobody Died at Forty, What Measles Deletes, Peak Child,
Thirty Earths, The Price In Hours) were researched against primary sources and then put through an
adversarial fact-check whose brief was to *refute* rather than approve. Every
one came back needing corrections, and the corrections are applied. A few
examples of what that removed: the claim that forty was an unlikely age to die
in 1841 (it was mid-pack, 52nd of 125 single ages); the claim that world
population growth is mostly extra old people (they are 13% of it - working-age
adults are 67.5%); a "lockstep" reading of the measles mortality curves that
the underlying figure does not actually show; and a 50% macaque antibody-loss
figure that is really a 40-60% range across four animals.

Where a correction removed a claim, the claim is gone rather than softened, and
several chapter footnotes now say explicitly what the data cannot support.

The Price In Hours splices two wage series across 1997. That is only legitimate
because they agree there: the Dallas Fed's manufacturing wage back-computes from
their own published 1997 work-time figures to about $13.00/hour, against $13.02
in the BLS total-private series used for the modern figures. One number was cut
from that chapter for having no source at either end - a 1997 childcare anchor -
rather than estimated.

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
