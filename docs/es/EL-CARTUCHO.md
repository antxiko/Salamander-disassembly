# El cartucho

## La máquina

Un MSX de primera generación: el VDP TMS9918 en SCREEN 2, el PSG y el SCC
que lleva el propio cartucho. Nombres en 0x3800, colores en 0x0000, dibujos
en 0x2000, dibujos de sprite en 0x1800 y sus atributos en 0x3B00. La zona
de juego son 21 filas; las tres de abajo son el marcador.

## El mapper

Es el de Konami con SCC: dieciséis bancos de 8 KB. El 0 está fijo en 0x4000
y los otros tres huecos se eligen en 0x7000, 0x9000 y 0xB000, con una copia
en `0xF0F1`-`0xF0F3`. El juego los pone de tres en tres
(`p00:416E`-`p00:417D`): 1-2-3 para el juego, 4-5-6 para el sonido, 7-8-9
para los gráficos y 13-14-15 para los mapas. El 10 va solo en 0x8000 (la
presentación, las escenas y los finales) y el 11 y el 12 solos en 0xA000
(los jefes y los enemigos especiales). El banco 0x3F en 0x8000 abre el SCC.

## La interrupción

INIT (`p00:40DA`) borra la RAM del juego, instala el gancho H.KEYI y se
queda en `jr $`: todo corre dentro de la interrupción (`p00:4069`). Primero
el sonido, con los bancos 4-5-6 (`p04:6978`); después, si el cuadro anterior
ha acabado (`0xE205`), un cuadro de juego.

## El sonido

Ocho canales de 0x2C bytes desde `0xE000`: tres del PSG y cinco del SCC.
Son 89 sonidos; cada uno tiene una cabecera con sus canales y su prioridad
(`p04:663E`) y una partitura por canal. Los efectos usan dos canales (el C
del PSG y el primero del SCC) y las músicas seis u ocho, así que una música
de seis sigue sonando por debajo de los efectos. Las órdenes 0xF0-0xF6
hacen la pausa, los fundidos y el paso del SCC al PSG (`p04:6472`).

## La RAM

El juego usa `0xE000`-`0xEFFF`. Los 12 enemigos son fichas de 0x40 bytes
en `0xE700`, los 15 disparos de la nave van en `0xE440` y el jefe en
`0xEC80`. La pantalla se monta en la RAM, en `0xCA00` con 64 bytes por
fila, y cada cuadro se vuelca a la VRAM (`p00:5FED`).

## El otro cartucho

Al arrancar, `p03:B599` mira qué hay en la otra ranura. Si encuentra
*Nemesis 2* (`p03:B5E3` compara su 0x4010 con CD 07 51 y seis bytes de su
0x7FFA), se abre la fase 7. Para dibujarla, `p00:5B91` copia a 0xC000 una
rutina que pone el otro cartucho y trae 1.137 bytes, veinte trozos de sus
bancos 7, 8 y 9 (tabla `p00:5BFE`), a `0xC100`.
