# Curiosities

## Stage 7 comes from another cartridge

OPERATION X, -WRATH OF VENOM-, only exists with *Nemesis 2* in the other
slot. Its graphics are not in *Salamander*: the game switches slot, reads
1,137 bytes from banks 7, 8 and 9 of *Nemesis 2* and copies them to RAM
(`p00:5B91`). With that cartridge, and with the crystal, the ending is the
good one.

## The route turns

The stages are not a straight strip. In stage 1 the scroll stops twice and
the screen goes down through another map; in stage 4, once; stage 6, which
goes up, turns left and comes back (`p00:4BE6`, maps at `p14:80FC`,
`p14:815C` and `p14:818C`).

## A base you can barely see

In stage 4, between scrolls 0x100 and 0x150, the base is drawn only one
frame in 64; the rest are dumped without the scenery (`p00:5FC5`,
`p01:6016`).

## You choose the order of the planets

After stage 2, a radar with a clock lets you choose the order of EIONEUS,
LAVINIA and KIERKE (`p10:988A`); if time runs out, the game chooses.

## Leek and Crush Blow

The subtitle of stages 3, 4 and 5 is -SET THE LEEK SYSTEM- in the Japanese
version and -SET THE CRUSH BLOW SYSTEM- in the English one (`p15:BF5A`,
`p15:BF9A`).

## Konami and a boss sound the same

The Konami logo tune (0x4E) and the one played when a boss falls (0x25) have
different headers but play the same thing, frame by frame.

## The stage tune is asked for every frame

Every frame `p02:8720` checks which tune belongs to the scroll
(`p02:876A`) and, if it is not the one playing, asks for it again.

## Still open

- The Japanese texts (`p15:B002` and `p15:B725`) use kana and kanji
  characters: they still have to be drawn with the Japanese version's font.
- What EXCHANGE and DUALPLAY do, and when the SELECTION screen
  (`p12:B877`) shows up.
- Which item sits at each place in stages 3, 5 and 6 (`0xE350`-`0xE359`) and
  what results 2 to 4 change (`p01:7B33`).
- Enemy 0x06 in stage 4 and 0x30, 0x38 and 0x40 in stage 6 use sprite
  patterns that are not loaded when the stage starts (0x40-0x6F): they are
  shown without those frames.
- The six and eight channel sounds 0x1A, 0x23, 0x26, 0x29-0x2D and 0x49 last
  two frames and do not sound on their own.
- Three data blocks with no reader in sight: `p07:647F` (8 bytes),
  `p07:7A32` (36) and `p08:89D0` (61).
