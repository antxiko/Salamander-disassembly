# Under the hood

## Getting started

This repository does not include the game. It includes the tools that,
from your own image of the cartridge, rebuild the commented listing,
reassemble it and check that the ROM comes out **byte for byte**.

### What you need

- The image of *Salamander - Operation X* (RC-758), 131,072 bytes, in the
  root as `salamander.rom`. Its sha256:
  `edbbba820ac67d6a55b9dc5da9309e45979936d5620c07d09793efaf077e86b9`.
- `make`, `python3` and the `pasmo` assembler.
- For the pictures and the music, Python with PIL, numpy and lameenc. For
  stage 7, also the *Nemesis 2* image at `../NEMESIS2_DISAM/nemesis2.rom`.

### What to run

    make               # traces, builds the listing, reassembles and runs the tests
    make verify        # the sixteen banks against the ROM
    make densidad      # how many instructions carry a comment
    make sanity        # the budget: not one byte unassigned

`make verify` has to say `OK: la ROM entera reproducible byte a byte`.

### Where everything is

- `src/salamander_pNN.asm`: the listing of each bank (p00 to p15).
- `src/pNN.notes`: the names, comments and data blocks of each bank. The
  listing is generated from here.
- `tools/vram.py`, `tools/mundo.py`, `tools/nave.py`, `tools/enemigos.py`,
  `tools/jefes.py`, `tools/repite.py`: the pictures.
- `tools/musica.py`: the music; `tools/textos.py`: the texts.
- `tools/omsx_vram.tcl` and `tools/omsx_psg.tcl`: the openMSX probes
  everything is checked against.

### The pictures

    python tools/imagenes.py docs/imagenes

The routes, the ship and the characters come from the ROM alone. The
enemies and the bosses are drawn with the ROM's patterns over what they do
in openMSX. The screens of the intro, the planet choice and the endings are
rebuilt by repeating, with the ROM's bytes, the cartridge's writes to the
VRAM, and each one is identical, pixel for pixel, to the emulator's VRAM at
that moment. The gauge pieces and the items come from the ROM
(`tools/armas.py`, which checks them against the VRAM). The animations are
the VRAM and VDP registers of every frame of a game in openMSX
(`VRAM_CUADROS` in `tools/omsx_vram.tcl`), painted the way the TMS9918
paints them (`tools/anima.py`).

## The cartridge

### The machine

A first generation MSX: the TMS9918 VDP in SCREEN 2, the PSG and the SCC
carried by the cartridge itself. Names at 0x3800, colours at 0x0000,
patterns at 0x2000, sprite patterns at 0x1800 and their attributes at
0x3B00. The play area is 21 rows; the three below are the status panel.

### The mapper

Konami's with SCC: sixteen 8 KB banks. Bank 0 is fixed at 0x4000 and the
other three slots are chosen at 0x7000, 0x9000 and 0xB000, with a copy at
`0xF0F1`-`0xF0F3`. The game sets them three at a time
(`p00:416E`-`p00:417D`): 1-2-3 for the game, 4-5-6 for the sound, 7-8-9 for
the graphics and 13-14-15 for the maps. Bank 10 goes alone at 0x8000 (the
intro, the cut-scenes and the endings) and banks 11 and 12 alone at 0xA000
(the bosses and the special enemies). Bank 0x3F at 0x8000 opens the SCC.

### The interrupt

INIT (`p00:40DA`) clears the game RAM, installs the H.KEYI hook and stays
in `jr $`: everything runs inside the interrupt (`p00:4069`). First the
sound, with banks 4-5-6 (`p04:6978`); then, if the previous frame has
finished (`0xE205`), a game frame.

### The sound

Eight channels of 0x2C bytes from `0xE000`: three for the PSG and five for
the SCC. There are 89 sounds; each has a header with its channels and its
priority (`p04:663E`) and one score per channel. Effects use two channels
(PSG C and the first SCC one) and tunes six or eight, so a six-channel tune
keeps playing under the effects. Orders 0xF0-0xF6 handle the pause, the
fades and moving the SCC channels to the PSG (`p04:6472`).

### The RAM

The game uses `0xE000`-`0xEFFF`. The 12 enemies are 0x40-byte records at
`0xE700`, the ship's 15 shots are at `0xE440` and the boss at `0xEC80`. The
screen is built in RAM, at `0xCA00` with 64 bytes per row, and every frame
it is dumped to the VRAM (`p00:5FED`).

### The other cartridge

At start-up `p03:B599` looks at the other slot. If it finds *Nemesis 2*
(`p03:B5E3` compares its 0x4010 with CD 07 51 and six bytes of its 0x7FFA),
stage 7 opens up. To draw it, `p00:5B91` copies to 0xC000 a routine that
maps the other cartridge in and brings 1,137 bytes, twenty pieces of its
banks 7, 8 and 9 (table `p00:5BFE`), to `0xC100`.

## The code

### The numbers

**100 %** of the 131,072 bytes is explained: 52,996 of code and 78,076 of
data. The nine banks with code have 3,429 routines and labels, and 11,342
of their 25,417 instructions carry a comment: **44.6 %**, with no routine
under 10 %.

### Where everything is

- bank 0: the interrupt, the bank sets, the graphics loading (`p00:438C`),
  the maps in RAM (`p00:49BB`, `p00:4A88`) and the game states;
- banks 1, 2 and 3: the enemies, the ship, its weapons, the collisions and
  the script of each stage (`p02:8525`-`p02:86EF`);
- bank 4: the sound;
- bank 10: the intro, the take-off, the planet choice, the cut-scenes and
  the endings;
- bank 11: the eight bosses (table `p01:6E89`) and the screen fade;
- bank 12: the special enemies, the items to pick up and the SELECTION
  screen;
- banks 5, 7, 8, 9, 13, 14 and 15: data only (waveforms, graphics, maps and
  texts).

### The names

The routine and RAM names are in `tools/anotaciones.py`, and
`tools/anota.py` takes them to every call and every access in the listing.
