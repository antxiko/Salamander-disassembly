# The game

**Seven stages**. Stages 1 and 2 always come first; stages 3, 4 and 5, in
whatever order the player picks; then stage 6. Stage 7 only exists with
*Nemesis 2* in the other slot.

Every picture on this page comes from `tools/imagenes.py`. The still
screens of the intro, the radar and the endings are **rebuilt from the bytes
of the ROM** and identical, pixel for pixel, to openMSX's VRAM at that
moment; the enemies, the bosses, the weapon pieces and the items are drawn
with the ROM's patterns. The animations are the VRAM and VDP registers of
every frame of a game in openMSX, painted the way the TMS9918 paints them
(`tools/anima.py`), one frame in three.

## The intro

![The intro](imagenes/presentacion.gif)

*The whole intro, 32 seconds: the Konami logo on blue, the title with the
menu (1PLAYER, EXCHANGE and DUALPLAY), THE SAGA CONTINUES, KONAMI PRESENTS
and the title building up.*

If nothing is pressed, [the story](imagenes/historia.gif) follows (105
seconds): EMERGENCY, the warning from Latis, ZELOS-FORCE surrounding the
planet, the two ships with their pilots and «CAN THEY RESCUE PLANET LATIS?»,
and the title again with «THE FANTASTIC SPACE ADVENTURE COMMENCES». Then the
demo starts.

The still screens, each identical to the VRAM: [Konami](imagenes/konami.png),
[the title](imagenes/titulo.png),
[THE SAGA CONTINUES](imagenes/saga.png),
[KONAMI PRESENTS](imagenes/presents.png) and
[the title on its own](imagenes/titulo_solo.png).

## The stages and their order

![The radar to pick a planet](imagenes/eleccion.png)

*The radar with the three planets.*

After stage 2, the game shows the radar with EIONEUS, LAVINIA and KIERKE,
and the player picks which one comes first: they are stages 3, 4 and 5, in
whatever order he chooses (`p10:988A`). There is a clock: if it reaches
zero, the game picks (`p10:9A43`). Stage 6 comes next. Stage 7, with
*Nemesis 2*, comes before stage 6 (`p10:8B7B`).

Before each stage come the take-off from the base and a title card
(`p10:8A20`):

![The take-off and the stage 1 card](imagenes/despegue.gif)

*The take-off and the stage 1 card, 6 seconds. As stills, identical to the
VRAM: [the take-off](imagenes/despegue.png) and [the card](imagenes/rotulo.png).*

| Stage | Card | Subtitle |
|---|---|---|
| 1 | OPERATION ONE | -TOP FLIGHT SPEED TO LATIS- |
| 2 | OPERATION TWO | -CONDUCT TO SPACE STATION ZOT- |
| 3, 4, 5 | OPERATION THREE | -SET THE CRUSH BLOW SYSTEM- and the planet |
| 6 | OPERATION FOUR | -CRUSH SALAMANDER- |
| 7 | OPERATION X | -WRATH OF VENOM- |

In the Japanese version the subtitle of stages 3, 4 and 5 is
-SET THE LEEK SYSTEM- (`p15:BF5A`); the others are the same.

## The routes

![The stage 1 route](imagenes/recorrido_f1.png)

*Stage 1 whole, the way the game feeds it into the screen: it goes down
twice through another map.*

Stages 2, 3 and 6 scroll vertically; the others, horizontally
(`p02:8921`). Each stage map is made of 4 x 4 character blocks
(`p13:6F4C`), but the route is not a straight strip: in three stages the
scroll stops and the screen moves through another map (`p00:4BE6`):

- in stage 1, at scroll 0x11F the view goes down 24 rows through the map at
  `p14:80FC`, carries on horizontally and at 0x1FF goes down another 24;
- in stage 4, at 0x1BF it goes down 24 rows through `p14:815C`;
- in stage 6, which goes up, at 0x14F it moves 32 columns to the left and
  at 0x167 back to the right, through `p14:818C`.

| Stage | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| Scroll | [horizontal](imagenes/recorrido_f1.png) | [vertical](imagenes/recorrido_f2.png) | [vertical](imagenes/recorrido_f3.png) | [horizontal](imagenes/recorrido_f4.png) | [horizontal](imagenes/recorrido_f5.png) | [vertical](imagenes/recorrido_f6.png) | [horizontal](imagenes/recorrido_f7.png) |

*Each link leads to the whole route of its stage.*

In stage 4, between scrolls 0x100 and 0x150, the base is barely visible:
only one frame in 64 dumps the map with its scenery (`p00:5FC5`,
`p01:6016`). In stages 1, 3, 6 and 7 the characters change half way
(`p00:5C77`), and in stages 4, 5 and 6 some of them animate on their own
(`p12:A4A9`).

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

## The enemies

![Stage 1 enemies](imagenes/enemigos_f1.png)

*The stage 1 enemies, with the frames they use.*

There are 65 enemy types, each with a 7-byte record (`p01:6C5D`).

| Stage | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| Enemies | [stage 1](imagenes/enemigos_f1.png) | [stage 2](imagenes/enemigos_f2.png) | [stage 3](imagenes/enemigos_f3.png) | [stage 4](imagenes/enemigos_f4.png) | [stage 5](imagenes/enemigos_f5.png) | [stage 6](imagenes/enemigos_f6.png) | [stage 7](imagenes/enemigos_f7.png) |

## The bosses

![Boss 1](imagenes/jefe_1.png)

*Boss 1, a brain with two tentacles.*

The code of the eight bosses is in bank 11 (table `p01:6E89`). The
cartridge gives them no names: neither the English nor the Japanese texts
name any of them. The prophecy only speaks of «THE DEVIL» with his copper
shield, «THE HUGE SPHERE», «THE GREAT DEVIL» and his nucleus, and «THE FIVE
EYED GREEN DEVIL».

| Stage | Boss |
|---|---|
| 1 | [boss 1](imagenes/jefe_1.png): a brain with two tentacles |
| 2 | [boss 2](imagenes/jefe_2.png) |
| 3 | [boss 8](imagenes/jefe_8.png), a nest in the ceiling that drops spiders, then [boss 3](imagenes/jefe_3.png) |
| 4 | [boss 4](imagenes/jefe_4.png), after a wave (`p03:BD53`) |
| 5 | [boss 5](imagenes/jefe_5.png) |
| 6 | [boss 7](imagenes/jefe_7.png), an eye inside a sphere, then [boss 6](imagenes/jefe_6.png) |
| 7 | [the fixed core](imagenes/jefe_nucleo.png) at `p12:A000`, in two parts |

## The two endings

The ending comes when boss 6 falls (`p11:B58D`). With *Nemesis 2* in the
other slot and `0xE30A` set, it is the good one (`p10:8F7F`); otherwise, the
other one.

![The good ending](imagenes/final_bueno_3.png)

*The good ending: «CONGRATURATION! YOU ARE GREAT STAR FIGHTER».*

Before it come «ZELOS FORCE HAS DISAPPEARED!!» and «...PEACE WILL RETURN TO
LATIS AGAIN!!».

![The other ending](imagenes/final_malo_2.png)

*The other ending: VENOM shows up.*

The CRUSH BLOW fails, VENOM shows up («HE DIED ONCE, BUT HE IS NOW
REINCARNATED!!») and «THE CRUSH BLOW OPERATION TURNED OUT TO BE A FAILURE
AFTER ALL». Both end with THE END and EXTEND PLAY? Y/N.

| Ending | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| Good | [ZELOS FORCE](imagenes/final_bueno_1.png) | [PEACE](imagenes/final_bueno_2.png) | [the pilot](imagenes/final_bueno_3.png) | | |
| The other | [WHAT IS HAPPENED!?](imagenes/final_malo_1.png) | [VENOM](imagenes/final_malo_2.png) | [FAILURE](imagenes/final_malo_3.png) | [GO FOR THE FIGHT!!](imagenes/final_malo_4.png) | [THE END](imagenes/final_malo_5.png) |

*The screens of each ending, in order.*

## The texts

They are in bank 15, with a Japanese table and an English one chosen by
byte 0x002B of the BIOS (`p10:944C`). The English ones, as they come (typos
included):

- «A WARNING SIGNAL FROM LATIS.», «ZELOS-FORCE SURROUNDING LATIS»,
  «BIGIN CRUSH-BLOW OPERATIONS! SPACE FORCE!! GET SET!!»,
  «HYPER SPACE FIGHTER», «SABEL TIGER / PILOT - IGGY ROCK»,
  «THRASHER / PILOT - ZOWIE SCOTT», «CAN THEY RESCUE PLANET LATIS?»
- between stages: «ASSESS ARMS SUPPLY SITUATION THEN DICIDE WITHIN TIME
  LIMIT.», «WE HAVE SET ALL OF THE CRUSH BLOW SYSTEMS.», «OK, SWITCH ON!!»,
  «WAIT! PLEASE REMEMBER THE PREDICTION»
- the prediction, in four chapters: the devil that came from the sphere and
  his copper shield, the huge sphere and the shining ball, the great devil
  and his nucleus, and the five-eyed green devil that can only be killed by
  the crystal.
