; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 14 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS mapa_fase6_cola: mapa de la fase 6, en vertical: cada fila son 8
;   bloques; el recorrido va de 0x0048 a 0x0228 (p02:88F2) (sigue del banco
;   13); lo leen p00:4A88 (252 bytes)
;   0x8000..0x80fc  (252 bytes)
DATA_8000:
	defb 01fh,000h,000h,020h,016h,00bh,000h,000h	; 8000  ... ....
	defb 000h,000h,00ah,011h,019h,015h,000h,01eh	; 8008  ........
	defb 01fh,000h,008h,030h,031h,016h,00bh,000h	; 8010  ...01...
	defb 000h,00ah,018h,011h,02fh,01ah,014h,01eh	; 8018  ..../...
	defb 01fh,00eh,011h,02eh,019h,019h,014h,000h	; 8020  ........
	defb 000h,00eh,011h,018h,01ch,017h,00dh,01eh	; 8028  ........
	defb 01fh,00ch,01dh,011h,01ch,01bh,000h,000h	; 8030  ........
	defb 000h,000h,013h,011h,01ch,00dh,000h,01eh	; 8038  ........
	defb 01fh,000h,00ch,011h,01ch,000h,000h,000h	; 8040  ........
	defb 000h,000h,000h,011h,01ch,000h,01eh,000h	; 8048  ........
	defb 000h,01fh,000h,011h,01ch,000h,000h,000h	; 8050  ........
	defb 000h,000h,000h,02eh,01ch,000h,01eh,000h	; 8058  ........
	defb 000h,01fh,000h,02dh,01ch,000h,000h,000h	; 8060  ...-....
	defb 000h,000h,000h,011h,017h,000h,01eh,000h	; 8068  ........
	defb 000h,01fh,000h,02eh,01bh,000h,000h,000h	; 8070  ........
	defb 000h,000h,000h,013h,014h,000h,000h,01eh	; 8078  ........
	defb 01fh,000h,000h,00eh,015h,000h,000h,000h	; 8080  ........
	defb 000h,000h,000h,00fh,016h,000h,000h,01eh	; 8088  ........
	defb 01fh,000h,000h,008h,02ch,000h,000h,000h	; 8090  ....,...
	defb 000h,000h,000h,018h,01ch,000h,000h,01eh	; 8098  ........
	defb 01fh,000h,000h,011h,014h,000h,000h,000h	; 80a0  ........
	defb 000h,000h,000h,00eh,015h,000h,000h,01eh	; 80a8  ........
	defb 01fh,000h,000h,00fh,01ch,00bh,000h,000h	; 80b0  ........
	defb 000h,000h,00ah,011h,02fh,014h,000h,01eh	; 80b8  ..../...
	defb 01fh,000h,00eh,01dh,01bh,014h,000h,000h	; 80c0  ........
	defb 000h,000h,00eh,013h,016h,00dh,000h,01eh	; 80c8  ........
	defb 01fh,000h,00ch,00fh,01ah,000h,000h,000h	; 80d0  ........
	defb 000h,000h,000h,008h,01ah,000h,000h,01eh	; 80d8  ........
	defb 01fh,000h,000h,02dh,02ch,00bh,000h,000h	; 80e0  ...-,...
	defb 000h,000h,00ah,011h,02fh,014h,000h,01eh	; 80e8  ..../...
	defb 01fh,000h,00eh,01dh,01bh,015h,000h,000h	; 80f0  ........
	defb 000h,000h,00fh,013h	; 80f8

; ----------------------------------------------------------------------
; DATOS mapa_fase6_cola: 240 bytes mas del mapa de la fase 6 (el mismo
;   formato, 30 filas), detras de donde acaba el recorrido medido (0xE623 =
;   0x0228): SIN LECTOR a la vista; lo leen nadie (240 bytes)
;   0x80fc..0x81ec  (240 bytes)
DATA_80FC:
	defb 010h,010h,010h,010h,010h,010h,010h,010h	; 80fc  ........
	defb 004h,027h,005h,029h,005h,027h,029h,005h	; 8104  .'.).').
	defb 001h,000h,003h,000h,003h,001h,000h,001h	; 810c  ........
	defb 000h,003h,000h,000h,001h,000h,003h,000h	; 8114  ........
	defb 003h,000h,001h,003h,000h,001h,000h,001h	; 811c  ........
	defb 001h,000h,003h,000h,001h,000h,001h,003h	; 8124  ........
	defb 010h,010h,010h,010h,010h,010h,010h,010h	; 812c  ........
	defb 023h,025h,025h,025h,025h,025h,025h,009h	; 8134  #%%%%%%.
	defb 023h,026h,000h,026h,026h,026h,026h,000h	; 813c  #&.&&&&.
	defb 023h,026h,000h,026h,026h,026h,026h,00fh	; 8144  #&.&&&&.
	defb 023h,026h,028h,028h,028h,000h,026h,023h	; 814c  #&(((.&#
	defb 023h,026h,026h,000h,026h,000h,026h,023h	; 8154  #&&.&.&#
	defb 004h,004h,004h,004h,004h,004h,004h,004h	; 815c  ........
	defb 008h,006h,007h,005h,006h,007h,006h,007h	; 8164  ........
	defb 00bh,000h,000h,000h,000h,000h,000h,000h	; 816c  ........
	defb 009h,000h,00ch,000h,000h,00ch,000h,009h	; 8174  ........
	defb 00ah,000h,000h,009h,009h,000h,000h,00bh	; 817c  ........
	defb 008h,000h,00ch,00bh,00bh,00ch,000h,00ah	; 8184  ........
	defb 010h,010h,010h,010h,01ah,000h,000h,000h	; 818c  ........
	defb 000h,000h,012h,000h,000h,014h,00eh,000h	; 8194  ........
	defb 012h,000h,000h,000h,000h,000h,012h,000h	; 819c  ........
	defb 000h,01fh,01fh,000h,012h,000h,015h,000h	; 81a4  ........
	defb 000h,000h,012h,000h,000h,01fh,01fh,000h	; 81ac  ........
	defb 012h,000h,008h,000h,000h,013h,011h,000h	; 81b4  ........
	defb 00bh,000h,000h,01bh,02fh,000h,000h,000h	; 81bc  ..../...
	defb 000h,000h,012h,000h,000h,000h,000h,000h	; 81c4  ........
	defb 00eh,000h,00fh,00eh,000h,01eh,014h,000h	; 81cc  ........
	defb 015h,014h,000h,01fh,012h,000h,000h,000h	; 81d4  ........
	defb 000h,00ch,013h,000h,008h,013h,020h,02eh	; 81dc  ...... .
	defb 011h,000h,030h,011h,011h,02dh,01dh,000h	; 81e4  ..0..-..

; ----------------------------------------------------------------------
; DATOS mapa_fase7: mapa de la fase 7, en horizontal: cada columna son 6
;   bloques; el recorrido va de 0x0000 a 0x01E0 (p02:88F2); lo leen p00:49BB
;   (720 bytes)
;   0x81ec..0x84bc  (720 bytes)
DATA_mapa_fase7:
	defb 001h,002h,001h,002h,003h,001h	; 81ec
	defb 003h,001h,003h,001h,000h,001h	; 81f2
	defb 001h,000h,002h,001h,002h,001h	; 81f8
	defb 002h,001h,000h,003h,001h,002h	; 81fe
	defb 001h,003h,001h,000h,003h,001h	; 8204
	defb 001h,001h,002h,003h,001h,000h	; 820a
	defb 003h,001h,000h,001h,000h,003h	; 8210
	defb 001h,003h,002h,001h,000h,001h	; 8216
	defb 000h,011h,02bh,017h,02fh,000h	; 821c
	defb 000h,012h,02ch,018h,01bh,000h	; 8222
	defb 000h,013h,02dh,019h,01ch,000h	; 8228
	defb 000h,014h,02dh,019h,01dh,000h	; 822e
	defb 011h,015h,02eh,01ah,01eh,02fh	; 8234
	defb 012h,016h,02bh,017h,016h,01bh	; 823a
	defb 013h,016h,02ch,018h,016h,01ch	; 8240
	defb 014h,016h,02eh,01ah,016h,01dh	; 8246
	defb 015h,007h,02bh,017h,007h,01eh	; 824c
	defb 016h,006h,02ch,018h,007h,016h	; 8252
	defb 00eh,029h,000h,000h,00bh,006h	; 8258
	defb 029h,000h,000h,000h,000h,004h	; 825e
	defb 02ah,000h,000h,000h,000h,004h	; 8264
	defb 029h,000h,000h,000h,000h,004h	; 826a
	defb 029h,000h,000h,000h,000h,004h	; 8270
	defb 029h,000h,000h,000h,000h,004h	; 8276
	defb 00dh,00fh,000h,004h,008h,006h	; 827c
	defb 029h,000h,000h,000h,00bh,007h	; 8282
	defb 02ah,000h,000h,000h,000h,004h	; 8288
	defb 029h,000h,000h,000h,000h,004h	; 828e
	defb 029h,000h,000h,000h,00bh,007h	; 8294
	defb 029h,000h,000h,000h,000h,004h	; 829a
	defb 02ah,000h,000h,000h,000h,004h	; 82a0
	defb 02ah,000h,000h,000h,000h,004h	; 82a6
	defb 02ah,000h,000h,000h,000h,004h	; 82ac
	defb 029h,000h,000h,000h,000h,004h	; 82b2
	defb 00fh,000h,000h,000h,000h,004h	; 82b8
	defb 029h,000h,000h,000h,000h,004h	; 82be
	defb 02ah,000h,000h,000h,000h,004h	; 82c4
	defb 029h,000h,000h,000h,00bh,007h	; 82ca
	defb 00dh,00dh,00fh,000h,004h,008h	; 82d0
	defb 029h,000h,000h,000h,000h,004h	; 82d6
	defb 029h,000h,000h,000h,000h,004h	; 82dc
	defb 02ah,000h,000h,000h,000h,004h	; 82e2
	defb 02ah,000h,000h,000h,000h,004h	; 82e8
	defb 010h,000h,004h,008h,006h,006h	; 82ee
	defb 02ah,000h,000h,000h,005h,006h	; 82f4
	defb 029h,000h,000h,00bh,007h,006h	; 82fa
	defb 00fh,000h,000h,000h,000h,004h	; 8300
	defb 02ah,000h,000h,000h,000h,004h	; 8306
	defb 010h,000h,000h,000h,000h,004h	; 830c
	defb 029h,000h,000h,000h,00bh,007h	; 8312
	defb 029h,000h,000h,000h,000h,004h	; 8318
	defb 02ah,000h,000h,000h,000h,004h	; 831e
	defb 00fh,000h,004h,00fh,000h,004h	; 8324
	defb 029h,000h,00bh,010h,000h,004h	; 832a
	defb 02ah,000h,000h,004h,029h,004h	; 8330
	defb 006h,007h,029h,005h,029h,005h	; 8336
	defb 00fh,006h,029h,009h,02ah,009h	; 833c
	defb 007h,00fh,000h,005h,029h,005h	; 8342
	defb 006h,010h,00bh,007h,029h,004h	; 8348
	defb 007h,00fh,000h,000h,000h,004h	; 834e
	defb 00fh,000h,000h,000h,000h,004h	; 8354
	defb 010h,000h,000h,000h,00bh,007h	; 835a
	defb 010h,000h,000h,000h,000h,004h	; 8360
	defb 029h,000h,000h,000h,000h,004h	; 8366
	defb 029h,000h,000h,000h,00bh,006h	; 836c
	defb 02ah,000h,000h,000h,000h,004h	; 8372
	defb 006h,00dh,00fh,000h,004h,006h	; 8378
	defb 02ah,000h,000h,000h,000h,004h	; 837e
	defb 029h,000h,000h,000h,000h,004h	; 8384
	defb 029h,000h,000h,000h,000h,004h	; 838a
	defb 00fh,000h,004h,008h,006h,00ah	; 8390
	defb 02ah,000h,000h,000h,000h,004h	; 8396
	defb 010h,000h,000h,000h,000h,004h	; 839c
	defb 029h,000h,000h,000h,00bh,007h	; 83a2
	defb 02ah,000h,000h,000h,000h,004h	; 83a8
	defb 00ch,00dh,00fh,000h,004h,008h	; 83ae
	defb 02ah,000h,000h,000h,000h,004h	; 83b4
	defb 010h,000h,000h,000h,000h,004h	; 83ba
	defb 02ah,000h,000h,000h,000h,004h	; 83c0
	defb 029h,004h,02ah,000h,00bh,007h	; 83c6
	defb 02ah,000h,004h,029h,000h,004h	; 83cc
	defb 00fh,00bh,00dh,029h,00bh,00ah	; 83d2
	defb 010h,00bh,010h,000h,000h,004h	; 83d8
	defb 029h,00bh,029h,000h,00bh,006h	; 83de
	defb 02ah,004h,00fh,000h,004h,008h	; 83e4
	defb 02ah,00bh,029h,000h,000h,004h	; 83ea
	defb 010h,000h,000h,000h,000h,004h	; 83f0
	defb 029h,000h,000h,000h,000h,004h	; 83f6
	defb 00eh,00dh,008h,029h,00bh,00ah	; 83fc
	defb 010h,000h,000h,000h,000h,004h	; 8402
	defb 00ch,029h,000h,000h,000h,004h	; 8408
	defb 010h,000h,000h,000h,000h,004h	; 840e
	defb 00dh,00fh,000h,004h,008h,006h	; 8414
	defb 029h,000h,000h,000h,000h,004h	; 841a
	defb 00eh,00dh,008h,029h,00bh,00ah	; 8420
	defb 029h,000h,000h,000h,000h,004h	; 8426
	defb 02ah,000h,000h,000h,000h,004h	; 842c
	defb 010h,000h,004h,008h,008h,00ah	; 8432
	defb 029h,000h,000h,000h,000h,004h	; 8438
	defb 02ah,000h,000h,000h,000h,004h	; 843e
	defb 02ah,000h,000h,000h,00bh,007h	; 8444
	defb 029h,000h,000h,000h,004h,006h	; 844a
	defb 029h,000h,000h,000h,000h,004h	; 8450
	defb 02ah,000h,000h,000h,000h,004h	; 8456
	defb 00dh,00fh,000h,004h,00eh,008h	; 845c
	defb 010h,000h,000h,000h,00bh,007h	; 8462
	defb 010h,000h,000h,000h,00bh,007h	; 8468
	defb 029h,000h,000h,000h,000h,004h	; 846e
	defb 02ah,000h,000h,000h,000h,004h	; 8474
	defb 025h,021h,01fh,023h,027h,010h	; 847a
	defb 026h,022h,020h,024h,028h,010h	; 8480
	defb 02ah,000h,000h,000h,000h,004h	; 8486
	defb 02ah,000h,000h,000h,000h,004h	; 848c
	defb 029h,000h,000h,000h,000h,004h	; 8492
	defb 029h,000h,000h,000h,000h,004h	; 8498
	defb 02ah,000h,000h,000h,000h,004h	; 849e
	defb 029h,000h,000h,000h,000h,004h	; 84a4
	defb 02ah,030h,032h,034h,000h,004h	; 84aa
	defb 029h,031h,033h,035h,036h,004h	; 84b0
	defb 007h,00eh,00fh,006h,00ah,009h	; 84b6

; ----------------------------------------------------------------------
; DATOS sucesos_por_fase_84BA: 7 punteros (fase 1 a 7; tabla en 0x84BA + 2 x
;   A): las listas de sucesos de cada fase (0xE658); lo leen p01:6E3B (14
;   bytes)
;   0x84bc..0x84ca  (14 bytes)
DATA_sucesos_por_fase_84BA:
	defw 084cah,084f9h,08550h,08550h,08550h,08550h,084f7h	; 84bc

; ----------------------------------------------------------------------
; DATOS sucesos_84CA: sucesos de la fase 1: fichas de 3 bytes que se gastan
;   con 0xE658 segun avanza el scroll; la posicion FFFF acaba (la lista vacia
;   es solo la marca); se solapan 5 bloques: (sucesos_84F7 84F7-84FA)
;   (sucesos_84F9 84F9-8553) (sucesos_8550 8550-8553) (tramos_por_fase
;   8552-8560); lo leen p01:6E3B, p01:6EE0 (150 bytes)
;   0x84ca..0x8560  (150 bytes)
DATA_sucesos_84CA:
	defb 095h,000h,00fh	; 84ca
	defb 0b9h,000h,062h	; 84cd
	defb 0beh,000h,050h	; 84d0
	defb 0cdh,000h,00fh	; 84d3
	defb 0dch,000h,062h	; 84d6
	defb 0ebh,000h,062h	; 84d9
	defb 0f2h,000h,04fh	; 84dc
	defb 012h,001h,008h	; 84df
	defb 014h,001h,06eh	; 84e2
	defb 020h,001h,010h	; 84e5
	defb 034h,001h,062h	; 84e8
	defb 036h,001h,062h	; 84eb
	defb 037h,001h,010h	; 84ee
	defb 046h,001h,023h	; 84f1
	defb 04ch,001h,010h	; 84f4
	defb 0ffh,0ffh,05eh	; 84f7
	defb 000h,074h,065h	; 84fa
	defb 000h,00ah,066h	; 84fd
	defb 000h,071h,069h	; 8500
	defb 000h,05ah,06eh	; 8503
	defb 000h,038h,072h	; 8506
	defb 000h,069h,089h	; 8509
	defb 000h,00ah,089h	; 850c
	defb 000h,06eh,08eh	; 850f
	defb 000h,07ch,09bh	; 8512
	defb 000h,078h,09eh	; 8515
	defb 000h,06ch,0a6h	; 8518
	defb 000h,03dh,0adh	; 851b
	defb 000h,036h,0b6h	; 851e
	defb 000h,02ch,0b6h	; 8521
	defb 000h,03dh,001h	; 8524
	defb 001h,026h,00dh	; 8527
	defb 001h,076h,00eh	; 852a
	defb 001h,068h,01ah	; 852d
	defb 001h,078h,02dh	; 8530
	defb 001h,078h,036h	; 8533
	defb 001h,06dh,0a3h	; 8536
	defb 001h,073h,0bdh	; 8539
	defb 001h,04ah,0bdh	; 853c
	defb 001h,02eh,0eeh	; 853f
	defb 001h,074h,0f1h	; 8542
	defb 001h,042h,0f1h	; 8545
	defb 001h,026h,0f2h	; 8548
	defb 001h,07ch,0f6h	; 854b
	defb 001h,071h,0ffh	; 854e
	defb 0ffh,060h,085h	; 8551
	defb 070h,085h,080h	; 8554
	defb 085h,090h,085h	; 8557
	defb 0a3h,085h,0b3h	; 855a
	defb 085h,0c3h,085h	; 855d

; ----------------------------------------------------------------------
; DATOS tramos_fase1: un byte por tramo de 32 del scroll de la fase 1 (de 0 a
;   0x0F: el recorrido acaba en 0x0200, p02:88F2); las dos cifras son oleadas
;   que p01:6F18 lanza por la tabla de p01:6F1D; lo leen p01:6EF5 (16 bytes)
;   0x8560..0x8570  (16 bytes)
DATA_tramos_fase1:
	defb 000h,000h,040h,060h,000h,000h,000h,000h,000h,000h,070h,070h,070h,000h,000h,000h	; 8560  ..@`......ppp...

; ----------------------------------------------------------------------
; DATOS tramos_fase2: un byte por tramo de 32 del scroll de la fase 2 (de 0 a
;   0x0F: el recorrido acaba en 0x01F8, p02:88F2); las dos cifras son oleadas
;   que p01:6F18 lanza por la tabla de p01:6F1D; lo leen p01:6EF5 (16 bytes)
;   0x8570..0x8580  (16 bytes)
DATA_tramos_fase2:
	defb 000h,030h,030h,0b0h,0b0h,000h,000h,000h,030h,000h,010h,010h,000h,000h,000h,000h	; 8570  .00.....0.......

; ----------------------------------------------------------------------
; DATOS tramos_fase3: un byte por tramo de 32 del scroll de la fase 3 (de 0 a
;   0x10: el recorrido acaba en 0x0210, p02:88F2); las dos cifras son oleadas
;   que p01:6F18 lanza por la tabla de p01:6F1D; se solapan 2 bloques:
;   (tramos_fase4 8590-85A3); lo leen p01:6EF5 (35 bytes)
;   0x8580..0x85a3  (35 bytes)
DATA_tramos_fase3:
	defb 000h,030h,030h,000h,020h,000h,020h,000h,000h,020h,020h,090h,090h,020h,020h,000h	; 8580  .00. . ..  ..  .
	defb 000h,000h,040h,060h,030h,0a0h,0a0h,000h,000h,000h,000h,0a0h,000h,000h,050h,050h	; 8590  ..@`0.........PP
	defb 050h,050h,000h	; 85a0

; ----------------------------------------------------------------------
; DATOS tramos_fase5: un byte por tramo de 32 del scroll de la fase 5 (de 0 a
;   0x0D: el recorrido acaba en 0x01C0, p02:88F2); las dos cifras son oleadas
;   que p01:6F18 lanza por la tabla de p01:6F1D; lo leen p01:6EF5 (14 bytes)
;   0x85a3..0x85b1  (14 bytes)
DATA_tramos_fase5:
	defb 000h,040h,040h,000h,000h,000h,070h,070h,070h,000h,040h,040h,040h,000h	; 85a3  .@@...ppp.@@@.

; ----------------------------------------------------------------------
; DATOS sin identificar  0x85b1..0x85b3  (2 bytes)
DATA_85B1:
	defb 000h,000h	; 85b1

; ----------------------------------------------------------------------
; DATOS tramos_fase6: un byte por tramo de 32 del scroll de la fase 6 (de 0 a
;   0x11: el recorrido acaba en 0x0228, p02:88F2); las dos cifras son oleadas
;   que p01:6F18 lanza por la tabla de p01:6F1D; se solapan 2 bloques:
;   (tramos_fase7 85C3-85D2); lo leen p01:6EF5 (31 bytes)
;   0x85b3..0x85d2  (31 bytes)
DATA_tramos_fase6:
	defb 000h,000h,060h,000h,090h,020h,020h,000h,020h,020h,000h,000h,020h,000h,000h,000h	; 85b3  ..`..  .  .. ...
	defb 000h,000h,000h,008h,020h,020h,060h,060h,000h,000h,020h,020h,080h,000h,020h	; 85c3  ....  ``..  ..

; ----------------------------------------------------------------------
; DATOS sin identificar  0x85d2..0x85d3  (1 bytes)
DATA_85D2:
	defb 000h	; 85d2

; ----------------------------------------------------------------------
; DATOS apariciones_85D1: 7 punteros (fase 1 a 7; tabla en 0x85D1 + 2 x A):
;   las listas de p01:7139 (HL = 0x85D1, A = 0xE67C); lo leen p01:70BA (14
;   bytes)
;   0x85d3..0x85e1  (14 bytes)
DATA_apariciones_85D1:
	defw 08631h,0865fh,086b9h,08703h,08745h,08793h,085efh	; 85d3

; ----------------------------------------------------------------------
; DATOS apariciones_85DF: 7 punteros (fase 1 a 7; tabla en 0x85DF + 2 x A):
;   las listas de p01:7139 (HL = 0x85DF, A = 0xE677); lo leen p01:7128 (14
;   bytes)
;   0x85e1..0x85ef  (14 bytes)
DATA_apariciones_85DF:
	defw 0881dh,0883dh,0883dh,0883dh,0883fh,0883dh,08847h	; 85e1

; ----------------------------------------------------------------------
; DATOS apariciones_85EF: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 7, que p01:7139 gasta con 0xE67C; FF FF acaba (p01:714A); lo
;   leen p01:70BA (66 bytes)
;   0x85ef..0x8631  (66 bytes)
DATA_apariciones_85EF:
	defb 080h,000h,00eh,000h	; 85ef
	defb 080h,000h,00eh,0a0h	; 85f3
	defb 080h,004h,00eh,000h	; 85f7
	defb 080h,004h,00eh,0a0h	; 85fb
	defb 0a0h,000h,00eh,000h	; 85ff
	defb 0a0h,000h,00eh,0a0h	; 8603
	defb 0a0h,004h,00eh,000h	; 8607
	defb 0a0h,004h,00eh,0a0h	; 860b
	defb 0a0h,008h,00eh,000h	; 860f
	defb 0a0h,008h,00eh,0a0h	; 8613
	defb 0a0h,001h,00eh,000h	; 8617
	defb 0a0h,001h,00eh,0a0h	; 861b
	defb 0a0h,005h,00eh,000h	; 861f
	defb 0a0h,005h,00eh,0a0h	; 8623
	defb 0a0h,009h,00eh,000h	; 8627
	defb 0a0h,009h,00eh,0a0h	; 862b
	defb 0ffh,0ffh	; 862f

; ----------------------------------------------------------------------
; DATOS apariciones_8631: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 1, que p01:7139 gasta con 0xE67C; FF FF acaba (p01:714A); lo
;   leen p01:70BA (46 bytes)
;   0x8631..0x865f  (46 bytes)
DATA_apariciones_8631:
	defb 008h,001h,003h,010h	; 8631
	defb 00bh,001h,003h,078h	; 8635
	defb 023h,001h,003h,030h	; 8639
	defb 025h,001h,003h,060h	; 863d
	defb 02ah,001h,003h,020h	; 8641
	defb 030h,001h,003h,058h	; 8645
	defb 053h,001h,003h,050h	; 8649
	defb 058h,001h,003h,058h	; 864d
	defb 05eh,001h,003h,058h	; 8651
	defb 063h,001h,003h,040h	; 8655
	defb 06ah,001h,003h,038h	; 8659
	defb 0ffh,0ffh	; 865d

; ----------------------------------------------------------------------
; DATOS apariciones_865F: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 2, que p01:7139 gasta con 0xE67C; FF FF acaba (p01:714A); lo
;   leen p01:70BA (90 bytes)
;   0x865f..0x86b9  (90 bytes)
DATA_apariciones_865F:
	defb 048h,004h,05fh,060h	; 865f
	defb 048h,000h,05fh,0a0h	; 8663
	defb 068h,000h,016h,010h	; 8667
	defb 06ah,000h,016h,0a0h	; 866b
	defb 06eh,000h,016h,080h	; 866f
	defb 074h,000h,016h,040h	; 8673
	defb 07ch,000h,016h,080h	; 8677
	defb 082h,000h,016h,040h	; 867b
	defb 082h,000h,016h,0c0h	; 867f
	defb 092h,000h,016h,010h	; 8683
	defb 092h,000h,016h,080h	; 8687
	defb 098h,000h,016h,0a0h	; 868b
	defb 09ch,000h,016h,080h	; 868f
	defb 0a4h,000h,016h,080h	; 8693
	defb 058h,00dh,00ch,030h	; 8697
	defb 05ch,009h,00ch,0a0h	; 869b
	defb 062h,005h,00ch,028h	; 869f
	defb 063h,005h,00ch,078h	; 86a3
	defb 064h,005h,00ch,0c0h	; 86a7
	defb 068h,009h,00ch,080h	; 86ab
	defb 068h,00dh,00ch,028h	; 86af
	defb 0b0h,001h,023h,080h	; 86b3
	defb 0ffh,0ffh	; 86b7

; ----------------------------------------------------------------------
; DATOS apariciones_86B9: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 3, que p01:7139 gasta con 0xE67C; FF FF acaba (p01:714A); lo
;   leen p01:70BA (74 bytes)
;   0x86b9..0x8703  (74 bytes)
DATA_apariciones_86B9:
	defb 068h,004h,05ch,020h	; 86b9
	defb 070h,000h,05ch,0e0h	; 86bd
	defb 011h,005h,05ch,040h	; 86c1
	defb 01ch,005h,05ch,020h	; 86c5
	defb 039h,005h,05ch,010h	; 86c9
	defb 058h,001h,05ch,0e0h	; 86cd
	defb 059h,005h,05ch,070h	; 86d1
	defb 05bh,005h,05ch,070h	; 86d5
	defb 05fh,005h,05ch,070h	; 86d9
	defb 06ch,001h,05ch,0e0h	; 86dd
	defb 079h,005h,05ch,018h	; 86e1
	defb 083h,005h,05ch,010h	; 86e5
	defb 084h,001h,05ch,078h	; 86e9
	defb 08eh,005h,05ch,010h	; 86ed
	defb 0e3h,005h,05ch,020h	; 86f1
	defb 0e7h,005h,05ch,020h	; 86f5
	defb 0e8h,001h,05ch,0e0h	; 86f9
	defb 0f4h,005h,05ch,090h	; 86fd
	defb 0ffh,0ffh	; 8701

; ----------------------------------------------------------------------
; DATOS apariciones_8703: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 4, que p01:7139 gasta con 0xE67C; FF FF acaba (p01:714A); lo
;   leen p01:70BA (66 bytes)
;   0x8703..0x8745  (66 bytes)
DATA_apariciones_8703:
	defb 0a0h,000h,01ch,080h	; 8703
	defb 0a2h,000h,01ch,080h	; 8707
	defb 0bch,000h,01ch,080h	; 870b
	defb 0c2h,000h,01ch,080h	; 870f
	defb 002h,001h,020h,050h	; 8713
	defb 00eh,005h,020h,050h	; 8717
	defb 018h,001h,020h,050h	; 871b
	defb 020h,005h,020h,050h	; 871f
	defb 02ah,001h,020h,050h	; 8723
	defb 034h,005h,020h,050h	; 8727
	defb 056h,001h,01bh,040h	; 872b
	defb 060h,001h,05ch,080h	; 872f
	defb 06eh,005h,05ch,018h	; 8733
	defb 070h,001h,05ch,080h	; 8737
	defb 078h,005h,05ch,018h	; 873b
	defb 09bh,001h,01bh,040h	; 873f
	defb 0ffh,0ffh	; 8743

; ----------------------------------------------------------------------
; DATOS apariciones_8745: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 5, que p01:7139 gasta con 0xE67C; FF FF acaba (p01:714A); lo
;   leen p01:70BA (78 bytes)
;   0x8745..0x8793  (78 bytes)
DATA_apariciones_8745:
	defb 068h,000h,00eh,030h	; 8745
	defb 070h,000h,00eh,060h	; 8749
	defb 078h,000h,00eh,050h	; 874d
	defb 080h,000h,00eh,020h	; 8751
	defb 044h,001h,006h,010h	; 8755
	defb 048h,005h,006h,090h	; 8759
	defb 04ch,001h,006h,010h	; 875d
	defb 050h,001h,006h,010h	; 8761
	defb 054h,005h,006h,090h	; 8765
	defb 058h,001h,006h,010h	; 8769
	defb 05ch,005h,006h,090h	; 876d
	defb 063h,001h,006h,010h	; 8771
	defb 06ah,005h,006h,090h	; 8775
	defb 072h,001h,006h,010h	; 8779
	defb 07ah,005h,006h,090h	; 877d
	defb 085h,001h,006h,010h	; 8781
	defb 08eh,005h,006h,090h	; 8785
	defb 094h,001h,006h,010h	; 8789
	defb 09ch,005h,006h,090h	; 878d
	defb 0ffh,0ffh	; 8791

; ----------------------------------------------------------------------
; DATOS apariciones_8793: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 6, que p01:7139 gasta con 0xE67C; FF FF acaba (p01:714A); lo
;   leen p01:70BA (138 bytes)
;   0x8793..0x881d  (138 bytes)
DATA_apariciones_8793:
	defb 040h,000h,05fh,080h	; 8793
	defb 048h,000h,05fh,080h	; 8797
	defb 061h,004h,00ch,0a0h	; 879b
	defb 06ah,004h,00ch,038h	; 879f
	defb 073h,004h,00ch,0b0h	; 87a3
	defb 074h,004h,00ch,080h	; 87a7
	defb 07ch,004h,00ch,068h	; 87ab
	defb 080h,000h,00eh,000h	; 87af
	defb 080h,000h,00eh,0a0h	; 87b3
	defb 080h,004h,00eh,000h	; 87b7
	defb 080h,004h,00eh,0a0h	; 87bb
	defb 08bh,004h,00ch,080h	; 87bf
	defb 09ah,000h,00eh,080h	; 87c3
	defb 0a0h,000h,00eh,000h	; 87c7
	defb 0a0h,000h,00eh,0a0h	; 87cb
	defb 0a0h,004h,00eh,000h	; 87cf
	defb 0a0h,004h,00eh,0a0h	; 87d3
	defb 0d0h,004h,01ch,020h	; 87d7
	defb 0d0h,000h,01ch,0d0h	; 87db
	defb 0d3h,000h,05fh,040h	; 87df
	defb 0e0h,000h,05fh,0a0h	; 87e3
	defb 0e6h,004h,01ch,020h	; 87e7
	defb 0e6h,000h,01ch,0d0h	; 87eb
	defb 0eeh,004h,01ch,020h	; 87ef
	defb 0eeh,000h,01ch,0d0h	; 87f3
	defb 010h,005h,01ch,020h	; 87f7
	defb 010h,001h,01ch,0d0h	; 87fb
	defb 01eh,005h,01ch,020h	; 87ff
	defb 01eh,001h,01ch,0d0h	; 8803
	defb 04ah,001h,024h,083h	; 8807
	defb 04ch,001h,024h,083h	; 880b
	defb 050h,001h,024h,048h	; 880f
	defb 05ch,001h,024h,040h	; 8813
	defb 09ch,001h,023h,080h	; 8817
	defb 0ffh,0ffh	; 881b

; ----------------------------------------------------------------------
; DATOS apariciones_881D: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 1, que p01:7139 gasta con 0xE677; FF FF acaba (p01:714A); se
;   solapan 2 bloques: (apariciones_883D 883D-883F); lo leen p01:7128 (34
;   bytes)
;   0x881d..0x883f  (34 bytes)
DATA_apariciones_881D:
	defb 016h,000h,003h,040h	; 881d
	defb 016h,000h,003h,0c0h	; 8821
	defb 013h,000h,003h,020h	; 8825
	defb 012h,000h,003h,068h	; 8829
	defb 012h,000h,003h,0c8h	; 882d
	defb 008h,000h,003h,080h	; 8831
	defb 008h,000h,003h,0d0h	; 8835
	defb 007h,000h,003h,030h	; 8839
	defb 0ffh,0ffh	; 883d

; ----------------------------------------------------------------------
; DATOS apariciones_883F: fichas de 4 bytes [posicion lo][hi (2 bits)][c][b]
;   de la fase 5, que p01:7139 gasta con 0xE677; FF FF acaba (p01:714A); se
;   solapan 2 bloques: (apariciones_8847 8847-8849); lo leen p01:7128 (10
;   bytes)
;   0x883f..0x8849  (10 bytes)
DATA_apariciones_883F:
	defb 00bh,000h,024h,010h	; 883f
	defb 009h,000h,024h,070h	; 8843
	defb 0ffh,0ffh	; 8847

; ----------------------------------------------------------------------
; DATOS pieza_8849: 22 punteros que p00:5E0B lee con B (p00:4E28): piezas de 5
;   filas de 7 caracteres; lo leen p00:5E0B (44 bytes)
;   0x8849..0x8875  (44 bytes)
DATA_pieza_8849:
	defw 08875h,08899h,088bdh,088e1h,08905h,08929h,0894dh,08971h	; 8849
	defw 08995h,089b9h,089ddh,08a01h,08a25h,08a49h,08a6dh,08ab5h	; 8859
	defw 08a91h,08ad9h,08afdh,08b21h,08b45h,08b69h	; 8869

; ----------------------------------------------------------------------
; DATOS pieza_8849_8875: pieza de 36 bytes de las entradas 0 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8875..0x8899  (36 bytes)
DATA_pieza_8849_8875:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8875
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 887c
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8883
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 888a
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8891
	defb 0a0h	; 8898

; ----------------------------------------------------------------------
; DATOS pieza_8849_8899: pieza de 36 bytes de las entradas 1 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8899..0x88bd  (36 bytes)
DATA_pieza_8849_8899:
	defb 0ffh,0f8h,0fbh,0f8h,0ffh,0f8h,0ffh	; 8899
	defb 0ffh,020h,0eeh,020h,0afh,02fh,0ffh	; 88a0
	defb 0ffh,082h,0beh,082h,0beh,082h,0ffh	; 88a7
	defb 0ffh,008h,0fbh,00bh,0fbh,008h,0ffh	; 88ae
	defb 0ffh,0ffh,07fh,0bfh,0bfh,03fh,0ffh	; 88b5
	defb 0a0h	; 88bc

; ----------------------------------------------------------------------
; DATOS pieza_8849_88BD: pieza de 36 bytes de las entradas 2 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x88bd..0x88e1  (36 bytes)
DATA_pieza_8849_88BD:
	defb 0ffh,0e0h,0eeh,0eeh,0eeh,0eeh,0ffh	; 88bd
	defb 0ffh,082h,0bah,0bah,0bah,082h,0ffh	; 88c4
	defb 0ffh,008h,0eah,00ah,0dah,0cah,0ffh	; 88cb
	defb 0ffh,020h,0aeh,0a0h,0aeh,0aeh,0ffh	; 88d2
	defb 0ffh,0bfh,0bfh,0bfh,0bfh,087h,0ffh	; 88d9
	defb 0a0h	; 88e0

; ----------------------------------------------------------------------
; DATOS pieza_8849_88E1: pieza de 36 bytes de las entradas 3 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x88e1..0x8905  (36 bytes)
DATA_pieza_8849_88E1:
	defb 0ffh,0f8h,0ffh,0f8h,0fbh,0f8h,0ffh	; 88e1
	defb 0ffh,06ah,06ah,06ah,0eah,060h,0ffh	; 88e8
	defb 0ffh,085h,0b5h,084h,0b7h,0b4h,0ffh	; 88ef
	defb 0ffh,0bch,0bdh,024h,0bdh,03ch,0ffh	; 88f6
	defb 0ffh,03fh,0bfh,01fh,0dfh,01fh,0ffh	; 88fd
	defb 0a0h	; 8904

; ----------------------------------------------------------------------
; DATOS pieza_8849_8905: pieza de 36 bytes de las entradas 4 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8905..0x8929  (36 bytes)
DATA_pieza_8849_8905:
	defb 0ffh,068h,06bh,008h,06bh,06bh,0ffh	; 8905
	defb 0ffh,055h,055h,055h,055h,041h,0ffh	; 890c
	defb 0ffh,05dh,05dh,00dh,06dh,06ch,0ffh	; 8913
	defb 0ffh,054h,055h,055h,055h,015h,0ffh	; 891a
	defb 0ffh,027h,0abh,0adh,0adh,0a1h,0ffh	; 8921
	defb 0a0h	; 8928

; ----------------------------------------------------------------------
; DATOS pieza_8849_8929: pieza de 36 bytes de las entradas 5 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8929..0x894d  (36 bytes)
DATA_pieza_8849_8929:
	defb 0ffh,0edh,0edh,0e1h,0edh,0edh,0ffh	; 8929
	defb 0ffh,00ah,06ah,06ah,06ah,008h,0ffh	; 8930
	defb 0ffh,0a0h,0aah,0aah,0aah,02ah,0ffh	; 8937
	defb 0ffh,0a1h,0adh,0adh,0adh,0adh,0ffh	; 893e
	defb 0ffh,00fh,07fh,04fh,06fh,00fh,0ffh	; 8945
	defb 0a0h	; 894c

; ----------------------------------------------------------------------
; DATOS pieza_8849_894D: pieza de 36 bytes de las entradas 6 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x894d..0x8971  (36 bytes)
DATA_pieza_8849_894D:
	defb 0ffh,0f0h,0f7h,0f0h,0f6h,0f6h,0ffh	; 894d
	defb 0ffh,050h,057h,050h,0d7h,057h,0ffh	; 8954
	defb 0ffh,041h,05dh,041h,0dfh,0dfh,0ffh	; 895b
	defb 0ffh,07ch,07dh,07ch,07dh,004h,0ffh	; 8962
	defb 0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh	; 8969
	defb 0a0h	; 8970

; ----------------------------------------------------------------------
; DATOS pieza_8849_8971: pieza de 36 bytes de las entradas 7 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8971..0x8995  (36 bytes)
DATA_pieza_8849_8971:
	defb 0ffh,0fbh,0fbh,0fbh,0fbh,0f8h,0ffh	; 8971
	defb 0ffh,0e0h,0eeh,0e0h,0eeh,02eh,0ffh	; 8978
	defb 0ffh,082h,0beh,082h,0fah,082h,0ffh	; 897f
	defb 0ffh,008h,0fbh,008h,0fbh,00bh,0ffh	; 8986
	defb 0ffh,03fh,0bfh,03fh,07fh,03fh,0ffh	; 898d
	defb 0a0h	; 8994

; ----------------------------------------------------------------------
; DATOS pieza_8849_8995: pieza de 36 bytes de las entradas 8 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8995..0x89b9  (36 bytes)
DATA_pieza_8849_8995:
	defb 0ffh,0f8h,0fbh,0f8h,0ffh,0f8h,0ffh	; 8995
	defb 0ffh,020h,0efh,02fh,0afh,020h,0ffh	; 899c
	defb 0ffh,082h,0bah,082h,0b6h,0b2h,0ffh	; 89a3
	defb 0ffh,00ah,0fah,00ah,0fah,008h,0ffh	; 89aa
	defb 0ffh,0bfh,0bfh,0bfh,0bfh,03fh,0ffh	; 89b1
	defb 0a0h	; 89b8

; ----------------------------------------------------------------------
; DATOS pieza_8849_89B9: pieza de 36 bytes de las entradas 9 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x89b9..0x89dd  (36 bytes)
DATA_pieza_8849_89B9:
	defb 0ffh,0f8h,0fah,0fah,0fah,0fah,0ffh	; 89b9
	defb 0ffh,020h,0afh,0a0h,0afh,0a0h,0ffh	; 89c0
	defb 0ffh,082h,0eeh,0eeh,0eeh,0eeh,0ffh	; 89c7
	defb 0ffh,008h,0fbh,00bh,0fbh,008h,0ffh	; 89ce
	defb 0ffh,03fh,0bfh,0bfh,0bfh,03fh,0ffh	; 89d5
	defb 0a0h	; 89dc

; ----------------------------------------------------------------------
; DATOS pieza_8849_89DD: pieza de 36 bytes de las entradas 10 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x89dd..0x8a01  (36 bytes)
DATA_pieza_8849_89DD:
	defb 0ffh,0f0h,0f7h,0f7h,0f7h,0f0h,0ffh	; 89dd
	defb 0ffh,041h,05dh,041h,05fh,05fh,0ffh	; 89e4
	defb 0ffh,005h,0ddh,0ddh,0ddh,0ddh,0ffh	; 89eb
	defb 0ffh,004h,075h,075h,075h,005h,0ffh	; 89f2
	defb 0ffh,01fh,0dfh,0dfh,0dfh,0dfh,0ffh	; 89f9
	defb 0a0h	; 8a00

; ----------------------------------------------------------------------
; DATOS pieza_8849_8A01: pieza de 36 bytes de las entradas 11 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8a01..0x8a25  (36 bytes)
DATA_pieza_8849_8A01:
	defb 0ffh,0e0h,0efh,0e0h,0efh,0eeh,0ffh	; 8a01
	defb 0ffh,0e0h,0efh,0e0h,0efh,06fh,0ffh	; 8a08
	defb 0ffh,0a0h,0afh,0a0h,0afh,0a0h,0ffh	; 8a0f
	defb 0ffh,0beh,0beh,0beh,0beh,082h,0ffh	; 8a16
	defb 0ffh,03fh,0dfh,0efh,0efh,00fh,0ffh	; 8a1d
	defb 0a0h	; 8a24

; ----------------------------------------------------------------------
; DATOS pieza_8849_8A25: pieza de 36 bytes de las entradas 12 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8a25..0x8a49  (36 bytes)
DATA_pieza_8849_8A25:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8a25
	defb 0ffh,0c1h,0f7h,0f7h,0f7h,0f7h,0ffh	; 8a2c
	defb 0ffh,055h,055h,055h,055h,005h,0ffh	; 8a33
	defb 0ffh,007h,077h,077h,077h,077h,0ffh	; 8a3a
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8a41
	defb 0a0h	; 8a48

; ----------------------------------------------------------------------
; DATOS pieza_8849_8A49: pieza de 36 bytes de las entradas 13 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8a49..0x8a6d  (36 bytes)
DATA_pieza_8849_8A49:
	defb 0ffh,0f0h,0fdh,0fdh,0fdh,0fdh,0ffh	; 8a49
	defb 0ffh,041h,0ddh,0c1h,0dbh,0d9h,0ffh	; 8a50
	defb 0ffh,041h,05dh,041h,05fh,05fh,0ffh	; 8a57
	defb 0ffh,07ch,07dh,07ch,07dh,004h,0ffh	; 8a5e
	defb 0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh	; 8a65
	defb 0a0h	; 8a6c

; ----------------------------------------------------------------------
; DATOS pieza_8849_8A6D: pieza de 36 bytes de las entradas 14 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8a6d..0x8a91  (36 bytes)
DATA_pieza_8849_8A6D:
	defb 0ffh,0f0h,0f7h,0f0h,0f7h,0f7h,0ffh	; 8a6d
	defb 0ffh,041h,05dh,041h,05bh,059h,0ffh	; 8a74
	defb 0ffh,005h,055h,055h,055h,055h,0ffh	; 8a7b
	defb 0ffh,004h,075h,075h,075h,074h,0ffh	; 8a82
	defb 0ffh,01fh,0ffh,01fh,0dfh,01fh,0ffh	; 8a89
	defb 0a0h	; 8a90

; ----------------------------------------------------------------------
; DATOS pieza_8849_8A91: pieza de 36 bytes de las entradas 16 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8a91..0x8ab5  (36 bytes)
DATA_pieza_8849_8A91:
	defb 000h,000h,078h,048h,048h,04bh,07bh	; 8a91
	defb 000h,000h,04bh,04ah,07ah,04ah,04bh	; 8a98
	defb 000h,000h,0d0h,050h,050h,050h,0deh	; 8a9f
	defb 000h,000h,0c3h,0a3h,090h,093h,0f3h	; 8aa6
	defb 03eh,022h,022h,07eh,042h,042h,07eh	; 8aad
	defb 0f0h	; 8ab4

; ----------------------------------------------------------------------
; DATOS pieza_8849_8AB5: pieza de 36 bytes de las entradas 15 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8ab5..0x8ad9  (36 bytes)
DATA_pieza_8849_8AB5:
	defb 000h,000h,078h,040h,078h,00bh,07bh	; 8ab5
	defb 000h,000h,07bh,041h,079h,009h,079h	; 8abc
	defb 000h,000h,0bdh,025h,025h,025h,03dh	; 8ac3
	defb 000h,000h,0e3h,023h,0e0h,003h,003h	; 8aca
	defb 03eh,022h,022h,07eh,042h,042h,07eh	; 8ad1
	defb 0f0h	; 8ad8

; ----------------------------------------------------------------------
; DATOS pieza_8849_8AD9: pieza de 36 bytes de las entradas 17 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8ad9..0x8afd  (36 bytes)
DATA_pieza_8849_8AD9:
	defb 000h,000h,078h,048h,048h,04ah,07ah	; 8ad9
	defb 000h,000h,0e9h,089h,08fh,089h,0e9h	; 8ae0
	defb 000h,000h,07ah,04ah,07ah,04ah,04ah	; 8ae7
	defb 000h,000h,0f3h,093h,090h,093h,093h	; 8aee
	defb 03eh,022h,022h,07eh,042h,042h,07eh	; 8af5
	defb 0f0h	; 8afc

; ----------------------------------------------------------------------
; DATOS pieza_8849_8AFD: pieza de 36 bytes de las entradas 18 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8afd..0x8b21  (36 bytes)
DATA_pieza_8849_8AFD:
	defb 000h,000h,07bh,042h,07bh,00ah,07ah	; 8afd
	defb 000h,000h,0deh,052h,0deh,012h,012h	; 8b04
	defb 000h,000h,0f5h,095h,0f7h,0a4h,0b4h	; 8b0b
	defb 000h,000h,003h,003h,080h,083h,083h	; 8b12
	defb 03eh,022h,022h,07eh,042h,042h,07eh	; 8b19
	defb 0f0h	; 8b20

; ----------------------------------------------------------------------
; DATOS pieza_8849_8B21: pieza de 36 bytes de las entradas 19 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8b21..0x8b45  (36 bytes)
DATA_pieza_8849_8B21:
	defb 000h,000h,07ch,010h,010h,010h,013h	; 8b21
	defb 000h,000h,073h,052h,07ah,04ah,07bh	; 8b28
	defb 000h,000h,0dfh,055h,055h,055h,0d5h	; 8b2f
	defb 000h,000h,073h,053h,078h,04bh,07bh	; 8b36
	defb 03eh,022h,022h,07eh,042h,042h,07eh	; 8b3d
	defb 0f0h	; 8b44

; ----------------------------------------------------------------------
; DATOS pieza_8849_8B45: pieza de 36 bytes de las entradas 20 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8b45..0x8b69  (36 bytes)
DATA_pieza_8849_8B45:
	defb 000h,000h,000h,000h,000h,000h,000h	; 8b45
	defb 000h,0fah,08ah,0fah,082h,082h,000h	; 8b4c
	defb 000h,087h,084h,084h,084h,0f7h,000h	; 8b53
	defb 000h,0dfh,044h,044h,044h,0c4h,000h	; 8b5a
	defb 000h,000h,000h,000h,000h,000h,000h	; 8b61
	defb 0f4h	; 8b68

; ----------------------------------------------------------------------
; DATOS pieza_8849_8B69: pieza de 36 bytes de las entradas 21 de 0x8849: 5
;   filas de 7 caracteres que p00:5E12 manda a la VRAM con outi, y un byte mas
;   que lee p00:5E20; lo leen p00:5E17 (36 bytes)
;   0x8b69..0x8b8d  (36 bytes)
DATA_pieza_8849_8B69:
	defb 000h,03ch,021h,021h,021h,03dh,000h	; 8b69
	defb 000h,003h,0c2h,043h,05ah,0dah,000h	; 8b70
	defb 000h,0eah,02ah,0eah,00ah,00bh,000h	; 8b77
	defb 000h,01fh,011h,011h,011h,0dfh,000h	; 8b7e
	defb 000h,07ch,010h,010h,010h,010h,000h	; 8b85
	defb 0f6h	; 8b8c

; ----------------------------------------------------------------------
; DATOS fichas_8B8D: 89 punteros que p01:6308 lee con IX+07 (p00:4E21); lo
;   leen p01:6308 (178 bytes)
;   0x8b8d..0x8c3f  (178 bytes)
DATA_fichas_8B8D:
	defw 08c7bh,08c99h,08c3fh,08c5dh,08df9h,08e01h,08d45h,08d4dh	; 8b8d
	defw 08cb7h,08cbbh,08cc3h,08ccfh,08cdfh,08ce3h,08cebh,08cf7h	; 8b9d
	defw 08d07h,08d17h,08d2fh,08d27h,08d37h,08d3dh,08d43h,08d44h	; 8bad
	defw 08f69h,08f69h,08f69h,08f72h,08f7bh,08f84h,08d55h,08c3fh	; 8bbd
	defw 08c3fh,08dddh,08ddbh,08dd9h,08dd7h,08dd5h,08dd3h,08dd1h	; 8bcd
	defw 08dcfh,08dcdh,08df1h,08e09h,08e31h,08e59h,08e69h,08e91h	; 8bdd
	defw 08eb9h,08ee1h,08f09h,08f19h,08f41h,08f15h,08f11h,08f0dh	; 8bed
	defw 08c3fh,08c3fh,08c3fh,08c3fh,08c3fh,08c3fh,08f8dh,08f95h	; 8bfd
	defw 08f9dh,08fa5h,08fadh,08fb5h,08fbdh,08fc5h,08fcdh,08febh	; 8c0d
	defw 09009h,09027h,09045h,09089h,09065h,09063h,09061h,0905fh	; 8c1d
	defw 0905dh,0905bh,09059h,09057h,09055h,09079h,09081h,09091h	; 8c2d
	defw 09099h	; 8c3d  -> DATA_fichas_8B8D_9099

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8C3F: lo que p01:630B lee de las entradas 2, 31, 32, 56,
;   57, 58, 59, 60, 61 de 0x8B8D (acaba donde empieza la siguiente); lo leen
;   p01:630B (30 bytes)
;   0x8c3f..0x8c5d  (30 bytes)
DATA_fichas_8B8D_8C3F:
	defb 0d8h,0d7h,0d6h,0d5h,0d4h,0d3h,0deh,0ddh,0dch,0dbh,0dah,0d9h,0e4h,0e3h,0e2h,0e1h	; 8c3f  ................
	defb 0e0h,0dfh,000h,0e8h,0e7h,0e6h,0e5h,000h,000h,0e9h,000h,000h,000h,000h	; 8c4f  ..............

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8C5D: lo que p01:630B lee de las entradas 3 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (30 bytes)
;   0x8c5d..0x8c7b  (30 bytes)
DATA_fichas_8B8D_8C5D:
	defb 0d8h,0d7h,0d6h,0d5h,0d4h,0d3h,0deh,0ddh,0dch,0dbh,0dah,0d9h,0e4h,0eah,0e2h,0e1h	; 8c5d  ................
	defb 0e0h,0dfh,000h,0ech,0ebh,0e6h,0e5h,000h,000h,0edh,000h,000h,000h,000h	; 8c6d  ..............

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8C7B: lo que p01:630B lee de las entradas 0 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (30 bytes)
;   0x8c7b..0x8c99  (30 bytes)
DATA_fichas_8B8D_8C7B:
	defb 0b4h,0b5h,0b6h,0b7h,0b8h,0b9h,0bah,0bbh,0bch,0bdh,0beh,0bfh,0c0h,0c1h,0c2h,0c3h	; 8c7b  ................
	defb 0c4h,0c5h,000h,0c6h,0c7h,0c8h,0cdh,000h,000h,000h,000h,000h,0ceh,000h	; 8c8b  ..............

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8C99: lo que p01:630B lee de las entradas 1 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (30 bytes)
;   0x8c99..0x8cb7  (30 bytes)
DATA_fichas_8B8D_8C99:
	defb 0b4h,0b5h,0b6h,0b7h,0b8h,0b9h,0bah,0bbh,0bch,0bdh,0beh,0bfh,0c0h,0c1h,0c2h,0c3h	; 8c99  ................
	defb 0cfh,0c5h,000h,0c6h,0c7h,0d0h,0d1h,000h,000h,000h,000h,000h,0d2h,000h	; 8ca9  ..............

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CB7: lo que p01:630B lee de las entradas 8 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (4 bytes)
;   0x8cb7..0x8cbb  (4 bytes)
DATA_fichas_8B8D_8CB7:
	defb 0e6h,0e7h,0e8h,0e9h	; 8cb7

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CBB: lo que p01:630B lee de las entradas 9 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8cbb..0x8cc3  (8 bytes)
DATA_fichas_8B8D_8CBB:
	defb 0e6h,0eah,0ebh,0e9h,000h,0e7h,0e8h,000h	; 8cbb  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CC3: lo que p01:630B lee de las entradas 10 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (12 bytes)
;   0x8cc3..0x8ccf  (12 bytes)
DATA_fichas_8B8D_8CC3:
	defb 0e6h,0eah,0ebh,0e9h,000h,0eeh,0efh,000h,000h,0ech,0edh,000h	; 8cc3  ............

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CCF: lo que p01:630B lee de las entradas 11 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (16 bytes)
;   0x8ccf..0x8cdf  (16 bytes)
DATA_fichas_8B8D_8CCF:
	defb 0e6h,0eah,0ebh,0e9h,000h,0eeh,0efh,000h,000h,0eeh,0efh,000h,000h,0ech,0edh,000h	; 8ccf  ................

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CDF: lo que p01:630B lee de las entradas 12 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (4 bytes)
;   0x8cdf..0x8ce3  (4 bytes)
DATA_fichas_8B8D_8CDF:
	defb 0dch,0ddh,0deh,0dfh	; 8cdf

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CE3: lo que p01:630B lee de las entradas 13 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8ce3..0x8ceb  (8 bytes)
DATA_fichas_8B8D_8CE3:
	defb 000h,0ddh,0deh,000h,0dch,0e0h,0e1h,0dfh	; 8ce3  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CEB: lo que p01:630B lee de las entradas 14 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (12 bytes)
;   0x8ceb..0x8cf7  (12 bytes)
DATA_fichas_8B8D_8CEB:
	defb 000h,0e2h,0e3h,000h,000h,0e4h,0e5h,000h,0dch,0e0h,0e1h,0dfh	; 8ceb  ............

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8CF7: lo que p01:630B lee de las entradas 15 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (16 bytes)
;   0x8cf7..0x8d07  (16 bytes)
DATA_fichas_8B8D_8CF7:
	defb 000h,0e2h,0e3h,000h,000h,0e4h,0e5h,000h,000h,0e4h,0e5h,000h,0dch,0e0h,0e1h,0dfh	; 8cf7  ................

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D07: lo que p01:630B lee de las entradas 16 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (16 bytes)
;   0x8d07..0x8d17  (16 bytes)
DATA_fichas_8B8D_8D07:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,054h,055h,000h	; 8d07  .............TU.

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D17: lo que p01:630B lee de las entradas 17 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (16 bytes)
;   0x8d17..0x8d27  (16 bytes)
DATA_fichas_8B8D_8D17:
	defb 000h,05ah,05bh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8d17  .Z[.............

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D27: lo que p01:630B lee de las entradas 19 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8d27..0x8d2f  (8 bytes)
DATA_fichas_8B8D_8D27:
	defb 0a1h,09dh,09bh,09ch,09ah,09eh,000h,09fh	; 8d27  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D2F: lo que p01:630B lee de las entradas 18 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8d2f..0x8d37  (8 bytes)
DATA_fichas_8B8D_8D2F:
	defb 0a5h,000h,0a4h,0a0h,0a2h,0a1h,0a3h,09bh	; 8d2f  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D37: lo que p01:630B lee de las entradas 20 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (6 bytes)
;   0x8d37..0x8d3d  (6 bytes)
DATA_fichas_8B8D_8D37:
	defb 000h,000h,0a2h,09dh,09dh,09bh	; 8d37

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D3D: lo que p01:630B lee de las entradas 21 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (6 bytes)
;   0x8d3d..0x8d43  (6 bytes)
DATA_fichas_8B8D_8D3D:
	defb 0a1h,0a3h,0a3h,09ch,000h,000h	; 8d3d

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D43: lo que p01:630B lee de las entradas 22 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (1 bytes)
;   0x8d43..0x8d44  (1 bytes)
DATA_fichas_8B8D_8D43:
	defb 0fch	; 8d43

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D44: lo que p01:630B lee de las entradas 23 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (1 bytes)
;   0x8d44..0x8d45  (1 bytes)
DATA_fichas_8B8D_8D44:
	defb 0f7h	; 8d44

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D45: lo que p01:630B lee de las entradas 6 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8d45..0x8d4d  (8 bytes)
DATA_fichas_8B8D_8D45:
	defb 0e7h,0ebh,0ech,0eah,000h,0edh,0eeh,000h	; 8d45  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D4D: lo que p01:630B lee de las entradas 7 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8d4d..0x8d55  (8 bytes)
DATA_fichas_8B8D_8D4D:
	defb 000h,0e2h,0e3h,000h,0dch,0e0h,0e1h,0dfh	; 8d4d  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8D55: lo que p01:630B lee de las entradas 30 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (120 bytes)
;   0x8d55..0x8dcd  (120 bytes)
DATA_fichas_8B8D_8D55:
	defb 0a7h,0a8h,000h,000h,000h,000h,000h,0a9h,0aah,000h,000h,000h,000h,0abh,0ach,000h	; 8d55  ................
	defb 000h,000h,000h,000h,0adh,0aeh,000h,000h,000h,000h,0afh,0b0h,0b1h,000h,000h,000h	; 8d65  ................
	defb 0b2h,0b3h,0b4h,000h,000h,000h,0b5h,0b6h,0b7h,000h,000h,000h,000h,0b8h,0b9h,0bah	; 8d75  ................
	defb 000h,000h,000h,0bbh,0b0h,0bch,000h,000h,000h,0b8h,0b3h,0bdh,000h,000h,000h,0cfh	; 8d85  ................
	defb 0cah,0d4h,000h,000h,000h,0d2h,0c7h,0d3h,000h,000h,000h,0cfh,0d0h,0d1h,000h,000h	; 8d95  ................
	defb 0cch,0cdh,0ceh,000h,000h,000h,0c9h,0cah,0cbh,000h,000h,000h,0c6h,0c7h,0c8h,000h	; 8da5  ................
	defb 000h,000h,0c4h,0c5h,000h,000h,000h,0c2h,0c3h,000h,000h,000h,000h,0c0h,0c1h,000h	; 8db5  ................
	defb 000h,000h,0beh,0bfh,000h,000h,000h,000h	; 8dc5  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DCD: lo que p01:630B lee de las entradas 41 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8dcd..0x8dcf  (2 bytes)
DATA_fichas_8B8D_8DCD:
	defb 0beh,000h	; 8dcd

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DCF: lo que p01:630B lee de las entradas 40 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8dcf..0x8dd1  (2 bytes)
DATA_fichas_8B8D_8DCF:
	defb 0beh,000h	; 8dcf

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DD1: lo que p01:630B lee de las entradas 39 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8dd1..0x8dd3  (2 bytes)
DATA_fichas_8B8D_8DD1:
	defb 0beh,000h	; 8dd1

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DD3: lo que p01:630B lee de las entradas 38 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8dd3..0x8dd5  (2 bytes)
DATA_fichas_8B8D_8DD3:
	defb 0beh,000h	; 8dd3

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DD5: lo que p01:630B lee de las entradas 37 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8dd5..0x8dd7  (2 bytes)
DATA_fichas_8B8D_8DD5:
	defb 0beh,000h	; 8dd5

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DD7: lo que p01:630B lee de las entradas 36 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8dd7..0x8dd9  (2 bytes)
DATA_fichas_8B8D_8DD7:
	defb 0beh,000h	; 8dd7

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DD9: lo que p01:630B lee de las entradas 35 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8dd9..0x8ddb  (2 bytes)
DATA_fichas_8B8D_8DD9:
	defb 0beh,000h	; 8dd9

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DDB: lo que p01:630B lee de las entradas 34 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x8ddb..0x8ddd  (2 bytes)
DATA_fichas_8B8D_8DDB:
	defb 0beh,000h	; 8ddb

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DDD: lo que p01:630B lee de las entradas 33 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (20 bytes)
;   0x8ddd..0x8df1  (20 bytes)
DATA_fichas_8B8D_8DDD:
	defb 0c0h,0c1h,0c2h,0c3h,0beh,000h,0beh,000h,0beh,000h,0beh,000h,0beh,000h,0beh,000h	; 8ddd  ................
	defb 0beh,000h,0beh,000h	; 8ded

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DF1: lo que p01:630B lee de las entradas 42 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8df1..0x8df9  (8 bytes)
DATA_fichas_8B8D_8DF1:
	defb 010h,010h,010h,010h,010h,010h,010h,010h	; 8df1  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8DF9: lo que p01:630B lee de las entradas 4 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8df9..0x8e01  (8 bytes)
DATA_fichas_8B8D_8DF9:
	defb 0b9h,0bah,0beh,0bdh,0b7h,0b8h,0bch,0bbh	; 8df9  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8E01: lo que p01:630B lee de las entradas 5 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8e01..0x8e09  (8 bytes)
DATA_fichas_8B8D_8E01:
	defb 0afh,0b0h,0b4h,0b3h,0b1h,0b2h,0b6h,0b5h	; 8e01  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8E09: lo que p01:630B lee de las entradas 43 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8e09..0x8e31  (40 bytes)
DATA_fichas_8B8D_8E09:
	defb 085h,086h,000h,000h,000h,000h,000h,000h,087h,088h,081h,082h,000h,000h,000h,000h	; 8e09  ................
	defb 000h,000h,083h,084h,07dh,07eh,000h,000h,000h,000h,000h,000h,07fh,080h,07dh,07eh	; 8e19  ....}~........}~
	defb 000h,000h,000h,000h,000h,000h,07fh,080h	; 8e29  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8E31: lo que p01:630B lee de las entradas 44 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8e31..0x8e59  (40 bytes)
DATA_fichas_8B8D_8E31:
	defb 085h,086h,000h,000h,000h,087h,088h,000h,000h,000h,000h,000h,07dh,07eh,000h,000h	; 8e31  ............}~..
	defb 000h,07fh,080h,000h,000h,000h,000h,081h,082h,000h,000h,000h,083h,084h,000h,000h	; 8e41  ................
	defb 000h,07dh,07eh,000h,000h,000h,07fh,080h	; 8e51  .}~.....

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8E59: lo que p01:630B lee de las entradas 45 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (16 bytes)
;   0x8e59..0x8e69  (16 bytes)
DATA_fichas_8B8D_8E59:
	defb 089h,08ah,08bh,08ch,07dh,07eh,07fh,080h,07dh,07eh,07fh,080h,081h,082h,083h,084h	; 8e59  ....}~..}~......

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8E69: lo que p01:630B lee de las entradas 46 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8e69..0x8e91  (40 bytes)
DATA_fichas_8B8D_8E69:
	defb 000h,000h,000h,08fh,08eh,000h,000h,000h,091h,090h,000h,07dh,07eh,000h,000h,000h	; 8e69  ...........}~...
	defb 07fh,080h,000h,000h,081h,082h,000h,000h,000h,083h,084h,000h,000h,000h,07dh,07eh	; 8e79  ..............}~
	defb 000h,000h,000h,07fh,080h,000h,000h,000h	; 8e89  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8E91: lo que p01:630B lee de las entradas 47 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8e91..0x8eb9  (40 bytes)
DATA_fichas_8B8D_8E91:
	defb 000h,000h,000h,000h,000h,000h,08fh,08eh,000h,000h,000h,000h,081h,082h,091h,090h	; 8e91  ................
	defb 000h,000h,07dh,07eh,083h,084h,000h,000h,07dh,07eh,07fh,080h,000h,000h,000h,000h	; 8ea1  ..}~....}~......
	defb 07fh,080h,000h,000h,000h,000h,000h,000h	; 8eb1  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8EB9: lo que p01:630B lee de las entradas 48 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8eb9..0x8ee1  (40 bytes)
DATA_fichas_8B8D_8EB9:
	defb 000h,000h,000h,000h,000h,000h,07dh,07eh,000h,000h,000h,000h,07dh,07eh,07fh,080h	; 8eb9  ......}~....}~..
	defb 000h,000h,081h,082h,07fh,080h,000h,000h,0d2h,0d3h,083h,084h,000h,000h,000h,000h	; 8ec9  ................
	defb 0d0h,0d1h,000h,000h,000h,000h,000h,000h	; 8ed9  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8EE1: lo que p01:630B lee de las entradas 49 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8ee1..0x8f09  (40 bytes)
DATA_fichas_8B8D_8EE1:
	defb 000h,000h,000h,07dh,07eh,000h,000h,000h,07fh,080h,000h,000h,000h,081h,082h,000h	; 8ee1  ...}~...........
	defb 000h,000h,083h,084h,000h,000h,07dh,07eh,000h,000h,000h,07fh,080h,000h,0d2h,0d3h	; 8ef1  ......}~........
	defb 000h,000h,000h,0d0h,0d1h,000h,000h,000h	; 8f01  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F09: lo que p01:630B lee de las entradas 50 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (4 bytes)
;   0x8f09..0x8f0d  (4 bytes)
DATA_fichas_8B8D_8F09:
	defb 081h,082h,083h,084h	; 8f09

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F0D: lo que p01:630B lee de las entradas 55 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (4 bytes)
;   0x8f0d..0x8f11  (4 bytes)
DATA_fichas_8B8D_8F0D:
	defb 07dh,07eh,07fh,080h	; 8f0d

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F11: lo que p01:630B lee de las entradas 54 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (4 bytes)
;   0x8f11..0x8f15  (4 bytes)
DATA_fichas_8B8D_8F11:
	defb 07dh,07eh,07fh,080h	; 8f11

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F15: lo que p01:630B lee de las entradas 53 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (4 bytes)
;   0x8f15..0x8f19  (4 bytes)
DATA_fichas_8B8D_8F15:
	defb 0d6h,0d7h,0d4h,0d5h	; 8f15

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F19: lo que p01:630B lee de las entradas 51 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8f19..0x8f41  (40 bytes)
DATA_fichas_8B8D_8F19:
	defb 07dh,07eh,000h,000h,000h,07fh,080h,000h,000h,000h,081h,082h,000h,000h,000h,083h	; 8f19  }~..............
	defb 084h,000h,000h,000h,000h,07dh,07eh,000h,000h,000h,07fh,080h,000h,000h,000h,000h	; 8f29  .....}~.........
	defb 000h,0dbh,0dah,000h,000h,000h,0d9h,0d8h	; 8f39  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F41: lo que p01:630B lee de las entradas 52 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (40 bytes)
;   0x8f41..0x8f69  (40 bytes)
DATA_fichas_8B8D_8F41:
	defb 07dh,07eh,000h,000h,000h,000h,000h,000h,07fh,080h,07dh,07eh,000h,000h,000h,000h	; 8f41  }~........}~....
	defb 000h,000h,07fh,080h,081h,082h,000h,000h,000h,000h,000h,000h,083h,084h,0dbh,0dah	; 8f51  ................
	defb 000h,000h,000h,000h,000h,000h,0d9h,0d8h	; 8f61  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F69: lo que p01:630B lee de las entradas 24, 25, 26 de
;   0x8B8D (acaba donde empieza la siguiente); lo leen p01:630B (9 bytes)
;   0x8f69..0x8f72  (9 bytes)
DATA_fichas_8B8D_8F69:
	defb 0b5h,0b6h,0b4h,0b8h,0bah,0c0h,0bdh,0beh,0bch	; 8f69  .........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F72: lo que p01:630B lee de las entradas 27 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (9 bytes)
;   0x8f72..0x8f7b  (9 bytes)
DATA_fichas_8B8D_8F72:
	defb 0b5h,0b7h,0b4h,0b9h,0bbh,0c1h,0bdh,0bfh,0bch	; 8f72  .........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F7B: lo que p01:630B lee de las entradas 28 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (9 bytes)
;   0x8f7b..0x8f84  (9 bytes)
DATA_fichas_8B8D_8F7B:
	defb 0b5h,054h,0b4h,055h,000h,059h,0bdh,058h,0bch	; 8f7b  .T.U.Y.X.

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F84: lo que p01:630B lee de las entradas 29 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (9 bytes)
;   0x8f84..0x8f8d  (9 bytes)
DATA_fichas_8B8D_8F84:
	defb 053h,054h,052h,055h,000h,059h,057h,058h,056h	; 8f84  STRU.YWXV

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F8D: lo que p01:630B lee de las entradas 62 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8f8d..0x8f95  (8 bytes)
DATA_fichas_8B8D_8F8D:
	defb 0d3h,0d4h,0dch,0dbh,0d5h,0d6h,0deh,0ddh	; 8f8d  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F95: lo que p01:630B lee de las entradas 63 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8f95..0x8f9d  (8 bytes)
DATA_fichas_8B8D_8F95:
	defb 0d7h,0d8h,0e0h,0dfh,0d9h,0dah,0deh,0e1h	; 8f95  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8F9D: lo que p01:630B lee de las entradas 64 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8f9d..0x8fa5  (8 bytes)
DATA_fichas_8B8D_8F9D:
	defb 0e4h,0e5h,0edh,0ech,0e2h,0e3h,0ebh,0eah	; 8f9d  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8FA5: lo que p01:630B lee de las entradas 65 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8fa5..0x8fad  (8 bytes)
DATA_fichas_8B8D_8FA5:
	defb 0e8h,0e9h,0edh,0f0h,0e6h,0e7h,0efh,0eeh	; 8fa5  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8FAD: lo que p01:630B lee de las entradas 66 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8fad..0x8fb5  (8 bytes)
DATA_fichas_8B8D_8FAD:
	defb 0dch,0dbh,0deh,0ddh,0eeh,0edh,0ech,0ebh	; 8fad  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8FB5: lo que p01:630B lee de las entradas 67 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8fb5..0x8fbd  (8 bytes)
DATA_fichas_8B8D_8FB5:
	defb 0e0h,0dfh,0e2h,0e1h,0f2h,0f1h,0f0h,0efh	; 8fb5  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8FBD: lo que p01:630B lee de las entradas 68 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8fbd..0x8fc5  (8 bytes)
DATA_fichas_8B8D_8FBD:
	defb 0d3h,0d4h,0d5h,0d6h,0e5h,0e6h,0e3h,0e4h	; 8fbd  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8FC5: lo que p01:630B lee de las entradas 69 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x8fc5..0x8fcd  (8 bytes)
DATA_fichas_8B8D_8FC5:
	defb 0d7h,0d8h,0d9h,0dah,0e9h,0eah,0e7h,0e8h	; 8fc5  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8FCD: lo que p01:630B lee de las entradas 70 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (30 bytes)
;   0x8fcd..0x8feb  (30 bytes)
DATA_fichas_8B8D_8FCD:
	defb 057h,058h,059h,068h,067h,058h,05fh,0a6h,06fh,068h,05ah,0c6h,0a9h,0d0h,06ah,05bh	; 8fcd  WXYhgX_.ohZ...j[
	defb 0c7h,0a8h,0d1h,06bh,000h,05dh,077h,06dh,000h,000h,05eh,078h,06eh,000h	; 8fdd  ...k.]wm..^xn.

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_8FEB: lo que p01:630B lee de las entradas 71 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (30 bytes)
;   0x8feb..0x9009  (30 bytes)
DATA_fichas_8B8D_8FEB:
	defb 057h,058h,059h,068h,067h,058h,05fh,0a6h,06fh,068h,05ah,0c6h,0aah,0d0h,06ah,05bh	; 8feb  WXYhgX_.ohZ...j[
	defb 0c7h,0a7h,0d1h,06bh,000h,05dh,077h,06dh,000h,000h,05eh,078h,06eh,000h	; 8ffb  ...k.]wm..^xn.

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9009: lo que p01:630B lee de las entradas 72 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (30 bytes)
;   0x9009..0x9027  (30 bytes)
DATA_fichas_8B8D_9009:
	defb 057h,058h,059h,068h,067h,058h,05fh,0a6h,06fh,068h,05ah,0c6h,0ach,0d0h,06ah,05bh	; 9009  WXYhgX_.ohZ...j[
	defb 0c7h,000h,0d1h,06bh,000h,05dh,077h,06dh,000h,000h,05eh,078h,06eh,000h	; 9019  ...k.]wm..^xn.

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9027: lo que p01:630B lee de las entradas 73 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (30 bytes)
;   0x9027..0x9045  (30 bytes)
DATA_fichas_8B8D_9027:
	defb 057h,058h,059h,068h,067h,058h,05fh,061h,06fh,068h,05ah,060h,000h,070h,06ah,05bh	; 9027  WXYhgX_aohZ`.pj[
	defb 05ch,000h,06ch,06bh,000h,05dh,077h,06dh,000h,000h,05eh,078h,06eh,000h	; 9037  \.lk.]wm..^xn.

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9045: lo que p01:630B lee de las entradas 74 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (16 bytes)
;   0x9045..0x9055  (16 bytes)
DATA_fichas_8B8D_9045:
	defb 000h,000h,056h,072h,056h,074h,061h,053h,067h,052h,065h,05dh,000h,000h,055h,053h	; 9045  ..VrVtaSgRe]..US

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9055: lo que p01:630B lee de las entradas 84 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x9055..0x9057  (2 bytes)
DATA_fichas_8B8D_9055:
	defb 0bfh,000h	; 9055

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9057: lo que p01:630B lee de las entradas 83 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x9057..0x9059  (2 bytes)
DATA_fichas_8B8D_9057:
	defb 0bfh,000h	; 9057

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9059: lo que p01:630B lee de las entradas 82 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x9059..0x905b  (2 bytes)
DATA_fichas_8B8D_9059:
	defb 0bfh,000h	; 9059

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_905B: lo que p01:630B lee de las entradas 81 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x905b..0x905d  (2 bytes)
DATA_fichas_8B8D_905B:
	defb 0bfh,000h	; 905b

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_905D: lo que p01:630B lee de las entradas 80 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x905d..0x905f  (2 bytes)
DATA_fichas_8B8D_905D:
	defb 0bfh,000h	; 905d

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_905F: lo que p01:630B lee de las entradas 79 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x905f..0x9061  (2 bytes)
DATA_fichas_8B8D_905F:
	defb 0bfh,000h	; 905f

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9061: lo que p01:630B lee de las entradas 78 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x9061..0x9063  (2 bytes)
DATA_fichas_8B8D_9061:
	defb 0bfh,000h	; 9061

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9063: lo que p01:630B lee de las entradas 77 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (2 bytes)
;   0x9063..0x9065  (2 bytes)
DATA_fichas_8B8D_9063:
	defb 0bfh,000h	; 9063

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9065: lo que p01:630B lee de las entradas 76 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (20 bytes)
;   0x9065..0x9079  (20 bytes)
DATA_fichas_8B8D_9065:
	defb 0c0h,0c1h,0c2h,0c3h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h,0bfh,000h	; 9065  ................
	defb 0bfh,000h,0bfh,000h	; 9075

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9079: lo que p01:630B lee de las entradas 85 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x9079..0x9081  (8 bytes)
DATA_fichas_8B8D_9079:
	defb 0f7h,0f9h,0fdh,0fbh,0f8h,0fah,0feh,0fch	; 9079  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9081: lo que p01:630B lee de las entradas 86 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x9081..0x9089  (8 bytes)
DATA_fichas_8B8D_9081:
	defb 0e8h,0eah,0eeh,0ech,0e7h,0e9h,0edh,0ebh	; 9081  ........

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9089: lo que p01:630B lee de las entradas 75 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x9089..0x9091  (8 bytes)
DATA_fichas_8B8D_9089:
	defb 055h,057h,056h,054h,07dh,080h,081h,07ah	; 9089  UWVT}..z

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9091: lo que p01:630B lee de las entradas 87 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x9091..0x9099  (8 bytes)
DATA_fichas_8B8D_9091:
	defb 07dh,080h,081h,07ah,071h,05ah,05ch,07bh	; 9091  }..zqZ\{

; ----------------------------------------------------------------------
; DATOS fichas_8B8D_9099: lo que p01:630B lee de las entradas 88 de 0x8B8D
;   (acaba donde empieza la siguiente); lo leen p01:630B (8 bytes)
;   0x9099..0x90a1  (8 bytes)
DATA_fichas_8B8D_9099:
	defb 071h,05ah,05ch,07bh,061h,063h,062h,060h	; 9099  qZ\{acb`

; ----------------------------------------------------------------------
; DATOS formas_90A1: 56 punteros que p01:61C3 lee con IX+32 (p00:4E21): formas
;   que p01:61E9 copia con ldir (IX+14 de ancho, IX+13 filas); lo leen
;   p01:61C3 (112 bytes)
;   0x90a1..0x9111  (112 bytes)
DATA_formas_90A1:
	defw 09111h,09115h,0911eh,09127h,09137h,0913bh,0913fh,0914fh	; 90a1
	defw 0915bh,0915dh,09161h,09165h,09165h,09169h,0916dh,09171h	; 90b1
	defw 09175h,09179h,0917dh,09181h,09185h,09189h,0918dh,09191h	; 90c1
	defw 09195h,09199h,0919dh,091a1h,091a5h,091a9h,091adh,091b3h	; 90d1
	defw 091b9h,091bfh,091cfh,091d7h,091dbh,091dbh,091dfh,091e3h	; 90e1
	defw 091e7h,091ebh,091efh,091f3h,091f3h,091f3h,091f7h,091f7h	; 90f1
	defw 091f7h,091fbh,091fbh,091fbh,091ffh,091ffh,091ffh,09203h	; 9101

; ----------------------------------------------------------------------
; DATOS formas_90A1_9111: forma de caracteres de las entradas 0 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9111..0x9115  (4 bytes)
DATA_formas_90A1_9111:
	defb 0b3h,0b4h,0b5h,0b6h	; 9111

; ----------------------------------------------------------------------
; DATOS formas_90A1_9115: forma de caracteres de las entradas 1 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (9 bytes)
;   0x9115..0x911e  (9 bytes)
DATA_formas_90A1_9115:
	defb 0b7h,0b8h,0b9h,0bah,0bbh,0bch,0bdh,0beh	; 9115  ........
	defb 0bfh	; 911d

; ----------------------------------------------------------------------
; DATOS formas_90A1_911E: forma de caracteres de las entradas 2 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (9 bytes)
;   0x911e..0x9127  (9 bytes)
DATA_formas_90A1_911E:
	defb 0c0h,0b3h,0b4h,0c1h,0c2h,0c3h,0b5h,0c4h	; 911e  ........
	defb 0b6h	; 9126

; ----------------------------------------------------------------------
; DATOS formas_90A1_9127: forma de caracteres de las entradas 3 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (16 bytes)
;   0x9127..0x9137  (16 bytes)
DATA_formas_90A1_9127:
	defb 0b7h,0c5h,0c6h,0b9h,0c7h,0c8h,0c1h,0c9h	; 9127  ........
	defb 0bah,0cah,0bbh,0bch,0bdh,0beh,0cbh,0bfh	; 912f  ........

; ----------------------------------------------------------------------
; DATOS formas_90A1_9137: forma de caracteres de las entradas 4 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9137..0x913b  (4 bytes)
DATA_formas_90A1_9137:
	defb 0cch,0cdh,0ceh,0cfh	; 9137

; ----------------------------------------------------------------------
; DATOS formas_90A1_913B: forma de caracteres de las entradas 5 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x913b..0x913f  (4 bytes)
DATA_formas_90A1_913B:
	defb 0f3h,0f4h,0f5h,0f6h	; 913b

; ----------------------------------------------------------------------
; DATOS formas_90A1_913F: forma de caracteres de las entradas 6 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (16 bytes)
;   0x913f..0x914f  (16 bytes)
DATA_formas_90A1_913F:
	defb 000h,0b1h,0b2h,0b3h,0b4h,0b5h,0b6h,0b7h	; 913f  ........
	defb 0b8h,0b9h,0bah,0bbh,000h,0bch,0bdh,000h	; 9147  ........

; ----------------------------------------------------------------------
; DATOS formas_90A1_914F: forma de caracteres de las entradas 7 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (12 bytes)
;   0x914f..0x915b  (12 bytes)
DATA_formas_90A1_914F:
	defb 000h,096h,094h,095h,092h,099h,000h,091h	; 914f  ........
	defb 097h,000h,093h,098h	; 9157

; ----------------------------------------------------------------------
; DATOS formas_90A1_915B: forma de caracteres de las entradas 8 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (2 bytes)
;   0x915b..0x915d  (2 bytes)
DATA_formas_90A1_915B:
	defb 090h,090h	; 915b

; ----------------------------------------------------------------------
; DATOS formas_90A1_915D: forma de caracteres de las entradas 9 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x915d..0x9161  (4 bytes)
DATA_formas_90A1_915D:
	defb 028h,029h,02ah,02bh	; 915d

; ----------------------------------------------------------------------
; DATOS formas_90A1_9161: forma de caracteres de las entradas 10 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9161..0x9165  (4 bytes)
DATA_formas_90A1_9161:
	defb 020h,021h,022h,023h	; 9161

; ----------------------------------------------------------------------
; DATOS formas_90A1_9165: forma de caracteres de las entradas 11, 12 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9165..0x9169  (4 bytes)
DATA_formas_90A1_9165:
	defb 0a7h,0a8h,0a9h,0aah	; 9165

; ----------------------------------------------------------------------
; DATOS formas_90A1_9169: forma de caracteres de las entradas 13 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9169..0x916d  (4 bytes)
DATA_formas_90A1_9169:
	defb 0abh,0ach,0a9h,0aah	; 9169

; ----------------------------------------------------------------------
; DATOS formas_90A1_916D: forma de caracteres de las entradas 14 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x916d..0x9171  (4 bytes)
DATA_formas_90A1_916D:
	defb 0adh,0aeh,0a9h,0aah	; 916d

; ----------------------------------------------------------------------
; DATOS formas_90A1_9171: forma de caracteres de las entradas 15 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9171..0x9175  (4 bytes)
DATA_formas_90A1_9171:
	defb 0f0h,0f1h,0f2h,0f3h	; 9171

; ----------------------------------------------------------------------
; DATOS formas_90A1_9175: forma de caracteres de las entradas 16 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9175..0x9179  (4 bytes)
DATA_formas_90A1_9175:
	defb 0f4h,0f5h,0f2h,0f3h	; 9175

; ----------------------------------------------------------------------
; DATOS formas_90A1_9179: forma de caracteres de las entradas 17 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9179..0x917d  (4 bytes)
DATA_formas_90A1_9179:
	defb 0f6h,0f7h,0f2h,0f3h	; 9179

; ----------------------------------------------------------------------
; DATOS formas_90A1_917D: forma de caracteres de las entradas 18 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x917d..0x9181  (4 bytes)
DATA_formas_90A1_917D:
	defb 0fah,0fbh,0f8h,0f9h	; 917d

; ----------------------------------------------------------------------
; DATOS formas_90A1_9181: forma de caracteres de las entradas 19 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9181..0x9185  (4 bytes)
DATA_formas_90A1_9181:
	defb 0fah,0fbh,0fch,0fdh	; 9181

; ----------------------------------------------------------------------
; DATOS formas_90A1_9185: forma de caracteres de las entradas 20 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9185..0x9189  (4 bytes)
DATA_formas_90A1_9185:
	defb 0fah,0fbh,0feh,0ffh	; 9185

; ----------------------------------------------------------------------
; DATOS formas_90A1_9189: forma de caracteres de las entradas 21 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9189..0x918d  (4 bytes)
DATA_formas_90A1_9189:
	defb 071h,072h,06fh,070h	; 9189

; ----------------------------------------------------------------------
; DATOS formas_90A1_918D: forma de caracteres de las entradas 22 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x918d..0x9191  (4 bytes)
DATA_formas_90A1_918D:
	defb 071h,072h,0afh,0b0h	; 918d

; ----------------------------------------------------------------------
; DATOS formas_90A1_9191: forma de caracteres de las entradas 23 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9191..0x9195  (4 bytes)
DATA_formas_90A1_9191:
	defb 071h,072h,0b1h,0b2h	; 9191

; ----------------------------------------------------------------------
; DATOS formas_90A1_9195: forma de caracteres de las entradas 24 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9195..0x9199  (4 bytes)
DATA_formas_90A1_9195:
	defb 07dh,07fh,07eh,080h	; 9195

; ----------------------------------------------------------------------
; DATOS formas_90A1_9199: forma de caracteres de las entradas 25 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x9199..0x919d  (4 bytes)
DATA_formas_90A1_9199:
	defb 081h,07fh,082h,080h	; 9199

; ----------------------------------------------------------------------
; DATOS formas_90A1_919D: forma de caracteres de las entradas 26 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x919d..0x91a1  (4 bytes)
DATA_formas_90A1_919D:
	defb 08ah,07fh,089h,080h	; 919d

; ----------------------------------------------------------------------
; DATOS formas_90A1_91A1: forma de caracteres de las entradas 27 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91a1..0x91a5  (4 bytes)
DATA_formas_90A1_91A1:
	defb 08dh,08fh,08eh,090h	; 91a1

; ----------------------------------------------------------------------
; DATOS formas_90A1_91A5: forma de caracteres de las entradas 28 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91a5..0x91a9  (4 bytes)
DATA_formas_90A1_91A5:
	defb 091h,08fh,092h,090h	; 91a5

; ----------------------------------------------------------------------
; DATOS formas_90A1_91A9: forma de caracteres de las entradas 29 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91a9..0x91ad  (4 bytes)
DATA_formas_90A1_91A9:
	defb 09ah,08fh,099h,090h	; 91a9

; ----------------------------------------------------------------------
; DATOS formas_90A1_91AD: forma de caracteres de las entradas 30 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (6 bytes)
;   0x91ad..0x91b3  (6 bytes)
DATA_formas_90A1_91AD:
	defb 0ach,0abh,0adh,000h,0aah,000h	; 91ad

; ----------------------------------------------------------------------
; DATOS formas_90A1_91B3: forma de caracteres de las entradas 31 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (6 bytes)
;   0x91b3..0x91b9  (6 bytes)
DATA_formas_90A1_91B3:
	defb 000h,0f8h,000h,0fah,0f9h,0fbh	; 91b3

; ----------------------------------------------------------------------
; DATOS formas_90A1_91B9: forma de caracteres de las entradas 32 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (6 bytes)
;   0x91b9..0x91bf  (6 bytes)
DATA_formas_90A1_91B9:
	defb 000h,0feh,0fch,0fdh,000h,0ffh	; 91b9

; ----------------------------------------------------------------------
; DATOS formas_90A1_91BF: forma de caracteres de las entradas 33 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (16 bytes)
;   0x91bf..0x91cf  (16 bytes)
DATA_formas_90A1_91BF:
	defb 0bfh,0c0h,09ch,0c7h,0c1h,0c2h,09eh,09dh	; 91bf  ........
	defb 0c3h,0c4h,0cch,09fh,0c5h,0c6h,0ceh,0cdh	; 91c7  ........

; ----------------------------------------------------------------------
; DATOS formas_90A1_91CF: forma de caracteres de las entradas 34 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (8 bytes)
;   0x91cf..0x91d7  (8 bytes)
DATA_formas_90A1_91CF:
	defb 0a2h,0a3h,0a7h,0a6h,0a4h,0a5h,0a9h,0a8h	; 91cf  ........

; ----------------------------------------------------------------------
; DATOS formas_90A1_91D7: forma de caracteres de las entradas 35 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91d7..0x91db  (4 bytes)
DATA_formas_90A1_91D7:
	defb 024h,025h,026h,027h	; 91d7

; ----------------------------------------------------------------------
; DATOS formas_90A1_91DB: forma de caracteres de las entradas 36, 37 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91db..0x91df  (4 bytes)
DATA_formas_90A1_91DB:
	defb 085h,083h,086h,084h	; 91db

; ----------------------------------------------------------------------
; DATOS formas_90A1_91DF: forma de caracteres de las entradas 38 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91df..0x91e3  (4 bytes)
DATA_formas_90A1_91DF:
	defb 085h,087h,086h,088h	; 91df

; ----------------------------------------------------------------------
; DATOS formas_90A1_91E3: forma de caracteres de las entradas 39 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91e3..0x91e7  (4 bytes)
DATA_formas_90A1_91E3:
	defb 085h,08ch,086h,08bh	; 91e3

; ----------------------------------------------------------------------
; DATOS formas_90A1_91E7: forma de caracteres de las entradas 40 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91e7..0x91eb  (4 bytes)
DATA_formas_90A1_91E7:
	defb 095h,093h,096h,094h	; 91e7

; ----------------------------------------------------------------------
; DATOS formas_90A1_91EB: forma de caracteres de las entradas 41 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91eb..0x91ef  (4 bytes)
DATA_formas_90A1_91EB:
	defb 095h,097h,096h,098h	; 91eb

; ----------------------------------------------------------------------
; DATOS formas_90A1_91EF: forma de caracteres de las entradas 42 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91ef..0x91f3  (4 bytes)
DATA_formas_90A1_91EF:
	defb 095h,09ch,096h,09bh	; 91ef

; ----------------------------------------------------------------------
; DATOS formas_90A1_91F3: forma de caracteres de las entradas 43, 44, 45 de
;   0x90A1 (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91f3..0x91f7  (4 bytes)
DATA_formas_90A1_91F3:
	defb 052h,055h,053h,056h	; 91f3

; ----------------------------------------------------------------------
; DATOS formas_90A1_91F7: forma de caracteres de las entradas 46, 47, 48 de
;   0x90A1 (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91f7..0x91fb  (4 bytes)
DATA_formas_90A1_91F7:
	defb 054h,057h,053h,056h	; 91f7

; ----------------------------------------------------------------------
; DATOS formas_90A1_91FB: forma de caracteres de las entradas 49, 50, 51 de
;   0x90A1 (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91fb..0x91ff  (4 bytes)
DATA_formas_90A1_91FB:
	defb 059h,05ch,058h,05bh	; 91fb

; ----------------------------------------------------------------------
; DATOS formas_90A1_91FF: forma de caracteres de las entradas 52, 53, 54 de
;   0x90A1 (acaba donde empieza la siguiente); lo leen p01:61E9 (4 bytes)
;   0x91ff..0x9203  (4 bytes)
DATA_formas_90A1_91FF:
	defb 059h,05ch,05ah,05dh	; 91ff

; ----------------------------------------------------------------------
; DATOS formas_90A1_9203: forma de caracteres de las entradas 55 de 0x90A1
;   (acaba donde empieza la siguiente); lo leen p01:61E9 (2 bytes)
;   0x9203..0x9205  (2 bytes)
DATA_formas_90A1_9203:
	defb 028h,029h	; 9203

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9205..0x9207  (2 bytes)
DATA_9205:
	defb 02ah,02bh	; 9205

; ----------------------------------------------------------------------
; DATOS sucesos_por_fase_9205: 7 punteros (fase 1 a 7; tabla en 0x9205 + 2 x
;   A): las listas de sucesos de cada fase (0xE659); lo leen p01:78F5 (14
;   bytes)
;   0x9207..0x9215  (14 bytes)
DATA_sucesos_por_fase_9205:
	defw 09223h,09261h,0929fh,0933dh,09372h,0939bh,093dfh	; 9207

; ----------------------------------------------------------------------
; DATOS sucesos_por_fase_9213: 7 punteros (fase 1 a 7; tabla en 0x9213 + 2 x
;   A): las listas de sucesos de cada fase (0xE688); lo leen p01:792C (14
;   bytes)
;   0x9215..0x9223  (14 bytes)
DATA_sucesos_por_fase_9213:
	defw 09417h,09417h,09417h,09408h,09417h,09417h,09417h	; 9215

; ----------------------------------------------------------------------
; DATOS sucesos_9223: sucesos de la fase 1: fichas de 3 bytes que se gastan
;   con 0xE659 segun avanza el scroll; la posicion 0x7FF acaba (la lista vacia
;   es solo la marca); se solapan 12 bloques: (sucesos_9261 9261-92A0)
;   (sucesos_929F 929F-933E) (sucesos_933D 933D-9373) (sucesos_9372 9372-939C)
;   (sucesos_939B 939B-93E0) (sucesos_93DF 93DF-9409) (sucesos_9408 9408-941A)
;   (sucesos_9417 9417-941A) (demo_jugador1 9419-94DB) (demo_jugador2
;   94DA-95F8) (dibujos_95F7 95F7-962F); lo leen p01:78F5, p01:792C, p03:BF92,
;   p03:BFB4, p01:6078 (1036 bytes)
;   0x9223..0x962f  (1036 bytes)
DATA_sucesos_9223:
	defb 07ah,088h,008h	; 9223
	defb 09bh,080h,00ch	; 9226
	defb 0a8h,010h,028h	; 9229
	defb 0b6h,018h,030h	; 922c
	defb 0bah,078h,010h	; 922f
	defb 0c0h,088h,008h	; 9232
	defb 0c6h,018h,028h	; 9235
	defb 0cch,078h,00ch	; 9238
	defb 0e7h,020h,030h	; 923b
	defb 0eeh,070h,010h	; 923e
	defb 010h,041h,008h	; 9241
	defb 010h,079h,028h	; 9244
	defb 033h,019h,030h	; 9247
	defb 033h,079h,010h	; 924a
	defb 089h,019h,022h	; 924d
	defb 090h,089h,002h	; 9250
	defb 098h,089h,004h	; 9253
	defb 0a9h,019h,022h	; 9256
	defb 0afh,019h,024h	; 9259
	defb 0b5h,089h,004h	; 925c
	defb 0ffh,0ffh,0cdh	; 925f
	defb 0a0h,016h,0d9h	; 9262
	defb 080h,016h,0e5h	; 9265
	defb 0a0h,016h,001h	; 9268
	defb 081h,016h,009h	; 926b
	defb 021h,016h,00fh	; 926e
	defb 0e1h,00ah,015h	; 9271
	defb 0a1h,016h,017h	; 9274
	defb 011h,02ah,021h	; 9277
	defb 041h,016h,029h	; 927a
	defb 0a1h,016h,039h	; 927d
	defb 021h,016h,041h	; 9280
	defb 0c1h,016h,085h	; 9283
	defb 061h,016h,08dh	; 9286
	defb 021h,016h,093h	; 9289
	defb 011h,02ah,09bh	; 928c
	defb 0e1h,00ah,0a5h	; 928f
	defb 0a1h,016h,0a7h	; 9292
	defb 011h,02ah,0cch	; 9295
	defb 0e1h,00ah,0d7h	; 9298
	defb 011h,02ah,0ffh	; 929b
	defb 0ffh,062h,060h	; 929e
	defb 007h,071h,020h	; 92a1
	defb 02ah,075h,0c0h	; 92a4
	defb 00ah,07dh,0a8h	; 92a7
	defb 007h,07eh,040h	; 92aa
	defb 007h,085h,080h	; 92ad
	defb 007h,089h,020h	; 92b0
	defb 02ah,095h,0e0h	; 92b3
	defb 00ah,09ah,048h	; 92b6
	defb 027h,09dh,048h	; 92b9
	defb 00fh,0aah,060h	; 92bc
	defb 02fh,0b3h,078h	; 92bf
	defb 007h,0b8h,028h	; 92c2
	defb 007h,0cdh,028h	; 92c5
	defb 007h,0cfh,0a8h	; 92c8
	defb 007h,0ddh,0e0h	; 92cb
	defb 00ah,0deh,060h	; 92ce
	defb 007h,0e1h,010h	; 92d1
	defb 02ah,0eeh,020h	; 92d4
	defb 06fh,0f1h,0b8h	; 92d7
	defb 007h,0f7h,090h	; 92da
	defb 00fh,0f9h,0e0h	; 92dd
	defb 00ah,0fch,010h	; 92e0
	defb 02ah,002h,0a1h	; 92e3
	defb 02fh,005h,061h	; 92e6
	defb 007h,00fh,081h	; 92e9
	defb 007h,015h,0e1h	; 92ec
	defb 00ah,017h,031h	; 92ef
	defb 027h,024h,051h	; 92f2
	defb 027h,032h,079h	; 92f5
	defb 014h,047h,0a9h	; 92f8
	defb 027h,049h,031h	; 92fb
	defb 027h,04eh,0e1h	; 92fe
	defb 00ah,05ah,019h	; 9301
	defb 007h,05eh,0e1h	; 9304
	defb 00ah,06ah,0a1h	; 9307
	defb 007h,06dh,011h	; 930a
	defb 02ah,080h,0c1h	; 930d
	defb 007h,081h,079h	; 9310
	defb 04fh,090h,0a1h	; 9313
	defb 007h,097h,049h	; 9316
	defb 034h,098h,0b1h	; 9319
	defb 014h,09bh,059h	; 931c
	defb 007h,0a1h,099h	; 931f
	defb 007h,0a4h,011h	; 9322
	defb 06fh,0b1h,069h	; 9325
	defb 007h,0c2h,019h	; 9328
	defb 007h,0d5h,029h	; 932b
	defb 007h,0e3h,091h	; 932e
	defb 007h,0e5h,021h	; 9331
	defb 06fh,0eeh,031h	; 9334
	defb 007h,0f1h,0e1h	; 9337
	defb 00ah,0ffh,0ffh	; 933a
	defb 090h,080h,011h	; 933d
	defb 0a8h,080h,00dh	; 9340
	defb 0cch,080h,00dh	; 9343
	defb 0d8h,080h,001h	; 9346
	defb 0efh,018h,021h	; 9349
	defb 034h,019h,021h	; 934c
	defb 043h,081h,00dh	; 934f
	defb 060h,019h,031h	; 9352
	defb 070h,081h,011h	; 9355
	defb 07eh,019h,031h	; 9358
	defb 0a2h,091h,04fh	; 935b
	defb 0a6h,019h,031h	; 935e
	defb 0a6h,071h,001h	; 9361
	defb 0abh,091h,06fh	; 9364
	defb 020h,082h,00dh	; 9367
	defb 032h,032h,04fh	; 936a
	defb 032h,062h,04fh	; 936d
	defb 0ffh,0ffh,08fh	; 9370
	defb 088h,012h,0b6h	; 9373
	defb 008h,02eh,0b6h	; 9376
	defb 088h,00eh,0dbh	; 9379
	defb 088h,012h,0e7h	; 937c
	defb 008h,032h,0f7h	; 937f
	defb 048h,013h,013h	; 9382
	defb 089h,012h,027h	; 9385
	defb 069h,013h,037h	; 9388
	defb 009h,032h,053h	; 938b
	defb 029h,013h,073h	; 938e
	defb 009h,02eh,073h	; 9391
	defb 089h,00eh,08bh	; 9394
	defb 049h,013h,0ffh	; 9397
	defb 0ffh,050h,010h	; 939a
	defb 061h,054h,0e0h	; 939d
	defb 041h,0b9h,040h	; 93a0
	defb 02ah,0b9h,0b0h	; 93a3
	defb 00ah,0c4h,068h	; 93a6
	defb 007h,0d0h,0a0h	; 93a9
	defb 007h,00ch,051h	; 93ac
	defb 007h,049h,089h	; 93af
	defb 007h,077h,021h	; 93b2
	defb 06fh,077h,0d9h	; 93b5
	defb 04fh,07fh,059h	; 93b8
	defb 04fh,07fh,0a1h	; 93bb
	defb 06fh,087h,021h	; 93be
	defb 06fh,087h,0d9h	; 93c1
	defb 04fh,09fh,021h	; 93c4
	defb 005h,0a4h,0b1h	; 93c7
	defb 025h,0cfh,021h	; 93ca
	defb 006h,0d2h,0b1h	; 93cd
	defb 026h,0dfh,021h	; 93d0
	defb 006h,0e2h,0b1h	; 93d3
	defb 026h,0efh,021h	; 93d6
	defb 006h,0f2h,0b1h	; 93d9
	defb 026h,0ffh,0ffh	; 93dc
	defb 057h,040h,00bh	; 93df
	defb 08fh,060h,00bh	; 93e2
	defb 0a3h,020h,00bh	; 93e5
	defb 0c7h,020h,00bh	; 93e8
	defb 0ffh,060h,02bh	; 93eb
	defb 00fh,021h,02bh	; 93ee
	defb 023h,061h,02bh	; 93f1
	defb 03bh,071h,04bh	; 93f4
	defb 047h,061h,04bh	; 93f7
	defb 057h,071h,04bh	; 93fa
	defb 067h,041h,06bh	; 93fd
	defb 06fh,071h,06bh	; 9400
	defb 07bh,021h,06bh	; 9403
	defb 0ffh,0ffh,013h	; 9406
	defb 058h,04fh,013h	; 9409
	defb 0a0h,06fh,00eh	; 940c
	defb 058h,04fh,00eh	; 940f
	defb 0a0h,06fh,004h	; 9412
	defb 070h,051h,0ffh	; 9415
	defb 0ffh,014h,000h	; 9418
	defb 004h,001h,05fh	; 941b
	defb 000h,00ch,002h	; 941e
	defb 042h,000h,006h	; 9421
	defb 002h,053h,000h	; 9424
	defb 004h,001h,019h	; 9427
	defb 000h,005h,002h	; 942a
	defb 0a3h,000h,004h	; 942d
	defb 020h,070h,000h	; 9430
	defb 00ah,004h,016h	; 9433
	defb 000h,00fh,008h	; 9436
	defb 094h,000h,00bh	; 9439
	defb 004h,00ah,000h	; 943c
	defb 003h,008h,008h	; 943f
	defb 000h,009h,001h	; 9442
	defb 01eh,000h,003h	; 9445
	defb 020h,033h,000h	; 9448
	defb 00fh,002h,0a1h	; 944b
	defb 000h,004h,002h	; 944e
	defb 032h,000h,006h	; 9451
	defb 008h,05eh,000h	; 9454
	defb 006h,008h,02fh	; 9457
	defb 000h,009h,001h	; 945a
	defb 003h,000h,003h	; 945d
	defb 008h,014h,000h	; 9460
	defb 007h,002h,010h	; 9463
	defb 000h,002h,002h	; 9466
	defb 011h,000h,003h	; 9469
	defb 002h,008h,000h	; 946c
	defb 001h,002h,0a1h	; 946f
	defb 000h,006h,008h	; 9472
	defb 00fh,000h,006h	; 9475
	defb 004h,074h,000h	; 9478
	defb 015h,008h,0feh	; 947b
	defb 000h,007h,000h	; 947e
	defb 006h,002h,035h	; 9481
	defb 000h,01eh,004h	; 9484
	defb 00fh,005h,01ah	; 9487
	defb 004h,006h,001h	; 948a
	defb 015h,000h,003h	; 948d
	defb 001h,00fh,000h	; 9490
	defb 006h,001h,01bh	; 9493
	defb 000h,010h,002h	; 9496
	defb 011h,000h,004h	; 9499
	defb 001h,006h,000h	; 949c
	defb 004h,001h,008h	; 949f
	defb 000h,003h,001h	; 94a2
	defb 003h,000h,004h	; 94a5
	defb 001h,009h,000h	; 94a8
	defb 012h,002h,004h	; 94ab
	defb 000h,002h,008h	; 94ae
	defb 013h,000h,02bh	; 94b1
	defb 008h,04dh,000h	; 94b4
	defb 00dh,005h,008h	; 94b7
	defb 001h,004h,000h	; 94ba
	defb 011h,002h,008h	; 94bd
	defb 000h,007h,002h	; 94c0
	defb 042h,000h,005h	; 94c3
	defb 008h,010h,000h	; 94c6
	defb 00ah,004h,018h	; 94c9
	defb 000h,00ch,001h	; 94cc
	defb 010h,000h,009h	; 94cf
	defb 008h,007h,000h	; 94d2
	defb 005h,004h,005h	; 94d5
	defb 000h,0ffh,056h	; 94d8
	defb 000h,00dh,002h	; 94db
	defb 0beh,000h,016h	; 94de
	defb 008h,008h,000h	; 94e1
	defb 004h,020h,002h	; 94e4
	defb 000h,00eh,004h	; 94e7
	defb 0f1h,000h,002h	; 94ea
	defb 005h,001h,001h	; 94ed
	defb 016h,000h,003h	; 94f0
	defb 002h,035h,000h	; 94f3
	defb 005h,001h,02ch	; 94f6
	defb 000h,006h,002h	; 94f9
	defb 08ch,000h,003h	; 94fc
	defb 020h,017h,000h	; 94ff
	defb 003h,008h,00ah	; 9502
	defb 000h,004h,004h	; 9505
	defb 002h,024h,002h	; 9508
	defb 020h,005h,000h	; 950b
	defb 00bh,001h,012h	; 950e
	defb 000h,002h,002h	; 9511
	defb 01bh,000h,00ah	; 9514
	defb 008h,074h,000h	; 9517
	defb 001h,008h,00ah	; 951a
	defb 009h,012h,001h	; 951d
	defb 038h,000h,002h	; 9520
	defb 002h,045h,000h	; 9523
	defb 009h,004h,02eh	; 9526
	defb 000h,008h,002h	; 9529
	defb 006h,000h,003h	; 952c
	defb 004h,006h,000h	; 952f
	defb 00bh,001h,007h	; 9532
	defb 000h,002h,004h	; 9535
	defb 006h,006h,028h	; 9538
	defb 000h,007h,001h	; 953b
	defb 00eh,000h,003h	; 953e
	defb 020h,01fh,000h	; 9541
	defb 005h,00ah,012h	; 9544
	defb 008h,00bh,000h	; 9547
	defb 009h,004h,00eh	; 954a
	defb 000h,007h,004h	; 954d
	defb 006h,000h,003h	; 9550
	defb 004h,010h,000h	; 9553
	defb 002h,004h,001h	; 9556
	defb 000h,006h,002h	; 9559
	defb 005h,006h,00fh	; 955c
	defb 000h,004h,001h	; 955f
	defb 00bh,009h,002h	; 9562
	defb 008h,001h,00ah	; 9565
	defb 001h,002h,004h	; 9568
	defb 006h,002h,002h	; 956b
	defb 002h,000h,001h	; 956e
	defb 008h,005h,009h	; 9571
	defb 001h,001h,03ah	; 9574
	defb 000h,006h,002h	; 9577
	defb 001h,00ah,004h	; 957a
	defb 008h,003h,009h	; 957d
	defb 006h,001h,021h	; 9580
	defb 000h,006h,004h	; 9583
	defb 005h,002h,007h	; 9586
	defb 000h,00bh,004h	; 9589
	defb 00ch,000h,005h	; 958c
	defb 002h,018h,000h	; 958f
	defb 00ah,001h,006h	; 9592
	defb 000h,006h,002h	; 9595
	defb 0a3h,000h,002h	; 9598
	defb 008h,008h,00ah	; 959b
	defb 030h,000h,019h	; 959e
	defb 004h,00ah,000h	; 95a1
	defb 005h,004h,00ah	; 95a4
	defb 000h,002h,004h	; 95a7
	defb 009h,000h,004h	; 95aa
	defb 004h,017h,000h	; 95ad
	defb 004h,001h,010h	; 95b0
	defb 000h,003h,001h	; 95b3
	defb 020h,000h,015h	; 95b6
	defb 008h,010h,002h	; 95b9
	defb 007h,000h,003h	; 95bc
	defb 008h,00eh,009h	; 95bf
	defb 007h,001h,01fh	; 95c2
	defb 000h,014h,004h	; 95c5
	defb 013h,000h,001h	; 95c8
	defb 002h,004h,00ah	; 95cb
	defb 002h,008h,00fh	; 95ce
	defb 000h,012h,004h	; 95d1
	defb 034h,000h,004h	; 95d4
	defb 004h,004h,006h	; 95d7
	defb 01ch,000h,005h	; 95da
	defb 008h,009h,009h	; 95dd
	defb 001h,008h,011h	; 95e0
	defb 000h,003h,001h	; 95e3
	defb 013h,000h,00ah	; 95e6
	defb 002h,030h,000h	; 95e9
	defb 003h,001h,038h	; 95ec
	defb 000h,007h,001h	; 95ef
	defb 019h,000h,005h	; 95f2
	defb 020h,0ffh,0dfh	; 95f5
	defb 09dh,0ffh,09dh	; 95f8
	defb 07fh,097h,09fh	; 95fb
	defb 097h,0bfh,097h	; 95fe
	defb 0dfh,097h,07fh	; 9601
	defb 098h,0ffh,09dh	; 9604
	defb 0bfh,098h,09fh	; 9607
	defb 097h,0dfh,098h	; 960a
	defb 0dfh,097h,09fh	; 960d
	defb 098h,0ffh,09dh	; 9610
	defb 0bfh,096h,0dfh	; 9613
	defb 096h,0ffh,096h	; 9616
	defb 01fh,097h,03fh	; 9619
	defb 097h,05fh,097h	; 961c
	defb 0ffh,097h,0dfh	; 961f
	defb 096h,03fh,098h	; 9622
	defb 01fh,097h,05fh	; 9625
	defb 098h,05fh,097h	; 9628
	defb 01fh,098h,0dfh	; 962b
	defb 096h	; 962e

; ----------------------------------------------------------------------
; DATOS dibujos_962F: 18 fichas de 4 punteros ((IY+27 & 0x7F) x 8): cada uno a
;   32 bytes de dibujo de sprite que p01:608F manda a la VRAM con outi; lo
;   leen p01:60B2 (144 bytes)
;   0x962f..0x96bf  (144 bytes)
DATA_dibujos_962F:
	defw 09a3fh,09a5fh,09a7fh,09c5fh	; 962f  -> DATA_sprite_9A3F DATA_sprite_9A5F DATA_sprite_9A7F DATA_sprite_9C5F
	defw 09a9fh,09abfh,09adfh,09c5fh	; 9637  -> DATA_sprite_9A9F DATA_sprite_9ABF DATA_sprite_9ADF DATA_sprite_9C5F
	defw 09affh,09b1fh,09b3fh,09c5fh	; 963f  -> DATA_sprite_9AFF DATA_sprite_9B1F DATA_sprite_9B3F DATA_sprite_9C5F
	defw 098ffh,0991fh,0993fh,0995fh	; 9647  -> DATA_sprite_98FF DATA_sprite_991F DATA_sprite_993F DATA_sprite_995F
	defw 0997fh,0999fh,099bfh,09c5fh	; 964f  -> DATA_sprite_997F DATA_sprite_999F DATA_sprite_99BF DATA_sprite_9C5F
	defw 099dfh,099ffh,09a1fh,09c5fh	; 9657  -> DATA_sprite_99DF DATA_sprite_99FF DATA_sprite_9A1F DATA_sprite_9C5F
	defw 09a3fh,09bdfh,09a7fh,09c5fh	; 965f  -> DATA_sprite_9A3F DATA_sprite_9BDF DATA_sprite_9A7F DATA_sprite_9C5F
	defw 09a9fh,09c1fh,09adfh,09c5fh	; 9667  -> DATA_sprite_9A9F DATA_sprite_9C1F DATA_sprite_9ADF DATA_sprite_9C5F
	defw 09affh,09c3fh,09b3fh,09c5fh	; 966f  -> DATA_sprite_9AFF DATA_sprite_9C3F DATA_sprite_9B3F DATA_sprite_9C5F
	defw 09a3fh,09bffh,09a7fh,09c5fh	; 9677  -> DATA_sprite_9A3F DATA_sprite_9BFF DATA_sprite_9A7F DATA_sprite_9C5F
	defw 09b5fh,0991fh,0993fh,0995fh	; 967f  -> DATA_sprite_9B5F DATA_sprite_991F DATA_sprite_993F DATA_sprite_995F
	defw 09b9fh,0999fh,099bfh,09c5fh	; 9687  -> DATA_sprite_9B9F DATA_sprite_999F DATA_sprite_99BF DATA_sprite_9C5F
	defw 09bbfh,099ffh,09a1fh,09c5fh	; 968f  -> DATA_sprite_9BBF DATA_sprite_99FF DATA_sprite_9A1F DATA_sprite_9C5F
	defw 09b7fh,0991fh,0993fh,0995fh	; 9697  -> DATA_sprite_9B7F DATA_sprite_991F DATA_sprite_993F DATA_sprite_995F
	defw 09c7fh,09c9fh,09c5fh,09c5fh	; 969f  -> DATA_sprite_9C7F DATA_sprite_9C9F DATA_sprite_9C5F DATA_sprite_9C5F
	defw 09cbfh,09cdfh,09cffh,09c5fh	; 96a7  -> DATA_sprite_9CBF DATA_sprite_9CDF DATA_sprite_9CFF DATA_sprite_9C5F
	defw 09d1fh,09d3fh,09d5fh,09c5fh	; 96af  -> DATA_sprite_9D1F DATA_sprite_9D3F DATA_sprite_9D5F DATA_sprite_9C5F
	defw 09d7fh,09d9fh,09dbfh,09c5fh	; 96b7  -> DATA_sprite_9D7F DATA_sprite_9D9F DATA_sprite_9DBF DATA_sprite_9C5F

; ----------------------------------------------------------------------
; DATOS sprite_96BF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); se solapan 3 bloques: (sprites_96BF 96BF-96FF)
;   (sprite_96DF 96DF-96FF); lo leen p01:6096, p00:55A9 (64 bytes)
;   0x96bf..0x96ff  (64 bytes)
DATA_sprite_96BF:
	defb 000h,000h,000h,000h,002h,000h,002h,000h,000h,001h,002h,009h,08dh,024h,066h,049h	; 96bf  .............$fI
	defb 000h,000h,000h,000h,080h,000h,080h,000h,000h,000h,080h,020h,062h,048h,0cch,024h	; 96cf  ........... bH.$
	defb 000h,002h,001h,007h,004h,004h,00dh,086h,012h,09bh,098h,0b6h,073h,02dh,025h,001h	; 96df  ............s-%.
	defb 000h,080h,000h,0c0h,040h,040h,060h,0c2h,090h,0b2h,032h,0dah,09ch,068h,048h,000h	; 96ef  ....@@`...2..hH.

; ----------------------------------------------------------------------
; DATOS sprite_96FF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x96ff..0x971f  (32 bytes)
DATA_sprite_96FF:
	defb 000h,000h,000h,000h,001h,000h,003h,000h,000h,002h,005h,00ah,02ah,008h,013h,006h	; 96ff  ............*...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,040h,0c8h,0a0h,030h,090h	; 970f  ...........@..0.

; ----------------------------------------------------------------------
; DATOS sprite_971F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x971f..0x973f  (32 bytes)
DATA_sprite_971F:
	defb 002h,003h,000h,007h,004h,004h,002h,025h,005h,027h,028h,011h,00eh,00eh,012h,002h	; 971f  .......%.'(.....
	defb 000h,000h,000h,080h,080h,080h,0c0h,088h,020h,048h,0c8h,068h,030h,0e0h,0a0h,000h	; 972f  ........ H.h0...

; ----------------------------------------------------------------------
; DATOS sprite_973F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x973f..0x975f  (32 bytes)
DATA_sprite_973F:
	defb 000h,000h,000h,000h,001h,000h,001h,000h,000h,000h,001h,004h,026h,00ah,019h,012h	; 973f  ............&...
	defb 000h,000h,000h,000h,000h,000h,080h,000h,000h,080h,040h,0a0h,0a8h,020h,090h,0c0h	; 974f  ..........@.. ..

; ----------------------------------------------------------------------
; DATOS sprite_975F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x975f..0x977f  (32 bytes)
DATA_sprite_975F:
	defb 000h,001h,000h,003h,002h,002h,006h,023h,009h,025h,026h,02dh,018h,00eh,00ah,000h	; 975f  .......#.%&-....
	defb 080h,080h,000h,0c0h,040h,040h,080h,048h,040h,0c8h,028h,010h,0e0h,0e0h,090h,080h	; 976f  ....@@.H@.(.....

; ----------------------------------------------------------------------
; DATOS sprite_977F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x977f..0x979f  (32 bytes)
DATA_sprite_977F:
	defb 000h,000h,000h,080h,010h,022h,01ch,002h,000h,000h,010h,020h,000h,010h,000h,000h	; 977f  ....."..... ....
	defb 000h,000h,000h,000h,000h,080h,050h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 978f  ......P.........

; ----------------------------------------------------------------------
; DATOS sprite_979F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x979f..0x97bf  (32 bytes)
DATA_sprite_979F:
	defb 000h,000h,000h,030h,036h,01ch,0feh,02fh,037h,00fh,07eh,01ch,00ch,00eh,000h,000h	; 979f  ...06../7.~.....
	defb 000h,000h,000h,000h,080h,040h,03ah,0dfh,0f0h,080h,000h,000h,000h,080h,000h,000h	; 97af  .....@:.........

; ----------------------------------------------------------------------
; DATOS sprite_97BF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x97bf..0x97df  (32 bytes)
DATA_sprite_97BF:
	defb 000h,000h,000h,000h,010h,080h,0dch,082h,060h,0b8h,00ch,040h,060h,0c0h,010h,000h	; 97bf  ........`..@`...
	defb 000h,000h,000h,000h,000h,000h,000h,040h,050h,000h,000h,000h,000h,000h,000h,000h	; 97cf  .......@P.......

; ----------------------------------------------------------------------
; DATOS sprite_97DF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x97df..0x97ff  (32 bytes)
DATA_sprite_97DF:
	defb 000h,000h,000h,000h,032h,032h,070h,013h,0f9h,074h,02fh,07bh,018h,010h,00eh,000h	; 97df  ....22p..t/{....
	defb 000h,000h,000h,000h,080h,000h,028h,0cbh,0dah,078h,000h,000h,000h,000h,080h,000h	; 97ef  ......(..x......

; ----------------------------------------------------------------------
; DATOS sprite_97FF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x97ff..0x981f  (32 bytes)
DATA_sprite_97FF:
	defb 010h,0aah,054h,092h,056h,0a8h,012h,000h,000h,001h,002h,009h,08dh,024h,066h,049h	; 97ff  ..T.V........$fI
	defb 010h,0aah,054h,092h,0d4h,02ah,090h,000h,000h,000h,080h,020h,062h,048h,0cch,024h	; 980f  ..T..*..... bH.$

; ----------------------------------------------------------------------
; DATOS sprite_981F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x981f..0x983f  (32 bytes)
DATA_sprite_981F:
	defb 028h,054h,082h,054h,082h,054h,02ah,000h,000h,001h,002h,009h,08dh,024h,066h,049h	; 981f  (T.T.T*......$fI
	defb 028h,054h,082h,054h,082h,054h,0a8h,000h,000h,000h,080h,020h,062h,048h,0cch,024h	; 982f  (T.T.T..... bH.$

; ----------------------------------------------------------------------
; DATOS sprite_983F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x983f..0x985f  (32 bytes)
DATA_sprite_983F:
	defb 010h,0aah,054h,092h,055h,0a8h,013h,000h,000h,002h,005h,00ah,02ah,008h,013h,006h	; 983f  ..T.U.......*...
	defb 010h,0aah,054h,092h,054h,02ah,010h,000h,000h,000h,000h,040h,0c8h,0a0h,030h,090h	; 984f  ..T.T*.....@..0.

; ----------------------------------------------------------------------
; DATOS sprite_985F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x985f..0x987f  (32 bytes)
DATA_sprite_985F:
	defb 010h,0aah,054h,092h,055h,0a8h,011h,000h,000h,000h,001h,004h,026h,00ah,019h,012h	; 985f  ..T.U.......&...
	defb 010h,0aah,054h,092h,054h,02ah,090h,000h,000h,080h,040h,0a0h,0a8h,020h,090h,0c0h	; 986f  ..T.T*....@.. ..

; ----------------------------------------------------------------------
; DATOS sprite_987F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x987f..0x989f  (32 bytes)
DATA_sprite_987F:
	defb 000h,000h,000h,080h,0c0h,010h,046h,070h,09ch,004h,060h,0c0h,010h,000h,000h,000h	; 987f  ......Fp..`.....
	defb 02ah,014h,022h,05dh,022h,014h,02ah,050h,02ah,014h,022h,05dh,022h,014h,02ah,000h	; 988f  *."]".*P*."]".*.

; ----------------------------------------------------------------------
; DATOS sprite_989F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x989f..0x98bf  (32 bytes)
DATA_sprite_989F:
	defb 000h,000h,000h,080h,0c0h,010h,046h,070h,09ch,004h,060h,0c0h,010h,000h,000h,000h	; 989f  ......Fp..`.....
	defb 014h,02ah,041h,02ah,041h,02ah,014h,050h,014h,02ah,041h,02ah,041h,02ah,014h,000h	; 98af  .*A*A*.P.*A*A*..

; ----------------------------------------------------------------------
; DATOS sprite_98BF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x98bf..0x98df  (32 bytes)
DATA_sprite_98BF:
	defb 000h,000h,000h,080h,010h,022h,01ch,002h,000h,000h,010h,020h,000h,010h,000h,000h	; 98bf  ....."..... ....
	defb 02ah,014h,022h,05dh,022h,094h,05ah,000h,02ah,014h,022h,05dh,022h,014h,02ah,000h	; 98cf  *."]".Z.*."]".*.

; ----------------------------------------------------------------------
; DATOS sprite_98DF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x98df..0x98ff  (32 bytes)
DATA_sprite_98DF:
	defb 000h,000h,000h,000h,010h,080h,0dch,082h,060h,0b8h,00ch,040h,060h,0c0h,010h,000h	; 98df  ........`..@`...
	defb 02ah,014h,022h,05dh,022h,014h,02ah,040h,05ah,014h,022h,05dh,022h,014h,02ah,000h	; 98ef  *."]".*@Z."]".*.

; ----------------------------------------------------------------------
; DATOS sprite_98FF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x98ff..0x991f  (32 bytes)
DATA_sprite_98FF:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,002h,003h,004h,000h,005h,006h,00bh	; 98ff  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,080h,040h,000h,040h,0c0h,0a0h	; 990f  ...........@.@..

; ----------------------------------------------------------------------
; DATOS sprite_991F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x991f..0x993f  (32 bytes)
DATA_sprite_991F:
	defb 011h,014h,006h,003h,015h,018h,028h,0e8h,008h,004h,004h,035h,036h,004h,004h,000h	; 991f  ......(....56...
	defb 010h,050h,0c0h,080h,050h,030h,028h,02eh,021h,040h,040h,058h,0d8h,040h,040h,000h	; 992f  .P..P0(.!@@X.@@.

; ----------------------------------------------------------------------
; DATOS sprite_993F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x993f..0x995f  (32 bytes)
DATA_sprite_993F:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,002h,000h,002h,002h,000h,003h,001h	; 993f  ................
	defb 003h,004h,000h,009h,004h,02eh,023h,008h,00ch,00ah,0a4h,095h,017h,0f7h,09bh,06ah	; 994f  ......#........j

; ----------------------------------------------------------------------
; DATOS sprite_995F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x995f..0x997f  (32 bytes)
DATA_sprite_995F:
	defb 080h,040h,000h,020h,040h,0e8h,088h,020h,060h,0a0h,04ah,052h,0d0h,0deh,0b3h,0adh	; 995f  .@. @.. `.JR....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,000h,080h,080h,000h,080h,000h	; 996f  ................

; ----------------------------------------------------------------------
; DATOS sprite_997F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x997f..0x999f  (32 bytes)
DATA_sprite_997F:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,003h,003h,003h,000h,000h,006h,005h,003h	; 997f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,000h,080h,000h,000h	; 998f  ................

; ----------------------------------------------------------------------
; DATOS sprite_999F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x999f..0x99bf  (32 bytes)
DATA_sprite_999F:
	defb 002h,001h,005h,007h,00ah,050h,018h,018h,068h,004h,009h,01fh,01eh,001h,005h,000h	; 999f  .....P..h.......
	defb 020h,0a0h,080h,000h,0a0h,062h,070h,058h,0c6h,080h,000h,0b0h,0b0h,000h,000h,000h	; 99af   ....bpX........

; ----------------------------------------------------------------------
; DATOS sprite_99BF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x99bf..0x99df  (32 bytes)
DATA_sprite_99BF:
	defb 007h,004h,000h,00ah,00ch,01dh,016h,000h,000h,045h,00ch,046h,047h,017h,07ah,026h	; 99bf  .........E.FG.z&
	defb 000h,080h,000h,0c0h,0c0h,0d0h,010h,040h,0c0h,042h,088h,08ah,0a2h,038h,06eh,0dch	; 99cf  .......@.B...8n.

; ----------------------------------------------------------------------
; DATOS sprite_99DF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x99df..0x99ff  (32 bytes)
DATA_sprite_99DF:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,001h,002h,000h,002h,001h,001h	; 99df  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,080h,000h,000h,0c0h,040h,080h	; 99ef  ..............@.

; ----------------------------------------------------------------------
; DATOS sprite_99FF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x99ff..0x9a1f  (32 bytes)
DATA_sprite_99FF:
	defb 008h,00bh,003h,001h,00ah,08ch,01ch,034h,0c6h,002h,001h,01bh,01ah,001h,001h,000h	; 99ff  .......4........
	defb 080h,000h,040h,0c0h,0a0h,004h,030h,030h,02ch,040h,060h,0f0h,0f0h,000h,040h,000h	; 9a0f  ..@...00,@`...@.

; ----------------------------------------------------------------------
; DATOS sprite_9A1F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9a1f..0x9a3f  (32 bytes)
DATA_sprite_9A1F:
	defb 001h,002h,000h,006h,006h,017h,010h,004h,006h,085h,022h,0a2h,08bh,039h,0ech,076h	; 9a1f  .........."..9.v
	defb 0c0h,040h,000h,0a0h,060h,070h,0d0h,000h,000h,044h,070h,0c4h,0c4h,0d0h,0bch,0c8h	; 9a2f  .@..`p...Dp.....

; ----------------------------------------------------------------------
; DATOS sprite_9A3F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9a3f..0x9a5f  (32 bytes)
DATA_sprite_9A3F:
	defb 018h,014h,01ah,011h,002h,009h,010h,0f0h,008h,031h,032h,002h,000h,000h,000h,000h	; 9a3f  .........12.....
	defb 000h,000h,000h,000h,020h,09bh,0b8h,04ch,0c1h,000h,000h,040h,000h,000h,000h,000h	; 9a4f  .... ..L...@....

; ----------------------------------------------------------------------
; DATOS sprite_9A5F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9a5f..0x9a7f  (32 bytes)
DATA_sprite_9A5F:
	defb 000h,000h,000h,000h,000h,000h,0c0h,06eh,080h,000h,000h,000h,000h,000h,000h,000h	; 9a5f  .......n........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9a6f  ................

; ----------------------------------------------------------------------
; DATOS sprite_9A7F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9a7f..0x9a9f  (32 bytes)
DATA_sprite_9A7F:
	defb 000h,080h,040h,0e0h,0d8h,066h,0f4h,0fbh,033h,06ch,0c0h,05ah,000h,000h,000h,000h	; 9a7f  ..@..f..3l.Z....
	defb 000h,000h,000h,000h,000h,040h,071h,039h,0a6h,030h,000h,000h,000h,000h,000h,000h	; 9a8f  .....@q9.0......

; ----------------------------------------------------------------------
; DATOS sprite_9A9F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9a9f..0x9abf  (32 bytes)
DATA_sprite_9A9F:
	defb 000h,000h,018h,01ah,010h,030h,0b0h,000h,0f8h,000h,030h,030h,000h,000h,002h,000h	; 9a9f  .....0....00....
	defb 000h,000h,000h,040h,003h,0cch,030h,000h,000h,018h,020h,000h,080h,000h,040h,000h	; 9aaf  ...@..0... ...@.

; ----------------------------------------------------------------------
; DATOS sprite_9ABF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9abf..0x9adf  (32 bytes)
DATA_sprite_9ABF:
	defb 000h,000h,000h,000h,000h,060h,00eh,00eh,010h,000h,000h,000h,000h,000h,000h,000h	; 9abf  .....`..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9acf  ................

; ----------------------------------------------------------------------
; DATOS sprite_9ADF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9adf..0x9aff  (32 bytes)
DATA_sprite_9ADF:
	defb 000h,000h,000h,05ah,066h,0b3h,0bch,0ffh,07fh,0feh,0bch,0b8h,074h,0e0h,05ah,000h	; 9adf  ...Zf.......t.Z.
	defb 000h,000h,000h,000h,000h,039h,0dfh,0ffh,0feh,018h,030h,000h,000h,000h,000h,000h	; 9aef  .....9....0.....

; ----------------------------------------------------------------------
; DATOS sprite_9AFF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9aff..0x9b1f  (32 bytes)
DATA_sprite_9AFF:
	defb 000h,000h,000h,01ah,019h,015h,0dah,010h,0f8h,016h,003h,030h,031h,001h,002h,002h	; 9aff  ...........01...
	defb 000h,000h,000h,040h,000h,060h,018h,033h,01dh,02ch,0c0h,0e6h,080h,000h,000h,040h	; 9b0f  ...@.`.3.,.....@

; ----------------------------------------------------------------------
; DATOS sprite_9B1F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9b1f..0x9b3f  (32 bytes)
DATA_sprite_9B1F:
	defb 000h,000h,000h,000h,000h,000h,0c0h,04eh,08eh,050h,000h,000h,000h,000h,000h,000h	; 9b1f  .......N.P......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9b2f  ................

; ----------------------------------------------------------------------
; DATOS sprite_9B3F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9b3f..0x9b5f  (32 bytes)
DATA_sprite_9B3F:
	defb 000h,000h,000h,05ah,020h,088h,05eh,0f8h,032h,09dh,0c3h,070h,0a0h,06ch,0c0h,05ah	; 9b3f  ...Z .^.2..p.l.Z
	defb 000h,000h,000h,000h,060h,038h,073h,049h,021h,03ah,0b8h,000h,060h,000h,000h,000h	; 9b4f  ....`8sI!:..`...

; ----------------------------------------------------------------------
; DATOS sprite_9B5F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9b5f..0x9b7f  (32 bytes)
DATA_sprite_9B5F:
	defb 010h,0aah,054h,092h,054h,0aah,010h,000h,002h,002h,003h,004h,000h,005h,006h,00bh	; 9b5f  ..T.T...........
	defb 010h,0aah,054h,092h,054h,0aah,010h,000h,080h,080h,080h,040h,000h,040h,0c0h,0a0h	; 9b6f  ..T.T......@.@..

; ----------------------------------------------------------------------
; DATOS sprite_9B7F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9b7f..0x9b9f  (32 bytes)
DATA_sprite_9B7F:
	defb 028h,054h,082h,054h,082h,054h,028h,000h,002h,002h,003h,004h,000h,005h,006h,00bh	; 9b7f  (T.T.T(.........
	defb 028h,054h,082h,054h,082h,054h,028h,000h,080h,080h,080h,040h,000h,040h,0c0h,0a0h	; 9b8f  (T.T.T(....@.@..

; ----------------------------------------------------------------------
; DATOS sprite_9B9F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9b9f..0x9bbf  (32 bytes)
DATA_sprite_9B9F:
	defb 010h,0aah,054h,092h,054h,0aah,010h,000h,003h,003h,003h,000h,000h,006h,005h,003h	; 9b9f  ..T.T...........
	defb 010h,0aah,054h,092h,054h,0aah,010h,000h,000h,000h,000h,080h,000h,080h,000h,000h	; 9baf  ..T.T...........

; ----------------------------------------------------------------------
; DATOS sprite_9BBF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9bbf..0x9bdf  (32 bytes)
DATA_sprite_9BBF:
	defb 010h,0aah,054h,092h,054h,0aah,010h,000h,001h,001h,001h,002h,000h,002h,001h,001h	; 9bbf  ..T.T...........
	defb 010h,0aah,054h,092h,054h,0aah,010h,000h,080h,080h,080h,000h,000h,0c0h,040h,080h	; 9bcf  ..T.T.........@.

; ----------------------------------------------------------------------
; DATOS sprite_9BDF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9bdf..0x9bff  (32 bytes)
DATA_sprite_9BDF:
	defb 000h,000h,000h,000h,000h,000h,0c0h,06eh,080h,000h,000h,000h,000h,000h,000h,000h	; 9bdf  .......n........
	defb 054h,028h,044h,0bah,044h,028h,054h,000h,054h,028h,044h,0bah,044h,028h,054h,000h	; 9bef  T(D.D(T.T(D.D(T.

; ----------------------------------------------------------------------
; DATOS sprite_9BFF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9bff..0x9c1f  (32 bytes)
DATA_sprite_9BFF:
	defb 000h,000h,000h,000h,000h,000h,0c0h,06eh,080h,000h,000h,000h,000h,000h,000h,000h	; 9bff  .......n........
	defb 028h,054h,082h,054h,082h,054h,028h,000h,028h,054h,082h,054h,082h,054h,028h,000h	; 9c0f  (T.T.T(.(T.T.T(.

; ----------------------------------------------------------------------
; DATOS sprite_9C1F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9c1f..0x9c3f  (32 bytes)
DATA_sprite_9C1F:
	defb 000h,000h,000h,000h,000h,060h,00eh,00eh,010h,000h,000h,000h,000h,000h,000h,000h	; 9c1f  .....`..........
	defb 054h,028h,044h,0bah,044h,028h,054h,000h,054h,028h,044h,0bah,044h,028h,054h,000h	; 9c2f  T(D.D(T.T(D.D(T.

; ----------------------------------------------------------------------
; DATOS sprite_9C3F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9c3f..0x9c5f  (32 bytes)
DATA_sprite_9C3F:
	defb 000h,000h,000h,000h,000h,000h,0c0h,04eh,08eh,050h,000h,000h,000h,000h,000h,000h	; 9c3f  .......N.P......
	defb 054h,028h,044h,0bah,044h,028h,054h,000h,054h,028h,044h,0bah,044h,028h,054h,000h	; 9c4f  T(D.D(T.T(D.D(T.

; ----------------------------------------------------------------------
; DATOS sprite_9C5F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9c5f..0x9c7f  (32 bytes)
DATA_sprite_9C5F:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9c5f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9c6f  ................

; ----------------------------------------------------------------------
; DATOS sprite_9C7F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9c7f..0x9c9f  (32 bytes)
DATA_sprite_9C7F:
	defb 000h,000h,000h,000h,003h,00ch,03fh,0d0h,026h,018h,00eh,003h,000h,000h,000h,000h	; 9c7f  ......?.&.......
	defb 000h,000h,000h,000h,0c0h,070h,018h,064h,00bh,0fch,030h,0c0h,000h,000h,000h,000h	; 9c8f  .....p.d..0.....

; ----------------------------------------------------------------------
; DATOS sprite_9C9F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9c9f..0x9cbf  (32 bytes)
DATA_sprite_9C9F:
	defb 000h,000h,000h,000h,000h,003h,000h,02fh,019h,007h,001h,000h,000h,000h,000h,000h	; 9c9f  ......./........
	defb 000h,000h,000h,000h,000h,080h,0e0h,098h,0f4h,000h,0c0h,000h,000h,000h,000h,000h	; 9caf  ................

; ----------------------------------------------------------------------
; DATOS sprite_9CBF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9cbf..0x9cdf  (32 bytes)
DATA_sprite_9CBF:
	defb 000h,000h,000h,000h,000h,000h,000h,005h,000h,000h,000h,000h,000h,000h,000h,000h	; 9cbf  ................
	defb 000h,000h,000h,00fh,036h,008h,074h,0c0h,036h,0c8h,036h,00dh,003h,000h,000h,000h	; 9ccf  ....6.t.6.6.....

; ----------------------------------------------------------------------
; DATOS sprite_9CDF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9cdf..0x9cff  (32 bytes)
DATA_sprite_9CDF:
	defb 000h,000h,000h,0c0h,0b0h,06ch,013h,06ch,003h,02eh,010h,06ch,0f0h,000h,000h,000h	; 9cdf  .....l.l...l....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0a0h,000h,000h,000h,000h,000h,000h,000h	; 9cef  ................

; ----------------------------------------------------------------------
; DATOS sprite_9CFF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9cff..0x9d1f  (32 bytes)
DATA_sprite_9CFF:
	defb 000h,000h,000h,000h,001h,007h,00bh,03fh,009h,007h,001h,000h,000h,000h,000h,000h	; 9cff  .......?........
	defb 000h,000h,000h,000h,000h,080h,0e0h,090h,0fch,0d0h,0e0h,080h,000h,000h,000h,000h	; 9d0f  ................

; ----------------------------------------------------------------------
; DATOS sprite_9D1F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9d1f..0x9d3f  (32 bytes)
DATA_sprite_9D1F:
	defb 000h,000h,000h,000h,000h,000h,000h,017h,001h,000h,000h,000h,000h,000h,000h,000h	; 9d1f  ................
	defb 000h,000h,007h,008h,027h,01fh,07ch,040h,0f6h,07ch,00fh,013h,00ch,003h,000h,000h	; 9d2f  ....'.|@.|......

; ----------------------------------------------------------------------
; DATOS sprite_9D3F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9d3f..0x9d5f  (32 bytes)
DATA_sprite_9D3F:
	defb 000h,000h,0c0h,030h,0c8h,0f0h,03eh,06fh,002h,03eh,0f8h,0e4h,010h,0e0h,000h,000h	; 9d3f  ...0..>o.>......
	defb 000h,000h,000h,000h,000h,000h,000h,080h,0e8h,000h,000h,000h,000h,000h,000h,000h	; 9d4f  ................

; ----------------------------------------------------------------------
; DATOS sprite_9D5F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9d5f..0x9d7f  (32 bytes)
DATA_sprite_9D5F:
	defb 000h,000h,000h,000h,000h,000h,003h,0bfh,009h,003h,000h,000h,000h,000h,000h,000h	; 9d5f  ................
	defb 000h,000h,000h,000h,000h,000h,0c0h,090h,0fdh,0c0h,000h,000h,000h,000h,000h,000h	; 9d6f  ................

; ----------------------------------------------------------------------
; DATOS sprite_9D7F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9d7f..0x9d9f  (32 bytes)
DATA_sprite_9D7F:
	defb 000h,000h,000h,000h,000h,000h,000h,0b7h,000h,000h,000h,000h,000h,000h,000h,000h	; 9d7f  ................
	defb 000h,001h,008h,000h,000h,001h,00fh,0e4h,03ah,007h,001h,000h,000h,010h,001h,000h	; 9d8f  ........:.......

; ----------------------------------------------------------------------
; DATOS sprite_9D9F: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9d9f..0x9dbf  (32 bytes)
DATA_sprite_9D9F:
	defb 000h,080h,008h,000h,000h,080h,0e0h,05ch,027h,0f0h,080h,000h,000h,010h,080h,000h	; 9d9f  .......\'.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0edh,000h,000h,000h,000h,000h,000h,000h	; 9daf  ................

; ----------------------------------------------------------------------
; DATOS sprite_9DBF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x962F
;   (p01:6094: outi x 0x20); lo leen p01:6096 (32 bytes)
;   0x9dbf..0x9ddf  (32 bytes)
DATA_sprite_9DBF:
	defb 000h,000h,000h,000h,000h,000h,000h,01bh,005h,000h,000h,000h,000h,000h,000h,000h	; 9dbf  ................
	defb 000h,000h,000h,000h,000h,000h,000h,0a0h,0d8h,000h,000h,000h,000h,000h,000h,000h	; 9dcf  ................

; ----------------------------------------------------------------------
; DATOS sprite_9DDF: 32 bytes de dibujo de sprite (16 x 16) de la tabla 0x95F7
;   (p01:6094: outi x 0x20); se solapan 3 bloques: (sprites_9DDF 9DDF-9E1F)
;   (sprite_9DFF 9DFF-9E1F); lo leen p01:6096, p00:55A9 (64 bytes)
;   0x9ddf..0x9e1f  (64 bytes)
DATA_sprite_9DDF:
	defb 000h,000h,000h,080h,0c0h,010h,046h,070h,09ch,004h,060h,0c0h,010h,000h,000h,000h	; 9ddf  ......Fp..`.....
	defb 000h,000h,000h,000h,000h,000h,000h,050h,000h,000h,000h,000h,000h,000h,000h,000h	; 9def  .......P........
	defb 000h,000h,030h,030h,030h,03ah,01bh,0f8h,076h,02fh,079h,010h,00eh,000h,000h,000h	; 9dff  ..000:..v/y.....
	defb 000h,000h,000h,000h,000h,000h,088h,0dah,030h,080h,000h,000h,080h,000h,000h,000h	; 9e0f  ........0.......

; ----------------------------------------------------------------------
; DATOS estrellas_9E1F: 32 bytes, uno por (0xE302 & 0x1F), que leen p00:4AD5 y
;   p00:4B97 (21 filas) para poner los caracteres 0x50/0x51 del fondo; lo leen
;   p00:4ADA (32 bytes)
;   0x9e1f..0x9e3f  (32 bytes)
DATA_estrellas_9E1F:
	defb 002h,00fh,005h,013h,00ah,001h,00dh,006h,011h,008h,00bh,002h,010h,007h,00dh,005h	; 9e1f  ................
	defb 012h,00ch,002h,012h,009h,00eh,014h,011h,002h,005h,00dh,00ah,013h,006h,00fh,009h	; 9e2f  ................

; ----------------------------------------------------------------------
; DATOS estrellas_9E3F: 32 bytes, uno por (0xE302 & 0x1F), que leen p00:4AF9
;   (32 columnas) para poner los caracteres 0x50/0x51 del fondo; lo leen
;   p00:4AFE (32 bytes)
;   0x9e3f..0x9e5f  (32 bytes)
DATA_estrellas_9E3F:
	defb 01fh,009h,017h,00eh,003h,01ch,002h,008h,00dh,014h,00bh,01dh,000h,007h,00ah,010h	; 9e3f  ................
	defb 01eh,00ch,006h,019h,013h,004h,012h,018h,005h,00fh,01bh,016h,001h,015h,01ah,011h	; 9e4f  ................

; ----------------------------------------------------------------------
; DATOS relleno_ff: 417 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (417 bytes)
;   0x9e5f..0xa000  (417 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e5f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e6f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e7f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e8f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9e9f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9eaf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9ebf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9ecf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9edf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9eef  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9eff  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f0f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f1f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f2f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f3f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f4f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f5f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f6f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f7f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f8f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f9f  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9faf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fbf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fcf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fdf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fef  ................
	defb 0ffh	; 9fff
