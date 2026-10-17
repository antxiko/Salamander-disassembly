# Salamander - Operation X - a commented disassembly

*(También [en castellano](README.es.md).)*

The commented disassembly of **Salamander - Operation X** (Konami, 1987,
RC-758) for the MSX: a 128 KB MegaROM with Konami's SCC mapper, sixteen 8 KB
banks.

- **100%** of the binary explained: 52,996 bytes of code and 78,076 of named
  data, not one byte unassigned.
- **44.6%** of the listing commented, 3,429 routines and labels, none below
  10% comments.
- The listing reassembles into the original ROM **byte for byte**.
- The seven stages with their whole routes, the ship, the enemies, the eight
  bosses, the intro, the planet choice and both endings are **drawn from the
  ROM**, not captured, and checked against the openMSX VRAM; the music comes
  from running the cartridge's own sound engine.

The website: <https://antxiko.github.io/Salamander-disassembly/>
(in Spanish: <https://antxiko.github.io/Salamander-disassembly/es/>).

## Reproducing it

The cartridge image is not distributed. Put yours in the root as
`salamander.rom` (sha256 `edbbba82...`) and run `make`. The details are in
[UNDER THE HOOD](docs/UNDER-THE-HOOD.md).

## Legal

The game belongs to Konami and its rights holders. The `LICENSE` covers only
the tools, comments, analysis and documentation here. See
[LEGAL-NOTICE.md](LEGAL-NOTICE.md).
