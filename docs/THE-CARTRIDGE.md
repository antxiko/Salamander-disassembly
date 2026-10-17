# The cartridge

## The machine

A first generation MSX: the TMS9918 VDP in SCREEN 2, the PSG and the SCC
carried by the cartridge itself. Names at 0x3800, colours at 0x0000,
patterns at 0x2000, sprite patterns at 0x1800 and their attributes at
0x3B00. The play area is 21 rows; the three below are the status panel.

## The mapper

Konami's with SCC: sixteen 8 KB banks. Bank 0 is fixed at 0x4000 and the
other three slots are chosen at 0x7000, 0x9000 and 0xB000, with a copy at
`0xF0F1`-`0xF0F3`. The game sets them three at a time
(`p00:416E`-`p00:417D`): 1-2-3 for the game, 4-5-6 for the sound, 7-8-9 for
the graphics and 13-14-15 for the maps. Bank 10 goes alone at 0x8000 (the
intro, the cut-scenes and the endings) and banks 11 and 12 alone at 0xA000
(the bosses and the special enemies). Bank 0x3F at 0x8000 opens the SCC.

## The interrupt

INIT (`p00:40DA`) clears the game RAM, installs the H.KEYI hook and stays
in `jr $`: everything runs inside the interrupt (`p00:4069`). First the
sound, with banks 4-5-6 (`p04:6978`); then, if the previous frame has
finished (`0xE205`), a game frame.

## The sound

Eight channels of 0x2C bytes from `0xE000`: three for the PSG and five for
the SCC. There are 89 sounds; each has a header with its channels and its
priority (`p04:663E`) and one score per channel. Effects use two channels
(PSG C and the first SCC one) and tunes six or eight, so a six-channel tune
keeps playing under the effects. Orders 0xF0-0xF6 handle the pause, the
fades and moving the SCC channels to the PSG (`p04:6472`).

## The RAM

The game uses `0xE000`-`0xEFFF`. The 12 enemies are 0x40-byte records at
`0xE700`, the ship's 15 shots are at `0xE440` and the boss at `0xEC80`. The
screen is built in RAM, at `0xCA00` with 64 bytes per row, and every frame
it is dumped to the VRAM (`p00:5FED`).

## The other cartridge

At start-up `p03:B599` looks at the other slot. If it finds *Nemesis 2*
(`p03:B5E3` compares its 0x4010 with CD 07 51 and six bytes of its 0x7FFA),
stage 7 opens up. To draw it, `p00:5B91` copies to 0xC000 a routine that
maps the other cartridge in and brings 1,137 bytes, twenty pieces of its
banks 7, 8 and 9 (table `p00:5BFE`), to `0xC100`.
