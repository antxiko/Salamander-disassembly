# La música

Cada pieza se ha sacado ejecutando el propio motor de sonido del cartucho
(`tools/musica.py` con `tools/motor_musica.py` y `tools/z80run.py`): se pide
con `pide_sonido` (`p00:4D6E`, que pone los bancos 4, 5 y 6 y llama a
`p04:6472`) y cada cuadro se llama a `p04:6978`, como hace la interrupción.
De ahí salen las escrituras al PSG y al SCC de cada cuadro, que se mezclan
en un MP3. Las que vuelven a empezar se oyen dos veces y se apagan.

## El cotejo

Las escrituras se han comparado con las de openMSX, registro a registro
(`tools/omsx_psg.tcl` y `tools/coteja_psg.py`):

- la del logotipo de Konami (0x4E), 193 cuadros, y la del título (0x2E),
  132, en la presentación: el PSG y el SCC iguales en todos;
- las de las siete fases, unos 375 cuadros de cada una,
  tres veces en cada partida: iguales en todos. Para oír cada una en su
  sitio, la sonda usa una copia de la ROM en la que la cabecera de la música
  de la fase 1 apunta a la de la pieza (`tools/rom_musica.py`). Como los
  efectos suenan por el canal C del PSG y el primero del SCC, se comparan
  los canales de la música;
- la de los jefes (0x21) y la del objeto recogido (0x22), tres veces cada
  una, y las de los dos finales (0x30 y 0x31), una vez, unos 375 cuadros:
  iguales en todos;
- la de entre fases (0x2F) y uno de los tramos de la fase 7 (0x19) difieren
  solo en el cuadro 0, en el registro 1 del PSG, que conserva lo que dejó la
  pieza anterior;
- la del despegue (0x28), 72 cuadros: igual.

## Las piezas

### 0x4E El logotipo de Konami (y cae un jefe: la 0x25 suena igual)

Se pide en `p10:82D7 (la 0x25, en p02:9CB8 y p11:B575)`

<audio controls preload="none" src="../audio/musica_4E.mp3?v=7c127c1c"></audio>

### 0x2E El título

Se pide en `p10:83B3`

<audio controls preload="none" src="../audio/musica_2E.mp3?v=ae54ffd0"></audio>

### 0x28 El despegue

Se pide en `p10:887B`

<audio controls preload="none" src="../audio/musica_28.mp3?v=bc0fbcde"></audio>

### 0x48 La nave sale

Se pide en `p10:88A0 y p10:88E3`

<audio controls preload="none" src="../audio/musica_48.mp3?v=294c97c3"></audio>

### 0x1B Fase 1

Se pide en `p02:876A, la lista de la fase 1`

<audio controls preload="none" src="../audio/musica_1B.mp3?v=a6d25ea0"></audio>

### 0x1C Fase 2

Se pide en `p02:876A, la lista de la fase 2`

<audio controls preload="none" src="../audio/musica_1C.mp3?v=0507f780"></audio>

### 0x1E Fase 3

Se pide en `p02:876A, la lista de la fase 3`

<audio controls preload="none" src="../audio/musica_1E.mp3?v=cb57f9ff"></audio>

### 0x1D Fase 4

Se pide en `p02:876A, la lista de la fase 4`

<audio controls preload="none" src="../audio/musica_1D.mp3?v=3dbdbb41"></audio>

### 0x1F Fase 5

Se pide en `p02:876A, la lista de la fase 5`

<audio controls preload="none" src="../audio/musica_1F.mp3?v=b5cd2c0f"></audio>

### 0x20 Fase 6

Se pide en `p02:876A, la lista de la fase 6`

<audio controls preload="none" src="../audio/musica_20.mp3?v=01313b59"></audio>

### 0x19 Fase 7 (OPERATION X)

Se pide en `p02:876A, la lista de la fase 7`

<audio controls preload="none" src="../audio/musica_19.mp3?v=3235c1eb"></audio>

### 0x21 Los jefes

Se pide en `p02:876A, al final de cada lista`

<audio controls preload="none" src="../audio/musica_21.mp3?v=c68b0a4d"></audio>

### 0x24 Cae un jefe

Se pide en `p02:9CFE, p11:A372 y p11:B580`

<audio controls preload="none" src="../audio/musica_24.mp3?v=12e891a8"></audio>

### 0x27 La nave estalla

Se pide en `p02:96A4`

<audio controls preload="none" src="../audio/musica_27.mp3?v=591b56e4"></audio>

### 0x2F Entre fases

Se pide en `p10:8C36 y p10:8DB3`

<audio controls preload="none" src="../audio/musica_2F.mp3?v=d1b89c7e"></audio>

### 0x22 La pieza de p00:56C4

Se pide en `p00:56C4`

<audio controls preload="none" src="../audio/musica_22.mp3?v=408c9be1"></audio>

### 0x30 El final, sin el cartucho de Nemesis 2

Se pide en `p10:8FEA`

<audio controls preload="none" src="../audio/musica_30.mp3?v=43c89a9c"></audio>

### 0x31 El final bueno

Se pide en `p10:8FE6 y p03:A3DB`

<audio controls preload="none" src="../audio/musica_31.mp3?v=87eb632c"></audio>

### 0x32 Fin de la partida

Se pide en `p00:551F`

<audio controls preload="none" src="../audio/musica_32.mp3?v=f059310c"></audio>

### 0x34 La ventana de la presentación

Se pide en `p10:82C5`

<audio controls preload="none" src="../audio/musica_34.mp3?v=22d60cd0"></audio>
