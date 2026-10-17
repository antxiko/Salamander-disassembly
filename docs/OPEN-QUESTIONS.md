# Open questions

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
