# The music

Every piece comes from running the cartridge's own sound engine
(`tools/musica.py` with `tools/motor_musica.py` and `tools/z80run.py`): it is
asked for with `pide_sonido` (`p00:4D6E`, which maps banks 4, 5 and 6 and
calls `p04:6472`) and every frame `p04:6978` is called, as the interrupt
does. That gives the PSG and SCC writes of every frame, which are mixed into
an MP3. The ones that start again are heard twice and fade out.

## The check

The writes were compared with openMSX's, register by register
(`tools/omsx_psg.tcl` and `tools/coteja_psg.py`):

- the Konami logo tune (0x4E), 193 frames, and the title (0x2E), 132, in
  the intro: PSG and SCC the same in all of them;
- the tunes of the seven stages, some 375 frames each, three times per
  game: the same in all of them. To hear each one in its place, the probe
  uses a copy of the ROM where the header of the stage 1 tune points to the
  piece's (`tools/rom_musica.py`). As the effects play on PSG channel C and
  the first SCC channel, the tune's channels are compared;
- the boss tune (0x21) and the item tune (0x22), three times each, and the
  two endings (0x30 and 0x31), once, some 375 frames: the same in all;
- the between-stages tune (0x2F) and one of the stage 7 (0x19) runs differ
  only in frame 0, in PSG register 1, which keeps what the previous piece
  left;
- the take-off (0x28), 72 frames: the same.

## The pieces

### 0x4E The Konami logo (and a boss falls: 0x25 sounds the same)

Asked for at `p10:82D7 (0x25, at p02:9CB8 and p11:B575)`

<audio controls preload="none" src="audio/musica_4E.mp3?v=7c127c1c"></audio>

### 0x2E The title

Asked for at `p10:83B3`

<audio controls preload="none" src="audio/musica_2E.mp3?v=ae54ffd0"></audio>

### 0x28 The take-off

Asked for at `p10:887B`

<audio controls preload="none" src="audio/musica_28.mp3?v=bc0fbcde"></audio>

### 0x48 The ship leaves

Asked for at `p10:88A0 and p10:88E3`

<audio controls preload="none" src="audio/musica_48.mp3?v=294c97c3"></audio>

### 0x1B Stage 1

Asked for at `p02:876A, the list of stage 1`

<audio controls preload="none" src="audio/musica_1B.mp3?v=a6d25ea0"></audio>

### 0x1C Stage 2

Asked for at `p02:876A, the list of stage 2`

<audio controls preload="none" src="audio/musica_1C.mp3?v=0507f780"></audio>

### 0x1E Stage 3

Asked for at `p02:876A, the list of stage 3`

<audio controls preload="none" src="audio/musica_1E.mp3?v=cb57f9ff"></audio>

### 0x1D Stage 4

Asked for at `p02:876A, the list of stage 4`

<audio controls preload="none" src="audio/musica_1D.mp3?v=3dbdbb41"></audio>

### 0x1F Stage 5

Asked for at `p02:876A, the list of stage 5`

<audio controls preload="none" src="audio/musica_1F.mp3?v=b5cd2c0f"></audio>

### 0x20 Stage 6

Asked for at `p02:876A, the list of stage 6`

<audio controls preload="none" src="audio/musica_20.mp3?v=01313b59"></audio>

### 0x19 Stage 7 (OPERATION X)

Asked for at `p02:876A, the list of stage 7`

<audio controls preload="none" src="audio/musica_19.mp3?v=3235c1eb"></audio>

### 0x21 The bosses

Asked for at `p02:876A, at the end of each list`

<audio controls preload="none" src="audio/musica_21.mp3?v=c68b0a4d"></audio>

### 0x24 A boss falls

Asked for at `p02:9CFE, p11:A372 and p11:B580`

<audio controls preload="none" src="audio/musica_24.mp3?v=12e891a8"></audio>

### 0x27 The ship blows up

Asked for at `p02:96A4`

<audio controls preload="none" src="audio/musica_27.mp3?v=591b56e4"></audio>

### 0x2F Between stages

Asked for at `p10:8C36 and p10:8DB3`

<audio controls preload="none" src="audio/musica_2F.mp3?v=d1b89c7e"></audio>

### 0x22 The tune at p00:56C4

Asked for at `p00:56C4`

<audio controls preload="none" src="audio/musica_22.mp3?v=408c9be1"></audio>

### 0x30 The ending, without Nemesis 2

Asked for at `p10:8FEA`

<audio controls preload="none" src="audio/musica_30.mp3?v=43c89a9c"></audio>

### 0x31 The good ending

Asked for at `p10:8FE6 and p03:A3DB`

<audio controls preload="none" src="audio/musica_31.mp3?v=87eb632c"></audio>

### 0x32 Game over

Asked for at `p00:551F`

<audio controls preload="none" src="audio/musica_32.mp3?v=f059310c"></audio>

### 0x34 The intro window

Asked for at `p10:82C5`

<audio controls preload="none" src="audio/musica_34.mp3?v=22d60cd0"></audio>
