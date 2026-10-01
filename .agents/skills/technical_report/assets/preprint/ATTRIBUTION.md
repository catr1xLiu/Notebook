# Attribution and upstream sources

This file records the provenance and reuse boundary of the two projects that
made this template possible.

## 1. Google DeepMind technical-report class

- Work: *Gemini: A Family of Highly Capable Multimodal Models*
- Paper: https://arxiv.org/abs/2312.11805v5
- Source package: https://arxiv.org/src/2312.11805v5
- Source archive retrieved: 2026-08-03
- Downloaded archive SHA-256:
  `87846abe7d26355d1ff97511737f66a53cad6ab59de3fa8e05fea1b72e349cd7`
- Upstream `googledeepmind.cls` SHA-256:
  `91d8a6a8388337a6cf37efcb228a23f86c0af3dc528408c77e21fb9b3c035bf3`
- Derived `cleantechnicalreport.cls` SHA-256:
  `2491d116e9348a4ac302c00efda0c0d6e2bfc9ca40bed1885c9eca8921471e41`
- License declared in the class header: Creative Commons
  Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
- Original upstream attribution: `DeepMind, London, 2019`

The following upstream version history is retained from the original header:

- v0.4, September 2023: update to the Google DeepMind unit;
- v0.31, May 2019: corresponding authors allowed without the internal option;
- v0.3, March 2019: math-font consistency and improved option handling;
- v0.2, January 2019: font, margin, and notes consistency;
- v0.1, December 2018: initial testing version.

This repository does not distribute the original class under its original
filename. It distributes the renamed derivative `cleantechnicalreport.cls`,
which retains the XCharter/newtx/zlmtt type system, geometry, body layout,
section hierarchy, captions, tables, bibliography support, and generic page
furniture. The derivative removes the upstream institution-specific logo path,
address, copyright notice, confidential/internal wording, and report identifier.
The legacy `logo`, `address`, `copyright`, and `internal` options now raise an
explanatory `\ClassError`; the derivative contains no implementation that
produces the upstream institution-specific output.
The file header identifies the upstream work, preserves the CC BY-SA 4.0
license, and records these modifications.

## 2. Industry-style visual reference

- Repository: https://github.com/ShenzheZhu/industry-tech-report-template
- Inspected commit:
  https://github.com/ShenzheZhu/industry-tech-report-template/commit/41464936654e24b730317109e1caf9c0c0e0614e
- Repository README at that commit describes the project as MIT licensed.

The inspected commit does not include a standalone `LICENSE`, `COPYING`, or
`NOTICE` file. This combined template therefore does not rely on permission to
copy that repository's implementation or assets.

This project is gratefully acknowledged as the visual inspiration for the title
rules, centered author block, rounded abstract card, metadata rows, colors, and
spacing proportions. Those features were independently implemented in
`hybridfrontmatter.sty`. No source code from its `style.cls`, Stanford logo,
Stanford Digital Economy Lab logo, or other repository assets are copied or
distributed here.

## 3. Combined template

`cleantechnicalreport.cls`, `hybridfrontmatter.sty`, the sample paper, and the
integration work are released under CC BY-SA 4.0. The combined repository uses
that same license to satisfy the ShareAlike requirement declared by the upstream
class.

License deed: https://creativecommons.org/licenses/by-sa/4.0/

The names and trademarks of Google, Google DeepMind, Stanford University, and
Stanford Digital Economy Lab belong to their respective owners. This repository
is an independent community template and is not affiliated with or endorsed by
either upstream project or any referenced institution.

For the project's brand-neutralization measures and rights-holder review
process, see [NOTICE.md](NOTICE.md).
