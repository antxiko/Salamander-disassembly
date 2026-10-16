; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 04 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS ondas: 41 punteros a las formas de onda del SCC (orden 0xF8 de la
;   partitura, p04:6FAF: 0x6000 + 2 x n); apuntan a las 33 ondas de detras; lo
;   leen p04:6FB8 (82 bytes)
;   0x6000..0x6052  (82 bytes)
DATA_ondas:
	defw 06052h,06052h,06072h,06092h,060b2h,060d2h,060f2h,060f2h	; 6000
	defw 060f2h,06112h,06132h,06152h,06172h,06192h,061b2h,061d2h	; 6010
	defw 061f2h,06212h,06212h,06212h,06232h,06252h,06272h,06272h	; 6020
	defw 06292h,06292h,062b2h,062d2h,062f2h,06312h,06332h,06332h	; 6030
	defw 06352h,06372h,06392h,063b2h,063d2h,063f2h,06412h,06432h	; 6040
	defw 06452h	; 6050  -> DATA_onda_32

; ----------------------------------------------------------------------
; DATOS onda_00: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6052..0x6072  (32 bytes)
DATA_onda_00:
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,080h,080h,080h,080h,080h,080h,080h,080h	; 6052  ................
	defb 07fh,07fh,07fh,07fh,07fh,07fh,07fh,07fh,080h,080h,080h,080h,080h,080h,080h,080h	; 6062  ................

; ----------------------------------------------------------------------
; DATOS onda_01: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6072..0x6092  (32 bytes)
DATA_onda_01:
	defb 000h,0f8h,0f0h,0e8h,0e0h,0d8h,0d0h,0c8h,0c0h,0b8h,0b0h,0a8h,0a0h,098h,090h,088h	; 6072  ................
	defb 080h,078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h	; 6082  .xph`XPH@80( ...

; ----------------------------------------------------------------------
; DATOS onda_02: forma de onda del SCC: 32 muestras con signo (ninguna
;   partitura la pide); lo leen p04:6FB8 (32 bytes)
;   0x6092..0x60b2  (32 bytes)
DATA_onda_02:
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h	; 6092  .........p`P@0 .
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h	; 60a2  .........p`P@0 .

; ----------------------------------------------------------------------
; DATOS onda_03: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x60b2..0x60d2  (32 bytes)
DATA_onda_03:
	defb 000h,04eh,062h,06dh,075h,07ah,07dh,07eh,07fh,07eh,07dh,07ah,075h,06dh,062h,04eh	; 60b2  .Nbmuz}~.~}zumbN
	defb 000h,0b1h,09dh,092h,08ah,085h,082h,081h,080h,081h,082h,085h,08ah,092h,09dh,0b1h	; 60c2  ................

; ----------------------------------------------------------------------
; DATOS onda_04: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x60d2..0x60f2  (32 bytes)
DATA_onda_04:
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 60d2  ..1GZju}.}ujZG1.
	defb 000h,0e7h,0cfh,0b9h,0a6h,096h,08bh,083h,080h,083h,08bh,096h,0a6h,0b9h,0cfh,0e7h	; 60e2  ................

; ----------------------------------------------------------------------
; DATOS onda_05: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x60f2..0x6112  (32 bytes)
DATA_onda_05:
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 60f2  ..1GZju}.}ujZG1.
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h	; 6102  ................

; ----------------------------------------------------------------------
; DATOS onda_06: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6112..0x6132  (32 bytes)
DATA_onda_06:
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 6112  ..1GZju}.}ujZG1.
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 6122  ......... @`.`@

; ----------------------------------------------------------------------
; DATOS onda_07: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6132..0x6152  (32 bytes)
DATA_onda_07:
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 6132  ..1GZju}.}ujZG1.
	defb 080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h,000h,010h,020h,030h,040h,050h,060h,070h	; 6142  .......... 0@P`p

; ----------------------------------------------------------------------
; DATOS onda_08: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6152..0x6172  (32 bytes)
DATA_onda_08:
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 6152  ..1GZju}.}ujZG1.
	defb 080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h	; 6162  ..... @`..... @`

; ----------------------------------------------------------------------
; DATOS onda_09: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6172..0x6192  (32 bytes)
DATA_onda_09:
	defb 001h,02ah,040h,050h,05ch,068h,070h,078h,07fh,078h,070h,068h,05ch,050h,040h,02ah	; 6172  .*@P\hpx.xph\P@*
	defb 0ffh,0d6h,0c0h,0b0h,0a4h,098h,090h,088h,081h,088h,090h,098h,0a4h,0b0h,0c0h,0d6h	; 6182  ................

; ----------------------------------------------------------------------
; DATOS onda_10: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6192..0x61b2  (32 bytes)
DATA_onda_10:
	defb 000h,040h,07fh,040h,001h,0c0h,081h,0c0h,001h,040h,07fh,040h,001h,0c0h,001h,040h	; 6192  .@.@.....@.@...@
	defb 001h,0e0h,001h,020h,001h,0f0h,001h,010h,001h,0ffh,0ffh,0ffh,0ffh,040h,040h,040h	; 61a2  ... .........@@@

; ----------------------------------------------------------------------
; DATOS onda_11: forma de onda del SCC: 32 muestras con signo (ninguna
;   partitura la pide); lo leen p04:6FB8 (32 bytes)
;   0x61b2..0x61d2  (32 bytes)
DATA_onda_11:
	defb 078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 61b2  xph`XPH@80( ....
	defb 078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 61c2  xph`XPH@80( ....

; ----------------------------------------------------------------------
; DATOS onda_12: forma de onda del SCC: 32 muestras con signo (ninguna
;   partitura la pide); lo leen p04:6FB8 (32 bytes)
;   0x61d2..0x61f2  (32 bytes)
DATA_onda_12:
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 61d2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 61e2  ................

; ----------------------------------------------------------------------
; DATOS onda_13: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x61f2..0x6212  (32 bytes)
DATA_onda_13:
	defb 000h,040h,07fh,040h,001h,010h,020h,02dh,037h,044h,04eh,059h,063h,06ch,073h,078h	; 61f2  .@.@.. -7DNYclsx
	defb 07ch,07fh,07ch,078h,073h,06ch,059h,04eh,044h,037h,02dh,020h,010h,003h,002h,001h	; 6202  |.|xslYND7- ....

; ----------------------------------------------------------------------
; DATOS onda_14: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6212..0x6232  (32 bytes)
DATA_onda_14:
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,080h,080h,080h,080h,080h,080h,080h	; 6212  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,07fh,070h,060h,050h,040h,030h,020h,010h	; 6222  .........p`P@0 .

; ----------------------------------------------------------------------
; DATOS onda_15: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6232..0x6252  (32 bytes)
DATA_onda_15:
	defb 000h,030h,050h,060h,070h,060h,050h,030h,000h,0d0h,0b0h,0a0h,090h,0a0h,0b0h,0d0h	; 6232  .0P`p`P0........
	defb 000h,040h,060h,070h,060h,040h,000h,0c0h,0a0h,090h,0a0h,0c0h,000h,070h,000h,090h	; 6242  .@`p`@.......p..

; ----------------------------------------------------------------------
; DATOS onda_16: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6252..0x6272  (32 bytes)
DATA_onda_16:
	defb 030h,050h,050h,030h,000h,000h,010h,040h,060h,070h,060h,030h,0f0h,0e0h,0e0h,000h	; 6252  0PP0...@`p`0....
	defb 020h,020h,010h,0c0h,0a0h,090h,0a0h,0c0h,000h,000h,0d0h,0b0h,0b0h,0d0h,000h,000h	; 6262    ..............

; ----------------------------------------------------------------------
; DATOS onda_17: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6272..0x6292  (32 bytes)
DATA_onda_17:
	defb 000h,07fh,000h,080h,0a0h,0c0h,0d8h,0f0h,008h,020h,030h,040h,050h,060h,070h,078h	; 6272  ......... 0@P`px
	defb 07ch,07fh,07ch,078h,070h,060h,050h,040h,030h,020h,008h,0f0h,0d8h,0c0h,0a0h,080h	; 6282  |.|xp`P@0 ......

; ----------------------------------------------------------------------
; DATOS onda_18: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6292..0x62b2  (32 bytes)
DATA_onda_18:
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 6292  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 62a2  ................

; ----------------------------------------------------------------------
; DATOS onda_19: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x62b2..0x62d2  (32 bytes)
DATA_onda_19:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 62b2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 62c2  ................

; ----------------------------------------------------------------------
; DATOS onda_20: forma de onda del SCC: 32 muestras con signo (ninguna
;   partitura la pide); lo leen p04:6FB8 (32 bytes)
;   0x62d2..0x62f2  (32 bytes)
DATA_onda_20:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 62d2  ................
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 62e2  ................

; ----------------------------------------------------------------------
; DATOS onda_21: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x62f2..0x6312  (32 bytes)
DATA_onda_21:
	defb 080h,08eh,0a0h,0c0h,0e0h,000h,020h,03fh,03eh,03ch,03ah,037h,031h,029h,020h,01ch	; 62f2  ...... ?><:71) .
	defb 010h,000h,0e6h,0c0h,0d0h,000h,020h,03fh,010h,0e0h,080h,0c0h,000h,020h,000h,090h	; 6302  ...... ?..... ..

; ----------------------------------------------------------------------
; DATOS onda_22: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6312..0x6332  (32 bytes)
DATA_onda_22:
	defb 000h,070h,050h,020h,050h,070h,030h,000h,050h,07fh,060h,010h,030h,040h,000h,0b0h	; 6312  .pP Pp0.P.`.0@..
	defb 010h,060h,000h,0e0h,0f0h,000h,0b0h,090h,0c0h,010h,0e0h,0a0h,0c0h,0f0h,0c0h,0a0h	; 6322  .`..............

; ----------------------------------------------------------------------
; DATOS onda_23: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6332..0x6352  (32 bytes)
DATA_onda_23:
	defb 000h,020h,030h,040h,050h,060h,068h,070h,078h,070h,068h,060h,050h,040h,030h,020h	; 6332  . 0@P`hpxph`P@0
	defb 000h,0e0h,0d0h,0c0h,0b0h,0a0h,098h,090h,088h,090h,098h,0a0h,0b0h,0c0h,0d0h,0e0h	; 6342  ................

; ----------------------------------------------------------------------
; DATOS onda_24: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6352..0x6372  (32 bytes)
DATA_onda_24:
	defb 000h,000h,000h,000h,000h,078h,078h,000h,000h,080h,080h,080h,000h,000h,000h,000h	; 6352  .....xx.........
	defb 078h,078h,078h,000h,080h,080h,000h,000h,000h,000h,078h,078h,000h,000h,080h,080h	; 6362  xxx.......xx....

; ----------------------------------------------------------------------
; DATOS onda_25: forma de onda del SCC: 32 muestras con signo (ninguna
;   partitura la pide); lo leen p04:6FB8 (32 bytes)
;   0x6372..0x6392  (32 bytes)
DATA_onda_25:
	defb 078h,078h,078h,078h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 6372  xxxx............
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 6382  ................

; ----------------------------------------------------------------------
; DATOS onda_26: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6392..0x63b2  (32 bytes)
DATA_onda_26:
	defb 078h,078h,078h,078h,078h,078h,078h,078h,080h,080h,080h,080h,080h,080h,080h,080h	; 6392  xxxxxxxx........
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 63a2  ................

; ----------------------------------------------------------------------
; DATOS onda_27: forma de onda del SCC: 32 muestras con signo (ninguna
;   partitura la pide); lo leen p04:6FB8 (32 bytes)
;   0x63b2..0x63d2  (32 bytes)
DATA_onda_27:
	defb 080h,0b0h,0c0h,010h,01ah,02ah,02ch,01ah,000h,0e0h,0d0h,0e0h,022h,053h,070h,075h	; 63b2  .....*,....."Spu
	defb 070h,031h,0eah,080h,088h,08ah,08ch,08eh,000h,07fh,075h,073h,062h,000h,0c0h,090h	; 63c2  p1........usb...

; ----------------------------------------------------------------------
; DATOS onda_28: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x63d2..0x63f2  (32 bytes)
DATA_onda_28:
	defb 000h,020h,030h,040h,050h,058h,060h,068h,070h,068h,060h,058h,050h,040h,030h,020h	; 63d2  . 0@PX`hph`XP@0
	defb 000h,0e0h,0d0h,0c0h,0b0h,0a0h,098h,090h,088h,090h,098h,0a0h,0b0h,0c0h,0d0h,0e0h	; 63e2  ................

; ----------------------------------------------------------------------
; DATOS onda_29: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x63f2..0x6412  (32 bytes)
DATA_onda_29:
	defb 000h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h,080h,000h,000h,000h,000h	; 63f2  .....pp.........
	defb 070h,070h,070h,000h,080h,080h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h	; 6402  ppp.......pp....

; ----------------------------------------------------------------------
; DATOS onda_30: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6412..0x6432  (32 bytes)
DATA_onda_30:
	defb 000h,000h,000h,080h,000h,070h,070h,070h,000h,000h,000h,080h,000h,000h,000h,080h	; 6412  .....ppp........
	defb 080h,080h,080h,000h,080h,000h,000h,000h,000h,080h,080h,080h,000h,080h,080h,080h	; 6422  ................

; ----------------------------------------------------------------------
; DATOS onda_31: forma de onda del SCC: 32 muestras con signo (ninguna
;   partitura la pide); lo leen p04:6FB8 (32 bytes)
;   0x6432..0x6452  (32 bytes)
DATA_onda_31:
	defb 000h,030h,0f0h,030h,040h,050h,060h,060h,070h,079h,070h,078h,040h,000h,000h,00eh	; 6432  .0.0@P``pypx@...
	defb 070h,083h,060h,050h,000h,000h,000h,026h,074h,082h,084h,065h,064h,0e4h,093h,084h	; 6442  p.`P...&t..ed...

; ----------------------------------------------------------------------
; DATOS onda_32: forma de onda del SCC: 32 muestras con signo; lo leen
;   p04:6FB8 (32 bytes)
;   0x6452..0x6472  (32 bytes)
DATA_onda_32:
	defb 070h,070h,070h,070h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h,080h,080h	; 6452  pppppppp........
	defb 070h,070h,070h,080h,080h,080h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h	; 6462  ppp...pppp......

; ======================================================================
; CODIGO 0x6472..0x6563  (241 bytes)
; ======================================================================


arranca_sonido:		; arranca el sonido A: cabecera de 0x663E y una partitura por canal
	ld c,a			;6472   ; el numero en C
	cp 0f0h		;6473   ; 0xF0: quita la pausa
	jp z,L_657F		;6475
	cp 0f1h		;6478   ; 0xF1: fundido
	jp z,L_6591		;647a
	cp 0f4h		;647d   ; 0xF4: otro fundido
	jp z,L_6586		;647f
	cp 0f5h		;6482   ; 0xF5: la subida
	jp z,L_656F		;6484
	cp 0f6h		;6487   ; 0xF6: los canales del SCC al PSG
	jp z,L_65EE		;6489
	cp 0f2h		;648c   ; 0xF2: y de vuelta
	jp z,L_65A8		;648e
	cp 0f3h		;6491   ; 0xF3: al PSG y sigue
	call z,L_65EE		;6493
	ld hl,0e1b9h		;6496   ; apunta a el sonido que se esta arrancando
	ld (hl),c			;6499   ; el sonido que arranca
	ld hl,0663eh		;649a   ; la cabecera: 0x663E + 2 x numero
	ld a,c			;649d
	add a,c			;649e
	ld e,a			;649f
	ld d,000h		;64a0
	add hl,de			;64a2
	ld e,(hl)			;64a3   ; su direccion
	inc hl			;64a4
	ld d,(hl)			;64a5
	ex de,hl			;64a6   ; HL = la cabecera
	ld de,0e1bah		;64a7   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	ld bc,00012h		;64aa   ; 18 bytes
	ldir		;64ad
	ld ix,0e1bch		;64af   ; las palabras de partitura, de 0xE1BC en adelante
	ld hl,0e1bah		;64b3   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 7,(hl)		;64b6   ; bit 7: el canal 1 (0xE000)
	jr z,L_64C6		;64b8
	inc hl			;64ba   ; la prioridad
	ld a,(hl)			;64bb
	ld hl,0e001h		;64bc   ; el canal
	call L_6543		;64bf   ; lo arranca si le toca (p04:6543)
	inc ix		;64c2   ; la palabra siguiente
	inc ix		;64c4
L_64C6:
	ld hl,0e1bah		;64c6   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 6,(hl)		;64c9   ; bit 6: el canal 2 (0xE02C)
	jr z,L_64D9		;64cb
	inc hl			;64cd
	ld a,(hl)			;64ce
	ld hl,0e02dh		;64cf
	call L_6543		;64d2
	inc ix		;64d5
	inc ix		;64d7
L_64D9:
	ld hl,0e1bah		;64d9   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 5,(hl)		;64dc   ; bit 5: el canal 3 (0xE058)
	jr z,L_64EC		;64de
	inc hl			;64e0
	ld a,(hl)			;64e1
	ld hl,0e059h		;64e2
	call L_6543		;64e5
	inc ix		;64e8
	inc ix		;64ea
L_64EC:
	ld hl,0e1bah		;64ec   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 4,(hl)		;64ef   ; bit 4: el canal 4 (0xE084)
	jr z,L_64FF		;64f1
	inc hl			;64f3
	ld a,(hl)			;64f4
	ld hl,0e085h		;64f5
	call L_6543		;64f8
	inc ix		;64fb
	inc ix		;64fd
L_64FF:
	ld hl,0e1bah		;64ff   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 3,(hl)		;6502   ; bit 3: el canal 5 (0xE0B0)
	jr z,L_6512		;6504
	inc hl			;6506
	ld a,(hl)			;6507
	ld hl,0e0b1h		;6508
	call L_6543		;650b
	inc ix		;650e
	inc ix		;6510
L_6512:
	ld hl,0e1bah		;6512   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 2,(hl)		;6515   ; bit 2: el canal 6 (0xE0DC)
	jr z,L_6525		;6517
	inc hl			;6519
	ld a,(hl)			;651a
	ld hl,0e0ddh		;651b
	call L_6543		;651e
	inc ix		;6521
	inc ix		;6523
L_6525:
	ld hl,0e1bah		;6525   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 1,(hl)		;6528   ; bit 1: el canal 7 (0xE108)
	jr z,L_6538		;652a
	inc hl			;652c
	ld a,(hl)			;652d
	ld hl,0e109h		;652e
	call L_6543		;6531
	inc ix		;6534
	inc ix		;6536
L_6538:
	ld hl,0e1bah		;6538   ; apunta a la cabecera del sonido que se arranca (18 bytes)
	bit 0,(hl)		;653b   ; bit 0: el canal 8 (0xE134)
	ret z			;653d
	inc hl			;653e
	ld a,(hl)			;653f
	ld hl,0e135h		;6540
L_6543:
	ld b,(hl)			;6543   ; la prioridad del que suena
	cp b			;6544   ; la nueva es menor: no se lo quita
	ret c			;6545
	ex de,hl			;6546   ; DE = el canal + 1
	ld (de),a			;6547   ; la prioridad
	dec de			;6548   ; el byte de antes...
	ld hl,0e1b9h		;6549   ; apunta a el sonido que se esta arrancando
	ld a,(hl)			;654c   ; ...el numero de sonido
	ld (de),a			;654d
	inc de			;654e   ; el canal + 2
	inc de			;654f
	ld a,(ix+000h)		;6550   ; la partitura, bajo
	ld (de),a			;6553
	inc de			;6554
	ld a,(ix+001h)		;6555   ; alto
	ld (de),a			;6558
	inc de			;6559
	ld hl,06563h		;655a   ; el resto del canal de 0x6563 (12 bytes): la cuenta a 1 y lo demas a 0
	ld bc,0000ch		;655d
	ldir		;6560
	ret			;6562

; ----------------------------------------------------------------------
; DATOS canal_nuevo: 12 bytes que p04:655A copia a un canal al arrancarlo
;   (detras de la cuenta, el sonido y la partitura): todo a 0; lo leen
;   p04:655A (12 bytes)
;   0x6563..0x656f  (12 bytes)
DATA_canal_nuevo:
	defb 001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6563  ............

; ======================================================================
; CODIGO 0x656f..0x6640  (209 bytes)
; ======================================================================


L_656F:
	ld hl,0e1b8h		;656f   ; 0xF5: la subida (0xE1B8 bit 4) sin pausa
	set 4,(hl)		;6572
	res 0,(hl)		;6574
	ld hl,0e1ceh		;6576   ; 0xE1CE = 0, 0xE1CF = 9
	ld (hl),000h		;6579
	inc hl			;657b
	ld (hl),009h		;657c
	ret			;657e
L_657F:
	ld hl,0e1b8h		;657f   ; 0xF0: sin pausa
	res 0,(hl)		;6582
	jr L_65A0		;6584
L_6586:
	ld hl,0e1cch		;6586   ; 0xF4: 37 cuadros y 10 pasos
	ld (hl),025h		;6589
	inc hl			;658b
	ld (hl),00ah		;658c
	jp L_6599		;658e
L_6591:
	ld hl,0e1cch		;6591   ; 0xF1: 37 cuadros y 10 pasos
	ld (hl),025h		;6594
	inc hl			;6596
	ld (hl),00ah		;6597
L_6599:
	ld hl,0e1b8h		;6599   ; la pausa (0xE1B8 bit 0) sin subida
	set 0,(hl)		;659c
	res 4,(hl)		;659e
L_65A0:
	ld hl,0e1ceh		;65a0   ; las cuentas a 0
	xor a			;65a3
	ld (hl),a			;65a4
	inc hl			;65a5
	ld (hl),a			;65a6
	ret			;65a7
L_65A8:
	ld hl,0e1b8h		;65a8   ; 0xF2: vuelven los canales del SCC
	res 1,(hl)		;65ab
	bit 3,(hl)		;65ad   ; los habia en pausa?
	jr z,L_65B5		;65af
	res 3,(hl)		;65b1
	set 0,(hl)		;65b3   ; entonces la pausa otra vez
L_65B5:
	ld hl,0e160h		;65b5   ; los canales 3-4 guardados de 0xE160 a 0xE058
	ld de,0e058h		;65b8
	call L_663A		;65bb   ; 0x58 bytes
	ld a,(0e1eah)		;65be   ; los canales del SCC que sonaban (0xE1EA)
	ld e,a			;65c1
	ld a,03fh		;65c2   ; el SCC en 0x9800
	ld (09000h),a		;65c4   ; el mapper: pone en 0x8000 el banco de A
	ld a,e			;65c7   ; al SCC: los canales que suenan
	ld (0988fh),a		;65c8   ; al SCC: los canales del SCC que suenan (un bit cada uno)
	ld a,005h		;65cb   ; el banco 5 otra vez
	ld (09000h),a		;65cd   ; el mapper: pone en 0x8000 el banco de A
	ld a,0ffh		;65d0   ; 0xE1D8-0xE1D9 = 0xFF
	ld hl,0e1d8h		;65d2
	ld (hl),a			;65d5
	inc hl			;65d6
	ld (hl),a			;65d7
	call L_728E		;65d8   ; p04:728E
	ld hl,0e00dh		;65db   ; el modo del canal 1...
	ld a,(hl)			;65de
	rrca			;65df   ; ...cuatro bits girados
	rrca			;65e0
	rrca			;65e1
	rrca			;65e2
	ld (hl),a			;65e3
	ld hl,0e039h		;65e4   ; el del canal 2
	ld a,(hl)			;65e7
	rrca			;65e8
	rrca			;65e9
	rrca			;65ea
	rrca			;65eb
	ld (hl),a			;65ec
	ret			;65ed
L_65EE:
	ld hl,0e1b8h		;65ee   ; 0xF6: los canales del SCC al PSG (0xE1B8 bit 1)
	set 1,(hl)		;65f1
	bit 0,(hl)		;65f3   ; en pausa?
	jr z,L_65FB		;65f5
	res 0,(hl)		;65f7   ; la pausa al bit 3
	set 3,(hl)		;65f9
L_65FB:
	ld hl,0e058h		;65fb   ; guarda los canales 3-4 en 0xE160
	ld de,0e160h		;65fe
	call L_663A		;6601
	ld a,03fh		;6604   ; el SCC en 0x9800
	ld (09000h),a		;6606   ; el mapper: pone en 0x8000 el banco de A
	xor a			;6609   ; 0xE00C = 0
	ld (0e00ch),a		;660a
	ld (0988fh),a		;660d   ; al SCC: ningun canal suena
	xor a			;6610
	ld (0988ah),a		;6611   ; los 5 volumenes del SCC a 0
	ld (0988bh),a		;6614   ; al SCC: el volumen del canal 2 del SCC
	ld (0988ch),a		;6617   ; al SCC: el volumen del canal 3 del SCC
	ld (0988dh),a		;661a   ; al SCC: el volumen del canal 4 del SCC
	ld (0988eh),a		;661d   ; al SCC: el volumen del canal 5 del SCC
	ld a,005h		;6620   ; el banco 5
	ld (09000h),a		;6622   ; el mapper: pone en 0x8000 el banco de A
	ld hl,0e00dh		;6625   ; el modo del canal 1...
	ld a,(hl)			;6628
	rlca			;6629
	rlca			;662a
	rlca			;662b
	rlca			;662c
	ld (hl),a			;662d
	ld hl,0e039h		;662e   ; y el del 2
	ld a,(hl)			;6631
	rlca			;6632
	rlca			;6633
	rlca			;6634
	rlca			;6635
	ld (hl),a			;6636
	ld c,002h		;6637   ; C = 2
	ret			;6639
L_663A:
	ld bc,00058h		;663a   ; copia 0x58 bytes: dos canales
	ldir		;663d
	ret			;663f

; ----------------------------------------------------------------------
; DATOS sonidos: 89 punteros, uno por sonido del 1 al 0x59 (A en p04:6472,
;   tabla en 0x663E + 2 x A): su cabecera [canales][prioridad][una palabra por
;   canal]. La entrada 0 serian los bytes B0 C9 de `ldir / ret` (p04:663D): no
;   hay sonido 0; lo leen p04:649A (178 bytes)
;   0x6640..0x66f2  (178 bytes)
DATA_sonidos:
	defw 06966h,06716h,06764h,0676ah,06770h,06776h,0677ch,06782h	; 6640
	defw 06788h,067a0h,067a6h,067ach,067b2h,067b8h,067c4h,067dch	; 6650
	defw 067e2h,067e8h,067eeh,067f4h,067fah,067fah,06800h,06806h	; 6660
	defw 0680ch,0681ah,06828h,06836h,06844h,06852h,06860h,0686eh	; 6670
	defw 0687ch,0688ah,06954h,06898h,068aah,068bch,068ceh,068e0h	; 6680
	defw 06954h,06954h,06954h,06954h,06954h,0690ah,06918h,06926h	; 6690
	defw 06934h,06942h,06728h,06734h,0677ch,0679ah,06746h,0674ch	; 66a0
	defw 06752h,0677ch,0677ch,06758h,0677ch,0675eh,0677ch,067c4h	; 66b0
	defw 0671ch,06722h,067d0h,0672eh,0672eh,067beh,068f2h,068f8h	; 66c0
	defw 06954h,0678eh,06794h,067fah,068f2h,06704h,067d0h,067cah	; 66d0
	defw 067c4h,067d6h,0677ch,0677ch,066feh,066f2h,066f8h,0677ch	; 66e0
	defw 067c4h	; 66f0  -> DATA_cabecera_0F

; ----------------------------------------------------------------------
; DATOS cabecera_56: cabecera del sonido 0x56: canales 0x30, prioridad 0x65 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x66f2..0x66f8  (6 bytes)
DATA_cabecera_56:
	defb 030h,065h,034h,0b9h,062h,0b9h	; 66f2

; ----------------------------------------------------------------------
; DATOS cabecera_57: cabecera del sonido 0x57: canales 0x30, prioridad 0x2E y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x66f8..0x66fe  (6 bytes)
DATA_cabecera_57:
	defb 030h,02eh,08eh,0b9h,0c4h,0b9h	; 66f8

; ----------------------------------------------------------------------
; DATOS cabecera_55: cabecera del sonido 0x55: canales 0x30, prioridad 0x2F y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x66fe..0x6704  (6 bytes)
DATA_cabecera_55:
	defb 030h,02fh,07eh,0bdh,097h,0bdh	; 66fe

; ----------------------------------------------------------------------
; DATOS cabecera_4E: cabecera del sonido 0x4E: canales 0xFF, prioridad 0x40 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x6704..0x6716  (18 bytes)
DATA_cabecera_4E:
	defb 0ffh,040h,072h,080h,0dbh,080h,0e5h,080h,0e6h,080h,079h,081h,08ch,081h,096h,081h,0a1h,081h	; 6704  .@r.......y.......

; ----------------------------------------------------------------------
; DATOS cabecera_02: cabecera del sonido 0x02: canales 0x30, prioridad 0x70 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6716..0x671c  (6 bytes)
DATA_cabecera_02:
	defb 030h,070h,08eh,079h,095h,079h	; 6716

; ----------------------------------------------------------------------
; DATOS cabecera_41: cabecera del sonido 0x41: canales 0x30, prioridad 0x23 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x671c..0x6722  (6 bytes)
DATA_cabecera_41:
	defb 030h,023h,0f2h,0bch,031h,0bdh	; 671c

; ----------------------------------------------------------------------
; DATOS cabecera_42: cabecera del sonido 0x42: canales 0x30, prioridad 0x11 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6722..0x6728  (6 bytes)
DATA_cabecera_42:
	defb 030h,011h,05ah,0bdh,063h,0bdh	; 6722

; ----------------------------------------------------------------------
; DATOS cabecera_33: cabecera del sonido 0x33: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6728..0x672e  (6 bytes)
DATA_cabecera_33:
	defb 030h,002h,0b3h,07ch,0c2h,07ch	; 6728

; ----------------------------------------------------------------------
; DATOS cabecera_44: cabecera del sonido 0x44: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); se solapan 2 bloques:
;   (cabecera_45 672E-6734); lo leen p04:649A (6 bytes)
;   0x672e..0x6734  (6 bytes)
DATA_cabecera_44:
	defb 030h,002h,07eh,0bdh,097h,0bdh	; 672e

; ----------------------------------------------------------------------
; DATOS cabecera_34: cabecera del sonido 0x34: canales 0xFF, prioridad 0x30 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x6734..0x6746  (18 bytes)
DATA_cabecera_34:
	defb 0ffh,030h,043h,07ch,05bh,07ch,075h,07ch,084h,07ch,0a1h,07ch,0a1h,07ch,0a1h,07ch,0a1h,07ch	; 6734  .0C|[|u|.|.|.|.|.|

; ----------------------------------------------------------------------
; DATOS cabecera_37: cabecera del sonido 0x37: canales 0x30, prioridad 0x13 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6746..0x674c  (6 bytes)
DATA_cabecera_37:
	defb 030h,013h,087h,0bbh,092h,0bbh	; 6746

; ----------------------------------------------------------------------
; DATOS cabecera_38: cabecera del sonido 0x38: canales 0x30, prioridad 0x2A y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x674c..0x6752  (6 bytes)
DATA_cabecera_38:
	defb 030h,02ah,0afh,0bbh,0e0h,0bbh	; 674c

; ----------------------------------------------------------------------
; DATOS cabecera_39: cabecera del sonido 0x39: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6752..0x6758  (6 bytes)
DATA_cabecera_39:
	defb 030h,002h,01fh,0bch,03ah,0bch	; 6752

; ----------------------------------------------------------------------
; DATOS cabecera_3C: cabecera del sonido 0x3C: canales 0x30, prioridad 0x19 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6758..0x675e  (6 bytes)
DATA_cabecera_3C:
	defb 030h,019h,04fh,0bch,077h,0bch	; 6758

; ----------------------------------------------------------------------
; DATOS cabecera_3E: cabecera del sonido 0x3E: canales 0x30, prioridad 0x05 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x675e..0x6764  (6 bytes)
DATA_cabecera_3E:
	defb 030h,005h,0b2h,0bch,0cfh,0bch	; 675e

; ----------------------------------------------------------------------
; DATOS cabecera_03: cabecera del sonido 0x03: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6764..0x676a  (6 bytes)
DATA_cabecera_03:
	defb 030h,002h,0f6h,074h,000h,075h	; 6764

; ----------------------------------------------------------------------
; DATOS cabecera_04: cabecera del sonido 0x04: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x676a..0x6770  (6 bytes)
DATA_cabecera_04:
	defb 030h,002h,0b0h,074h,0c7h,074h	; 676a

; ----------------------------------------------------------------------
; DATOS cabecera_05: cabecera del sonido 0x05: canales 0x30, prioridad 0x04 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6770..0x6776  (6 bytes)
DATA_cabecera_05:
	defb 030h,004h,02bh,075h,037h,075h	; 6770

; ----------------------------------------------------------------------
; DATOS cabecera_06: cabecera del sonido 0x06: canales 0x30, prioridad 0x0A y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6776..0x677c  (6 bytes)
DATA_cabecera_06:
	defb 030h,00ah,0e1h,076h,005h,077h	; 6776

; ----------------------------------------------------------------------
; DATOS cabecera_07: cabecera del sonido 0x07: canales 0x30, prioridad 0x00 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); se solapan 9 bloques:
;   (cabecera_35 677C-6782) (cabecera_3A 677C-6782) (cabecera_3B 677C-6782)
;   (cabecera_3D 677C-6782) (cabecera_3F 677C-6782) (cabecera_53 677C-6782)
;   (cabecera_54 677C-6782) (cabecera_58 677C-6782); lo leen p04:649A (6
;   bytes)
;   0x677c..0x6782  (6 bytes)
DATA_cabecera_07:
	defb 030h,000h,0afh,074h,0afh,074h	; 677c

; ----------------------------------------------------------------------
; DATOS cabecera_08: cabecera del sonido 0x08: canales 0x30, prioridad 0x0B y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6782..0x6788  (6 bytes)
DATA_cabecera_08:
	defb 030h,00bh,04eh,075h,06fh,075h	; 6782

; ----------------------------------------------------------------------
; DATOS cabecera_09: cabecera del sonido 0x09: canales 0x30, prioridad 0x0C y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6788..0x678e  (6 bytes)
DATA_cabecera_09:
	defb 030h,00ch,0ach,075h,0c9h,075h	; 6788

; ----------------------------------------------------------------------
; DATOS cabecera_4A: cabecera del sonido 0x4A: canales 0x30, prioridad 0x05 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x678e..0x6794  (6 bytes)
DATA_cabecera_4A:
	defb 030h,005h,006h,0beh,033h,0beh	; 678e

; ----------------------------------------------------------------------
; DATOS cabecera_4B: cabecera del sonido 0x4B: canales 0x30, prioridad 0x1A y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6794..0x679a  (6 bytes)
DATA_cabecera_4B:
	defb 030h,01ah,0e9h,0b9h,0efh,0b9h	; 6794

; ----------------------------------------------------------------------
; DATOS cabecera_36: cabecera del sonido 0x36: canales 0x30, prioridad 0x11 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x679a..0x67a0  (6 bytes)
DATA_cabecera_36:
	defb 030h,011h,0abh,079h,0deh,079h	; 679a

; ----------------------------------------------------------------------
; DATOS cabecera_0A: cabecera del sonido 0x0A: canales 0x30, prioridad 0x1D y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67a0..0x67a6  (6 bytes)
DATA_cabecera_0A:
	defb 030h,01dh,017h,07ah,03fh,07ah	; 67a0

; ----------------------------------------------------------------------
; DATOS cabecera_0B: cabecera del sonido 0x0B: canales 0x30, prioridad 0x12 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67a6..0x67ac  (6 bytes)
DATA_cabecera_0B:
	defb 030h,012h,0eeh,075h,006h,076h	; 67a6

; ----------------------------------------------------------------------
; DATOS cabecera_0C: cabecera del sonido 0x0C: canales 0x30, prioridad 0x24 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67ac..0x67b2  (6 bytes)
DATA_cabecera_0C:
	defb 030h,024h,02eh,076h,032h,076h	; 67ac

; ----------------------------------------------------------------------
; DATOS cabecera_0D: cabecera del sonido 0x0D: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67b2..0x67b8  (6 bytes)
DATA_cabecera_0D:
	defb 030h,010h,079h,076h,0ach,076h	; 67b2

; ----------------------------------------------------------------------
; DATOS cabecera_0E: cabecera del sonido 0x0E: canales 0x30, prioridad 0x0F y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67b8..0x67be  (6 bytes)
DATA_cabecera_0E:
	defb 030h,00fh,0bch,078h,0e5h,078h	; 67b8

; ----------------------------------------------------------------------
; DATOS cabecera_46: cabecera del sonido 0x46: canales 0x30, prioridad 0x11 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67be..0x67c4  (6 bytes)
DATA_cabecera_46:
	defb 030h,011h,043h,0bah,090h,0bah	; 67be

; ----------------------------------------------------------------------
; DATOS cabecera_0F: cabecera del sonido 0x0F: canales 0x30, prioridad 0x1A y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); se solapan 4 bloques:
;   (cabecera_40 67C4-67CA) (cabecera_51 67C4-67CA) (cabecera_59 67C4-67CA);
;   lo leen p04:649A (6 bytes)
;   0x67c4..0x67ca  (6 bytes)
DATA_cabecera_0F:
	defb 030h,01ah,036h,077h,055h,077h	; 67c4

; ----------------------------------------------------------------------
; DATOS cabecera_50: cabecera del sonido 0x50: canales 0x30, prioridad 0x18 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67ca..0x67d0  (6 bytes)
DATA_cabecera_50:
	defb 030h,018h,0edh,0bah,005h,0bbh	; 67ca

; ----------------------------------------------------------------------
; DATOS cabecera_43: cabecera del sonido 0x43: canales 0x30, prioridad 0x1E y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); se solapan 2 bloques:
;   (cabecera_4F 67D0-67D6); lo leen p04:649A (6 bytes)
;   0x67d0..0x67d6  (6 bytes)
DATA_cabecera_43:
	defb 030h,01eh,024h,0bbh,050h,0bbh	; 67d0

; ----------------------------------------------------------------------
; DATOS cabecera_52: cabecera del sonido 0x52: canales 0x30, prioridad 0x1F y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67d6..0x67dc  (6 bytes)
DATA_cabecera_52:
	defb 030h,01fh,024h,0bbh,050h,0bbh	; 67d6

; ----------------------------------------------------------------------
; DATOS cabecera_10: cabecera del sonido 0x10: canales 0x30, prioridad 0x14 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67dc..0x67e2  (6 bytes)
DATA_cabecera_10:
	defb 030h,014h,0d1h,077h,0eah,077h	; 67dc

; ----------------------------------------------------------------------
; DATOS cabecera_11: cabecera del sonido 0x11: canales 0x30, prioridad 0x2A y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67e2..0x67e8  (6 bytes)
DATA_cabecera_11:
	defb 030h,02ah,083h,078h,087h,078h	; 67e2

; ----------------------------------------------------------------------
; DATOS cabecera_12: cabecera del sonido 0x12: canales 0x30, prioridad 0x30 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67e8..0x67ee  (6 bytes)
DATA_cabecera_12:
	defb 030h,030h,012h,079h,039h,079h	; 67e8

; ----------------------------------------------------------------------
; DATOS cabecera_13: cabecera del sonido 0x13: canales 0x30, prioridad 0x09 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67ee..0x67f4  (6 bytes)
DATA_cabecera_13:
	defb 030h,009h,07eh,07ah,07eh,07ah	; 67ee

; ----------------------------------------------------------------------
; DATOS cabecera_14: cabecera del sonido 0x14: canales 0x30, prioridad 0x09 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x67f4..0x67fa  (6 bytes)
DATA_cabecera_14:
	defb 030h,009h,0bfh,07ah,011h,07bh	; 67f4

; ----------------------------------------------------------------------
; DATOS cabecera_15: cabecera del sonido 0x15: canales 0x30, prioridad 0x25 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); se solapan 3 bloques:
;   (cabecera_16 67FA-6800) (cabecera_4C 67FA-6800); lo leen p04:649A (6
;   bytes)
;   0x67fa..0x6800  (6 bytes)
DATA_cabecera_15:
	defb 030h,025h,0f6h,0b9h,0fah,0b9h	; 67fa

; ----------------------------------------------------------------------
; DATOS cabecera_17: cabecera del sonido 0x17: canales 0x30, prioridad 0x15 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6800..0x6806  (6 bytes)
DATA_cabecera_17:
	defb 030h,015h,09ch,07bh,0a0h,07bh	; 6800

; ----------------------------------------------------------------------
; DATOS cabecera_18: cabecera del sonido 0x18: canales 0x30, prioridad 0x11 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (6
;   bytes)
;   0x6806..0x680c  (6 bytes)
DATA_cabecera_18:
	defb 030h,011h,0d3h,07bh,00ah,07ch	; 6806

; ----------------------------------------------------------------------
; DATOS cabecera_19: cabecera del sonido 0x19: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x680c..0x681a  (14 bytes)
DATA_cabecera_19:
	defb 0cfh,016h,0b3h,09bh,0f6h,09bh,080h,09ch,0ebh,09ch,050h,09dh,0beh,09dh	; 680c  ..........P...

; ----------------------------------------------------------------------
; DATOS cabecera_1A: cabecera del sonido 0x1A: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x681a..0x6828  (14 bytes)
DATA_cabecera_1A:
	defb 0cfh,016h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h	; 681a  ...t.t.t.t.t.t

; ----------------------------------------------------------------------
; DATOS cabecera_1B: cabecera del sonido 0x1B: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6828..0x6836  (14 bytes)
DATA_cabecera_1B:
	defb 0cfh,016h,010h,083h,065h,083h,034h,084h,01ch,085h,054h,086h,058h,087h	; 6828  ....e.4...T.X.

; ----------------------------------------------------------------------
; DATOS cabecera_1C: cabecera del sonido 0x1C: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6836..0x6844  (14 bytes)
DATA_cabecera_1C:
	defb 0cfh,016h,04eh,088h,0e3h,088h,095h,089h,072h,08ah,0a7h,08ah,07fh,08bh	; 6836  ..N.....r.....

; ----------------------------------------------------------------------
; DATOS cabecera_1D: cabecera del sonido 0x1D: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6844..0x6852  (14 bytes)
DATA_cabecera_1D:
	defb 0cfh,016h,03dh,08ch,0a2h,08ch,019h,08eh,0d1h,08eh,068h,08fh,006h,090h	; 6844  ..=.......h...

; ----------------------------------------------------------------------
; DATOS cabecera_1E: cabecera del sonido 0x1E: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6852..0x6860  (14 bytes)
DATA_cabecera_1E:
	defb 0cfh,016h,00bh,090h,0d3h,090h,06dh,091h,016h,092h,0f1h,092h,0a3h,093h	; 6852  ......m.......

; ----------------------------------------------------------------------
; DATOS cabecera_1F: cabecera del sonido 0x1F: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6860..0x686e  (14 bytes)
DATA_cabecera_1F:
	defb 0cfh,016h,041h,094h,093h,094h,03ah,095h,0f2h,095h,054h,096h,092h,096h	; 6860  ..A...:...T...

; ----------------------------------------------------------------------
; DATOS cabecera_20: cabecera del sonido 0x20: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x686e..0x687c  (14 bytes)
DATA_cabecera_20:
	defb 0cfh,016h,042h,097h,0a8h,097h,087h,098h,028h,099h,0fah,099h,03eh,09bh	; 686e  ..B.....(...>.

; ----------------------------------------------------------------------
; DATOS cabecera_21: cabecera del sonido 0x21: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x687c..0x688a  (14 bytes)
DATA_cabecera_21:
	defb 0cfh,016h,079h,0a0h,0f4h,0a0h,0aah,0a1h,072h,0a2h,037h,0a3h,0d9h,0a3h	; 687c  ..y.....r.7...

; ----------------------------------------------------------------------
; DATOS cabecera_22: cabecera del sonido 0x22: canales 0xCF, prioridad 0x16 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x688a..0x6898  (14 bytes)
DATA_cabecera_22:
	defb 0cfh,016h,0b4h,09eh,0c3h,09eh,00ch,09fh,07eh,09fh,0c7h,09fh,025h,0a0h	; 688a  ........~...%.

; ----------------------------------------------------------------------
; DATOS cabecera_24: cabecera del sonido 0x24: canales 0xFF, prioridad 0x46 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x6898..0x68aa  (18 bytes)
DATA_cabecera_24:
	defb 0ffh,046h,0bdh,07fh,0bdh,07fh,0bdh,07fh,07bh,07fh,0beh,07fh,033h,080h,072h,080h,072h,080h	; 6898  .F......{...3.r.r.

; ----------------------------------------------------------------------
; DATOS cabecera_25: cabecera del sonido 0x25: canales 0xFF, prioridad 0x46 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x68aa..0x68bc  (18 bytes)
DATA_cabecera_25:
	defb 0ffh,046h,072h,080h,0dbh,080h,0e5h,080h,0e6h,080h,079h,081h,08ch,081h,096h,081h,0a1h,081h	; 68aa  .Fr.......y.......

; ----------------------------------------------------------------------
; DATOS cabecera_26: cabecera del sonido 0x26: canales 0xFF, prioridad 0x01 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x68bc..0x68ce  (18 bytes)
DATA_cabecera_26:
	defb 0ffh,001h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h	; 68bc  ...t.t.t.t.t.t.t.t

; ----------------------------------------------------------------------
; DATOS cabecera_27: cabecera del sonido 0x27: canales 0xFF, prioridad 0x47 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x68ce..0x68e0  (18 bytes)
DATA_cabecera_27:
	defb 0ffh,047h,087h,082h,09ch,082h,0abh,082h,0bah,082h,0cfh,082h,0e6h,082h,0f3h,082h,002h,083h	; 68ce  .G................

; ----------------------------------------------------------------------
; DATOS cabecera_28: cabecera del sonido 0x28: canales 0xFF, prioridad 0x47 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x68e0..0x68f2  (18 bytes)
DATA_cabecera_28:
	defb 0ffh,047h,0cdh,07ch,01dh,07dh,028h,07dh,08fh,07dh,0ddh,07dh,0e6h,07dh,0efh,07dh,0f8h,07dh	; 68e0  .G.|.}(}.}.}.}.}.}

; ----------------------------------------------------------------------
; DATOS cabecera_47: cabecera del sonido 0x47: canales 0x30, prioridad 0x48 y
;   2 partituras (p04:64A7 copia 18 bytes a 0xE1BA); se solapan 2 bloques:
;   (cabecera_4D 68F2-68F8); lo leen p04:649A (6 bytes)
;   0x68f2..0x68f8  (6 bytes)
DATA_cabecera_47:
	defb 030h,048h,001h,07eh,043h,07eh	; 68f2

; ----------------------------------------------------------------------
; DATOS cabecera_48: cabecera del sonido 0x48: canales 0xFF, prioridad 0x48 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x68f8..0x690a  (18 bytes)
DATA_cabecera_48:
	defb 0ffh,048h,06ah,07eh,084h,07eh,08ch,07eh,0dfh,07eh,02ch,07fh,038h,07fh,040h,07fh,072h,07fh	; 68f8  .Hj~.~.~.~,.8.@.r.

; ----------------------------------------------------------------------
; DATOS cabecera_2E: cabecera del sonido 0x2E: canales 0xCF, prioridad 0x48 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x690a..0x6918  (14 bytes)
DATA_cabecera_2E:
	defb 0cfh,048h,02ah,0a6h,0d3h,0a6h,08ah,0a8h,0a8h,0a8h,0bch,0a9h,0b0h,0aah	; 690a  .H*...........

; ----------------------------------------------------------------------
; DATOS cabecera_2F: cabecera del sonido 0x2F: canales 0xCF, prioridad 0x48 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6918..0x6926  (14 bytes)
DATA_cabecera_2F:
	defb 0cfh,048h,05bh,0abh,0b0h,0abh,02ah,0ach,0ach,0ach,064h,0adh,0e7h,0adh	; 6918  .H[...*...d...

; ----------------------------------------------------------------------
; DATOS cabecera_30: cabecera del sonido 0x30: canales 0xCF, prioridad 0x48 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6926..0x6934  (14 bytes)
DATA_cabecera_30:
	defb 0cfh,048h,062h,0aeh,0b9h,0aeh,096h,0afh,0fbh,0b0h,0cah,0b1h,023h,0b3h	; 6926  .Hb.........#.

; ----------------------------------------------------------------------
; DATOS cabecera_31: cabecera del sonido 0x31: canales 0xCF, prioridad 0x48 y
;   6 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (14
;   bytes)
;   0x6934..0x6942  (14 bytes)
DATA_cabecera_31:
	defb 0cfh,048h,07dh,0b3h,03dh,0b4h,019h,0b5h,04ch,0b6h,030h,0b7h,032h,0b8h	; 6934  .H}.=...L.0.2.

; ----------------------------------------------------------------------
; DATOS cabecera_32: cabecera del sonido 0x32: canales 0xFF, prioridad 0x70 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x6942..0x6954  (18 bytes)
DATA_cabecera_32:
	defb 0ffh,070h,074h,0a4h,074h,0a4h,075h,0a4h,0cdh,0a4h,019h,0a5h,04ah,0a5h,0a1h,0a5h,0f0h,0a5h	; 6942  .pt.t.u.....J.....

; ----------------------------------------------------------------------
; DATOS cabecera_23: cabecera del sonido 0x23: canales 0xFF, prioridad 0x00 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); se solapan 7 bloques:
;   (cabecera_29 6954-6966) (cabecera_2A 6954-6966) (cabecera_2B 6954-6966)
;   (cabecera_2C 6954-6966) (cabecera_2D 6954-6966) (cabecera_49 6954-6966);
;   lo leen p04:649A (18 bytes)
;   0x6954..0x6966  (18 bytes)
DATA_cabecera_23:
	defb 0ffh,000h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h	; 6954  ...t.t.t.t.t.t.t.t

; ----------------------------------------------------------------------
; DATOS cabecera_01: cabecera del sonido 0x01: canales 0xFF, prioridad 0x80 y
;   8 partituras (p04:64A7 copia 18 bytes a 0xE1BA); lo leen p04:649A (18
;   bytes)
;   0x6966..0x6978  (18 bytes)
DATA_cabecera_01:
	defb 0ffh,080h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h,0afh,074h	; 6966  ...t.t.t.t.t.t.t.t

; ======================================================================
; CODIGO 0x6978..0x6aaf  (311 bytes)
; ======================================================================


sonido_cuadro:		; el sonido de un cuadro: los 8 canales (0xE000 + 0x2C x k)
	ld a,(0e1d0h)		;6978   ; el registro 7 del PSG (0xE1D0)
	call L_710D		;697b   ; p04:710D: lo escribe
	ld hl,0e1b8h		;697e   ; los canales del SCC en el PSG?
	bit 1,(hl)		;6981
	jp nz,L_6A02		;6983   ; si: p04:6A02
	ld a,(0e1b8h)		;6986   ; en pausa...
	bit 0,a		;6989
	call nz,L_6CFF		;698b   ; ...p04:6CFF
	ld a,(0e1b8h)		;698e   ; subiendo...
	bit 4,a		;6991
	call nz,L_6D83		;6993   ; ...p04:6D83
	ld a,001h		;6996   ; los 8 canales, cada uno con su bit en 0xE1D1
	ld (0e1d1h),a		;6998   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e000h		;699b   ; apunta a los 8 canales de sonido (0x2C bytes cada uno)
	call canal		;699f   ; canal: un cuadro del canal IX si suena
	ld a,002h		;69a2
	ld (0e1d1h),a		;69a4   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e02ch		;69a7
	call canal		;69ab   ; canal: un cuadro del canal IX si suena
	ld a,004h		;69ae
	ld (0e1d1h),a		;69b0   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e058h		;69b3
	call canal		;69b7   ; canal: un cuadro del canal IX si suena
	ld a,008h		;69ba
	ld (0e1d1h),a		;69bc   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e084h		;69bf
	call canal		;69c3   ; canal: un cuadro del canal IX si suena
	ld a,010h		;69c6
	ld (0e1d1h),a		;69c8   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e0b0h		;69cb
	call canal		;69cf   ; canal: un cuadro del canal IX si suena
	ld a,020h		;69d2
	ld (0e1d1h),a		;69d4   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e0dch		;69d7
	call canal		;69db   ; canal: un cuadro del canal IX si suena
	ld a,040h		;69de
	ld (0e1d1h),a		;69e0   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e108h		;69e3
	call canal		;69e7   ; canal: un cuadro del canal IX si suena
	ld a,080h		;69ea
	ld (0e1d1h),a		;69ec   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e134h		;69ef
	call canal		;69f3   ; canal: un cuadro del canal IX si suena
	call mezcla_psg		;69f6   ; y el registro 7
	ret			;69f9
canal:		; un cuadro del canal IX si suena
	ld a,(ix+000h)		;69fa   ; suena?
	or a			;69fd
	call nz,canal_paso		;69fe   ; si: un cuadro
	ret			;6a01
L_6A02:
	ld a,004h		;6a02   ; solo los canales 3 y 4
	ld (0e1d1h),a		;6a04   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e058h		;6a07
	call canal		;6a0b   ; canal: un cuadro del canal IX si suena
	ld a,008h		;6a0e
	ld (0e1d1h),a		;6a10   ; guarda el bit del canal que se interpreta (1, 2, 4... 0x80)
	ld ix,0e084h		;6a13
	call canal		;6a17   ; canal: un cuadro del canal IX si suena
	ld a,0bbh		;6a1a   ; el registro 7 con 0xBB
	ld (0e1d0h),a		;6a1c   ; guarda la copia del registro 7 del PSG
	call mezcla_psg		;6a1f   ; mezcla_psg: el registro 7 del PSG con lo que piden los canales
	ret			;6a22
canal_paso:		; baja la cuenta del canal y, si llega a 0, lee la partitura
	dec (ix+004h)		;6a23   ; baja la cuenta de la nota
	jp nz,L_6BBB		;6a26   ; aun no: lo que va entre notas (p04:6BBB)
	ld l,(ix+002h)		;6a29   ; lee por donde va la partitura (bajo)
	ld h,(ix+003h)		;6a2c   ; lee por donde va la partitura (alto)
L_6A2F:
	ld a,(hl)			;6a2f   ; el byte de la partitura
	cp 0ffh		;6a30   ; 0xFF: acaba el canal
	jp z,L_6D9B		;6a32
	cp 0d0h		;6a35   ; una orden (0xD0 o mas)...
	jr c,L_6A40		;6a37
	call orden		;6a39   ; ...la ejecuta
	inc hl			;6a3c   ; el siguiente byte
	jp L_6A2F		;6a3d
L_6A40:
	bit 0,(ix+009h)		;6a40   ; una nota: el modo
	jp nz,L_6A57		;6a44   ; bit 0: el PSG con la nota en la cifra alta
	bit 1,(ix+009h)		;6a47   ; mira el bit 1 de el modo del canal (orden 0xFE)
	jp nz,L_6ABC		;6a4b   ; bit 1: el SCC (p04:6ABC)
	ld a,(ix+009h)		;6a4e   ; lee el modo del canal (orden 0xFE)
	and 01ch		;6a51
	jp nz,L_6B35		;6a53   ; bits 2-4: la bateria (p04:6B35)
	ret			;6a56   ; ninguno: no lee
L_6A57:
	ld a,(hl)			;6a57   ; la cifra baja: la duracion
	and 00fh		;6a58
	ld b,a			;6a5a
	ld a,(ix+014h)		;6a5b   ; la unidad (IX+14)
	jr z,L_6A64		;6a5e   ; 0: la unidad
	ld e,a			;6a60
L_6A61:
	add a,e			;6a61   ; la unidad x la cifra
	djnz L_6A61		;6a62
L_6A64:
	ld (ix+004h),a		;6a64   ; la cuenta de la nota
	ld a,(hl)			;6a67   ; la cifra alta: la nota
	and 0f0h		;6a68
	rrca			;6a6a
	rrca			;6a6b
	rrca			;6a6c
	rrca			;6a6d
	call guarda_partitura		;6a6e   ; y la partitura avanza
	bit 7,(ix+009h)		;6a71   ; en la bateria: fuera
	ret nz			;6a75
	cp 00ch		;6a76   ; 12 o mas: un silencio
	jr nc,L_6AAA		;6a78
	ld hl,06aafh		;6a7a   ; el divisor de la nota (0x6AAF)
	ld e,a			;6a7d
	ld d,000h		;6a7e
	add hl,de			;6a80
	ld l,(hl)			;6a81
	ld h,000h		;6a82
	ld a,(ix+016h)		;6a84   ; la octava
	or a			;6a87
	jr z,L_6A8E		;6a88   ; 0: tal cual
	ld b,a			;6a8a
L_6A8B:
	add hl,hl			;6a8b   ; x 2 por octava
	djnz L_6A8B		;6a8c
L_6A8E:
	ld (ix+010h),l		;6a8e   ; el divisor en IX+10/11
	ld (ix+011h),h		;6a91
	ld e,(ix+015h)		;6a94   ; el volumen (IX+15)
	ld a,(0e1b8h)		;6a97   ; en pausa o subiendo...
	and 011h		;6a9a
	call nz,L_6D5F		;6a9c   ; ...se baja (p04:6D5F)
	ld (ix+012h),e		;6a9f   ; el volumen
	ld (ix+00dh),002h		;6aa2   ; IX+0D = 2: suena
	call L_6B6A		;6aa6   ; la envolvente desde el principio (p04:6B6A)
	ret			;6aa9
L_6AAA:
	ld (ix+00dh),000h		;6aaa   ; silencio: IX+0D = 0
	ret			;6aae

; ----------------------------------------------------------------------
; DATOS notas_psg: 13 bytes: el divisor de cada nota (de do a do) que p04:6A7A
;   lee con el indice < 12 (p04:6A76) y dobla por la octava; el 13 no lo lee
;   nadie; lo leen p04:6A7A (13 bytes)
;   0x6aaf..0x6abc  (13 bytes)
DATA_notas_psg:
	defb 06ah,064h,05eh,059h,054h,04fh,04ah,046h,042h,03fh,03bh,038h,035h	; 6aaf  jd^YTOJFB?.85

; ======================================================================
; CODIGO 0x6abc..0x6de9  (813 bytes)
; ======================================================================


L_6ABC:
	ld a,(ix+00dh)		;6abc   ; el SCC: IX+0D & 3
	and 003h		;6abf
	jr z,L_6B26		;6ac1   ; 0: un silencio
	cp 001h		;6ac3   ; 1: solo el volumen
	jr z,L_6AFD		;6ac5
	ld a,(hl)			;6ac7   ; el byte de la nota
	bit 6,(ix+00eh)		;6ac8   ; con IX+0E bit 6...
	jr nz,L_6AE9		;6acc
	bit 5,(ix+00eh)		;6ace   ; ...o bit 5...
	jr nz,L_6AEE		;6ad2
	and 0f0h		;6ad4   ; si no: la cifra alta es el volumen...
	ld b,a			;6ad6
	xor (hl)			;6ad7   ; ...la baja el periodo alto
	ld d,a			;6ad8
	inc hl			;6ad9   ; el periodo bajo
	ld a,(hl)			;6ada
	ld (ix+010h),a		;6adb   ; en IX+10/11
	ld (ix+011h),d		;6ade
	ld a,b			;6ae1   ; el volumen
	rrca			;6ae2
	rrca			;6ae3
	rrca			;6ae4
	rrca			;6ae5
	ld b,a			;6ae6
	jr L_6B01		;6ae7
L_6AE9:
	ld (ix+010h),a		;6ae9   ; bit 6: solo el periodo bajo
	jr L_6B15		;6aec
L_6AEE:
	and 0f0h		;6aee   ; bit 5: la cifra alta el volumen...
	rrca			;6af0
	rrca			;6af1
	rrca			;6af2
	rrca			;6af3
	ld b,a			;6af4
	ld a,(hl)			;6af5   ; ...y la baja el periodo alto
	and 00fh		;6af6
	ld (ix+011h),a		;6af8
	jr L_6B01		;6afb
L_6AFD:
	ld a,(hl)			;6afd   ; solo el volumen, en la cifra baja
	and 00fh		;6afe
	ld b,a			;6b00
L_6B01:
	ld a,(0e1d1h)		;6b01   ; los canales 1-3 del PSG...
	cp 008h		;6b04
	jr nc,L_6B10		;6b06
	bit 2,(ix+00dh)		;6b08   ; ...con IX+0D bit 2 (ruido)...
	jr z,L_6B10		;6b0c
	ld b,010h		;6b0e   ; ...el volumen 16: la envolvente
L_6B10:
	inc b			;6b10   ; + 2
	inc b			;6b11
	ld (ix+012h),b		;6b12   ; el volumen
L_6B15:
	ld e,(ix+012h)		;6b15   ; en pausa o subiendo, mas bajo
	ld a,(0e1b8h)		;6b18   ; lee el estado del sonido (bits: pausa, SCC...)
	and 011h		;6b1b
	call nz,L_6D5F		;6b1d
	ld (ix+012h),e		;6b20
	call L_6B6A		;6b23   ; la envolvente desde el principio
L_6B26:
	bit 7,(ix+009h)		;6b26   ; en la bateria: fuera
	ret nz			;6b2a
	call guarda_partitura		;6b2b   ; la partitura avanza
	ld a,(ix+013h)		;6b2e   ; la duracion (IX+13)
	ld (ix+004h),a		;6b31   ; es la cuenta
	ret			;6b34
L_6B35:
	set 7,(ix+009h)		;6b35   ; la bateria: IX+09 bit 7
	call L_6A57		;6b39   ; la nota de la bateria
	ld hl,073c8h		;6b3c   ; su guion de 0x73C8
	add a,a			;6b3f
	ld e,a			;6b40
	ld d,000h		;6b41
	add hl,de			;6b43
	ld e,(hl)			;6b44
	inc hl			;6b45
	ld d,(hl)			;6b46
	ex de,hl			;6b47   ; HL = el guion
	ld a,(hl)			;6b48
L_6B49:
	set 1,(ix+009h)		;6b49   ; se lee como el SCC (bit 1)
	call L_6A2F		;6b4d   ; hasta su nota
	res 1,(ix+009h)		;6b50   ; pone a cero el bit 1 de el modo del canal (orden 0xFE)
	res 7,(ix+009h)		;6b54   ; pone a cero el bit 7 de el modo del canal (orden 0xFE)
	ld a,(ix+013h)		;6b58   ; la duracion...
	ld (ix+019h),a		;6b5b   ; ...en IX+19
	inc hl			;6b5e   ; por donde va el guion
	ld (ix+017h),l		;6b5f   ; guarda por donde va el guion de bateria (bajo)
	ld (ix+018h),h		;6b62   ; guarda por donde va el guion de bateria (alto)
	set 0,(ix+00eh)		;6b65   ; IX+0E bit 0: la bateria en marcha
	ret			;6b69
L_6B6A:
	call L_6BF4		;6b6a   ; el periodo con el desafinado (p04:6BF4)
	res 4,(ix+00eh)		;6b6d   ; IX+0E bit 4 a cero
	ld a,(ix+00fh)		;6b71   ; IX+0F bits 3 y 5 a cero
	and 0d7h		;6b74
	ld (ix+00fh),a		;6b76
	xor a			;6b79   ; IX+1D-20 a cero
	ld (ix+01dh),a		;6b7a
	ld (ix+01eh),a		;6b7d
	ld (ix+01fh),a		;6b80
	ld (ix+020h),a		;6b83
	set 2,(ix+00fh)		;6b86   ; IX+0F bit 2: la envolvente baja
	ld a,(ix+012h)		;6b8a   ; el volumen
	bit 7,(ix+00eh)		;6b8d   ; con IX+0E bit 7...
	jr z,L_6B9A		;6b91
	ld e,(ix+015h)		;6b93   ; ...menos el de IX+15...
	sub e			;6b96
	call m,L_6BB9		;6b97   ; ...sin bajar de 0
L_6B9A:
	ld (ix+00ch),a		;6b9a   ; el volumen de ahora
	ld a,(0e1d1h)		;6b9d   ; los canales 1-3 con ruido...
	cp 008h		;6ba0
	jr nc,L_6BA9		;6ba2
	bit 2,(ix+00dh)		;6ba4   ; mira el bit 2 de IX+0D (bits 0-1 de las ordenes 0xE0-0xE3)
	ret nz			;6ba8   ; ...no
L_6BA9:
	bit 1,(ix+00fh)		;6ba9   ; IX+0F bit 1...
	ret z			;6bad
	ld a,(ix+025h)		;6bae   ; ...el volumen de IX+25
	ld (ix+00ch),a		;6bb1
	res 2,(ix+00fh)		;6bb4   ; y sin bajar
	ret			;6bb8
L_6BB9:
	xor a			;6bb9
	ret			;6bba
L_6BBB:
	bit 0,(ix+00eh)		;6bbb   ; entre notas: la bateria en marcha?
	jp nz,L_6BD1		;6bbf   ; si: p04:6BD1
	bit 2,(ix+00eh)		;6bc2   ; IX+0E bit 2: el vibrato (p04:6C0F)
	call nz,L_6C0F		;6bc6
	bit 0,(ix+00fh)		;6bc9   ; IX+0F bit 0: la envolvente (p04:6C5D)
	call nz,L_6C5D		;6bcd
	ret			;6bd0
L_6BD1:
	dec (ix+019h)		;6bd1   ; la cuenta del golpe
	ret nz			;6bd4   ; aun no: fuera
	ld l,(ix+017h)		;6bd5   ; el guion
	ld h,(ix+018h)		;6bd8   ; lee por donde va el guion de bateria (alto)
	ld a,(hl)			;6bdb   ; el byte
	cp 0ffh		;6bdc   ; 0xFF: acaba
	jr z,L_6BE8		;6bde
	set 7,(ix+009h)		;6be0   ; el golpe siguiente
	call L_6B49		;6be4
	ret			;6be7
L_6BE8:
	res 0,(ix+00eh)		;6be8   ; se acabo: la bateria parada
	xor a			;6bec   ; volumen y modo a 0
	ld (ix+00ch),a		;6bed
	ld (ix+00dh),a		;6bf0   ; guarda IX+0D (bits 0-1 de las ordenes 0xE0-0xE3)
	ret			;6bf3
L_6BF4:
	ld e,(ix+010h)		;6bf4   ; el divisor
	ld d,(ix+011h)		;6bf7
	bit 1,(ix+00eh)		;6bfa   ; IX+0E bit 1...
	jr z,L_6C08		;6bfe
	ld a,(ix+026h)		;6c00   ; ...+ IX+26 (orden 0xEE)
	add a,e			;6c03
	ld e,a			;6c04
	jr nc,L_6C08		;6c05
	inc d			;6c07
L_6C08:
	ld (ix+00ah),e		;6c08   ; el periodo en IX+0A/0B
	ld (ix+00bh),d		;6c0b
	ret			;6c0e
L_6C0F:
	inc (ix+01eh)		;6c0f   ; la cuenta del vibrato + 1
	ld a,(ix+01eh)		;6c12
	ld b,(ix+00eh)		;6c15   ; IX+0E
	bit 4,b		;6c18   ; bit 4: ya empezado
	jr nz,L_6C2E		;6c1a
	bit 3,b		;6c1c   ; bit 3: con espera
	jr z,L_6C2E		;6c1e
	cp (ix+01ah)		;6c20   ; la espera (IX+1A)...
	ret nz			;6c23
	ld (ix+01eh),000h		;6c24   ; ...cumplida: empieza
	set 4,(ix+00eh)		;6c28   ; pone a uno el bit 4 de IX+0E (marcas de las ordenes 0xEE-0xF7)
	jr L_6C32		;6c2c
L_6C2E:
	cp (ix+01bh)		;6c2e   ; el paso (IX+1B)
	ret nz			;6c31
L_6C32:
	ld e,(ix+00ah)		;6c32   ; el periodo
	ld d,(ix+00bh)		;6c35
	ld b,(ix+01ch)		;6c38   ; cuanto (IX+1C)
	ld a,(ix+01dh)		;6c3b   ; arriba o abajo, alternando
	cpl			;6c3e
	ld (ix+01dh),a		;6c3f
	and a			;6c42
	ld a,e			;6c43
	jr nz,L_6C4D		;6c44
	add a,b			;6c46   ; + cuanto
	ld e,a			;6c47
	jr nc,L_6C52		;6c48
	inc d			;6c4a
	jr L_6C52		;6c4b
L_6C4D:
	sub b			;6c4d   ; - cuanto
	ld e,a			;6c4e
	jr nc,L_6C52		;6c4f
	dec d			;6c51
L_6C52:
	ld (ix+00ah),e		;6c52   ; el periodo nuevo
	ld (ix+00bh),d		;6c55
	ld (ix+01eh),000h		;6c58   ; la cuenta a 0
	ret			;6c5c
L_6C5D:
	ld a,(0e1d1h)		;6c5d   ; los canales 1-3 con ruido: no
	cp 008h		;6c60
	jr nc,L_6C69		;6c62
	bit 2,(ix+00dh)		;6c64   ; mira el bit 2 de IX+0D (bits 0-1 de las ordenes 0xE0-0xE3)
	ret nz			;6c68
L_6C69:
	call L_6C70		;6c69   ; el volumen de la envolvente (p04:6C70)
	ld (ix+00ch),e		;6c6c   ; a IX+0C
	ret			;6c6f
L_6C70:
	ld e,(ix+00ch)		;6c70   ; el volumen
	inc (ix+01fh)		;6c73   ; la cuenta de la envolvente + 1
	ld b,(ix+01fh)		;6c76
	bit 5,(ix+00fh)		;6c79   ; bit 5: la caida final
	jr nz,L_6CEB		;6c7d
	bit 3,(ix+00fh)		;6c7f   ; bit 3: el sostenido
	jr nz,L_6CB2		;6c83
	bit 2,(ix+00fh)		;6c85   ; bit 2: el ataque bajando
	jr nz,L_6C9E		;6c89
	ld a,e			;6c8b   ; el ataque: sube 1...
	inc a			;6c8c
	ld e,a			;6c8d
	cp (ix+012h)		;6c8e   ; ...hasta el volumen de la nota
	ret c			;6c91
	set 2,(ix+00fh)		;6c92
	ld e,(ix+012h)		;6c96   ; llega: ya baja
	ld (ix+01fh),000h		;6c99
	ret			;6c9d
L_6C9E:
	ld a,e			;6c9e   ; baja 1...
	dec a			;6c9f
	jp m,L_6CA4		;6ca0
	ld e,a			;6ca3
L_6CA4:
	ld a,b			;6ca4   ; ...hasta la cuenta de IX+21
	cp (ix+021h)		;6ca5
	ret c			;6ca8
	ld (ix+01fh),000h		;6ca9
	set 3,(ix+00fh)		;6cad   ; y el sostenido
	ret			;6cb1
L_6CB2:
	bit 4,(ix+00fh)		;6cb2   ; bit 4: el sostenido de golpe
	jp nz,L_6CD5		;6cb6
	ld a,b			;6cb9   ; cada IX+22 cuadros...
	cp (ix+022h)		;6cba
	ret nz			;6cbd
	ld a,e			;6cbe   ; ...baja 1
	dec a			;6cbf
	ret m			;6cc0
	ld e,a			;6cc1
	inc (ix+020h)		;6cc2   ; IX+20 + 1...
	ld a,(ix+020h)		;6cc5
	cp (ix+023h)		;6cc8   ; ...hasta IX+23: la caida
	ld (ix+01fh),000h		;6ccb
	ret nz			;6ccf
	set 5,(ix+00fh)		;6cd0
	ret			;6cd4
L_6CD5:
	ld a,(ix+022h)		;6cd5   ; baja IX+22 de una vez
	ld d,a			;6cd8
	ld a,e			;6cd9
	sub d			;6cda
	ld e,000h		;6cdb
	jp m,L_6CE1		;6cdd
	ld e,a			;6ce0
L_6CE1:
	ld a,b			;6ce1   ; a los IX+23 cuadros: la caida
	cp (ix+023h)		;6ce2
	ret nz			;6ce5
	set 5,(ix+00fh)		;6ce6
	ret			;6cea
L_6CEB:
	ld a,(ix+004h)		;6ceb   ; la caida: cuando la nota llega a IX+24...
	cp (ix+024h)		;6cee
	ret nc			;6cf1
	ld a,e			;6cf2   ; ...baja 1
	dec a			;6cf3
	ret m			;6cf4
	ld e,a			;6cf5
	ret			;6cf6
guarda_partitura:		; IX+02/03 = HL + 1: por donde va la partitura
	inc hl			;6cf7   ; HL + 1...
	ld (ix+002h),l		;6cf8   ; ...en IX+02/03
	ld (ix+003h),h		;6cfb   ; guarda por donde va la partitura (alto)
	ret			;6cfe
L_6CFF:
	ld de,0e1cch		;6cff   ; el fundido: 0xE1CC (cuadros) y 0xE1CD (pasos)
	ld a,(de)			;6d02
	ld b,a			;6d03
	inc de			;6d04
	ld a,(de)			;6d05
	ld c,a			;6d06
	ld hl,0e1ceh		;6d07   ; la cuenta de cuadros
	inc (hl)			;6d0a
	ld a,(hl)			;6d0b
	cp b			;6d0c
	ret nz			;6d0d   ; aun no
	ld (hl),000h		;6d0e   ; un paso mas
	inc hl			;6d10
	inc (hl)			;6d11
	ld a,(hl)			;6d12
	cp c			;6d13   ; todos: se acaba
	ret nz			;6d14
	ld hl,0e1b8h		;6d15   ; sin pausa
	res 0,(hl)		;6d18
	xor a			;6d1a   ; las cuentas a 0
	ld hl,0e1ceh		;6d1b
	ld (hl),a			;6d1e
	inc hl			;6d1f
	ld (hl),a			;6d20
	ld a,(0e02ch)		;6d21   ; el sonido del canal 2...
	ld e,a			;6d24
	ld a,(0e058h)		;6d25   ; ...y el del 3 iguales?
	cp e			;6d28
	jr nz,L_6D39		;6d29
	ld ix,0e058h		;6d2b   ; entonces acaban el 3 y el 4
	call L_6D9B		;6d2f
	ld ix,0e084h		;6d32
	call L_6D9B		;6d36
L_6D39:
	ld de,0002ch		;6d39   ; y los canales 1, 2, 5, 6, 7 y 8
	ld ix,0e000h		;6d3c   ; apunta a los 8 canales de sonido (0x2C bytes cada uno)
	call L_6D9B		;6d40
	add ix,de		;6d43
	call L_6D9B		;6d45
	ld ix,0e0b0h		;6d48
	call L_6D9B		;6d4c
	add ix,de		;6d4f
	call L_6D9B		;6d51
	add ix,de		;6d54
	call L_6D9B		;6d56
	add ix,de		;6d59
	call L_6D9B		;6d5b
	ret			;6d5e
L_6D5F:
	ld a,(0e02ch)		;6d5f   ; el volumen con el fundido: el sonido del canal 2...
	ld b,a			;6d62
	ld a,(0e058h)		;6d63
	cp b			;6d66   ; ...distinto del del 3...
	jr z,L_6D6F		;6d67
	ld a,(0e1d1h)		;6d69   ; ...y el canal 3 o 4: no
	and 0f3h		;6d6c
	ret z			;6d6e
L_6D6F:
	bit 2,(ix+00dh)		;6d6f   ; con ruido: 0
	jr nz,L_6D80		;6d73
	ld a,(0e1cfh)		;6d75   ; el volumen - los pasos del fundido
	ld b,a			;6d78
	ld a,e			;6d79
	sub b			;6d7a
	ld e,000h		;6d7b
	ret m			;6d7d   ; sin bajar de 0
	ld e,a			;6d7e
	ret			;6d7f
L_6D80:
	ld e,000h		;6d80
	ret			;6d82
L_6D83:
	ld hl,0e1ceh		;6d83   ; la subida: la cuenta de cuadros
	inc (hl)			;6d86
	ld a,(hl)			;6d87
	cp 025h		;6d88   ; 37
	ret nz			;6d8a
	ld (hl),000h		;6d8b   ; la cuenta a 0
	inc hl			;6d8d
	dec (hl)			;6d8e   ; un paso menos
	ret nz			;6d8f
	ld hl,0e1b8h		;6d90   ; acabada: sin subida
	res 4,(hl)		;6d93
	ld hl,0e1ceh		;6d95
	ld (hl),000h		;6d98
	ret			;6d9a
L_6D9B:
	xor a			;6d9b   ; acaba el canal: todo a 0
	ld (ix+000h),a		;6d9c   ; guarda el canal en marcha (su sonido)
	ld (ix+001h),a		;6d9f   ; guarda el operando de la orden 0xDE
	ld (ix+005h),a		;6da2
	ld (ix+006h),a		;6da5
	ld (ix+00ah),a		;6da8
	ld (ix+00bh),a		;6dab
	ld (ix+00ch),a		;6dae
	ld (ix+00dh),a		;6db1   ; guarda IX+0D (bits 0-1 de las ordenes 0xE0-0xE3)
	ld (ix+00eh),a		;6db4   ; guarda IX+0E (marcas de las ordenes 0xEE-0xF7)
	ld (ix+00fh),a		;6db7
	ld a,(0e1d1h)		;6dba   ; el bit del canal
	cp 008h		;6dbd   ; los del SCC: fuera
	ret nc			;6dbf
	cp 004h		;6dc0   ; el canal 3...
	ld hl,0e1d4h		;6dc2   ; 0xE1D4: el ruido
	jr nz,L_6DD1		;6dc5
	res 1,(hl)		;6dc7   ; el bit 1 a cero
	bit 3,(hl)		;6dc9   ; el bit 3...
	ret z			;6dcb
	res 3,(hl)		;6dcc   ; ...pasa al 2
	set 2,(hl)		;6dce
	ret			;6dd0
L_6DD1:
	res 3,(hl)		;6dd1   ; los demas: el bit 3 a cero
	ret			;6dd3
orden:		; la orden 0xE0-0xFE de la partitura por la tabla de 0x6DE9
	cp 0e0h		;6dd4   ; menos de 0xE0: las ordenes 0xD0-0xDF
	jp c,orden_d		;6dd6   ; orden_d: la orden 0xD0-0xDF de la partitura
	and 01fh		;6dd9   ; & 0x1F
	push hl			;6ddb   ; la partitura se guarda en la pila
	ld hl,06de9h		;6ddc   ; la tabla de 0x6DE9
	add a,a			;6ddf   ; x 2
	ld e,a			;6de0
	ld d,000h		;6de1
	add hl,de			;6de3
	ld e,(hl)			;6de4   ; el destino
	inc hl			;6de5
	ld d,(hl)			;6de6
	ex de,hl			;6de7
	jp (hl)			;6de8   ; salta alli (el destino saca HL de la pila)

; ----------------------------------------------------------------------
; DATOS ordenes: 31 destinos, uno por orden de la partitura de 0xE0 a 0xFE
;   (p04:6DD4: HL = 0x6DE9 + 2 x (orden & 0x1F); jp (hl) en p04:6DE8); el 0xFF
;   no llega aqui (lo mira antes p04:6A30); lo leen p04:6DE8 (62 bytes)
;   0x6de9..0x6e27  (62 bytes)
DATA_ordenes:
	defw 06e27h,06e3dh,06e27h,06e3dh,06e5ah,06e84h,06e98h,06ea8h	; 6de9
	defw 06ebah,06ecbh,06ed2h,06ed9h,06f2ch,06f36h,06f3dh,06f48h	; 6df9
	defw 06f4eh,06f58h,06f73h,06f82h,06f88h,06f8eh,06f94h,06f9eh	; 6e09
	defw 06fa9h,06fc6h,06fd1h,06fd9h,06ff3h,07008h,0700bh	; 6e19

; ======================================================================
; CODIGO 0x6e27..0x711e  (759 bytes)
; ======================================================================


L_6E27:
	pop hl			;6e27   ; 0xE0/0xE2: la partitura
L_6E28:
	res 6,(ix+00eh)		;6e28   ; el bit 6 de IX+0E a cero
	ld a,(hl)			;6e2c   ; la orden & 3...
	and 003h		;6e2d
	ld (ix+00dh),a		;6e2f   ; ...a IX+0D
	ld b,a			;6e32
	inc hl			;6e33   ; el operando...
	ld a,(hl)			;6e34
	ld (ix+013h),a		;6e35   ; ...la duracion de la nota
	ld a,b			;6e38
	or a			;6e39   ; con operando: fuera
	ret nz			;6e3a
	dec hl			;6e3b   ; 0xE0: sin operando
	ret			;6e3c
L_6E3D:
	pop hl			;6e3d   ; 0xE1/0xE3: con ruido; el canal 3...
	ld a,(0e1d1h)		;6e3e   ; lee el bit del canal que se interpreta (1, 2, 4... 0x80)
	cp 004h		;6e41
	ld a,(0e1d4h)		;6e43
	jr nz,L_6E51		;6e46
	set 0,a		;6e48   ; ...0xE1D4 bit 0, sin el 1
	res 1,a		;6e4a
	ld (0e1d4h),a		;6e4c
	jr L_6E28		;6e4f
L_6E51:
	set 2,a		;6e51   ; el 4: bit 2, sin el 3
	res 3,a		;6e53
	ld (0e1d4h),a		;6e55
	jr L_6E28		;6e58
L_6E5A:
	pop hl			;6e5a   ; 0xE4: el periodo del ruido
	inc hl			;6e5b
	ld a,(hl)			;6e5c   ; el operando...
	and 01fh		;6e5d   ; ...& 0x1F
	ld b,a			;6e5f
	ld a,(0e1d1h)		;6e60   ; el canal 3...
	cp 004h		;6e63
	ld a,b			;6e65
	jr nz,L_6E76		;6e66
	ld (0e1d2h),a		;6e68   ; ...en 0xE1D2...
	ld a,(0e1d4h)		;6e6b   ; ...y que se escriba (0xE1D4 bit 0)
	set 0,a		;6e6e
	res 1,a		;6e70
	ld (0e1d4h),a		;6e72
	ret			;6e75
L_6E76:
	ld (0e1d3h),a		;6e76   ; el 4: en 0xE1D3, bit 2
	ld a,(0e1d4h)		;6e79
	set 2,a		;6e7c
	res 3,a		;6e7e
	ld (0e1d4h),a		;6e80
	ret			;6e83
L_6E84:
	pop hl			;6e84   ; 0xE5: la forma de la envolvente del PSG (registro 13)
	inc hl			;6e85
	res 3,(ix+00dh)		;6e86   ; IX+0D bit 3 a cero
	ld a,(hl)			;6e8a
	ld (0e1d5h),a		;6e8b   ; en 0xE1D5
	ld de,0e1d4h		;6e8e   ; y que se escriba (0xE1D4 bit 5)
	ld a,(de)			;6e91
	set 5,a		;6e92
	ld (de),a			;6e94
	jp L_6E99		;6e95
L_6E98:
	pop hl			;6e98   ; 0xE6: el periodo de la envolvente, alto (registro 12)
L_6E99:
	inc hl			;6e99
	ld a,(hl)			;6e9a
	ld (0e1d7h),a		;6e9b   ; en 0xE1D7, bit 6
	ld de,0e1d4h		;6e9e
	ld a,(de)			;6ea1
	set 6,a		;6ea2
	ld (de),a			;6ea4
	jp L_6EA9		;6ea5
L_6EA8:
	pop hl			;6ea8   ; 0xE7: el periodo de la envolvente, bajo (registro 11)
L_6EA9:
	inc hl			;6ea9
	ld a,(hl)			;6eaa
	ld (0e1d6h),a		;6eab   ; en 0xE1D6, bit 7
	ld de,0e1d4h		;6eae
	ld a,(de)			;6eb1
	set 7,a		;6eb2
	ld (de),a			;6eb4
	set 2,(ix+00dh)		;6eb5   ; y el canal con envolvente (IX+0D bit 2)
	ret			;6eb9
L_6EBA:
	pop hl			;6eba   ; 0xE8: sin envolvente del PSG
	ld de,0e1d4h		;6ebb
	ld a,(de)			;6ebe
	and 01fh		;6ebf   ; los bits 5-7 de 0xE1D4 a cero
	ld (de),a			;6ec1
	ld a,(ix+00dh)		;6ec2   ; IX+0D bits 2-3 a cero
	and 0f3h		;6ec5
	ld (ix+00dh),a		;6ec7   ; guarda IX+0D (bits 0-1 de las ordenes 0xE0-0xE3)
	ret			;6eca
L_6ECB:
	pop hl			;6ecb   ; 0xE9: la unidad de duracion
	inc hl			;6ecc
	ld a,(hl)			;6ecd
	ld (ix+014h),a		;6ece   ; guarda el operando de la orden 0xE9
	ret			;6ed1
L_6ED2:
	pop hl			;6ed2   ; 0xEA: el volumen
	inc hl			;6ed3
	ld a,(hl)			;6ed4
	ld (ix+015h),a		;6ed5   ; guarda el operando de la orden 0xEA
	ret			;6ed8
L_6ED9:
	pop hl			;6ed9   ; 0xEB: la envolvente de volumen, dos bytes
	inc hl			;6eda
	ld a,(ix+00fh)		;6edb   ; IX+0F: solo el bit 7
	and 080h		;6ede
	ld (ix+00fh),a		;6ee0
	ld a,(hl)			;6ee3   ; la cifra alta del primero...
	and 0f0h		;6ee4
	rrca			;6ee6
	rrca			;6ee7
	rrca			;6ee8
	rrca			;6ee9
	cp 008h		;6eea   ; ...8 o mas: empieza bajando (bit 2)
	jp nc,L_6EF3		;6eec
	set 2,(ix+00fh)		;6eef
L_6EF3:
	res 3,a		;6ef3   ; sin el bit 3...
	inc a			;6ef5   ; ...+ 1
	bit 2,(ix+00fh)		;6ef6   ; sin bajar...
	jp nz,L_6F01		;6efa
	set 1,(ix+00fh)		;6efd   ; ...con ataque (bit 1)
L_6F01:
	ld (ix+021h),a		;6f01   ; la cuenta del ataque (IX+21)
	ld a,(hl)			;6f04   ; la cifra baja...
	and 00fh		;6f05
	cp 008h		;6f07
	jp c,L_6F10		;6f09   ; ...8 o mas: el sostenido de golpe (bit 4)
	set 4,(ix+00fh)		;6f0c
L_6F10:
	res 3,a		;6f10
	inc a			;6f12
	ld (ix+022h),a		;6f13   ; la del sostenido (IX+22)
	inc hl			;6f16
	ld a,(hl)			;6f17   ; el segundo byte: cifra alta...
	and 0f0h		;6f18
	rrca			;6f1a
	rrca			;6f1b
	rrca			;6f1c
	rrca			;6f1d
	ld (ix+023h),a		;6f1e   ; ...IX+23
	ld a,(hl)			;6f21   ; cifra baja...
	and 00fh		;6f22
	ld (ix+024h),a		;6f24   ; ...IX+24
	set 0,(ix+00fh)		;6f27   ; la envolvente en marcha (bit 0)
	ret			;6f2b
L_6F2C:
	pop hl			;6f2c   ; 0xEC: sin envolvente de volumen
	res 0,(ix+00fh)		;6f2d
	res 1,(ix+00fh)		;6f31
	ret			;6f35
L_6F36:
	pop hl			;6f36   ; 0xED: el volumen del ataque (IX+25)
	inc hl			;6f37
	ld a,(hl)			;6f38
	ld (ix+025h),a		;6f39
	ret			;6f3c
L_6F3D:
	pop hl			;6f3d   ; 0xEE: el desafinado (IX+26)...
	inc hl			;6f3e
	ld a,(hl)			;6f3f
	ld (ix+026h),a		;6f40
	set 1,(ix+00eh)		;6f43   ; ...en marcha
	ret			;6f47
L_6F48:
	pop hl			;6f48   ; 0xEF: sin desafinado
	res 1,(ix+00eh)		;6f49   ; pone a cero el bit 1 de IX+0E (marcas de las ordenes 0xEE-0xF7)
	ret			;6f4d
L_6F4E:
	pop hl			;6f4e   ; 0xF0: sin vibrato
	ld a,(ix+00eh)		;6f4f   ; lee IX+0E (marcas de las ordenes 0xEE-0xF7)
	and 0e2h		;6f52
	ld (ix+00eh),a		;6f54   ; guarda IX+0E (marcas de las ordenes 0xEE-0xF7)
	ret			;6f57
L_6F58:
	pop hl			;6f58   ; 0xF1: el vibrato
	inc hl			;6f59
	ld a,(ix+00eh)		;6f5a   ; IX+0E bits 2 y 4
	or 014h		;6f5d
	ld (ix+00eh),a		;6f5f   ; guarda IX+0E (marcas de las ordenes 0xEE-0xF7)
	ld a,(hl)			;6f62   ; la cifra baja: cuanto (IX+1C)
	and 00fh		;6f63
	ld (ix+01ch),a		;6f65
	ld a,(hl)			;6f68   ; la alta: cada cuanto (IX+1B)
	and 0f0h		;6f69
	rrca			;6f6b
	rrca			;6f6c
	rrca			;6f6d
	rrca			;6f6e
	ld (ix+01bh),a		;6f6f
	ret			;6f72
L_6F73:
	pop hl			;6f73   ; 0xF2: el vibrato con espera (IX+1A)
	inc hl			;6f74
	ld a,(hl)			;6f75
	ld (ix+01ah),a		;6f76
	ld a,(ix+00eh)		;6f79   ; IX+0E bits 2 y 3
	or 00ch		;6f7c
	ld (ix+00eh),a		;6f7e   ; guarda IX+0E (marcas de las ordenes 0xEE-0xF7)
	ret			;6f81
L_6F82:
	pop hl			;6f82   ; 0xF3: sin la espera
	res 3,(ix+00eh)		;6f83   ; pone a cero el bit 3 de IX+0E (marcas de las ordenes 0xEE-0xF7)
	ret			;6f87
L_6F88:
	pop hl			;6f88   ; 0xF4: IX+0E bit 6
	set 6,(ix+00eh)		;6f89   ; pone a uno el bit 6 de IX+0E (marcas de las ordenes 0xEE-0xF7)
	ret			;6f8d
L_6F8E:
	pop hl			;6f8e   ; 0xF5: IX+0E bit 5
	set 5,(ix+00eh)		;6f8f   ; pone a uno el bit 5 de IX+0E (marcas de las ordenes 0xEE-0xF7)
	ret			;6f93
L_6F94:
	pop hl			;6f94   ; 0xF6: sin los bits 5 y 6
	ld a,(ix+00eh)		;6f95   ; lee IX+0E (marcas de las ordenes 0xEE-0xF7)
	and 09fh		;6f98
	ld (ix+00eh),a		;6f9a   ; guarda IX+0E (marcas de las ordenes 0xEE-0xF7)
	ret			;6f9d
L_6F9E:
	pop hl			;6f9e   ; 0xF7: el bit 7 y el volumen de IX+15
	set 7,(ix+00eh)		;6f9f   ; pone a uno el bit 7 de IX+0E (marcas de las ordenes 0xEE-0xF7)
	inc hl			;6fa3
	ld a,(hl)			;6fa4
	ld (ix+015h),a		;6fa5   ; guarda el operando de la orden 0xEA
	ret			;6fa8
L_6FA9:
	pop hl			;6fa9   ; 0xF8: la forma de onda del SCC
	inc hl			;6faa
	ld a,(hl)			;6fab
	ld (ix+029h),a		;6fac   ; en IX+29
	ld de,06000h		;6faf   ; su puntero de 0x6000 + 2 x n
	add a,a			;6fb2
	add a,e			;6fb3
	ld e,a			;6fb4
	jr nc,L_6FB8		;6fb5
	inc d			;6fb7
L_6FB8:
	ld a,(de)			;6fb8   ; a IX+27/28
	ld (ix+027h),a		;6fb9
	inc de			;6fbc
	ld a,(de)			;6fbd
	ld (ix+028h),a		;6fbe
	set 7,(ix+00fh)		;6fc1   ; y que se cargue (IX+0F bit 7)
	ret			;6fc5
L_6FC6:
	pop hl			;6fc6   ; 0xF9: llama a una subpartitura
	call L_6FE5		;6fc7   ; su direccion
	ld (ix+007h),e		;6fca   ; la vuelta en IX+07/08
	ld (ix+008h),d		;6fcd
	ret			;6fd0
L_6FD1:
	pop hl			;6fd1   ; 0xFA: vuelve de la subpartitura
	ld l,(ix+007h)		;6fd2
	ld h,(ix+008h)		;6fd5
	ret			;6fd8
L_6FD9:
	pop hl			;6fd9   ; 0xFB: repite [veces][direccion]
	inc hl			;6fda
	ld a,(ix+005h)		;6fdb   ; la cuenta (IX+05) + 1
	inc a			;6fde
	cp (hl)			;6fdf   ; ya las veces?
	jr z,L_6FEC		;6fe0   ; si: sigue
	ld (ix+005h),a		;6fe2   ; no: otra vez
L_6FE5:
	inc hl			;6fe5   ; la direccion
	ld e,(hl)			;6fe6
	inc hl			;6fe7
	ld d,(hl)			;6fe8
	ex de,hl			;6fe9   ; HL = la direccion - 1
	dec hl			;6fea
	ret			;6feb
L_6FEC:
	inc hl			;6fec   ; se acabo: se salta la direccion
	inc hl			;6fed
	ld (ix+005h),000h		;6fee   ; la cuenta a 0
	ret			;6ff2
L_6FF3:
	pop hl			;6ff3   ; 0xFC: igual con la otra cuenta (IX+06)
	inc hl			;6ff4
	ld a,(ix+006h)		;6ff5
	inc a			;6ff8
	cp (hl)			;6ff9
	jr z,L_7001		;6ffa
	ld (ix+006h),a		;6ffc
	jr L_6FE5		;6fff
L_7001:
	inc hl			;7001
	inc hl			;7002
	ld (ix+006h),000h		;7003
	ret			;7007
L_7008:
	pop hl			;7008   ; 0xFD: salta
	jr L_6FE5		;7009
L_700B:
	pop hl			;700b   ; 0xFE: el modo
	inc hl			;700c
	ld a,(hl)			;700d
	ld (ix+009h),a		;700e   ; en IX+09
	cp 004h		;7011   ; menos de 4: p04:7029
	jp c,L_7029		;7013
	ld a,(ix+00eh)		;7016   ; la bateria: IX+0E (bit 0 y solo 0 y 4)
	set 0,a		;7019
	and 011h		;701b
	ld (ix+00eh),a		;701d   ; guarda IX+0E (marcas de las ordenes 0xEE-0xF7)
	res 0,(ix+00fh)		;7020   ; sin envolvente de volumen
	res 1,(ix+00fh)		;7024
	ret			;7028
L_7029:
	res 0,(ix+00eh)		;7029   ; IX+0E bit 0 a cero
	ret			;702d
orden_d:		; la orden 0xD0-0xDF de la partitura
	ld a,(hl)			;702e   ; la cifra baja
	and 00fh		;702f
	cp 006h		;7031   ; de 0 a 5: la octava
	jr nc,L_7039		;7033
	ld (ix+016h),a		;7035   ; guarda la octava (ordenes 0xD0-0xD5)
	ret			;7038
L_7039:
	cp 00eh		;7039   ; 6-0x0D: nada
	ret c			;703b
	jp z,L_7044		;703c   ; 0x0E: con operando
	res 7,(ix+00eh)		;703f   ; 0x0F: IX+0E bit 7 a cero
	ret			;7043
L_7044:
	inc hl			;7044   ; el operando...
	ld a,(hl)			;7045
	ld (ix+001h),a		;7046   ; ...a IX+01
	ret			;7049
mezcla_psg:		; el registro 7 del PSG con lo que piden los canales
	call L_7051		;704a   ; el PSG (p04:7051) y el SCC (p04:712A)
	call L_712A		;704d
	ret			;7050
L_7051:
	call L_705E		;7051   ; periodos y volumenes, ruido, envolvente y mezclador
	call L_7093		;7054
	call L_70BC		;7057
	call L_70EA		;705a
	ret			;705d
L_705E:
	ld b,000h		;705e   ; los tres canales del PSG: los registros 0-5 y 8-10
	ld c,008h		;7060
	ld hl,0e00ah		;7062   ; el canal 1 (0xE00A: periodo y volumen)
	call L_7075		;7065
	ld hl,0e036h		;7068   ; el 2
	call L_7075		;706b
	ld hl,0e062h		;706e   ; el 3
	call L_7075		;7071
	ret			;7074
L_7075:
	ld e,(hl)			;7075   ; el periodo bajo
	ld a,b			;7076
	call 00093h		;7077   ; BIOS WRTPSG - Writes data to PSG-register | WRTPSG
	inc hl			;707a
	inc b			;707b
	ld e,(hl)			;707c   ; el alto
	ld a,b			;707d
	call 00093h		;707e   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;7081
	ld e,(hl)			;7082   ; el volumen
	ld a,c			;7083
	inc b			;7084
	inc c			;7085
	inc hl			;7086
	bit 3,(hl)		;7087   ; IX+0D bit 3: con envolvente...
	ret nz			;7089   ; ...no se escribe
	call 00093h		;708a   ; BIOS WRTPSG - Writes data to PSG-register | WRTPSG
	bit 2,(hl)		;708d   ; bit 2 (pide envolvente)...
	ret z			;708f
	set 3,(hl)		;7090   ; ...pasa al bit 3: el volumen 16 una sola vez
	ret			;7092
L_7093:
	ld hl,0e1d4h		;7093   ; el ruido: 0xE1D4 bit 0 (el del canal 3)?
	bit 0,(hl)		;7096
	jr z,L_70A8		;7098
	res 0,(hl)		;709a   ; se escribe una vez...
	set 1,(hl)		;709c
	ld a,(0e1d2h)		;709e   ; ...el periodo de 0xE1D2...
	ld e,a			;70a1
	ld a,006h		;70a2   ; ...en el registro 6
	call 00093h		;70a4   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;70a7
L_70A8:
	bit 1,(hl)		;70a8   ; bit 1: ya esta
	ret nz			;70aa
	bit 2,(hl)		;70ab   ; bit 2 (el del canal 4)?
	ret z			;70ad
	res 2,(hl)		;70ae
	set 3,(hl)		;70b0
	ld a,(0e1d3h)		;70b2   ; el de 0xE1D3
	ld e,a			;70b5
	ld a,006h		;70b6
	call 00093h		;70b8   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;70bb
L_70BC:
	ld hl,0e1d4h		;70bc   ; la envolvente del PSG: bit 7?
	bit 7,(hl)		;70bf
	ret z			;70c1
	res 7,(hl)		;70c2
	ld a,(0e1d6h)		;70c4   ; el periodo bajo (0xE1D6)...
	ld e,a			;70c7
	ld a,00bh		;70c8   ; ...al registro 11
	call 00093h		;70ca   ; BIOS WRTPSG - Writes data to PSG-register
	bit 6,(hl)		;70cd   ; bit 6...
	ret z			;70cf
	res 6,(hl)		;70d0
	ld a,(0e1d7h)		;70d2   ; ...el alto (0xE1D7) al 12
	ld e,a			;70d5
	ld a,00ch		;70d6
	call 00093h		;70d8   ; BIOS WRTPSG - Writes data to PSG-register
	bit 5,(hl)		;70db   ; bit 5...
	ret z			;70dd
	res 5,(hl)		;70de
	ld a,(0e1d5h)		;70e0   ; ...la forma (0xE1D5) al 13
	ld e,a			;70e3
	ld a,00dh		;70e4
	call 00093h		;70e6   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;70e9
L_70EA:
	ld hl,0e00dh		;70ea   ; el mezclador: los bits del canal 1 (0x711E)...
	ld a,(hl)			;70ed
	ld hl,0711eh		;70ee
	call L_7117		;70f1
	ld b,(hl)			;70f4   ; ...en B
	ld hl,0e039h		;70f5   ; los del 2 (0x7122) en C
	ld a,(hl)			;70f8
	ld hl,07122h		;70f9
	call L_7117		;70fc
	ld c,(hl)			;70ff
	ld hl,0e065h		;7100   ; los del 3 (0x7126)
	ld a,(hl)			;7103
	ld hl,07126h		;7104
	call L_7117		;7107
	ld a,(hl)			;710a
	or b			;710b   ; todos juntos
	or c			;710c
L_710D:
	ld e,a			;710d   ; en E
	ld (0e1d0h),a		;710e   ; la copia
	ld a,007h		;7111   ; el registro 7
	call 00093h		;7113   ; BIOS WRTPSG - Writes data to PSG-register | WRTPSG
	ret			;7116
L_7117:
	and 003h		;7117   ; IX+0D & 3...
	ld e,a			;7119
	ld d,000h		;711a
	add hl,de			;711c   ; ...en la tabla HL
	ret			;711d

; ----------------------------------------------------------------------
; DATOS mezclador: tres tablas de 4 bytes, una por canal del PSG, con los bits
;   del registro 7 (tono/ruido) segun IX+0D & 3; p04:70EE/70F9/7104 las juntan
;   y lo escriben con WRTPSG; lo leen p04:7117 (12 bytes)
;   0x711e..0x712a  (12 bytes)
DATA_mezclador:
	defb 089h,081h,088h,080h	; 711e
	defb 092h,082h,090h,080h	; 7122
	defb 0a4h,084h,0a0h,080h	; 7126

; ======================================================================
; CODIGO 0x712a..0x73c8  (670 bytes)
; ======================================================================


L_712A:
	call L_7137		;712a   ; el SCC: lo que ha cambiado (p04:7137)...
	call L_723C		;712d   ; ...los canales que suenan (p04:723C)...
	call L_728E		;7130   ; ...periodos y volumenes (p04:728E)...
	call L_7355		;7133   ; ...y las formas de onda (p04:7355)
	ret			;7136
L_7137:
	ld ix,0e1d8h		;7137   ; las marcas de lo que cambia (0xE1D8-0xE1D9)
	ld bc,0e1e4h		;713b   ; las copias de los volumenes
	ld de,0e1dah		;713e   ; las copias de los periodos
	ld hl,0e08eh		;7141   ; el periodo del canal 4 (0xE08E)
	ld a,(de)			;7144   ; la copia
	res 0,(ix+000h)		;7145
	cp (hl)			;7149   ; igual?
	jr z,L_7152		;714a
	set 0,(ix+000h)		;714c   ; no: la marca...
	ld a,(hl)			;7150   ; ...y la copia nueva
	ld (de),a			;7151
L_7152:
	inc de			;7152   ; el alto
	inc hl			;7153
	ld a,(de)			;7154
	res 1,(ix+000h)		;7155
	cp (hl)			;7159
	jr z,L_7162		;715a
	set 1,(ix+000h)		;715c
	ld a,(hl)			;7160
	ld (de),a			;7161
L_7162:
	inc de			;7162   ; el volumen
	inc hl			;7163
	res 2,(ix+001h)		;7164
	ld a,(bc)			;7168
	cp (hl)			;7169
	jr z,L_7172		;716a
	set 2,(ix+001h)		;716c
	ld a,(hl)			;7170
	ld (bc),a			;7171
L_7172:
	inc bc			;7172   ; el canal 5 (0xE0BA)
	ld hl,0e0bah		;7173
	ld a,(de)			;7176
	res 2,(ix+000h)		;7177
	cp (hl)			;717b
	jr z,L_7184		;717c
	set 2,(ix+000h)		;717e
	ld a,(hl)			;7182
	ld (de),a			;7183
L_7184:
	inc de			;7184
	inc hl			;7185
	ld a,(de)			;7186   ; el periodo alto del canal 5: distinto de la copia?
	res 3,(ix+000h)		;7187
	cp (hl)			;718b
	jr z,L_7194		;718c
	set 3,(ix+000h)		;718e   ; si: la marca (0xE1D8 bit 3)...
	ld a,(hl)			;7192   ; ...y la copia nueva
	ld (de),a			;7193
L_7194:
	inc de			;7194
	inc hl			;7195
	res 3,(ix+001h)		;7196   ; el volumen: 0xE1D9 bit 3
	ld a,(bc)			;719a   ; distinto?
	cp (hl)			;719b
	jr z,L_71A4		;719c
	set 3,(ix+001h)		;719e
	ld a,(hl)			;71a2   ; la copia nueva
	ld (bc),a			;71a3
L_71A4:
	inc bc			;71a4   ; el 6 (0xE0E6)
	ld hl,0e0e6h		;71a5
	ld a,(de)			;71a8
	res 4,(ix+000h)		;71a9
	cp (hl)			;71ad
	jr z,L_71B6		;71ae
	set 4,(ix+000h)		;71b0
	ld a,(hl)			;71b4
	ld (de),a			;71b5
L_71B6:
	inc de			;71b6
	inc hl			;71b7
	ld a,(de)			;71b8   ; el periodo alto del canal 6: distinto?
	res 5,(ix+000h)		;71b9
	cp (hl)			;71bd
	jr z,L_71C6		;71be
	set 5,(ix+000h)		;71c0   ; la marca (0xE1D8 bit 5)...
	ld a,(hl)			;71c4   ; ...y la copia nueva
	ld (de),a			;71c5
L_71C6:
	inc de			;71c6
	inc hl			;71c7
	res 4,(ix+001h)		;71c8   ; el volumen: 0xE1D9 bit 4
	ld a,(bc)			;71cc   ; distinto?
	cp (hl)			;71cd
	jr z,L_71D6		;71ce
	set 4,(ix+001h)		;71d0
	ld a,(hl)			;71d4   ; la copia nueva
	ld (bc),a			;71d5
L_71D6:
	inc bc			;71d6   ; el 7 (0xE112)
	ld hl,0e112h		;71d7
	ld a,(de)			;71da
	res 6,(ix+000h)		;71db
	cp (hl)			;71df
	jr z,L_71E8		;71e0
	set 6,(ix+000h)		;71e2
	ld a,(hl)			;71e6
	ld (de),a			;71e7
L_71E8:
	inc de			;71e8
	inc hl			;71e9
	ld a,(de)			;71ea   ; el periodo alto del canal 7: distinto?
	res 7,(ix+000h)		;71eb
	cp (hl)			;71ef
	jr z,L_71F8		;71f0
	set 7,(ix+000h)		;71f2   ; la marca (0xE1D8 bit 7)...
	ld a,(hl)			;71f6   ; ...y la copia nueva
	ld (de),a			;71f7
L_71F8:
	inc de			;71f8
	inc hl			;71f9
	res 5,(ix+001h)		;71fa   ; el volumen: 0xE1D9 bit 5
	ld a,(bc)			;71fe   ; distinto?
	cp (hl)			;71ff
	jr z,L_7208		;7200
	set 5,(ix+001h)		;7202
	ld a,(hl)			;7206   ; la copia nueva
	ld (bc),a			;7207
L_7208:
	inc bc			;7208   ; el 8 (0xE13E)
	ld hl,0e13eh		;7209
	ld a,(de)			;720c
	res 0,(ix+001h)		;720d
	cp (hl)			;7211
	jr z,L_721A		;7212
	set 0,(ix+001h)		;7214
	ld a,(hl)			;7218
	ld (de),a			;7219
L_721A:
	inc de			;721a
	inc hl			;721b
	ld a,(de)			;721c   ; el periodo alto del canal 8: distinto?
	res 1,(ix+001h)		;721d
	cp (hl)			;7221
	jr z,L_722A		;7222
	set 1,(ix+001h)		;7224   ; la marca (0xE1D9 bit 1)...
	ld a,(hl)			;7228   ; ...y la copia nueva
	ld (de),a			;7229
L_722A:
	inc de			;722a
	inc hl			;722b
	res 6,(ix+001h)		;722c   ; el volumen: 0xE1D9 bit 6
	ld a,(bc)			;7230   ; distinto?
	cp (hl)			;7231
	jr z,L_723A		;7232
	set 6,(ix+001h)		;7234
	ld a,(hl)			;7238   ; la copia nueva
	ld (bc),a			;7239
L_723A:
	inc bc			;723a
	ret			;723b
L_723C:
	ld e,000h		;723c   ; los canales que suenan: los modos de los 5 del SCC...
	ld hl,0e091h		;723e
	ld c,001h		;7241
	ld a,(hl)			;7243   ; ...con modo, su bit
	or a			;7244
	jr z,L_7248		;7245
	ld a,c			;7247
L_7248:
	or e			;7248
	ld e,a			;7249
	ld hl,0e0bdh		;724a
	sla c		;724d   ; el siguiente bit
	ld a,(hl)			;724f
	or a			;7250
	jr z,L_7254		;7251
	ld a,c			;7253
L_7254:
	or e			;7254
	ld e,a			;7255
	ld hl,0e0e9h		;7256   ; el modo del canal 6 (0xE0E9)
	sla c		;7259   ; su bit
	ld a,(hl)			;725b
	or a			;725c
	jr z,L_7260		;725d
	ld a,c			;725f
L_7260:
	or e			;7260
	ld e,a			;7261
	ld hl,0e115h		;7262   ; el del 7 (0xE115)
	sla c		;7265   ; su bit
	ld a,(hl)			;7267
	or a			;7268
	jr z,L_726C		;7269
	ld a,c			;726b
L_726C:
	or e			;726c
	ld e,a			;726d
	ld hl,0e141h		;726e   ; el del 8 (0xE141)
	sla c		;7271   ; su bit
	ld a,(hl)			;7273
	or a			;7274
	jr z,L_7278		;7275
	ld a,c			;7277
L_7278:
	or e			;7278
	ld e,a			;7279
	ld hl,0e1e9h		;727a   ; la copia de 0xE1E9
	ld a,(hl)			;727d
	cp e			;727e   ; igual: p04:7288
	jr z,L_7288		;727f
	ld (hl),e			;7281   ; la nueva...
	ld hl,0e1d9h		;7282   ; ...y la marca (0xE1D9 bit 7)
	set 7,(hl)		;7285
	ret			;7287
L_7288:
	ld hl,0e1d9h		;7288   ; sin cambio
	res 7,(hl)		;728b
	ret			;728d
L_728E:
	ld ix,0e1d8h		;728e   ; los registros del SCC: las marcas
	ld hl,0e1dah		;7292   ; las copias
	ld de,09880h		;7295   ; desde 0x9880 (los periodos)
	bit 0,(ix+000h)		;7298   ; cambia?
	jr z,L_72A1		;729c
	call L_7346		;729e   ; escribe el registro
L_72A1:
	inc hl			;72a1   ; el siguiente
	inc de			;72a2
	bit 1,(ix+000h)		;72a3
	jr z,L_72AC		;72a7
	call L_7346		;72a9
L_72AC:
	inc hl			;72ac
	inc de			;72ad
	bit 2,(ix+000h)		;72ae
	jr z,L_72B7		;72b2
	call L_7346		;72b4
L_72B7:
	inc hl			;72b7
	inc de			;72b8
	bit 3,(ix+000h)		;72b9
	jr z,L_72C2		;72bd
	call L_7346		;72bf
L_72C2:
	inc hl			;72c2
	inc de			;72c3
	bit 4,(ix+000h)		;72c4
	jr z,L_72CD		;72c8
	call L_7346		;72ca
L_72CD:
	inc hl			;72cd
	inc de			;72ce
	bit 5,(ix+000h)		;72cf
	jr z,L_72D8		;72d3
	call L_7346		;72d5
L_72D8:
	inc hl			;72d8
	inc de			;72d9
	bit 6,(ix+000h)		;72da
	jr z,L_72E3		;72de
	call L_7346		;72e0
L_72E3:
	inc hl			;72e3
	inc de			;72e4
	bit 7,(ix+000h)		;72e5
	jr z,L_72EE		;72e9
	call L_7346		;72eb
L_72EE:
	inc hl			;72ee
	inc de			;72ef
	bit 0,(ix+001h)		;72f0
	jr z,L_72F9		;72f4
	call L_7346		;72f6
L_72F9:
	inc hl			;72f9
	inc de			;72fa
	bit 1,(ix+001h)		;72fb
	jr z,L_7304		;72ff
	call L_7346		;7301
L_7304:
	inc hl			;7304
	inc de			;7305
	bit 2,(ix+001h)		;7306
	jr z,L_730F		;730a
	call L_7346		;730c
L_730F:
	inc hl			;730f
	inc de			;7310
	bit 3,(ix+001h)		;7311
	jr z,L_731A		;7315
	call L_7346		;7317
L_731A:
	inc hl			;731a
	inc de			;731b
	bit 4,(ix+001h)		;731c
	jr z,L_7325		;7320
	call L_7346		;7322
L_7325:
	inc hl			;7325
	inc de			;7326
	bit 5,(ix+001h)		;7327
	jr z,L_7330		;732b
	call L_7346		;732d
L_7330:
	inc hl			;7330
	inc de			;7331
	bit 6,(ix+001h)		;7332
	jr z,L_733B		;7336
	call L_7346		;7338
L_733B:
	inc hl			;733b
	inc de			;733c
	bit 7,(ix+001h)		;733d   ; el siguiente: con el bit 7 de 0xE1D9...
	ret z			;7341
	call L_7346		;7342   ; ...lo escribe
	ret			;7345
L_7346:
	ld a,(hl)			;7346   ; el byte...
	ld c,a			;7347
	ld a,03fh		;7348   ; ...con el SCC en 0x9800...
	ld (09000h),a		;734a   ; el mapper: pone en 0x8000 el banco de A
	ld a,c			;734d
	ld (de),a			;734e   ; ...al registro
	ld a,005h		;734f   ; y el banco 5 otra vez
	ld (09000h),a		;7351   ; el mapper: pone en 0x8000 el banco de A
	ret			;7354
L_7355:
	ld hl,0e093h		;7355   ; las formas de onda: la del canal 4 (0xE093 bit 7)?
	bit 7,(hl)		;7358
	jr z,L_736B		;735a
	res 7,(hl)		;735c   ; una vez
	ld hl,0e0abh		;735e   ; su puntero (IX+27/28)
	ld e,(hl)			;7361
	inc hl			;7362
	ld d,(hl)			;7363
	ex de,hl			;7364
	ld de,09800h		;7365   ; a 0x9800
	call L_73A9		;7368
L_736B:
	ld hl,0e0bfh		;736b   ; la del 5 a 0x9820
	bit 7,(hl)		;736e
	jr z,L_7381		;7370   ; cambia?
	res 7,(hl)		;7372   ; una vez
	ld hl,0e0d7h		;7374   ; su puntero
	ld e,(hl)			;7377
	inc hl			;7378
	ld d,(hl)			;7379
	ex de,hl			;737a
	ld de,09820h		;737b   ; a 0x9820
	call L_73A9		;737e   ; las 32 muestras
L_7381:
	ld hl,0e0ebh		;7381   ; la del 6 a 0x9840
	bit 7,(hl)		;7384
	jr z,L_7397		;7386   ; cambia?
	res 7,(hl)		;7388   ; una vez
	ld hl,0e103h		;738a   ; su puntero
	ld e,(hl)			;738d
	inc hl			;738e
	ld d,(hl)			;738f
	ex de,hl			;7390
	ld de,09840h		;7391   ; a 0x9840
	call L_73A9		;7394   ; las 32 muestras
L_7397:
	ld hl,0e117h		;7397   ; la del 7 a 0x9860
	bit 7,(hl)		;739a
	ret z			;739c
	res 7,(hl)		;739d
	ld hl,0e12fh		;739f
	ld e,(hl)			;73a2
	inc hl			;73a3
	ld d,(hl)			;73a4
	ex de,hl			;73a5
	ld de,09860h		;73a6
L_73A9:
	ld a,03fh		;73a9   ; el SCC en 0x9800
	ld (09000h),a		;73ab   ; el mapper: pone en 0x8000 el banco de A
	xor a			;73ae   ; todos callados mientras
	ld (0988fh),a		;73af   ; al SCC: los canales del SCC que suenan (un bit cada uno)
	ld b,020h		;73b2   ; 32 muestras
L_73B4:
	ld a,(hl)			;73b4   ; una
	ld (de),a			;73b5
	inc hl			;73b6
	inc de			;73b7
	djnz L_73B4		;73b8   ; las 32
	ld hl,0988fh		;73ba   ; y los que suenan otra vez
	ld de,0e1e9h		;73bd
	ld a,(de)			;73c0
	ld (hl),a			;73c1
	ld a,005h		;73c2   ; el banco 5
	ld (09000h),a		;73c4   ; el mapper: pone en 0x8000 el banco de A
	ret			;73c7

; ----------------------------------------------------------------------
; DATOS golpes: 10 punteros a los guiones de bateria (p04:6B3C: la cifra alta
;   de la nota en los modos de bateria); lo leen p04:6B44 (20 bytes)
;   0x73c8..0x73dc  (20 bytes)
DATA_golpes:
	defw 073dch,073e3h,073f0h,07405h,0741eh,07436h,0744fh,07468h,07483h,074a0h	; 73c8

; ----------------------------------------------------------------------
; DATOS partitura_73DC: partitura (p04:6A23: ordenes 0xD0-0xFF y notas) de los
;   sonidos 0x01, 0x03, 0x04, golpe 0, golpe 1, golpe 2 y otros; lo leen
;   p04:6A2F (334 bytes)
;   0x73dc..0x752a  (334 bytes)
DATA_partitura_73DC:
	defb 0e1h,001h,0e4h,000h,007h,005h,0ffh,0e3h,001h,0e4h,000h,08ah,000h,0e1h,004h,006h	; 73dc  ................
	defb 005h,004h,003h,0ffh,0e1h,001h,0e4h,014h,007h,0e2h,001h,072h,000h,0e1h,002h,0e4h	; 73ec  ...........r....
	defb 010h,003h,002h,0e1h,001h,0e4h,006h,002h,0ffh,0e2h,001h,0e5h,00ah,000h,042h,0c1h	; 73fc  ..............B.
	defb 0b0h,0e8h,0e1h,001h,0e4h,008h,008h,007h,006h,005h,004h,003h,002h,002h,001h,001h	; 740c  ................
	defb 000h,0ffh,0e2h,002h,0e5h,009h,000h,0d0h,0a2h,080h,0e1h,002h,0e4h,007h,006h,0e1h	; 741c  ................
	defb 001h,0e4h,003h,005h,004h,003h,002h,001h,000h,0ffh,0e2h,001h,0a1h,02ah,091h,04ah	; 742c  .............*.J
	defb 081h,055h,071h,060h,061h,06ah,051h,075h,041h,080h,031h,08ah,021h,095h,011h,0a0h	; 743c  .Uq`ajQuA.1.!...
	defb 001h,0b0h,0ffh,0e2h,001h,0b1h,05ah,091h,080h,081h,08ah,071h,095h,061h,0a0h,051h	; 744c  ......Z....q.a.Q
	defb 0aah,041h,0b5h,031h,0c0h,021h,0cah,011h,0d5h,001h,0e0h,0ffh,0e2h,001h,0b1h,095h	; 745c  .A.1.!..........
	defb 0a1h,0c0h,091h,0cah,0b1h,0d5h,071h,0e0h,061h,0eah,051h,0f5h,042h,000h,032h,00ah	; 746c  ......q.a.Q.B.2.
	defb 022h,015h,012h,020h,002h,030h,0ffh,0e2h,001h,0c1h,0e0h,0b2h,010h,0a2h,01ah,092h	; 747c  ".. .0..........
	defb 025h,082h,030h,072h,03ah,062h,045h,052h,050h,042h,05ah,032h,065h,022h,070h,012h	; 748c  %.0r:bERPBZ2e"p.
	defb 07ah,002h,085h,0ffh,0e2h,001h,0e5h,009h,001h,0a0h,094h,050h,096h,000h,097h,000h	; 749c  z..........P....
	defb 098h,000h,0ffh,0ffh,0feh,002h,0e0h,003h,0f7h,002h,0f9h,0e1h,074h,0dfh,060h,098h	; 74ac  ............t.`.
	defb 050h,0a0h,040h,0a8h,030h,0b0h,020h,0b8h,010h,0a0h,0ffh,0feh,002h,0f8h,010h,0f9h	; 74bc  P.@.0. .........
	defb 0e1h,074h,080h,098h,060h,0a0h,040h,0a8h,030h,0b0h,010h,0b8h,010h,0a0h,010h,098h	; 74cc  .t..`.@.0.......
	defb 000h,090h,000h,088h,0ffh,0e2h,001h,090h,0c0h,090h,0a0h,090h,098h,090h,090h,090h	; 74dc  ................
	defb 0c0h,090h,0b0h,090h,0a0h,090h,098h,090h,090h,0fah,0feh,002h,0e0h,004h,0f7h,003h	; 74ec  ................
	defb 0f9h,010h,075h,0ffh,0feh,002h,0f8h,00ah,0f9h,010h,075h,030h,0a0h,030h,0d0h,020h	; 74fc  ..u.......u0.0.
	defb 0b0h,010h,0a0h,0ffh,0e2h,001h,090h,068h,090h,060h,090h,0a0h,090h,0b0h,090h,0d0h	; 750c  .......h.`......
	defb 091h,000h,090h,0d0h,090h,0b0h,090h,0a0h,0dfh,030h,068h,030h,060h,0fah	; 751c  .........0h0`.

; ----------------------------------------------------------------------
; DATOS suelto_752A: 1 bytes 0xFF sueltos entre partituras: no los lee nadie;
;   lo leen nadie (1 bytes)
;   0x752a..0x752b  (1 bytes)
DATA_suelto_752A:
	defb 0ffh	; 752a

; ----------------------------------------------------------------------
; DATOS partitura_752B: partitura (p04:6A23: ordenes 0xD0-0xFF y notas) de los
;   sonidos 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F y otros (sigue en el banco 5,
;   en 0x8000); lo leen p04:6A2F (2773 bytes)
;   0x752b..0x8000  (2773 bytes)
DATA_partitura_752B:
	defb 0feh,002h,0eeh,002h,0e0h,002h,0f7h,004h,0f9h,043h,075h,0ffh,0feh,002h,0f8h,01dh	; 752b  .........Cu.....
	defb 0f9h,043h,075h,0c1h,040h,0c0h,0a5h,0ffh,0e2h,001h,0c1h,030h,0c0h,0a0h,0fbh,007h	; 753b  .Cu.@......0....
	defb 045h,075h,0fah,0feh,002h,0e2h,001h,080h,048h,070h,090h,070h,000h,080h,043h,070h	; 754b  Eu......Hp.p..Cp
	defb 086h,080h,000h,080h,000h,080h,041h,070h,082h,070h,000h,070h,03eh,060h,078h,0fbh	; 755b  ......Ap.p.p>`x.
	defb 003h,052h,075h,0ffh,0feh,002h,0f8h,028h,0e2h,001h,0c2h,000h,0c3h,000h,082h,000h	; 756b  .Ru....(........
	defb 083h,000h,091h,0a0h,092h,0a0h,0a1h,050h,0a2h,050h,0b1h,000h,0b2h,000h,0b1h,000h	; 757b  .......P.P......
	defb 0fbh,002h,075h,075h,0b2h,000h,052h,000h,053h,000h,052h,000h,053h,000h,051h,0a0h	; 758b  ..uu..R.S.R.S.Q.
	defb 052h,0a0h,051h,050h,052h,050h,051h,000h,052h,000h,051h,000h,052h,000h,051h,000h	; 759b  R.QPRPQ.R.Q.R.Q.
	defb 0ffh,0f9h,0b0h,075h,0ffh,0feh,002h,0e0h,004h,0e2h,001h,082h,000h,081h,080h,080h	; 75ab  ...u............
	defb 080h,0fbh,008h,0b6h,075h,074h,000h,071h,000h,074h,000h,071h,000h,0fah,0f9h,0cdh	; 75bb  ....ut.q.t.q....
	defb 075h,0ffh,0feh,002h,0f8h,026h,0e2h,001h,0c4h,000h,0c2h,000h,0c1h,000h,0fbh,008h	; 75cb  u....&..........
	defb 0d3h,075h,0a4h,000h,0a1h,000h,064h,000h,061h,000h,044h,000h,041h,000h,024h,000h	; 75db  .u....d.a.D.A.$.
	defb 021h,000h,0fah,0feh,002h,0e2h,001h,080h,020h,080h,040h,080h,080h,081h,000h,082h	; 75eb  !....... .@.....
	defb 000h,083h,000h,0a0h,040h,060h,020h,0f9h,01dh,076h,0ffh,0feh,002h,0f8h,002h,0e2h	; 75fb  ....@` ..v......
	defb 001h,080h,040h,080h,080h,081h,000h,0f5h,082h,084h,088h,0f6h,070h,020h,0f9h,01dh	; 760b  ..@.........p ..
	defb 076h,0ffh,060h,01fh,0e2h,002h,050h,01eh,040h,01dh,030h,01ch,020h,01bh,010h,01ah	; 761b  v.`...P.@.0. ...
	defb 000h,019h,0fah,0feh,002h,0e0h,002h,0feh,002h,0f8h,01dh,0e2h,001h,0f9h,067h,076h	; 762b  ..............gv
	defb 0f9h,070h,076h,0f7h,002h,0f9h,067h,076h,0f7h,002h,0f9h,070h,076h,0f7h,004h,0f9h	; 763b  .pv...gv...pv...
	defb 067h,076h,0f7h,004h,0f9h,070h,076h,0f7h,005h,0f9h,067h,076h,0f7h,005h,0f9h,070h	; 764b  gv...pv...gv...p
	defb 076h,0f7h,008h,0f9h,067h,076h,0f7h,008h,0f9h,070h,076h,0ffh,0a0h,040h,0f4h,041h	; 765b  v...gv...pv..@.A
	defb 042h,041h,040h,0f6h,0fah,0a0h,01dh,0f4h,01eh,01fh,01eh,01dh,0f6h,0fah,0feh,002h	; 766b  BA@.............
	defb 0e2h,001h,051h,060h,061h,030h,070h,080h,081h,000h,090h,0e4h,0a0h,0c8h,0a0h,065h	; 767b  ..Q`a0p........e
	defb 0a0h,065h,090h,065h,090h,065h,080h,066h,080h,066h,070h,067h,070h,068h,060h,068h	; 768b  .e.e.e.f.fpgph`h
	defb 060h,068h,050h,068h,050h,069h,040h,069h,030h,069h,020h,069h,010h,068h,000h,068h	; 769b  `hPhPi@i0i i.h.h
	defb 0ffh,0feh,002h,0f8h,014h,0e2h,001h,051h,060h,061h,030h,071h,000h,080h,0e0h,090h	; 76ab  .......Q`a0q....
	defb 0c8h,0a0h,063h,0b0h,063h,0b0h,063h,0a0h,063h,0a0h,063h,0a0h,063h,090h,063h,090h	; 76bb  ..c.c.c.c.c.c.c.
	defb 064h,090h,064h,070h,063h,050h,063h,030h,063h,020h,064h,020h,064h,010h,063h,010h	; 76cb  d.dpcPc0c d d.c.
	defb 063h,000h,063h,000h,064h,0ffh,0feh,002h,0e0h,002h,0e2h,001h,0f9h,0fah,076h,0f7h	; 76db  c.c.d.........v.
	defb 003h,0f9h,0fah,076h,080h,039h,080h,03bh,080h,03dh,080h,03fh,080h,041h,0ffh,090h	; 76eb  ...v.9...=.?.A..
	defb 043h,0f4h,041h,03fh,03dh,03bh,039h,037h,0f6h,0fah,0feh,002h,0f8h,015h,0e2h,001h	; 76fb  C.A?=.97........
	defb 0b1h,040h,0b0h,03eh,0b0h,03ch,0b1h,03ah,0b0h,038h,0b1h,036h,0b0h,034h,080h,040h	; 770b  .@.>.<.:.8.6.4.@
	defb 081h,03eh,080h,03ch,081h,03ah,080h,038h,080h,036h,081h,034h,050h,036h,051h,038h	; 771b  .>.<.:.8.6.4P6Q8
	defb 050h,03ah,050h,03ch,051h,03eh,050h,040h,051h,045h,0ffh,0feh,002h,0e0h,002h,0e2h	; 772b  P:P<Q>P@QE......
	defb 001h,0f9h,078h,077h,0f9h,08bh,077h,0f9h,09ah,077h,0f7h,001h,0f9h,09ah,077h,0f7h	; 773b  ..xw..w..w....w.
	defb 004h,0f9h,09ah,077h,0f7h,006h,0f9h,09ah,077h,0ffh,0feh,002h,0f8h,022h,0e2h,001h	; 774b  ...w....w...."..
	defb 0f9h,0a9h,077h,0f8h,014h,0f9h,0bch,077h,0f7h,001h,0f9h,09ah,077h,0f7h,004h,0f9h	; 775b  ..w....w....w...
	defb 09ah,077h,0f7h,006h,0f9h,09ah,077h,0f7h,007h,0f9h,09ah,077h,0ffh,0a2h,000h,091h	; 776b  .w....w....w....
	defb 050h,092h,000h,093h,000h,094h,050h,096h,000h,09ah,000h,0fbh,002h,078h,077h,0fah	; 777b  P.....P......xw.
	defb 0a2h,000h,091h,050h,0a2h,000h,092h,080h,093h,000h,093h,0f0h,094h,0c0h,0fah,082h	; 778b  ...P............
	defb 000h,071h,050h,072h,000h,072h,080h,073h,000h,073h,0f0h,074h,0c0h,0fah,0c2h,000h	; 779b  .qPr.r.s.s.t....
	defb 0b1h,050h,0b2h,000h,0b3h,000h,0b4h,050h,0b6h,000h,0bah,000h,0fbh,002h,0a9h,077h	; 77ab  .P.....P.......w
	defb 0fah,0c2h,000h,0b1h,050h,0b2h,000h,0b2h,080h,0b3h,000h,0b3h,0f0h,0b4h,0c0h,0b6h	; 77bb  ....P...........
	defb 000h,0fbh,002h,0bch,077h,0fah,0feh,002h,0eeh,00fh,0e0h,002h,0f7h,003h,0f9h,002h	; 77cb  ....w...........
	defb 078h,0f7h,002h,0f9h,03bh,078h,0dfh,060h,0e0h,060h,0d0h,0f9h,062h,078h,0ffh,0feh	; 77db  x....x.`.`..bx..
	defb 002h,0f8h,015h,0f9h,002h,078h,0f9h,03bh,078h,060h,0e0h,060h,0d0h,0f7h,001h,0f9h	; 77eb  .....x..x`.`....
	defb 062h,078h,000h,000h,000h,000h,0ffh,0e2h,001h,0c5h,000h,0c4h,000h,0c3h,0e0h,0c3h	; 77fb  bx..............
	defb 0c0h,0c3h,0a0h,0c3h,080h,0c3h,060h,0c3h,040h,0c3h,020h,0c3h,008h,0c2h,0f0h,0c2h	; 780b  ......`.@. .....
	defb 0d8h,0f4h,0c0h,0a8h,090h,078h,060h,040h,020h,000h,0f6h,0e2h,002h,0c2h,080h,0f4h	; 781b  .....x`@ .......
	defb 060h,040h,020h,000h,0f6h,0c1h,0e8h,0c1h,0d0h,0c1h,0b8h,0c1h,0a0h,0c1h,090h,0fah	; 782b  `@ .............
	defb 0e2h,001h,0b1h,0e0h,0b1h,0d0h,0b1h,0c0h,0b1h,0b0h,0b1h,0a0h,0a1h,090h,0a1h,080h	; 783b  ................
	defb 0a1h,070h,0a1h,060h,0a1h,050h,091h,040h,091h,030h,091h,020h,091h,010h,091h,000h	; 784b  .p.`.P.@.0. ....
	defb 080h,0d0h,080h,0c0h,080h,0b0h,0fah,060h,0c8h,060h,0c0h,060h,0b8h,050h,0b0h,050h	; 785b  .......`.`.`.P.P
	defb 0a8h,050h,0a0h,050h,098h,040h,090h,040h,088h,040h,080h,040h,078h,040h,070h,030h	; 786b  .P.P.@.@.@.@x@p0
	defb 068h,030h,060h,030h,058h,030h,050h,0fah,0feh,002h,0e0h,002h,0feh,002h,0f8h,017h	; 787b  h0`0X0P.........
	defb 0e2h,001h,0b2h,080h,0b2h,000h,0b1h,0a0h,0b1h,060h,0f9h,0adh,078h,0f7h,001h,0f9h	; 788b  .........`..x...
	defb 0adh,078h,0f7h,002h,0f9h,0adh,078h,0f7h,003h,0f9h,0adh,078h,0f7h,005h,0f9h,0adh	; 789b  .x....x....x....
	defb 078h,0ffh,0b1h,020h,0b0h,0e0h,0f4h,0a0h,070h,050h,030h,028h,020h,018h,010h,0f6h	; 78ab  x.. ....pP0( ...
	defb 0fah,0feh,002h,0e0h,001h,0e2h,001h,061h,080h,061h,0c0h,062h,000h,062h,070h,000h	; 78bb  .......a.a.b.bp.
	defb 000h,0fbh,004h,0c2h,078h,063h,000h,063h,080h,064h,000h,058h,000h,043h,000h,033h	; 78cb  ....xc.c.d.X.C.3
	defb 080h,024h,000h,018h,000h,0fbh,002h,0dah,078h,0ffh,0feh,002h,0f8h,01ah,0e2h,001h	; 78db  .$......x.......
	defb 0c1h,080h,0c1h,0c0h,0c2h,000h,0c2h,070h,000h,000h,0fbh,003h,0ebh,078h,0e2h,002h	; 78eb  .......p.....x..
	defb 0a3h,000h,0a3h,080h,0a4h,000h,0f5h,0a5h,0a6h,0a8h,0f6h,073h,000h,063h,080h,054h	; 78fb  ...........s.c.T
	defb 000h,0f5h,055h,046h,048h,0f6h,0ffh,0feh,002h,0e2h,003h,0f9h,02eh,079h,0f7h,001h	; 790b  ..UFH........y..
	defb 0f9h,02eh,079h,0f7h,002h,0f9h,02eh,079h,0f7h,003h,0f9h,02eh,079h,0f7h,004h,0f9h	; 791b  ..y....y....y...
	defb 02eh,079h,0ffh,0b2h,000h,0b1h,000h,0b0h,080h,0f4h,040h,020h,0f6h,0fah,0feh,002h	; 792b  .y........@ ....
	defb 0f8h,004h,0e2h,001h,0b0h,080h,0b0h,0a0h,0b0h,0b0h,0b1h,000h,0b1h,080h,0b2h,000h	; 793b  ................
	defb 0b2h,080h,0b3h,000h,0f8h,00ah,0b2h,000h,0b1h,0e0h,0b1h,0f0h,0f4h,0c0h,0b0h,0a0h	; 794b  ................
	defb 090h,080h,070h,060h,050h,040h,030h,020h,010h,000h,0f6h,0b0h,0f4h,0b0h,0f0h,0b0h	; 795b  ..p`P@0 ........
	defb 0e0h,0b0h,0d0h,0f4h,0c0h,0b0h,0a0h,098h,090h,088h,080h,078h,070h,068h,060h,058h	; 796b  ...........xph`X
	defb 050h,04ch,048h,044h,040h,03ch,038h,034h,030h,02eh,02ch,02ah,028h,026h,024h,022h	; 797b  PLHD@<840.,*(&$"
	defb 020h,0f6h,0ffh,0feh,001h,0eeh,002h,0e9h,002h,0c0h,0feh,001h,0f8h,00ah,0e9h,001h	; 798b   ...............
	defb 0eah,00ch,0d1h,0ebh,001h,088h,004h,074h,044h,074h,0ebh,001h,023h,0d0h,009h,0ffh	; 799b  .......tDt..#...
	defb 0feh,002h,0f8h,026h,0e2h,001h,083h,050h,082h,000h,083h,050h,082h,000h,0e0h,002h	; 79ab  ...&...P...P....
	defb 0e2h,001h,063h,050h,062h,000h,063h,050h,062h,000h,0e0h,002h,0e2h,001h,043h,050h	; 79bb  ..cPb.cPb.....CP
	defb 042h,000h,043h,050h,042h,000h,0e0h,002h,0e2h,001h,023h,050h,022h,000h,023h,050h	; 79cb  B.CPB.....#P".#P
	defb 022h,000h,0ffh,0feh,002h,0f8h,026h,0e2h,001h,080h,065h,0b4h,050h,0b3h,000h,0b4h	; 79db  ".....&...e.P...
	defb 050h,0b3h,000h,0e0h,002h,0e2h,001h,010h,065h,074h,050h,073h,000h,074h,050h,073h	; 79eb  P.......etPs.tPs
	defb 000h,0e0h,002h,0e2h,001h,000h,065h,034h,050h,033h,000h,034h,050h,033h,000h,0e0h	; 79fb  ......e4P3.4P3..
	defb 002h,0e2h,001h,004h,050h,003h,000h,004h,050h,003h,000h,0ffh,0feh,002h,0e2h,001h	; 7a0b  ....P...P.......
	defb 082h,0ach,082h,0e1h,083h,03ah,092h,03fh,092h,067h,000h,000h,0f9h,06bh,07ah,0f7h	; 7a1b  .....:.?.g...kz.
	defb 007h,0f9h,06bh,07ah,0f7h,008h,0f9h,06bh,07ah,0f7h,008h,0f9h,06bh,07ah,0f7h,009h	; 7a2b  ..kz...kz...kz..
	defb 0f9h,06bh,07ah,0ffh,0feh,002h,0f8h,019h,0e2h,001h,072h,09ch,072h,0e1h,063h,03ah	; 7a3b  .kz.......r.r.c:
	defb 072h,03fh,072h,067h,000h,000h,0f7h,008h,0f9h,06bh,07ah,0f7h,00ah,0f9h,06bh,07ah	; 7a4b  r?rg.....kz...kz
	defb 0f7h,00bh,0f9h,06bh,07ah,0f7h,00bh,0f9h,06bh,07ah,0f7h,00ch,0f9h,06bh,07ah,0ffh	; 7a5b  ...kz...kz...kz.
	defb 072h,0ach,072h,0e1h,063h,03ah,062h,03fh,052h,067h,092h,0abh,092h,00fh,091h,0efh	; 7a6b  r.r.c:b?Rg......
	defb 000h,000h,0fah,0feh,002h,0f8h,019h,0e2h,001h,0a1h,040h,0a1h,090h,0a1h,0f0h,0a2h	; 7a7b  ..........@.....
	defb 071h,0a3h,00dh,0a3h,0d0h,0a4h,0c4h,0a5h,0f5h,095h,000h,0e2h,002h,085h,0f5h,085h	; 7a8b  q...............
	defb 000h,075h,0f5h,075h,030h,065h,0f5h,065h,030h,055h,0f5h,055h,030h,045h,0f5h,045h	; 7a9b  .u.u0e.e0U.U0E.E
	defb 030h,035h,0f5h,035h,030h,025h,0f5h,025h,030h,015h,0f5h,015h,030h,005h,0f5h,005h	; 7aab  05.50%.%0...0...
	defb 030h,005h,0f5h,0ffh,0feh,002h,0e3h,001h,0f9h,03bh,07bh,0e4h,00ah,0a3h,000h,0f9h	; 7abb  0.........{.....
	defb 03bh,07bh,0e4h,00ah,0a3h,000h,0e4h,01ah,0f9h,052h,07bh,0a4h,00ah,093h,000h,0f9h	; 7acb  .{.......R{.....
	defb 03bh,07bh,0c4h,00ah,0f9h,052h,07bh,0e4h,013h,080h,04ch,080h,038h,080h,04eh,0e2h	; 7adb  .{...R{...L.8.N.
	defb 001h,084h,000h,0e3h,001h,0e4h,00ah,0f9h,067h,07bh,0e3h,001h,0e4h,00ah,0f7h,001h	; 7aeb  ........g{......
	defb 0f9h,067h,07bh,0e3h,001h,0e4h,00ah,0f7h,004h,0f9h,067h,07bh,0e3h,001h,0e4h,00ah	; 7afb  .g{.......g{....
	defb 0f7h,005h,0f9h,067h,07bh,0ffh,0feh,002h,0f8h,028h,0e2h,001h,0f9h,07ah,07bh,0f9h	; 7b0b  ...g{....(...z{.
	defb 07ah,07bh,0f7h,001h,0f9h,08bh,07bh,0f9h,07ah,07bh,0f9h,08bh,07bh,0f9h,08bh,07bh	; 7b1b  z{....{.z{..{..{
	defb 0f7h,004h,0f9h,08bh,07bh,0f7h,005h,0f9h,08bh,07bh,0f7h,006h,0f9h,08bh,07bh,0ffh	; 7b2b  ....{....{....{.
	defb 0e4h,00ah,0b3h,000h,0e4h,015h,090h,038h,0e4h,013h,090h,04ch,090h,038h,090h,04eh	; 7b3b  .......8...L.8.N
	defb 0e2h,001h,094h,000h,0e3h,001h,0fah,0a3h,000h,0e4h,015h,080h,038h,0e4h,013h,080h	; 7b4b  ............8...
	defb 04ch,080h,038h,080h,04eh,0e2h,001h,084h,000h,0e3h,001h,0fah,093h,000h,0e4h,015h	; 7b5b  L.8.N...........
	defb 070h,038h,0e4h,013h,070h,04ch,070h,038h,070h,04eh,0e2h,001h,074h,000h,0fah,093h	; 7b6b  p8..pLp8pN..t...
	defb 000h,071h,038h,071h,04ch,072h,038h,073h,04eh,074h,000h,083h,000h,065h,038h,0fah	; 7b7b  .q8qLr8sNt...e8.
	defb 073h,000h,061h,038h,061h,04ch,062h,038h,063h,04eh,054h,000h,063h,000h,055h,038h	; 7b8b  s.a8aLb8cNT.c.U8
	defb 0fah,0feh,002h,0e0h,002h,0feh,002h,0f8h,015h,0e2h,002h,063h,040h,072h,0c0h,082h	; 7b9b  ...........c@r..
	defb 040h,091h,0f0h,091h,0b0h,091h,070h,091h,030h,091h,022h,091h,028h,0fbh,003h,0b4h	; 7bab  @.....p.0.".(...
	defb 07bh,043h,040h,042h,0c0h,032h,040h,031h,0f0h,021h,0b0h,021h,070h,021h,030h,011h	; 7bbb  {C@B.2@1.!.!p!0.
	defb 022h,011h,028h,0fbh,004h,0cah,07bh,0ffh,0feh,002h,0e2h,001h,0b0h,060h,0b0h,0e0h	; 7bcb  ".(...{......`..
	defb 0b6h,000h,0b4h,0e0h,092h,0e0h,000h,000h,0fbh,002h,0d7h,07bh,095h,0e0h,09eh,0e0h	; 7bdb  ...........{....
	defb 074h,0e0h,000h,000h,000h,000h,080h,060h,080h,0e0h,086h,000h,084h,0e0h,072h,0e0h	; 7beb  t......`......r.
	defb 000h,000h,000h,000h,0fbh,002h,0f1h,07bh,065h,000h,054h,0e0h,042h,0e0h,0ffh,0feh	; 7bfb  .......{e.T.B...
	defb 002h,0f8h,014h,0e2h,001h,0c2h,001h,0c2h,040h,0c2h,0f0h,0c3h,0f0h,0c5h,0e0h,000h	; 7c0b  ........@.......
	defb 000h,0fbh,002h,010h,07ch,0c7h,0e0h,0cbh,0e0h,0ceh,0e0h,000h,000h,000h,000h,052h	; 7c1b  ....|..........R
	defb 001h,052h,040h,052h,0f0h,053h,0f0h,055h,0e0h,000h,000h,000h,000h,0fbh,002h,02ah	; 7c2b  .R@R.S.U.......*
	defb 07ch,047h,0e0h,03bh,0e0h,02eh,0e0h,0ffh,0feh,002h,0e2h,001h,0a0h,0a3h,0a0h,040h	; 7c3b  |G.............@
	defb 0a0h,024h,0a0h,041h,0e0h,001h,0e3h,004h,0b0h,024h,0f9h,0a2h,07ch,040h,023h,0ffh	; 7c4b  .$.A.....$..|@#.
	defb 0feh,002h,0e2h,001h,080h,0a4h,080h,031h,080h,025h,080h,042h,0e0h,001h,0e2h,004h	; 7c5b  .......1.%.B....
	defb 0eeh,003h,0b0h,024h,0b0h,023h,0f9h,0a2h,07ch,0ffh,0feh,002h,0e0h,003h,0e2h,001h	; 7c6b  ...$.#..|.......
	defb 070h,0a4h,060h,040h,050h,024h,040h,041h,0ffh,0feh,002h,0f8h,00ch,0e2h,001h,050h	; 7c7b  p.`@P$@A.......P
	defb 0a4h,050h,031h,050h,025h,050h,042h,0e0h,001h,0eeh,001h,0e2h,004h,0f8h,01fh,0b0h	; 7c8b  .P1P%PB.........
	defb 024h,0b0h,023h,0f9h,0a2h,07ch,0ffh,0b0h,023h,0a0h,023h,0a0h,023h,090h,023h,080h	; 7c9b  $.#..|..#.#.#.#.
	defb 023h,070h,023h,060h,023h,050h,023h,0fah,0feh,002h,0e1h,001h,0e4h,008h,007h,0e0h	; 7cab  #p#`#P#.........
	defb 003h,0e1h,001h,0e4h,008h,003h,0ffh,0feh,002h,0f8h,00ah,0e0h,003h,0e2h,001h,000h	; 7cbb  ................
	defb 040h,0ffh,0feh,001h,0f9h,0d3h,07ch,0ffh,0e9h,002h,0eah,00ch,0ech,0d4h,050h,060h	; 7ccb  @.....|.......P`
	defb 070h,080h,090h,0a0h,0b0h,060h,070h,080h,090h,0a0h,0b0h,0d3h,000h,0d4h,070h,080h	; 7cdb  p....`p.......p.
	defb 090h,0a0h,0b0h,0d3h,000h,010h,0d4h,080h,090h,0a0h,0b0h,0d3h,000h,010h,020h,0d4h	; 7ceb  .............. .
	defb 090h,0a0h,0b0h,0d3h,000h,010h,020h,030h,0d4h,0a0h,0b0h,0d3h,000h,010h,020h,030h	; 7cfb  ...... 0...... 0
	defb 040h,0d4h,0b0h,0d3h,000h,010h,020h,030h,040h,050h,000h,010h,020h,030h,040h,050h	; 7d0b  @..... 0@P.. 0@P
	defb 060h,0fah,0feh,001h,0eeh,00fh,0e9h,002h,0c0h,0f9h,0d3h,07ch,0ffh,0feh,002h,0e1h	; 7d1b  `..........|....
	defb 002h,0e4h,01fh,00ah,0e4h,01eh,00ah,0e4h,01dh,00ah,0e4h,01ch,00ah,0e4h,01bh,00ah	; 7d2b  ................
	defb 0e4h,01ah,00ah,0e4h,019h,00ah,0e4h,018h,00ah,0e4h,017h,00ah,0e4h,016h,00ah,0e4h	; 7d3b  ................
	defb 015h,00ah,0e4h,014h,00ah,0e4h,013h,00ah,0e4h,012h,00ah,0e4h,011h,00ah,0e4h,010h	; 7d4b  ................
	defb 00ah,0e4h,00fh,00ah,0e4h,00eh,00ah,0e4h,00dh,00ah,0e4h,00ch,00ah,0e4h,00bh,00ah	; 7d5b  ................
	defb 0e4h,00ah,00ah,0e4h,009h,00ah,0e4h,008h,00ah,0e4h,007h,00ah,0e4h,006h,00ah,0e4h	; 7d6b  ................
	defb 005h,00ah,0e4h,004h,00ah,0e4h,003h,00ah,0e4h,002h,00ah,0e4h,001h,00ah,0e1h,035h	; 7d7b  ...............5
	defb 0e4h,000h,00bh,0ffh,0feh,001h,0f9h,095h,07dh,0ffh,0f8h,01dh,0e9h,001h,0eah,00ch	; 7d8b  ........}.......
	defb 0ech,0d4h,000h,010h,020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b0h,0d3h,000h	; 7d9b  .... 0@P`p......
	defb 010h,020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b0h,0d2h,000h,010h,020h,030h	; 7dab  . 0@P`p....... 0
	defb 040h,050h,060h,070h,080h,090h,0a0h,0b0h,0d1h,000h,010h,020h,030h,040h,050h,060h	; 7dbb  @P`p....... 0@P`
	defb 070h,080h,0a0h,0b0h,0d0h,000h,010h,020h,030h,040h,050h,060h,070h,080h,090h,0a0h	; 7dcb  p...... 0@P`p...
	defb 0b0h,0fah,0feh,001h,0e9h,00fh,0c0h,0f9h,095h,07dh,0ffh,0feh,001h,0e9h,00fh,0c1h	; 7ddb  .........}......
	defb 0f9h,095h,07dh,0ffh,0feh,001h,0e9h,00fh,0c2h,0f9h,095h,07dh,0ffh,0feh,001h,0e9h	; 7deb  ..}........}....
	defb 00fh,0c3h,0f9h,095h,07dh,0ffh,0feh,002h,0e1h,001h,0e4h,01fh,00ch,0e4h,01ah,00ch	; 7dfb  ....}...........
	defb 0e4h,015h,00ch,0e4h,010h,00ch,0e4h,00ah,00ch,0e4h,005h,00ch,0e4h,000h,00ch,0e4h	; 7e0b  ................
	defb 005h,00bh,0e4h,00ah,00bh,0fbh,003h,01ah,07eh,0e4h,00ah,00bh,0e4h,010h,00bh,0fbh	; 7e1b  ........~.......
	defb 003h,024h,07eh,0e4h,010h,00bh,0e4h,013h,00bh,0fbh,003h,02eh,07eh,0e4h,01ch,00ah	; 7e2b  .$~.........~...
	defb 0e4h,018h,00ah,0fbh,00ah,038h,07eh,0ffh,0feh,002h,0f8h,004h,0e2h,001h,0c0h,0b0h	; 7e3b  .....8~.........
	defb 0c1h,000h,0c2h,000h,0c1h,050h,0c2h,0a0h,0c1h,0a0h,0c3h,050h,0e0h,001h,0e2h,001h	; 7e4b  .....P.....P....
	defb 060h,0b0h,061h,000h,062h,000h,061h,050h,062h,0a0h,061h,0a0h,063h,050h,0ffh,0feh	; 7e5b  `.a.b.aPb.a.cP..
	defb 002h,0f9h,075h,07eh,0e0h,00ah,0f9h,075h,07eh,0ffh,0e2h,001h,0c2h,000h,0c3h,000h	; 7e6b  ..u~...u~.......
	defb 0c4h,000h,0c5h,000h,0c6h,000h,0c7h,000h,0fah,0feh,002h,0e0h,007h,0f9h,075h,07eh	; 7e7b  ..............u~
	defb 0ffh,0feh,002h,0e1h,003h,0e4h,01fh,00ch,0e4h,01ah,00bh,0e4h,015h,00bh,0e4h,010h	; 7e8b  ................
	defb 00ch,0e4h,00ah,00ch,0e4h,005h,00ch,0e3h,00fh,0c0h,015h,0e4h,008h,0c0h,014h,0e4h	; 7e9b  ................
	defb 00bh,0c0h,013h,0e4h,00eh,0c0h,012h,0e4h,011h,0c0h,011h,0e4h,014h,0c0h,010h,0e4h	; 7eab  ................
	defb 017h,0c0h,00fh,0e4h,01ah,0c0h,00eh,0e3h,003h,0e4h,01fh,0b0h,00dh,0a0h,00dh,090h	; 7ebb  ................
	defb 00dh,080h,00dh,070h,00dh,060h,00dh,050h,00dh,040h,00dh,030h,00dh,020h,00ch,010h	; 7ecb  ...p.`.P.@.0. ..
	defb 00ch,000h,00ch,0ffh,0feh,002h,0f9h,0e9h,07eh,010h,06fh,000h,06eh,0ffh,0f8h,01dh	; 7edb  ........~.o.n...
	defb 0e2h,003h,0c0h,0a0h,0f4h,09fh,09eh,09dh,09ch,09bh,09ah,099h,098h,097h,096h,095h	; 7eeb  ................
	defb 094h,093h,092h,091h,090h,08fh,08eh,08dh,08ch,08bh,08ah,089h,088h,087h,086h,085h	; 7efb  ................
	defb 084h,083h,082h,081h,080h,07fh,07eh,07dh,07ch,07bh,07ah,0f6h,0b0h,079h,0a0h,078h	; 7f0b  ......~}|{z..y.x
	defb 090h,077h,080h,076h,070h,075h,060h,074h,050h,073h,040h,072h,030h,071h,020h,070h	; 7f1b  .w.vpu`tPs@r0q p
	defb 0fah,0feh,002h,0eeh,005h,0f9h,0e9h,07eh,010h,06fh,000h,06eh,0ffh,0feh,002h,0e0h	; 7f2b  .......~.o.n....
	defb 007h,0f9h,0e9h,07eh,0ffh,0feh,001h,0f9h,046h,07fh,0ffh,0f8h,014h,0e9h,003h,0eah	; 7f3b  ...~....F.......
	defb 00fh,0ech,0d1h,000h,0d2h,000h,0d3h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h	; 7f4b  ...........p`P@0
	defb 020h,010h,000h,0d4h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h,000h	; 7f5b   .......p`P@0 ..
	defb 0d5h,0b0h,0a0h,090h,080h,070h,0fah,0feh,001h,0e9h,00ah,0c0h,0f9h,046h,07fh,0ffh	; 7f6b  .....p.......F..
	defb 0feh,002h,0f8h,005h,0e2h,002h,0c2h,000h,0c1h,0d0h,0f4h,0a0h,080h,060h,040h,020h	; 7f7b  .............`@
	defb 0f6h,0fbh,00ch,081h,07fh,072h,000h,071h,0d0h,0f4h,0a0h,080h,060h,040h,020h,0f6h	; 7f8b  .....r.q....`@ .
	defb 0fbh,004h,090h,07fh,032h,000h,031h,0d0h,0f4h,0a0h,080h,060h,040h,020h,0f6h,0fbh	; 7f9b  ....2.1....`@ ..
	defb 002h,09fh,07fh,002h,000h,001h,0d0h,0f4h,0a0h,080h,060h,040h,020h,0f6h,0fbh,002h	; 7fab  ..........`@ ...
	defb 0aeh,07fh,0ffh,0feh,002h,0f8h,00ch,0e2h,004h,0c5h,000h,0c4h,080h,0c4h,000h,0e2h	; 7fbb  ................
	defb 001h,0c3h,000h,0e2h,004h,0c3h,000h,0e2h,004h,0c3h,080h,0c3h,000h,0c2h,080h,0fbh	; 7fcb  ................
	defb 002h,0c4h,07fh,0c5h,000h,0c4h,080h,0e2h,001h,035h,000h,0e2h,004h,0c4h,000h,0e2h	; 7fdb  .........5......
	defb 001h,053h,000h,0e2h,004h,0c3h,080h,0c3h,000h,0c2h,080h,0fbh,002h,0deh,07fh,0b5h	; 7feb  .S..............
	defb 000h,0b4h,080h,0b4h,000h	; 7ffb
