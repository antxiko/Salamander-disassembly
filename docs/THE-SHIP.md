# The ship and its weapons

The ship, the gauge pieces and the items are **drawn from the bytes of the ROM**. The GIFs are the VRAM of every frame of a game in openMSX, painted the way the TMS9918 paints it (`tools/anima.py`), one frame in three.

## The ship

![The fourteen poses of the ship](imagenes/nave.png)

*The fourteen poses.*

Two 16 x 16 sprites and fourteen poses (`p09:A145`-`p09:A19F`, patterns at
`p14:95F7`): level, climbing and diving, the same with the shield in front,
and as many again for the vertical stages. The shield takes the hits counted
in IY+22 (`p02:960B`).

There are two ships: SABEL TIGER, flown by IGGY ROCK, and THRASHER, flown by
ZOWIE SCOTT. The SELECTION screen at `p12:B877` asks YES or NO to
«PLAYER1 JOINT GAME».

## The weapons

![The four options behind the ship](imagenes/arma_option.gif)

*The four options, following the ship along the path it took.*

At the bottom, the gauge has seven boxes (`p00:5D8E`). Each 0x29 capsule
moves the chosen box along (`p02:97C9`) and the second button activates it
(`p02:8929`): the box raises its weapon one level, with its routine from the
table at `p02:8967`. On the right, a 5-character window says what is
carried: a piece from the table at `p14:8849`, 35 bytes of pattern and one of
colour, chosen by the box and its level (`p00:5E52`).

![The 22 window pieces](imagenes/piezas.png)

*The 22 pieces, drawn from the ROM. Those of the seven boxes are identical to
the ones the game paints in openMSX when picking up each capsule
(`tools/armas.py coteja`).*

| Box | Level 1 | Level 2 | Level 3 |
|---|---|---|---|
| 1 | SPEED, seven times | | |
| 2 | [NORMAL](imagenes/arma_normal.gif) | [TWIN](imagenes/arma_twin.gif) | [TRIPLE](imagenes/arma_triple.gif) |
| 3 | [2WAY-B](imagenes/arma_2way.gif) | [HAWK WING](imagenes/arma_hawkwing.gif) | [HOWMING](imagenes/arma_howming.gif) |
| 4 | [RIPPLE](imagenes/arma_ripple.gif) | [ARMING](imagenes/arma_arming.gif) | |
| 5 | [LASER](imagenes/arma_laser.gif) | [METEO](imagenes/arma_meteo.gif) | [SCREW](imagenes/arma_screw.gif) |
| 6 | [OPTION](imagenes/arma_option.gif), up to four (three with two players) | | |
| 7 | [F.FIELD](imagenes/arma_ffield.gif), ten hits | | |

*Each link leads to the ship firing that weapon.*

Boxes 2, 4 and 5 are the main weapon (IY+40: 1 NORMAL, 2 RIPPLE, 3 LASER,
4 SCREW, 5 METEO, 6 TWIN and 7 TRIPLE) and box 3 and the ARMING the panel
weapon (IY+41: 1 to 3 the missiles and 4 the ARMING). The game only gives
the second and third levels with both ships joined, in state 3 or 4
(`p02:8995`), when the window says PILOT or Co.PILOT. For the GIFs the
weapon was set by hand in RAM (0xE340 and 0xE341); the options and the
F.FIELD are activated as in the game. The ARMING goes wherever the
controller is pushed (`p03:B43F`): with the ship still, it does not fire.

## The capsules and the items

![The six items](imagenes/objetos.png)

*Items 1 to 6, drawn with the runs at `p09:A331`. Items 2 and 3 are
identical, at 0 bytes, to the VRAM of two games in openMSX.*

There are three capsules (`p02:9670`):

- **0x29** moves the gauge box along;
- **0x2A** gives a bomb (IY+42, `p02:9806`) and the window says T.BOMB:
  while there are any, the button drops [bombs](imagenes/arma_bomba.gif)
  instead of the panel weapon (`p03:A962`);
- **0x35** adds one to IY+1B; at 15 it goes back to 0 and raises IY+10, and
  with IY+10 at 7 it gives an extra life (`p02:974A`).

The 0x29 and the 0x2A are in the sheet of the
[stage 4 enemies](imagenes/enemigos_f4.png). The 0x35 has not shown up in
any of the recorded games, and it is not drawn here.

Some enemies drop one of these items when destroyed (`p01:7C36`; with one
player, 1 to 4). They are four characters in the scenery (`p02:8B97`) and
give 30 points when picked up (`p02:9909`). Each one sets a clock (0xE630
the mode, 0xE631 the time) and its piece in the window (`p02:991E`):

| Item | In the window | The clock |
|---|---|---|
| 1 | S.STOP | mode 1, 0x10 |
| 2 | O.HOLD | mode 2, 0x15, and IY+34 = 1 |
| 3 | SPARK | mode 3 |
| 4 | | nothing |
| 5 | | mode 5, 0x10, on the other player |
| 6 | O.CHAIN | mode 6, 0x30 |

Stages 3, 5 and 6 also have items to pick up (`p12:A5CE`). Picking one up
brings a screen with its result. Item 1 says «IN THE RUIN OF LATIS... YOU
HAVE GOT A CRYSTAL BREEZE» and `p01:7B73` sets `0xE30A` to 1.
