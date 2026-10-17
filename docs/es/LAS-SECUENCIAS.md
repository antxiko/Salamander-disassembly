# Las secuencias

Las pantallas fijas están **rehechas con los bytes de la ROM** e iguales, píxel a píxel, a la VRAM de openMSX en ese momento. Las animaciones son la VRAM y los registros del VDP de cada cuadro de openMSX, pintados como los pinta el TMS9918 (`tools/anima.py`), un cuadro de cada tres.

## La presentación

![La presentación](../imagenes/presentacion.gif)

*La presentación entera, 32 segundos: el logotipo de Konami sobre azul, el
título con el menú (1PLAYER, EXCHANGE y DUALPLAY), THE SAGA CONTINUES,
KONAMI PRESENTS y el título que se monta.*

Si no se pulsa nada, sigue [la historia](../imagenes/historia.gif) (105
segundos): EMERGENCY, el aviso de Latis, ZELOS-FORCE rodeando el planeta,
las dos naves con sus pilotos y «CAN THEY RESCUE PLANET LATIS?», y otra vez
el título con «THE FANTASTIC SPACE ADVENTURE COMMENCES». Después empieza la
demostración.

Las pantallas fijas, cada una igual a la VRAM: [Konami](../imagenes/konami.png),
[el título](../imagenes/titulo.png),
[THE SAGA CONTINUES](../imagenes/saga.png),
[KONAMI PRESENTS](../imagenes/presents.png) y
[el título solo](../imagenes/titulo_solo.png).

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
