# El juego

**Siete fases**. La 1 y la 2 van siempre primero; la 3, la 4 y la 5, en el orden que elija el
jugador; luego la 6. La 7 solo existe con *Nemesis 2* en la otra ranura.

Todas las imágenes de esta página están **dibujadas desde los bytes de la
ROM** con `tools/imagenes.py`. Las pantallas de la presentación, el radar y
los finales son iguales, píxel a píxel, a la VRAM de openMSX en ese momento;
los enemigos y los jefes se pintan con los dibujos de la ROM sobre lo que
hacen en openMSX.

## La presentación

![El logotipo de Konami](../imagenes/konami.png)

![La pantalla de título](../imagenes/titulo.png)

*El título con el menú: 1PLAYER, EXCHANGE y DUALPLAY.*

Después salen [THE SAGA CONTINUES](../imagenes/saga.png),
[KONAMI PRESENTS](../imagenes/presents.png) y
[el título solo](../imagenes/titulo_solo.png).

## Las fases y su orden

![El radar para elegir planeta](../imagenes/eleccion.png)

*El radar con los tres planetas.*

Tras la fase 2, el juego enseña el radar con EIONEUS, LAVINIA y KIERKE, y el
jugador elige cuál hace antes: son las fases 3, 4 y 5, en el orden que él
quiera (`p10:988A`). Hay un reloj: si llega a cero, el juego elige solo
(`p10:9A43`). Detrás viene la 6. La 7, con *Nemesis 2*, va antes que la 6
(`p10:8B7B`).

Antes de cada fase sale el [despegue desde la base](../imagenes/despegue.png)
y un rótulo (`p10:8A20`):

![El rótulo de la fase 1](../imagenes/rotulo.png)

| Fase | Rótulo | Subtítulo |
|---|---|---|
| 1 | OPERATION ONE | -TOP FLIGHT SPEED TO LATIS- |
| 2 | OPERATION TWO | -CONDUCT TO SPACE STATION ZOT- |
| 3, 4, 5 | OPERATION THREE | -SET THE CRUSH BLOW SYSTEM- y el planeta |
| 6 | OPERATION FOUR | -CRUSH SALAMANDER- |
| 7 | OPERATION X | -WRATH OF VENOM- |

En la versión japonesa el subtítulo de las fases 3, 4 y 5 es
-SET THE LEEK SYSTEM- (`p15:BF5A`); los demás son iguales.

## Los recorridos

![El recorrido de la fase 1](../imagenes/recorrido_f1.png)

*La fase 1 entera, como el juego la va metiendo en la pantalla: baja dos
veces por otro mapa.*

La 2, la 3 y la 6 van en vertical; las demás, en horizontal (`p02:8921`).
El mapa de cada fase son bloques de 4 x 4 caracteres (`p13:6F4C`), pero el
recorrido no es una tira recta: en tres fases el scroll se para y la
pantalla se mueve por otro mapa (`p00:4BE6`):

- en la 1, al llegar al scroll 0x11F la vista baja 24 filas por el mapa de
  `p14:80FC`, sigue en horizontal y en 0x1FF vuelve a bajar otras 24;
- en la 4, en 0x1BF baja 24 filas por `p14:815C`;
- en la 6, que va hacia arriba, en 0x14F se va 32 columnas a la izquierda y
  en 0x167 vuelve a la derecha, por `p14:818C`.

| Fase | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| Sentido | [horizontal](../imagenes/recorrido_f1.png) | [vertical](../imagenes/recorrido_f2.png) | [vertical](../imagenes/recorrido_f3.png) | [horizontal](../imagenes/recorrido_f4.png) | [horizontal](../imagenes/recorrido_f5.png) | [vertical](../imagenes/recorrido_f6.png) | [horizontal](../imagenes/recorrido_f7.png) |

*Cada enlace lleva al recorrido entero de su fase.*

En la fase 4, entre los scrolls 0x100 y 0x150, la base casi no se ve: solo
uno de cada 64 cuadros vuelca el mapa con su decorado (`p00:5FC5`,
`p01:6016`). En las fases 1, 3, 6 y 7 los caracteres cambian a mitad de
camino (`p00:5C77`), y en las 4, 5 y 6 algunos se animan solos
(`p12:A4A9`).

## La nave

![Las catorce posturas de la nave](../imagenes/nave.png)

*Las catorce posturas.*

Son dos sprites de 16 x 16 y catorce posturas (`p09:A145`-`p09:A19F`,
dibujos en `p14:95F7`): recta, subiendo y bajando, las mismas con el escudo
delante y otras tantas para las fases verticales. El escudo aguanta los
golpes que cuenta IY+22 (`p02:960B`).

Hay dos naves: SABEL TIGER, la del piloto IGGY ROCK, y THRASHER, la de
ZOWIE SCOTT. La pantalla SELECTION de `p12:B877` pregunta YES o NO a
«PLAYER1 JOINT GAME».

## Los enemigos

![Los enemigos de la fase 1](../imagenes/enemigos_f1.png)

*Los enemigos de la fase 1, con los fotogramas que usan.*

Hay 65 tipos de enemigo, cada uno con su ficha de 7 bytes (`p01:6C5D`).

| Fase | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| Enemigos | [fase 1](../imagenes/enemigos_f1.png) | [fase 2](../imagenes/enemigos_f2.png) | [fase 3](../imagenes/enemigos_f3.png) | [fase 4](../imagenes/enemigos_f4.png) | [fase 5](../imagenes/enemigos_f5.png) | [fase 6](../imagenes/enemigos_f6.png) | [fase 7](../imagenes/enemigos_f7.png) |

## Los jefes

![El jefe 1](../imagenes/jefe_1.png)

*El jefe 1, un cerebro con dos tentáculos.*

El código de los ocho jefes está en el banco 11 (tabla `p01:6E89`).

| Fase | Jefe |
|---|---|
| 1 | [el 1](../imagenes/jefe_1.png): un cerebro con dos tentáculos |
| 2 | [el 2](../imagenes/jefe_2.png) |
| 3 | [el 8](../imagenes/jefe_8.png), un nido en el techo que suelta arañas, y luego [el 3](../imagenes/jefe_3.png) |
| 4 | [el 4](../imagenes/jefe_4.png), después de una oleada (`p03:BD53`) |
| 5 | [el 5](../imagenes/jefe_5.png) |
| 6 | [el 7](../imagenes/jefe_7.png), un ojo dentro de una esfera, y luego [el 6](../imagenes/jefe_6.png) |
| 7 | [el núcleo](../imagenes/jefe_nucleo.png) fijo de `p12:A000`, en dos tramos |

## Los objetos

En las fases 3, 5 y 6 hay objetos que se recogen (`p12:A5CE`). Al
recogerlos sale una pantalla con su resultado. Con el objeto 1 dice
«IN THE RUIN OF LATIS... YOU HAVE GOT A CRYSTAL BREEZE» y `p01:7B73` pone
`0xE30A` = 1.

## Los dos finales

El final llega al caer el jefe 6 (`p11:B58D`). Si están *Nemesis 2* en la
otra ranura y `0xE30A`, es el bueno (`p10:8F7F`); si no, el otro.

![El final bueno](../imagenes/final_bueno_3.png)

*El final bueno: «CONGRATURATION! YOU ARE GREAT STAR FIGHTER».*

Antes salen «ZELOS FORCE HAS DISAPPEARED!!» y «...PEACE WILL RETURN TO
LATIS AGAIN!!».

![El otro final](../imagenes/final_malo_2.png)

*El otro final: aparece VENOM.*

El CRUSH BLOW falla, aparece VENOM («HE DIED ONCE, BUT HE IS NOW
REINCARNATED!!») y «THE CRUSH BLOW OPERATION TURNED OUT TO BE A FAILURE
AFTER ALL». Los dos acaban en THE END y EXTEND PLAY? Y/N.

| Final | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| Bueno | [ZELOS FORCE](../imagenes/final_bueno_1.png) | [PEACE](../imagenes/final_bueno_2.png) | [el piloto](../imagenes/final_bueno_3.png) | | |
| El otro | [WHAT IS HAPPENED!?](../imagenes/final_malo_1.png) | [VENOM](../imagenes/final_malo_2.png) | [FAILURE](../imagenes/final_malo_3.png) | [GO FOR THE FIGHT!!](../imagenes/final_malo_4.png) | [THE END](../imagenes/final_malo_5.png) |

*Las pantallas de cada final, en orden.*

## Los textos

Están en el banco 15, con una tabla japonesa y otra inglesa según el byte
0x002B de la BIOS (`p10:944C`). Los ingleses, tal como vienen (con sus
erratas):

- «A WARNING SIGNAL FROM LATIS.», «ZELOS-FORCE SURROUNDING LATIS»,
  «BIGIN CRUSH-BLOW OPERATIONS! SPACE FORCE!! GET SET!!»,
  «HYPER SPACE FIGHTER», «SABEL TIGER / PILOT - IGGY ROCK»,
  «THRASHER / PILOT - ZOWIE SCOTT», «CAN THEY RESCUE PLANET LATIS?»
- entre fases: «ASSESS ARMS SUPPLY SITUATION THEN DICIDE WITHIN TIME
  LIMIT.», «WE HAVE SET ALL OF THE CRUSH BLOW SYSTEMS.», «OK, SWITCH ON!!»,
  «WAIT! PLEASE REMEMBER THE PREDICTION»
- la profecía, en cuatro capítulos: el diablo que vino de la esfera y su
  escudo de cobre, la esfera enorme y la bola brillante, el gran diablo y su
  núcleo, y el diablo verde de cinco ojos que solo muere con el cristal.
