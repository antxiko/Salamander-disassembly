; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 10 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ======================================================================
; CODIGO 0x8000..0x81a9  (425 bytes)
; ======================================================================


L_8000:
	call 041c7h		;8000   ; banco_9_en_a000: pone el banco 9 en 0xA000 (y su copia en 0xF0F1-3)
	ld hl,00001h		;8003
	ld (0e21ch),hl		;8006
	ld hl,0a505h		;8009
	ld (0e220h),hl		;800c
	ld hl,0a572h		;800f
	ld (0e222h),hl		;8012
	ld hl,0a593h		;8015
	ld (0e224h),hl		;8018
L_801B:
	jp 04199h		;801b   ; bancos_10_15: pone el banco 10 en 0x8000 y el 15 en 0xA000 (y su copia en 0xF0F1-3)
L_801E:
	ld (0e63ah),a		;801e   ; guarda el menu o pantalla de la presentacion (0xE63A & 0x0F)
	call 041c7h		;8021   ; banco_9_en_a000: pone el banco 9 en 0xA000 (y su copia en 0xF0F1-3)
	call 04708h		;8024
	jr L_801B		;8027
L_8029:
	ld a,001h		;8029
	jr L_802E		;802b
L_802D:
	xor a			;802d
L_802E:
	ld (0e639h),a		;802e
	call 041bfh		;8031   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a32ah		;8034
	jr L_801B		;8037
L_8039:
	call 041bfh		;8039   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call 0b957h		;803c
	call 0b8d7h		;803f
	jr L_801B		;8042
ventana_menu:		; pinta la ventana del menu B
	ld a,b			;8044
	push bc			;8045
	and 0f0h		;8046
	rrca			;8048
	ld d,a			;8049
	ld e,000h		;804a
	ld (0f012h),de		;804c
	ld hl,02000h		;8050
	add hl,de			;8053
	ld (0f010h),hl		;8054
	call 041bfh		;8057   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call 0b9bfh		;805a
	call 041c3h		;805d   ; banco_15_en_a000: pone el banco 15 en 0xA000 (y su copia en 0xF0F1-3)
	ld hl,(0f010h)		;8060
	ld de,00190h		;8063
	add hl,de			;8066
	ld de,0a912h		;8067
	call 04d16h		;806a   ; rachas: descomprime las rachas de DE en la VRAM HL
	pop bc			;806d
	ld a,b			;806e
	and 00fh		;806f
	ld hl,0a8f8h		;8071
	call 04e31h		;8074   ; palabra_a_hl: HL = la palabra HL + 2 x A
	ld b,(hl)			;8077
L_8078:
	push bc			;8078
	inc hl			;8079
	ld a,(hl)			;807a
	push hl			;807b
	ld hl,0a90ah		;807c
	call 04e28h		;807f   ; palabra_de_hl: DE = la palabra HL + 2 x A
	pop hl			;8082
	inc hl			;8083
	ld a,(hl)			;8084
	push hl			;8085
	ld h,000h		;8086
	ld l,a			;8088
	add hl,hl			;8089
	add hl,hl			;808a
	add hl,hl			;808b
	ld b,h			;808c
	ld c,l			;808d
	pop hl			;808e
	inc hl			;808f
	ld a,(hl)			;8090
	push hl			;8091
	push bc			;8092
	ld h,000h		;8093
	ld l,a			;8095
	add hl,hl			;8096
	add hl,hl			;8097
	add hl,hl			;8098
	ld bc,(0f010h)		;8099
	add hl,bc			;809d
	pop bc			;809e
	call 04cbdh		;809f   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	pop hl			;80a2
	pop bc			;80a3
	djnz L_8078		;80a4
	ld hl,00070h		;80a6
	ld de,(0f012h)		;80a9
	add hl,de			;80ad
	ld bc,00790h		;80ae
	ld a,0f0h		;80b1
	call 00056h		;80b3   ; BIOS FILVRM - Fills VRAM with value
	jp L_801B		;80b6
L_80B9:
	ld b,0e0h		;80b9
	call 05138h		;80bb
	call L_8039		;80be
	ld hl,02200h		;80c1
	ld de,0a03ch		;80c4
	call 04ce5h		;80c7   ; rachas_3: las rachas de DE en la VRAM HL, en los tres tercios
	ld hl,00200h		;80ca
	ld de,0a475h		;80cd
	call 04ce5h		;80d0   ; rachas_3: las rachas de DE en la VRAM HL, en los tres tercios
	ld hl,01800h		;80d3
	ld de,0a745h		;80d6
	jp 04d16h		;80d9   ; rachas: descomprime las rachas de DE en la VRAM HL
graficos_menu:		; con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	call 041c7h		;80dc   ; banco_9_en_a000: pone el banco 9 en 0xA000 (y su copia en 0xF0F1-3)
	ld a,b			;80df
	ld (0e63ah),a		;80e0   ; guarda el menu o pantalla de la presentacion (0xE63A & 0x0F)
	call caracteres_menu		;80e3   ; caracteres_menu: la lista de caracteres de la entrada B & 0x0F de 0xA4BF
	xor a			;80e6
	ld (0f000h),a		;80e7
	ld hl,0a4cbh		;80ea
	ld a,(0e63ah)		;80ed   ; lee el menu o pantalla de la presentacion (0xE63A & 0x0F)
	and 00fh		;80f0
	call 044f3h		;80f2   ; copias_de_tabla: la lista de copias VRAM -> VRAM de la entrada A de la tabla HL
	ld hl,0f000h		;80f5
	inc (hl)			;80f8
	ld hl,0a4d7h		;80f9
	ld a,(0e63ah)		;80fc   ; lee el menu o pantalla de la presentacion (0xE63A & 0x0F)
	and 00fh		;80ff
	call 044f3h		;8101   ; copias_de_tabla: la lista de copias VRAM -> VRAM de la entrada A de la tabla HL
	jp L_801B		;8104
caracteres_menu:		; la lista de caracteres de la entrada B & 0x0F de 0xA4BF
	and 00fh		;8107
	ld hl,0a4bfh		;8109
	call 04e28h		;810c   ; palabra_de_hl: DE = la palabra HL + 2 x A
	push de			;810f
	pop ix		;8110
L_8112:
	ld a,(ix+000h)		;8112
	and a			;8115
	ret z			;8116
	dec ix		;8117
	push bc			;8119
	bit 4,b		;811a
	ld de,00000h		;811c
	call nz,0456dh		;811f
	pop bc			;8122
	push bc			;8123
	bit 5,b		;8124
	ld de,00800h		;8126
	call nz,0456dh		;8129
	pop bc			;812c
	push bc			;812d
	bit 6,b		;812e
	ld de,01000h		;8130
	call nz,0456dh		;8133
	pop bc			;8136
	ld de,00006h		;8137
	add ix,de		;813a
	jr L_8112		;813c
L_813E:
	call 04eafh		;813e   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	call 04ca4h		;8141   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call 05f66h		;8144
	ld hl,03884h		;8147
	ld de,0bbc0h		;814a
	ld bc,00918h		;814d
L_8150:
	push bc			;8150
	ld b,000h		;8151
	call 04cbdh		;8153   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	ld bc,00020h		;8156
	add hl,bc			;8159
	pop bc			;815a
	ld a,b			;815b
	cp 003h		;815c
	ld a,020h		;815e
	jr z,L_8163		;8160
	xor a			;8162
L_8163:
	call 040c4h		;8163   ; hl_mas_a: HL = HL + A
	ld a,b			;8166
	rra			;8167
	ld a,004h		;8168
	jr c,L_816D		;816a
	xor a			;816c
L_816D:
	call 040c9h		;816d   ; de_mas_a: DE = DE + A
	djnz L_8150		;8170
	ld hl,08846h		;8172
	ld de,0ef80h		;8175   ; apunta a los atributos de sprite en la RAM (32 x 4)
	ld b,01ch		;8178
L_817A:
	push bc			;817a
	ld a,(hl)			;817b
	sub 018h		;817c
	ld (de),a			;817e
	inc de			;817f
	inc hl			;8180
	ld a,(hl)			;8181
	ld (de),a			;8182
	inc de			;8183
	dec hl			;8184
	dec hl			;8185
	dec hl			;8186
	ld a,b			;8187
	dec a			;8188
	add a,a			;8189
	add a,a			;818a
	ld (de),a			;818b
	inc de			;818c
	inc de			;818d
	pop bc			;818e
	djnz L_817A		;818f
	ld hl,0efe4h		;8191
	ld de,0efd8h		;8194
	ld bc,00004h		;8197
	ldir		;819a
	xor a			;819c
	ld (0ee06h),a		;819d
	call L_876B		;81a0
L_81A3:
	call L_8313		;81a3
	jp L_87C9		;81a6

; ----------------------------------------------------------------------
; DATOS lista_81A9: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:52DB (61 bytes)
;   0x81a9..0x81e6  (61 bytes)
DATA_lista_81A9:
	defb 00ah,038h,01ah,02bh,02fh,02eh,021h,02dh,029h,000h,011h,019h,018h,017h,0feh,0ebh	; 81a9  .8.+/.!-).......
	defb 039h,030h,02ch,021h,039h,000h,033h,025h,02ch,025h,023h,034h,0feh,02dh,03ah,011h	; 81b9  90,!9.3%,%#4.-:.
	defb 030h,02ch,021h,039h,025h,032h,0feh,06dh,03ah,025h,038h,023h,028h,021h,02eh,027h	; 81c9  0,!9%2.m:%8#(!.'
	defb 025h,0feh,0adh,03ah,024h,035h,021h,02ch,030h,02ch,021h,039h,0ffh	; 81d9  %..:$5!,0,!9.

; ======================================================================
; CODIGO 0x81e6..0x81ed  (7 bytes)
; ======================================================================


L_81E6:
	ld a,(0e217h)		;81e6
	dec a			;81e9
	call 040ceh		;81ea   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_81ED: 37 destinos del despachador p00:40CE (call en p10:81EA, el
;   indice en A): 8237, 828D, 82AD, 82E9, 8351, 8377, 8393, 83E2, 83FA, 8412,
;   8426, 843D, 844C, 846A, 8476, 8480, 849A, 84B1, 84C0, 84E4, 850D, 851F,
;   8530, 8542, 855C, 857A, 858C, 859D, 85B4, 85CE, 85DE, 85F2, 8623, 8641,
;   82AD, 82E9, 8351; lo leen p10:81EA (74 bytes)
;   0x81ed..0x8237  (74 bytes)
DATA_tabla_81ED:
	defw 08237h,0828dh,082adh,082e9h,08351h,08377h,08393h,083e2h	; 81ed
	defw 083fah,08412h,08426h,0843dh,0844ch,0846ah,08476h,08480h	; 81fd
	defw 0849ah,084b1h,084c0h,084e4h,0850dh,0851fh,08530h,08542h	; 820d
	defw 0855ch,0857ah,0858ch,0859dh,085b4h,085ceh,085deh,085f2h	; 821d
	defw 08623h,08641h,082adh,082e9h,08351h	; 822d

; ======================================================================
; CODIGO 0x8237..0x8288  (81 bytes)
; ======================================================================


L_8237:
	call L_8265		;8237
	call 04ca4h		;823a   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call 04eafh		;823d   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	call L_8039		;8240
	xor a			;8243
	ld (0ee33h),a		;8244
	ld (0ee08h),a		;8247
	ld (0ee32h),a		;824a
	ld a,029h		;824d
	call 04d6eh		;824f   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_8252:
	ld a,090h		;8252
	ld (0ee02h),a		;8254
	call L_827F		;8257
L_825A:
	ld hl,00000h		;825a
	ld (0f0f7h),hl		;825d   ; guarda la cuenta de interrupciones (16 bits)
	ld hl,0e217h		;8260
	inc (hl)			;8263
	ret			;8264
L_8265:
	call borra_c700		;8265   ; borra_c700: borra 0xC700-0xCFFF
	call 04ca4h		;8268   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call 04eafh		;826b   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	ld hl,0ed00h		;826e
	ld bc,001ffh		;8271
	call L_87FB		;8274
	ld a,001h		;8277
	ld (0e63ah),a		;8279   ; guarda el menu o pantalla de la presentacion (0xE63A & 0x0F)
	jp 05f66h		;827c
L_827F:
	ld hl,01fe0h		;827f
	ld de,08288h		;8282
	jp 04d16h		;8285   ; rachas: descomprime las rachas de DE en la VRAM HL

; ----------------------------------------------------------------------
; DATOS rachas_8288: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:8285 (5 bytes)
;   0x8288..0x828d  (5 bytes)
DATA_rachas_8288:
	defb 081h,080h,01fh,000h,000h	; 8288

; ======================================================================
; CODIGO 0x828d..0x83f7  (362 bytes)
; ======================================================================


L_828D:
	call L_9C4D		;828d
	call L_9681		;8290
	ld a,(0ee32h)		;8293
	and a			;8296
	ret z			;8297
L_8298:
	call 04eafh		;8298   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	call 04ca4h		;829b   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	xor a			;829e
	ld (0ee03h),a		;829f
	ld (0ee04h),a		;82a2
	call borra_c700		;82a5   ; borra_c700: borra 0xC700-0xCFFF
	call L_80B9		;82a8
	jr $-81		;82ab
L_82AD:
	ld hl,0ee03h		;82ad
	ld a,(hl)			;82b0
	and a			;82b1
	jr nz,L_82DC		;82b2
	inc (hl)			;82b4
	ld hl,0ee04h		;82b5
	inc (hl)			;82b8
	ld a,(hl)			;82b9
	cp 00ah		;82ba
	jr nc,L_82CA		;82bc
	dec a			;82be
	ld hl,0bb6fh		;82bf
	call L_95BD		;82c2
	ld a,034h		;82c5
	jp 04d6eh		;82c7   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_82CA:
	call L_876B		;82ca
	xor a			;82cd
	ld (0ee05h),a		;82ce
	ld (0ee06h),a		;82d1
	call L_825A		;82d4
	ld a,04eh		;82d7
	jp 04d6eh		;82d9   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_82DC:
	call L_95CE		;82dc
	ld a,(0ee18h)		;82df
	and a			;82e2
	ret z			;82e3
	xor a			;82e4
	ld (0ee03h),a		;82e5
	ret			;82e8
L_82E9:
	ld hl,0ee05h		;82e9
	ld b,(hl)			;82ec
	inc (hl)			;82ed
	ld a,(hl)			;82ee
	cp 01dh		;82ef
	jr nc,L_8332		;82f1
	ld a,b			;82f3
	cp 016h		;82f4
	call z,L_8343		;82f6
	ld a,b			;82f9
	ld hl,08810h		;82fa
	call 04e28h		;82fd   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld a,01fh		;8300
	sub b			;8302
	add a,a			;8303
	add a,a			;8304
	ld hl,0ef80h		;8305   ; apunta a los atributos de sprite en la RAM (32 x 4)
	call 040c4h		;8308   ; hl_mas_a: HL = HL + A
	ld (hl),e			;830b
	inc l			;830c
	ld (hl),d			;830d
	inc l			;830e
	ld a,b			;830f
	add a,a			;8310
	add a,a			;8311
	ld (hl),a			;8312
L_8313:
	ld hl,0ee06h		;8313
	inc (hl)			;8316
	ld a,(hl)			;8317
	cp 005h		;8318
	jr c,L_831E		;831a
	xor a			;831c
	ld (hl),a			;831d
L_831E:
	ld hl,0880bh		;831e
	call 040c4h		;8321   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;8324
	ld hl,0ef83h		;8325
	ld b,020h		;8328
L_832A:
	ld (hl),c			;832a
	ld a,l			;832b
	add a,004h		;832c
	ld l,a			;832e
	djnz L_832A		;832f
	ret			;8331
L_8332:
	ld a,(0e217h)		;8332
	cp 020h		;8335
	jp c,L_825A		;8337
	ld de,09ed8h		;833a
	call 04cf5h		;833d   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	jp L_825A		;8340
L_8343:
	exx			;8343
	ld hl,0eff4h		;8344
	ld de,0efe8h		;8347
	ld bc,00004h		;834a
	ldir		;834d
	exx			;834f
	ret			;8350
L_8351:
	ld de,00180h		;8351
	call 04da1h		;8354   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jr nc,L_835E		;8357
	call L_87C9		;8359
	jr L_8313		;835c
L_835E:
	call 04eafh		;835e   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	call 04ca4h		;8361   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	ld hl,0e217h		;8364
	ld a,(hl)			;8367
	cp 020h		;8368
	jr nc,L_8374		;836a
	ld a,040h		;836c
	ld (0ee07h),a		;836e
	jp L_825A		;8371
L_8374:
	ld (hl),000h		;8374
	ret			;8376
L_8377:
	ld de,00078h		;8377
	call 04da1h		;837a   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	ret c			;837d
	call L_8039		;837e
	ld hl,00900h		;8381
	ld bc,00100h		;8384
	ld a,090h		;8387
	call 00056h		;8389   ; BIOS FILVRM - Fills VRAM with value
	xor a			;838c
	ld (0ee38h),a		;838d
	jp L_825A		;8390
L_8393:
	ld de,00100h		;8393
	call 04da1h		;8396   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jr c,L_83BB		;8399
	ld a,002h		;839b
	call L_875C		;839d
	ld b,011h		;83a0
	call ventana_menu		;83a2   ; ventana_menu: pinta la ventana del menu B
	ld b,011h		;83a5
	call graficos_menu		;83a7   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	call borra_c700		;83aa   ; borra_c700: borra 0xC700-0xCFFF
	ld hl,0bcaah		;83ad
	call abre_ventana		;83b0   ; abre_ventana: copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	ld a,02eh		;83b3
	call 04d6eh		;83b5   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jp L_825A		;83b8
L_83BB:
	ld hl,0ee38h		;83bb
	ld a,(hl)			;83be
	cp 008h		;83bf
	ret nc			;83c1
	rra			;83c2
	jr c,L_83DA		;83c3
	inc (hl)			;83c5
	inc hl			;83c6
	ld (hl),030h		;83c7
	call 04ca4h		;83c9   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	ld a,017h		;83cc
	call 04d6eh		;83ce   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld de,0394ch		;83d1
	ld bc,00200h		;83d4
	jp L_944C		;83d7
L_83DA:
	inc hl			;83da
	dec (hl)			;83db
	jp nz,L_9497		;83dc
	dec hl			;83df
	inc (hl)			;83e0
	ret			;83e1
L_83E2:
	ld de,00080h		;83e2
	call L_8663		;83e5
	ret c			;83e8
	ld hl,083f7h		;83e9
L_83EC:
	ld e,(hl)			;83ec
	inc hl			;83ed
	ld d,(hl)			;83ee
	inc hl			;83ef
	ld c,(hl)			;83f0
	call L_944A		;83f1
	jp L_825A		;83f4

; ----------------------------------------------------------------------
; DATOS resto_83F7: lo apuntan con el banco puesto p10:83E9 (0x83F7); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:83E9 (3 bytes)
;   0x83f7..0x83fa  (3 bytes)
DATA_resto_83F7:
	defb 044h,039h,001h	; 83f7

; ======================================================================
; CODIGO 0x83fa..0x8423  (41 bytes)
; ======================================================================


L_83FA:
	call L_8675		;83fa
	ld de,00088h		;83fd
	call L_865A		;8400
	ret c			;8403
	ld b,042h		;8404
	call graficos_menu		;8406   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld hl,0bcb1h		;8409
	call abre_ventana		;840c   ; abre_ventana: copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	jp L_825A		;840f
L_8412:
	ld de,00080h		;8412
	call L_8663		;8415
	ret c			;8418
	ld a,002h		;8419
	call L_875C		;841b
	ld hl,08423h		;841e
	jr $-53		;8421

; ----------------------------------------------------------------------
; DATOS resto_8423: lo apuntan con el banco puesto p10:841E (0x8423); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:841E (3 bytes)
;   0x8423..0x8426  (3 bytes)
DATA_resto_8423:
	defb 044h,039h,002h	; 8423

; ======================================================================
; CODIGO 0x8426..0x843a  (20 bytes)
; ======================================================================


L_8426:
	call L_8697		;8426
	ld de,000c0h		;8429
	call L_865A		;842c
	ret c			;842f
	ld a,002h		;8430
	call L_875C		;8432
	ld hl,0843ah		;8435
	jr $-76		;8438

; ----------------------------------------------------------------------
; DATOS resto_843A: lo apuntan con el banco puesto p10:8435 (0x843A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:8435 (3 bytes)
;   0x843a..0x843d  (3 bytes)
DATA_resto_843A:
	defb 044h,039h,003h	; 843a

; ======================================================================
; CODIGO 0x843d..0x851c  (223 bytes)
; ======================================================================


L_843D:
	call L_8675		;843d
	ld de,00080h		;8440
	call 04da1h		;8443   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_9497		;8446
	jp L_825A		;8449
L_844C:
	ld de,00080h		;844c
	call 04da1h		;844f   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,058e9h		;8452
	ld b,033h		;8455
	call graficos_menu		;8457   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld b,021h		;845a
	call ventana_menu		;845c   ; ventana_menu: pinta la ventana del menu B
	ld de,0388ch		;845f
	ld c,000h		;8462
	call L_945C		;8464
	jp L_825A		;8467
L_846A:
	ld de,00080h		;846a
	call L_865A		;846d
	ret c			;8470
	ld c,004h		;8471
	jp L_84A8		;8473
L_8476:
	ld de,00140h		;8476
	call L_865A		;8479
	ret c			;847c
	jp L_825A		;847d
L_8480:
	ld de,00080h		;8480
	call 04da1h		;8483   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,058e9h		;8486
	ld b,022h		;8489
	call graficos_menu		;848b   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	call borra_c700		;848e   ; borra_c700: borra 0xC700-0xCFFF
	ld hl,0bcb8h		;8491
	call abre_ventana		;8494   ; abre_ventana: copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	jp L_825A		;8497
L_849A:
	ld de,00080h		;849a
	call L_8663		;849d
	ret c			;84a0
	ld a,003h		;84a1
	call L_875C		;84a3
	ld c,005h		;84a6
L_84A8:
	ld de,03a24h		;84a8
	call L_944A		;84ab
	jp L_825A		;84ae
L_84B1:
	call L_869C		;84b1
	ld de,001c0h		;84b4
	call 04da1h		;84b7   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_9497		;84ba
	jp L_825A		;84bd
L_84C0:
	ld de,00080h		;84c0
	call 04da1h		;84c3   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,058e9h		;84c6
	ld b,021h		;84c9
	call ventana_menu		;84cb   ; ventana_menu: pinta la ventana del menu B
	ld b,033h		;84ce
	call graficos_menu		;84d0   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	call borra_c700		;84d3   ; borra_c700: borra 0xC700-0xCFFF
	ld hl,0bccdh		;84d6
	call abre_ventana		;84d9   ; abre_ventana: copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	ld a,04dh		;84dc
	call 04d6eh		;84de   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jp L_825A		;84e1
L_84E4:
	ld de,00080h		;84e4
	call L_8663		;84e7
	ret c			;84ea
	ld b,045h		;84eb
	call graficos_menu		;84ed   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld a,001h		;84f0
	ld c,a			;84f2
	ld b,060h		;84f3
	ld hl,01288h		;84f5
	call L_9E13		;84f8
	ld hl,039ffh		;84fb
	ld de,0be81h		;84fe
	call L_8507		;8501
	jp L_825A		;8504
L_8507:
	ld bc,00709h		;8507
	jp L_874E		;850a
L_850D:
	ld de,00080h		;850d
	call 04da1h		;8510   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_9E56		;8513
	ld hl,0851ch		;8516
	jp L_83EC		;8519

; ----------------------------------------------------------------------
; DATOS resto_851C: lo apuntan con el banco puesto p10:8516 (0x851C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:8516 (3 bytes)
;   0x851c..0x851f  (3 bytes)
DATA_resto_851C:
	defb 028h,03ah,006h	; 851c

; ======================================================================
; CODIGO 0x851f..0x852d  (14 bytes)
; ======================================================================


L_851F:
	call L_9497		;851f
	ld a,(0ee21h)		;8522
	and a			;8525
	ret z			;8526
	ld hl,0852dh		;8527
	jp L_83EC		;852a

; ----------------------------------------------------------------------
; DATOS resto_852D: lo apuntan con el banco puesto p10:8527 (0x852D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:8527 (3 bytes)
;   0x852d..0x8530  (3 bytes)
DATA_resto_852D:
	defb 068h,03ah,007h	; 852d

; ======================================================================
; CODIGO 0x8530..0x8589  (89 bytes)
; ======================================================================


L_8530:
	ld de,00100h		;8530
	call L_865A		;8533
	ret c			;8536
	ld a,003h		;8537
	call L_875C		;8539
	call L_86CB		;853c
	jp L_825A		;853f
L_8542:
	ld de,00080h		;8542
	call 04da1h		;8545   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_86E8		;8548
	call L_8803		;854b
	ld hl,0bcd4h		;854e
	call abre_ventana		;8551   ; abre_ventana: copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	ld a,04dh		;8554
	call 04d6eh		;8556   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jp L_825A		;8559
L_855C:
	ld de,00080h		;855c
	call L_8663		;855f
	ret c			;8562
	ld a,001h		;8563
	ld c,a			;8565
	ld b,060h		;8566
	ld hl,01288h		;8568
	call L_9E13		;856b
	ld hl,03a18h		;856e
	ld de,0bec0h		;8571
	call L_8507		;8574
	jp L_825A		;8577
L_857A:
	ld de,00080h		;857a
	call 04da1h		;857d   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_9E56		;8580
	ld hl,08589h		;8583
	jp L_83EC		;8586

; ----------------------------------------------------------------------
; DATOS resto_8589: lo apuntan con el banco puesto p10:8583 (0x8589); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:8583 (3 bytes)
;   0x8589..0x858c  (3 bytes)
DATA_resto_8589:
	defb 022h,03ah,006h	; 8589

; ======================================================================
; CODIGO 0x858c..0x859a  (14 bytes)
; ======================================================================


L_858C:
	call L_9497		;858c
	ld a,(0ee21h)		;858f
	and a			;8592
	ret z			;8593
	ld hl,0859ah		;8594
	jp L_83EC		;8597

; ----------------------------------------------------------------------
; DATOS resto_859A: lo apuntan con el banco puesto p10:8594 (0x859A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:8594 (3 bytes)
;   0x859a..0x859d  (3 bytes)
DATA_resto_859A:
	defb 062h,03ah,008h	; 859a

; ======================================================================
; CODIGO 0x859d..0x86bf  (290 bytes)
; ======================================================================


L_859D:
	ld de,00100h		;859d
	call L_865A		;85a0
	ret c			;85a3
	ld a,003h		;85a4
	call L_875C		;85a6
	ld b,043h		;85a9
	call graficos_menu		;85ab   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	call L_871D		;85ae
	jp L_825A		;85b1
L_85B4:
	ld de,00080h		;85b4
	call 04da1h		;85b7   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_8725		;85ba
	call L_8803		;85bd
	ld b,025h		;85c0
	call graficos_menu		;85c2   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld hl,0bcbfh		;85c5
	call abre_ventana		;85c8   ; abre_ventana: copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	jp L_825A		;85cb
L_85CE:
	ld a,(0ee18h)		;85ce
	and a			;85d1
	jp z,L_95CE		;85d2
	ld hl,0bcc6h		;85d5
	call abre_ventana		;85d8   ; abre_ventana: copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	jp L_825A		;85db
L_85DE:
	ld de,00100h		;85de
	call L_8663		;85e1
	ret c			;85e4
	xor a			;85e5
	ld bc,0ff03h		;85e6
	ld hl,00000h		;85e9
	call L_9E13		;85ec
	jp L_825A		;85ef
L_85F2:
	ld de,00080h		;85f2
	call 04da1h		;85f5   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_9E56		;85f8
	call 04ca4h		;85fb   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	ld b,033h		;85fe
	call graficos_menu		;8600   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld b,021h		;8603
	call ventana_menu		;8605   ; ventana_menu: pinta la ventana del menu B
	ld hl,00000h		;8608
	ld bc,01800h		;860b
	xor a			;860e
	call 00056h		;860f   ; BIOS FILVRM - Fills VRAM with value
	ld de,0388ch		;8612
	ld c,000h		;8615
	call L_8CF0		;8617
	call L_8000		;861a
	call L_866C		;861d
	jp L_825A		;8620
L_8623:
	ld de,000c0h		;8623
	call 04da1h		;8626   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	ld a,035h		;8629
	jp c,L_801E		;862b
	ld b,021h		;862e
	call ventana_menu		;8630   ; ventana_menu: pinta la ventana del menu B
	call L_866C		;8633
	ld c,009h		;8636
	ld de,03a24h		;8638
	call L_944A		;863b
	jp L_8252		;863e
L_8641:
	call L_9C50		;8641
	ld de,00470h		;8644
	call L_865A		;8647
	ret c			;864a
	call 04ca4h		;864b   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call 04eafh		;864e   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	call L_80B9		;8651
	call L_866C		;8654
	jp L_8298		;8657
L_865A:
	call 04da1h		;865a   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	ret nc			;865d
	call L_9497		;865e
	scf			;8661
	ret			;8662
L_8663:
	call 04da1h		;8663   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	ret nc			;8666
	call L_95CE		;8667
	scf			;866a
	ret			;866b
L_866C:
	ld hl,0ed00h		;866c
	ld bc,000ffh		;866f
	jp L_87FB		;8672
L_8675:
	ld hl,0ee40h		;8675
	ld a,(0ee21h)		;8678
	and a			;867b
	jr z,L_8680		;867c
	ld (hl),000h		;867e
L_8680:
	ld a,(hl)			;8680
	inc (hl)			;8681
	rra			;8682
	rra			;8683
	rra			;8684
	rra			;8685
	ld de,086c1h		;8686
	jr c,L_868E		;8689
	ld de,086bfh		;868b
L_868E:
	ld hl,038afh		;868e
	ld bc,00201h		;8691
	jp L_874E		;8694
L_8697:
	ld de,03a8ah		;8697
	jr L_869F		;869a
L_869C:
	ld de,0398ah		;869c
L_869F:
	ld hl,0ee40h		;869f
	ld a,(0ee21h)		;86a2
	and a			;86a5
	jr z,L_86AA		;86a6
	ld (hl),000h		;86a8
L_86AA:
	ld a,(hl)			;86aa
	inc (hl)			;86ab
	rra			;86ac
	rra			;86ad
	rra			;86ae
	rra			;86af
	ex de,hl			;86b0
	ld de,086c3h		;86b1
	jr nc,L_86B9		;86b4
	ld de,086c7h		;86b6
L_86B9:
	ld bc,00202h		;86b9
	jp L_874E		;86bc

; ----------------------------------------------------------------------
; DATOS resto_86BF: lo apuntan con el banco puesto p10:868B (0x86BF), p10:8686
;   (0x86C1), p10:86B1 (0x86C3), p10:86B6 (0x86C7); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p10:868B, p10:8686,
;   p10:86B1, p10:86B6 (12 bytes)
;   0x86bf..0x86cb  (12 bytes)
DATA_resto_86BF:
	defb 029h,031h,041h,040h,032h,033h,03bh,03ch,067h,068h,069h,06ah	; 86bf  )1A@23.<ghij

; ======================================================================
; CODIGO 0x86cb..0x880b  (320 bytes)
; ======================================================================


L_86CB:
	ld hl,03947h		;86cb
	ld de,0bcdbh		;86ce
L_86D1:
	ld a,001h		;86d1
	ld (0ee70h),a		;86d3
	ld a,008h		;86d6
	ld (0ee75h),a		;86d8
	ld a,006h		;86db
	ld (0ee76h),a		;86dd
	ld (0ee71h),hl		;86e0
	ld (0ee73h),de		;86e3
	ret			;86e7
L_86E8:
	xor a			;86e8
	ld (0f000h),a		;86e9
L_86EC:
	ld a,(0ee70h)		;86ec
	and a			;86ef
	ret z			;86f0
	ld hl,0ee76h		;86f1
	dec (hl)			;86f4
	ret nz			;86f5
	ld (hl),006h		;86f6
	call L_872C		;86f8
	ld hl,(0ee71h)		;86fb
	ld de,00020h		;86fe
	ld a,(0f000h)		;8701
	and a			;8704
	jr nz,L_870C		;8705
	or a			;8707
	sbc hl,de		;8708
	jr L_870D		;870a
L_870C:
	add hl,de			;870c
L_870D:
	ld (0ee71h),hl		;870d
	call L_8743		;8710
	ld hl,0ee75h		;8713
	dec (hl)			;8716
	ret nz			;8717
	xor a			;8718
	ld (0ee70h),a		;8719
	ret			;871c
L_871D:
	ld hl,03947h		;871d
	ld de,0bd30h		;8720
	jr L_86D1		;8723
L_8725:
	ld a,001h		;8725
	ld (0f000h),a		;8727
	jr L_86EC		;872a
L_872C:
	ld b,005h		;872c
	ld hl,(0ee71h)		;872e
	dec hl			;8731
	dec hl			;8732
L_8733:
	push bc			;8733
	xor a			;8734
	ld bc,00013h		;8735
	call 00056h		;8738   ; BIOS FILVRM - Fills VRAM with value
	ld bc,00020h		;873b
	add hl,bc			;873e
	pop bc			;873f
	djnz L_8733		;8740
	ret			;8742
L_8743:
	ld c,011h		;8743
	ld b,005h		;8745
L_8747:
	ld hl,(0ee71h)		;8747
	ld de,(0ee73h)		;874a
L_874E:
	push bc			;874e
	ld b,000h		;874f
	call 04cbdh		;8751   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	ld bc,00020h		;8754
	add hl,bc			;8757
	pop bc			;8758
	djnz L_874E		;8759
	ret			;875b
L_875C:
	dec a			;875c
	ld d,a			;875d
	ld e,000h		;875e
	ld hl,03800h		;8760
	add hl,de			;8763
	xor a			;8764
	ld bc,00100h		;8765
	jp 00056h		;8768   ; BIOS FILVRM - Fills VRAM with value
L_876B:
	ld bc,00130h		;876b
	ld de,0ea00h		;876e   ; apunta a los disparos (8 fichas de 0x10 bytes)
	ld hl,00550h		;8771
L_8774:
	call 0004ah		;8774   ; BIOS RDVRM - Reads the content of VRAM
	ld (de),a			;8777
	inc de			;8778
	inc hl			;8779
	dec bc			;877a
	ld a,b			;877b
	or c			;877c
	jr nz,L_8774		;877d
	ld hl,0ea00h		;877f   ; apunta a los disparos (8 fichas de 0x10 bytes)
	ld de,0eb80h		;8782
	ld bc,00130h		;8785
L_8788:
	push bc			;8788
	call L_8796		;8789
	pop bc			;878c
	ld (de),a			;878d
	inc hl			;878e
	inc de			;878f
	dec bc			;8790
	ld a,b			;8791
	or c			;8792
	jr nz,L_8788		;8793
	ret			;8795
L_8796:
	ld a,(hl)			;8796
	ld b,a			;8797
	and 00fh		;8798
	call L_87AF		;879a
	ld a,b			;879d
	ld b,c			;879e
	rrca			;879f
	rrca			;87a0
	rrca			;87a1
	rrca			;87a2
	and 00fh		;87a3
	call L_87AF		;87a5
	ld a,c			;87a8
	rlca			;87a9
	rlca			;87aa
	rlca			;87ab
	rlca			;87ac
	or b			;87ad
	ret			;87ae
L_87AF:
	ld c,00fh		;87af
	cp 00ch		;87b1
	ret z			;87b3
	ld c,00bh		;87b4
	cp 002h		;87b6
	ret z			;87b8
	dec c			;87b9
	cp 003h		;87ba
	ret z			;87bc
	dec c			;87bd
	cp 00bh		;87be
	ret z			;87c0
	ld c,006h		;87c1
	cp 00fh		;87c3
	ret z			;87c5
	ld c,000h		;87c6
	ret			;87c8
L_87C9:
	ld a,(0e203h)		;87c9   ; lee la cuenta de cuadros del juego
	and 008h		;87cc
	ld de,0ea00h		;87ce   ; apunta a los disparos (8 fichas de 0x10 bytes)
	jr z,L_87D6		;87d1
	ld de,0eb80h		;87d3
L_87D6:
	ld bc,00130h		;87d6
	ld hl,00d50h		;87d9
	push de			;87dc
	push bc			;87dd
	call 04cbdh		;87de   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	pop bc			;87e1
	pop de			;87e2
	ld hl,01550h		;87e3
	jp 04cbdh		;87e6   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
L_87E9:
	ld hl,03b00h		;87e9
	ld de,0ef80h		;87ec   ; apunta a los atributos de sprite en la RAM (32 x 4)
	ld bc,00080h		;87ef
	jp 04cbdh		;87f2   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
borra_c700:		; borra 0xC700-0xCFFF
	ld hl,0c700h		;87f5
	ld bc,008ffh		;87f8
L_87FB:
	ld d,h			;87fb
	ld e,l			;87fc
	inc de			;87fd
	ld (hl),000h		;87fe
	ldir		;8800
	ret			;8802
L_8803:
	ld hl,0ca00h		;8803
	ld bc,002ffh		;8806
	jr L_87FB		;8809

; ----------------------------------------------------------------------
; DATOS resto_880B: lo apuntan con el banco puesto p10:831E (0x880B), p10:82FA
;   (0x8810), p10:8F0F (0x8830), p10:8172 (0x8846); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p10:831E, p10:82FA,
;   p10:8F0F, p10:8172 (61 bytes)
;   0x880b..0x8848  (61 bytes)
DATA_resto_880B:
	defb 006h,008h,009h,00ah,00bh,06fh,030h,05fh,040h,02fh,070h,02fh,080h,02fh,090h,02fh	; 880b  .....o0_@/p/././
	defb 0a0h,03fh,0a0h,04fh,0a0h,04fh,090h,05fh,090h,05fh,080h,06fh,078h,06fh,068h,05fh	; 881b  .?.O.O._._.oxoh_
	defb 060h,04fh,060h,04fh,070h,03fh,070h,03fh,080h,02fh,080h,02fh,090h,01fh,098h,02fh	; 882b  `O`Op?p?././.../
	defb 0a0h,01fh,0a8h,00fh,0b0h,01fh,0b8h,00fh,0c0h,01fh,0c8h,00fh,0d0h	; 883b  .............

; ======================================================================
; CODIGO 0x8848..0x884f  (7 bytes)
; ======================================================================


L_8848:
	ld a,(0e217h)		;8848
	dec a			;884b
	call 040ceh		;884c   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_884F: 9 destinos del despachador p00:40CE (call en p10:884C, el
;   indice en A): 8861, 8883, 8898, 88AA, 88D1, 88DB, 88ED, 88FB, 890C; lo
;   leen p10:884C (18 bytes)
;   0x884f..0x8861  (18 bytes)
DATA_tabla_884F:
	defw 08861h,08883h,08898h,088aah,088d1h,088dbh,088edh,088fbh	; 884f
	defw 0890ch	; 885f  -> L_890C

; ======================================================================
; CODIGO 0x8861..0x8a6c  (523 bytes)
; ======================================================================


L_8861:
	call L_8265		;8861
	ld b,034h		;8864
	call graficos_menu		;8866   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	call borra_c700		;8869   ; borra_c700: borra 0xC700-0xCFFF
	call L_8918		;886c
	ld b,034h		;886f
	call L_8AE9		;8871
	call L_8B04		;8874
	xor a			;8877
	ld (0e301h),a		;8878   ; guarda la fase (de 1 a 7; 0 en la presentacion)
	ld a,028h		;887b
	call 04d6eh		;887d   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_8880:
	jp L_825A		;8880
L_8883:
	call L_8934		;8883
	ld a,(0ee75h)		;8886
	and a			;8889
	ret nz			;888a
	call L_895A		;888b
L_888E:
	call L_89E6		;888e
	ld a,047h		;8891
	call 04d6eh		;8893   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jr L_8880		;8896
L_8898:
	call L_89BC		;8898
	ld a,(0ee0bh)		;889b
	and a			;889e
	ret nz			;889f
	ld a,048h		;88a0
	call 04d6eh		;88a2   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call L_89F0		;88a5
	jr L_8880		;88a8
L_88AA:
	ld a,(0e227h)		;88aa   ; lee cuantos jugadores (o el modo de dos)
	and a			;88ad
	call z,L_89F8		;88ae
	call L_8972		;88b1
	ld a,(0ee75h)		;88b4
	and a			;88b7
	ret nz			;88b8
	ld a,(0e227h)		;88b9   ; lee cuantos jugadores (o el modo de dos)
	and a			;88bc
	jr z,L_88C9		;88bd
	ld a,028h		;88bf
	call 04d6eh		;88c1   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call L_891D		;88c4
	jr L_8880		;88c7
L_88C9:
	ld hl,0e217h		;88c9
	inc (hl)			;88cc
	inc (hl)			;88cd
	inc (hl)			;88ce
	jr L_88F8		;88cf
L_88D1:
	call L_8934		;88d1
	ld a,(0ee75h)		;88d4
	and a			;88d7
	ret nz			;88d8
	jr L_888E		;88d9
L_88DB:
	call L_89BC		;88db
	ld a,(0ee0bh)		;88de
	and a			;88e1
	ret nz			;88e2
	ld a,048h		;88e3
	call 04d6eh		;88e5   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call L_895F		;88e8
	jr L_88F8		;88eb
L_88ED:
	call L_89F8		;88ed
	call L_8972		;88f0
	ld a,(0ee75h)		;88f3
	and a			;88f6
	ret nz			;88f7
L_88F8:
	jp L_8880		;88f8
L_88FB:
	call L_89F8		;88fb
	ld a,(0ee01h)		;88fe
	cp 020h		;8901
	ret c			;8903
	ld a,001h		;8904
	call L_8A20		;8906
	jp L_8880		;8909
L_890C:
	ld de,000b4h		;890c
	call 04da1h		;890f   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	ret c			;8912
	xor a			;8913
	ld (0e217h),a		;8914
	ret			;8917
L_8918:
	ld de,0bcdbh		;8918
	jr L_8920		;891b
L_891D:
	ld de,0bd30h		;891d
L_8920:
	ld (0ee73h),de		;8920
	ld hl,039a2h		;8924
	ld (0ee71h),hl		;8927
	ld a,048h		;892a
	ld (0ee75h),a		;892c
	xor a			;892f
	ld (0ee76h),a		;8930
	ret			;8933
L_8934:
	ld hl,0ee75h		;8934
	dec (hl)			;8937
	ld a,(hl)			;8938
	and 007h		;8939
	ret nz			;893b
	inc l			;893c
	inc (hl)			;893d
	ld a,(hl)			;893e
	cp 006h		;893f
	jr c,L_8948		;8941
	call L_872C		;8943
	ld a,005h		;8946
L_8948:
	ld b,a			;8948
	or a			;8949
	ld hl,(0ee71h)		;894a
	ld de,00020h		;894d
	sbc hl,de		;8950
	ld (0ee71h),hl		;8952
	ld c,011h		;8955
	jp L_8747		;8957
L_895A:
	ld de,0bcdbh		;895a
	jr L_8962		;895d
L_895F:
	ld de,0bd30h		;895f
L_8962:
	ld (0ee73h),de		;8962
	ld hl,03882h		;8966
	ld (0ee71h),hl		;8969
	ld a,01eh		;896c
	ld (0ee75h),a		;896e
	ret			;8971
L_8972:
	call L_872C		;8972
	ld hl,0ee75h		;8975
	dec (hl)			;8978
	ret z			;8979
	ld hl,(0ee71h)		;897a
	inc hl			;897d
	ld (0ee71h),hl		;897e
	ld a,l			;8981
	and 01fh		;8982
	ld b,a			;8984
	ld a,020h		;8985
	sub b			;8987
	cp 011h		;8988
	jr c,L_898E		;898a
	ld a,011h		;898c
L_898E:
	ld c,a			;898e
	ld b,005h		;898f
	ld de,(0ee73h)		;8991
	ld hl,(0ee71h)		;8995
L_8998:
	push bc			;8998
	push de			;8999
	ld b,000h		;899a
	call 04cbdh		;899c   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	ld bc,00020h		;899f
	add hl,bc			;89a2
	pop de			;89a3
	pop bc			;89a4
	ld a,011h		;89a5
	call 040c9h		;89a7   ; de_mas_a: DE = DE + A
	djnz L_8998		;89aa
	ld a,(0e203h)		;89ac   ; lee la cuenta de cuadros del juego
	and 004h		;89af
	ld a,001h		;89b1
	jr z,L_89B7		;89b3
	ld a,003h		;89b5
L_89B7:
	ld (0ee0ch),a		;89b7
	jr L_89C7		;89ba
L_89BC:
	ld hl,0ee0bh		;89bc
	dec (hl)			;89bf
	ld a,(hl)			;89c0
	and 003h		;89c1
	jr nz,L_89C7		;89c3
	inc l			;89c5
	inc (hl)			;89c6
L_89C7:
	ld a,(0ee0ch)		;89c7
	and 003h		;89ca
	ld hl,08ac1h		;89cc
	call 04e28h		;89cf   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld hl,(0ee71h)		;89d2
	ld a,l			;89d5
	and 01fh		;89d6
	cp 01ch		;89d8
	ret nc			;89da
	ld a,03eh		;89db
	call 040c4h		;89dd   ; hl_mas_a: HL = HL + A
	ld bc,00204h		;89e0
	jp L_874E		;89e3
L_89E6:
	ld a,020h		;89e6
	ld (0ee0bh),a		;89e8
	xor a			;89eb
	ld (0ee0ch),a		;89ec
	ret			;89ef
L_89F0:
	xor a			;89f0
	ld (0ee00h),a		;89f1
	ld (0ee01h),a		;89f4
	ret			;89f7
L_89F8:
	ld hl,0ee01h		;89f8
	ld a,(hl)			;89fb
	cp 008h		;89fc
	ld b,003h		;89fe
	jr c,L_8A0A		;8a00
	ld b,001h		;8a02
	cp 010h		;8a04
	jr c,L_8A0A		;8a06
	ld b,000h		;8a08
L_8A0A:
	dec l			;8a0a
	inc (hl)			;8a0b
	ld a,(hl)			;8a0c
	and b			;8a0d
	ret nz			;8a0e
	inc l			;8a0f
	inc (hl)			;8a10
	ld a,(hl)			;8a11
	ld de,0ca40h		;8a12
	call 040c9h		;8a15   ; de_mas_a: DE = DE + A
	ld hl,039a0h		;8a18
	ld b,018h		;8a1b
	jp L_8B0C		;8a1d
L_8A20:
	push af			;8a20
	call 04ca4h		;8a21   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_8039		;8a24
	ld a,(0002bh)		;8a27
	and 00fh		;8a2a
	ld hl,0befdh		;8a2c
	jr z,L_8A34		;8a2f
	ld hl,0bf0bh		;8a31
L_8A34:
	pop af			;8a34
	push af			;8a35
	call 04e28h		;8a36   ; palabra_de_hl: DE = la palabra HL + 2 x A
	call 04cf5h		;8a39   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld de,08a8fh		;8a3c
	call 04cf5h		;8a3f   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	pop af			;8a42
	push af			;8a43
	ld hl,08a6ah		;8a44
	call 04e28h		;8a47   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld c,0ffh		;8a4a
	ld hl,03933h		;8a4c
	call 04cfdh		;8a4f   ; lista_a_vram_aqui: la lista de DE en la VRAM HL (sin destino delante)
	pop af			;8a52
	sub 003h		;8a53
	cp 003h		;8a55
	ret nc			;8a57
	ld hl,08aa4h		;8a58
	call 04e28h		;8a5b   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ld c,0ffh		;8a5e
	ld hl,039d0h		;8a60
	call 04cfdh		;8a63   ; lista_a_vram_aqui: la lista de DE en la VRAM HL (sin destino delante)
	ld de,08a9bh		;8a66
	jp 04cf5h		;8a69   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)

; ----------------------------------------------------------------------
; DATOS rotulos2_8A6A: 7 punteros (fase 1 a 7; tabla en 0x8A6A + 2 x A): la
;   segunda linea del rotulo de cada fase (p10:8A44 con A = 1, 0xE21B o 7); lo
;   leen p10:8A47 (14 bytes)
;   0x8a6c..0x8a7a  (14 bytes)
DATA_rotulos2_8A6A:
	defw 08a7ah,08a7eh,08a82h,08a82h,08a82h,08a88h,08a8dh	; 8a6c

; ----------------------------------------------------------------------
; DATOS rotulo2_8A7A: lista a la VRAM sin destino delante (p00:4CFD, HL =
;   0x3933) de la fase 1; lo leen p10:8A4F (4 bytes)
;   0x8a7a..0x8a7e  (4 bytes)
DATA_rotulo2_8A7A:
	defb 02fh,02eh,025h,0ffh	; 8a7a

; ----------------------------------------------------------------------
; DATOS rotulo2_8A7E: lista a la VRAM sin destino delante (p00:4CFD, HL =
;   0x3933) de la fase 2; lo leen p10:8A4F (4 bytes)
;   0x8a7e..0x8a82  (4 bytes)
DATA_rotulo2_8A7E:
	defb 034h,037h,02fh,0ffh	; 8a7e

; ----------------------------------------------------------------------
; DATOS rotulo2_8A82: lista a la VRAM sin destino delante (p00:4CFD, HL =
;   0x3933) de la fase 3, 4, 5; lo leen p10:8A4F (6 bytes)
;   0x8a82..0x8a88  (6 bytes)
DATA_rotulo2_8A82:
	defb 034h,028h,032h,025h,025h,0ffh	; 8a82

; ----------------------------------------------------------------------
; DATOS rotulo2_8A88: lista a la VRAM sin destino delante (p00:4CFD, HL =
;   0x3933) de la fase 6; lo leen p10:8A4F (5 bytes)
;   0x8a88..0x8a8d  (5 bytes)
DATA_rotulo2_8A88:
	defb 026h,02fh,035h,032h,0ffh	; 8a88

; ----------------------------------------------------------------------
; DATOS rotulo2_8A8D: lista a la VRAM sin destino delante (p00:4CFD, HL =
;   0x3933) de la fase 7; lo leen p10:8A4F (2 bytes)
;   0x8a8d..0x8a8f  (2 bytes)
DATA_rotulo2_8A8D:
	defb 038h,0ffh	; 8a8d

; ----------------------------------------------------------------------
; DATOS lista_8A8F: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:8A3F (12 bytes)
;   0x8a8f..0x8a9b  (12 bytes)
DATA_lista_8A8F:
	defb 029h,039h,02fh,030h,025h,032h,021h,034h,029h,02fh,02eh,0ffh	; 8a8f  )9/0%2!4)/..

; ----------------------------------------------------------------------
; DATOS lista_8A9B: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:8A69 (9 bytes)
;   0x8a9b..0x8aa4  (9 bytes)
DATA_lista_8A9B:
	defb 0c9h,039h,030h,02ch,021h,02eh,025h,034h,0ffh	; 8a9b  .90,!.%4.

; ----------------------------------------------------------------------
; DATOS resto_8AA4: lo apuntan con el banco puesto p10:8A58 (0x8AA4), p10:89CC
;   (0x8AC1); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:8A58, p10:89CC (69 bytes)
;   0x8aa4..0x8ae9  (69 bytes)
DATA_resto_8AA4:
	defb 0aah,08ah,0b2h,08ah,0bah,08ah,025h,029h,02fh,02eh,025h,035h,033h,0ffh,02ch,021h	; 8aa4  ......%)/.%53.,!
	defb 036h,029h,02eh,029h,021h,0ffh,02bh,029h,025h,032h,02bh,025h,0ffh,0c9h,08ah,0d1h	; 8ab4  6).)!.+)%2+%....
	defb 08ah,0d9h,08ah,0e1h,08ah,000h,000h,000h,071h,000h,000h,000h,07bh,000h,000h,072h	; 8ac4  ........q...{..r
	defb 073h,000h,000h,07ch,07dh,000h,074h,075h,076h,000h,07eh,07fh,080h,077h,078h,079h	; 8ad4  s..|}.tuv.~..wxy
	defb 07ah,081h,082h,083h,084h	; 8ae4

; ======================================================================
; CODIGO 0x8ae9..0x8b20  (55 bytes)
; ======================================================================


L_8AE9:
	ld hl,0ca40h		;8ae9
	ld de,08b20h		;8aec
L_8AEF:
	ld b,h			;8aef
	ld c,l			;8af0
L_8AF1:
	ld a,(de)			;8af1
	inc a			;8af2
	ret z			;8af3
	inc a			;8af4
	jr z,L_8AFD		;8af5
	ld a,(de)			;8af7
	ld (hl),a			;8af8
	inc de			;8af9
	inc hl			;8afa
	jr L_8AF1		;8afb
L_8AFD:
	ld hl,00040h		;8afd
	add hl,bc			;8b00
	inc de			;8b01
	jr L_8AEF		;8b02
L_8B04:
	ld de,0c700h		;8b04
	ld hl,03800h		;8b07
	ld b,018h		;8b0a
L_8B0C:
	push bc			;8b0c
	ld bc,00020h		;8b0d
	call 04cbdh		;8b10   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	ld bc,00020h		;8b13
	add hl,bc			;8b16
	ld a,020h		;8b17
	call 040c9h		;8b19   ; de_mas_a: DE = DE + A
	pop bc			;8b1c
	djnz L_8B0C		;8b1d
	ret			;8b1f

; ----------------------------------------------------------------------
; DATOS resto_8B20: lo apuntan con el banco puesto p10:8AEC (0x8B20); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:8AEC (91 bytes)
;   0x8b20..0x8b7b  (91 bytes)
DATA_resto_8B20:
	defb 091h,093h,0a5h,093h,0a6h,092h,0a5h,093h,091h,093h,093h,0a6h,092h,091h,093h,092h	; 8b20  ................
	defb 093h,098h,091h,092h,093h,093h,094h,095h,096h,0feh,09ch,099h,09ah,09bh,097h,09ch	; 8b30  ................
	defb 09ah,09bh,09ah,09bh,097h,0a4h,0a6h,097h,09ch,099h,09ah,09bh,097h,09ah,09ch,099h	; 8b40  ................
	defb 09ah,097h,092h,094h,093h,093h,092h,095h,096h,0feh,0a2h,094h,0a0h,09fh,09dh,095h	; 8b50  ................
	defb 0a3h,094h,095h,096h,09ch,099h,09ah,09ch,0a6h,092h,0a0h,09fh,09dh,09ch,09eh,094h	; 8b60  ................
	defb 0a0h,09fh,09dh,09ch,09eh,092h,099h,09eh,09bh,097h,0ffh	; 8b70  ...........

; ======================================================================
; CODIGO 0x8b7b..0x8c1c  (161 bytes)
; ======================================================================


L_8B7B:
	ld a,(0e301h)		;8b7b   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 007h		;8b7e
	ld b,006h		;8b80
	jr z,L_8BCE		;8b82
	dec a			;8b84
	ld b,002h		;8b85
	jr z,L_8BCE		;8b87
	ld hl,0e362h		;8b89
	ld bc,00300h		;8b8c
L_8B8F:
	ld a,(hl)			;8b8f
	and a			;8b90
	jr nz,L_8B94		;8b91
	inc c			;8b93
L_8B94:
	inc hl			;8b94
	djnz L_8B8F		;8b95
	ld a,c			;8b97
	cp 002h		;8b98
	jr nc,L_8BE1		;8b9a
	dec a			;8b9c
	jr z,L_8BAF		;8b9d
	ld a,(0f0f5h)		;8b9f   ; lee lo que hay en el vecino (bit 0: CD 07 51, bit 1: Nemesis 2 de verdad)
	rra			;8ba2
	ld b,006h		;8ba3
	jr nc,L_8BCE		;8ba5
	ld a,(0e30ah)		;8ba7
	and a			;8baa
	jr z,L_8BCE		;8bab
	jr L_8BE5		;8bad
L_8BAF:
	ld hl,0e362h		;8baf
	ld b,003h		;8bb2
L_8BB4:
	ld a,(hl)			;8bb4
	and a			;8bb5
	jr z,L_8BBC		;8bb6
	inc b			;8bb8
	inc hl			;8bb9
	jr L_8BB4		;8bba
L_8BBC:
	ld hl,0e235h		;8bbc
	inc (hl)			;8bbf
	dec hl			;8bc0
	inc (hl)			;8bc1
	dec hl			;8bc2
	inc (hl)			;8bc3
	ld a,b			;8bc4
	sub 003h		;8bc5
	call 040c4h		;8bc7   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8bca
	ld (0e35fh),a		;8bcb
L_8BCE:
	ld a,b			;8bce
	dec a			;8bcf
	ld hl,0e360h		;8bd0
	call 040c4h		;8bd3   ; hl_mas_a: HL = HL + A
	ld (hl),001h		;8bd6
	ld a,b			;8bd8
	ld (0e21bh),a		;8bd9   ; guarda la fase en curso
	xor a			;8bdc
	ld (0e232h),a		;8bdd
	ret			;8be0
L_8BE1:
	ld a,001h		;8be1
	jr L_8BE7		;8be3
L_8BE5:
	ld a,002h		;8be5
L_8BE7:
	ld (0e232h),a		;8be7
	ret			;8bea
L_8BEB:
	ld de,0e217h		;8beb
	ld a,(0e232h)		;8bee
	dec a			;8bf1
	jr z,L_8C17		;8bf2
	dec a			;8bf4
	jp z,L_8DA0		;8bf5
	ld a,(de)			;8bf8
	dec a			;8bf9
	jr nz,L_8C08		;8bfa
	call L_8265		;8bfc
	ld a,(0e21bh)		;8bff   ; lee la fase en curso
	call L_8A20		;8c02
	jp L_825A		;8c05
L_8C08:
	ld de,000b4h		;8c08
	call 04da1h		;8c0b   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	ret c			;8c0e
	call 04ca4h		;8c0f   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	xor a			;8c12
	ld (0e217h),a		;8c13
	ret			;8c16
L_8C17:
	ld a,(de)			;8c17
	dec a			;8c18
	call 040ceh		;8c19   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8C1C: 7 destinos del despachador p00:40CE (call en p10:8C19, el
;   indice en A): 8C2A, 8C47, 8C62, 8C82, 8C97, 8CB8, 8C08; lo leen p10:8C19
;   (14 bytes)
;   0x8c1c..0x8c2a  (14 bytes)
DATA_tabla_8C1C:
	defw 08c2ah,08c47h,08c62h,08c82h,08c97h,08cb8h,08c08h	; 8c1c

; ======================================================================
; CODIGO 0x8c2a..0x8da5  (379 bytes)
; ======================================================================


L_8C2A:
	call L_8265		;8c2a
	call L_9D95		;8c2d
	call L_827F		;8c30
	call L_8F37		;8c33
	ld a,02fh		;8c36
	call 04d6eh		;8c38   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call 041bfh		;8c3b   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a000h		;8c3e
	call 041c3h		;8c41   ; banco_15_en_a000: pone el banco 15 en 0xA000 (y su copia en 0xF0F1-3)
	jp L_825A		;8c44
L_8C47:
	call L_9DC4		;8c47
	ld de,000b4h		;8c4a
	call 04da1h		;8c4d   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_8CF6		;8c50
	xor a			;8c53
	ld (0eec0h),a		;8c54
	ld (0eec1h),a		;8c57
	ld a,04ah		;8c5a
	call 04d6eh		;8c5c   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jp L_825A		;8c5f
L_8C62:
	call L_9DC4		;8c62
	call L_8E24		;8c65
	ld a,(0eec0h)		;8c68
	and a			;8c6b
	ret z			;8c6c
	ld b,011h		;8c6d
	call ventana_menu		;8c6f   ; ventana_menu: pinta la ventana del menu B
	ld b,021h		;8c72
	call ventana_menu		;8c74   ; ventana_menu: pinta la ventana del menu B
	ld c,00ch		;8c77
	ld de,03a04h		;8c79
	call L_944A		;8c7c
	jp L_825A		;8c7f
L_8C82:
	call L_9DC4		;8c82
	ld de,001a4h		;8c85
	call 04da1h		;8c88   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_9497		;8c8b
	call L_8EE1		;8c8e
	call L_8CE2		;8c91
	jp L_825A		;8c94
L_8C97:
	call L_9DC4		;8c97
	call L_988A		;8c9a
	ld a,(0eea0h)		;8c9d
	and a			;8ca0
	ret z			;8ca1
	xor a			;8ca2
	ld (0eec0h),a		;8ca3
	ld a,00fh		;8ca6
	ld (0eec1h),a		;8ca8
	ld a,04ah		;8cab
	call 04d6eh		;8cad   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld a,0f1h		;8cb0
	call 04d6eh		;8cb2   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jp L_825A		;8cb5
L_8CB8:
	call L_9DC4		;8cb8
	call L_8D15		;8cbb
	call L_8E16		;8cbe
	ld a,(0e301h)		;8cc1   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 004h		;8cc4
	jr c,L_8CD0		;8cc6
	ld a,(0e326h)		;8cc8
	cp 0d8h		;8ccb
	ret c			;8ccd
	jr L_8CD6		;8cce
L_8CD0:
	ld a,(0e324h)		;8cd0
	cp 004h		;8cd3
	ret nc			;8cd5
L_8CD6:
	call 04eafh		;8cd6   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	ld a,(0e21bh)		;8cd9   ; lee la fase en curso
	call L_8A20		;8cdc
	jp L_825A		;8cdf
L_8CE2:
	ld hl,0eea0h		;8ce2
	ld de,0eea1h		;8ce5
	ld (hl),000h		;8ce8
	ld bc,0000fh		;8cea
	ldir		;8ced
	ret			;8cef
L_8CF0:
	call L_945C		;8cf0
	jp L_949A		;8cf3
L_8CF6:
	call L_8D52		;8cf6
	jr c,L_8D01		;8cf9
	call L_8F0F		;8cfb
	call L_8D72		;8cfe
L_8D01:
	ld a,(0e227h)		;8d01   ; lee cuantos jugadores (o el modo de dos)
	cp 002h		;8d04
	jr c,L_8D3F		;8d06
	call L_8D62		;8d08
	jr c,L_8D3F		;8d0b
	call L_8F1C		;8d0d
	call L_8D89		;8d10
	jr L_8D3F		;8d13
L_8D15:
	xor a			;8d15
	ld hl,0f012h		;8d16
	ld (hl),a			;8d19
	inc hl			;8d1a
	ld (hl),a			;8d1b
	inc hl			;8d1c
	ld (hl),a			;8d1d
	inc hl			;8d1e
	ld (hl),a			;8d1f
	ld a,(0e301h)		;8d20   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 004h		;8d23
	ld hl,0f013h		;8d25
	ld a,0f8h		;8d28
	jr c,L_8D31		;8d2a
	ld hl,0f015h		;8d2c
	ld a,008h		;8d2f
L_8D31:
	ld (hl),a			;8d31
	call L_8D72		;8d32
	ld a,(0e227h)		;8d35   ; lee cuantos jugadores (o el modo de dos)
	cp 002h		;8d38
	jr c,L_8D3F		;8d3a
	call L_8D89		;8d3c
L_8D3F:
	xor a			;8d3f
	ld (0e30fh),a		;8d40
	ld (0e30eh),a		;8d43
	call 04030h		;8d46
	call 041bfh		;8d49   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a000h		;8d4c
	jp 041c3h		;8d4f   ; banco_15_en_a000: pone el banco 15 en 0xA000 (y su copia en 0xF0F1-3)
L_8D52:
	ld a,(0e324h)		;8d52
	sub 02eh		;8d55
	cp 004h		;8d57
	ret nc			;8d59
	ld a,(0e326h)		;8d5a
	sub 086h		;8d5d
	cp 004h		;8d5f
	ret			;8d61
L_8D62:
	ld a,(0e3a4h)		;8d62
	sub 03eh		;8d65
	cp 004h		;8d67
	ret nc			;8d69
	ld a,(0e3a6h)		;8d6a
	sub 066h		;8d6d
	cp 004h		;8d6f
	ret			;8d71
L_8D72:
	ld hl,(0f012h)		;8d72
	ld de,(0e323h)		;8d75
	add hl,de			;8d79
	ld (0e323h),hl		;8d7a
	ld hl,(0f014h)		;8d7d
	ld de,(0e325h)		;8d80
	add hl,de			;8d84
	ld (0e325h),hl		;8d85
	ret			;8d88
L_8D89:
	ld hl,(0f012h)		;8d89
	ld de,(0e3a3h)		;8d8c
	add hl,de			;8d90
	ld (0e3a3h),hl		;8d91
	ld hl,(0f014h)		;8d94
	ld de,(0e3a5h)		;8d97
	add hl,de			;8d9b
	ld (0e3a5h),hl		;8d9c
	ret			;8d9f
L_8DA0:
	ld a,(de)			;8da0
	dec a			;8da1
	call 040ceh		;8da2   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8DA5: 4 destinos del despachador p00:40CE (call en p10:8DA2, el
;   indice en A): 8DAD, 8DC4, 8DD5, 8C08; lo leen p10:8DA2 (8 bytes)
;   0x8da5..0x8dad  (8 bytes)
DATA_tabla_8DA5:
	defw 08dadh,08dc4h,08dd5h,08c08h	; 8da5  -> L_8DAD L_8DC4 L_8DD5 L_8C08

; ======================================================================
; CODIGO 0x8dad..0x8f00  (339 bytes)
; ======================================================================


L_8DAD:
	call L_8265		;8dad
	call L_827F		;8db0
	ld a,02fh		;8db3
	call 04d6eh		;8db5   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call 041bfh		;8db8   ; banco_11_en_a000: pone el banco 11 en 0xA000 (y su copia en 0xF0F1-3)
	call 0a000h		;8dbb
	call 041c3h		;8dbe   ; banco_15_en_a000: pone el banco 15 en 0xA000 (y su copia en 0xF0F1-3)
	jp L_825A		;8dc1
L_8DC4:
	ld de,000b4h		;8dc4
	call 04da1h		;8dc7   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	jp c,L_9C50		;8dca
	ld a,0f1h		;8dcd
	call 04d6eh		;8dcf   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jp L_825A		;8dd2
L_8DD5:
	call L_8DF0		;8dd5
	call L_9C50		;8dd8
	ld de,00078h		;8ddb
	call 04da1h		;8dde   ; cuadros_desde: compara la cuenta de cuadros (0xF0F7) con DE
	ret c			;8de1
	call 04eafh		;8de2   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	ld a,007h		;8de5
	ld (0e21bh),a		;8de7   ; guarda la fase en curso
	call L_8A20		;8dea
	jp L_825A		;8ded
L_8DF0:
	ld hl,07858h		;8df0
	call L_8F12		;8df3
	call L_8D72		;8df6
	ld a,(0e227h)		;8df9   ; lee cuantos jugadores (o el modo de dos)
	cp 002h		;8dfc
	jp c,L_8D3F		;8dfe
	ld hl,07858h		;8e01
	call L_8F1F		;8e04
	call L_8D89		;8e07
	jp L_8D3F		;8e0a
L_8E0D:
	call L_8EE1		;8e0d
	ld a,001h		;8e10
	ld (0eec0h),a		;8e12
	ret			;8e15
L_8E16:
	ld hl,0eec0h		;8e16
	ld a,(hl)			;8e19
	and a			;8e1a
	ret nz			;8e1b
	inc hl			;8e1c
	ld a,(hl)			;8e1d
	dec (hl)			;8e1e
	and a			;8e1f
	jr z,L_8E0D		;8e20
	jr L_8E31		;8e22
L_8E24:
	ld hl,0eec0h		;8e24
	ld a,(hl)			;8e27
	and a			;8e28
	ret nz			;8e29
	inc hl			;8e2a
	ld a,(hl)			;8e2b
	inc (hl)			;8e2c
	cp 00fh		;8e2d
	jr nc,L_8E0D		;8e2f
L_8E31:
	push af			;8e31
	call L_8EF6		;8e32
	pop af			;8e35
	ld hl,08f00h		;8e36
	call 040c4h		;8e39   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8e3c
	and 00fh		;8e3d
	ld b,a			;8e3f
	ld a,010h		;8e40
	sub b			;8e42
	add a,a			;8e43
	ld c,a			;8e44
	ld a,(hl)			;8e45
	and 0f0h		;8e46
	rlca			;8e48
	rlca			;8e49
	rlca			;8e4a
	rlca			;8e4b
	ld d,a			;8e4c
	ld a,005h		;8e4d
	sub d			;8e4f
	add a,a			;8e50
	ld e,a			;8e51
	ld a,d			;8e52
	add a,00eh		;8e53
	ld l,a			;8e55
	ld h,000h		;8e56
	add hl,hl			;8e58
	add hl,hl			;8e59
	add hl,hl			;8e5a
	add hl,hl			;8e5b
	add hl,hl			;8e5c
	ld a,b			;8e5d
	call 040c4h		;8e5e   ; hl_mas_a: HL = HL + A
	push de			;8e61
	ld de,03800h		;8e62
	add hl,de			;8e65
	pop de			;8e66
	push hl			;8e67
	push bc			;8e68
	ld a,00bh		;8e69
	call 0004dh		;8e6b   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;8e6e
	ld a,c			;8e6f
	dec a			;8e70
	dec a			;8e71
	jr z,L_8E7E		;8e72
	ld b,000h		;8e74
	ld c,a			;8e76
	ld a,00ch		;8e77
	push de			;8e79
	call 00056h		;8e7a   ; BIOS FILVRM - Fills VRAM with value
	pop de			;8e7d
L_8E7E:
	pop bc			;8e7e
	pop hl			;8e7f
	push hl			;8e80
	ld a,c			;8e81
	call 040c4h		;8e82   ; hl_mas_a: HL = HL + A
	dec hl			;8e85
	ld a,00bh		;8e86
	call 0004dh		;8e88   ; BIOS WRTVRM - Writes data in VRAM
	pop hl			;8e8b
	push hl			;8e8c
	ld a,020h		;8e8d
	call 040c4h		;8e8f   ; hl_mas_a: HL = HL + A
	push bc			;8e92
	ld b,e			;8e93
	dec b			;8e94
	dec b			;8e95
	jr z,L_8EB0		;8e96
L_8E98:
	push hl			;8e98
	ld a,00dh		;8e99
	call 0004dh		;8e9b   ; BIOS WRTVRM - Writes data in VRAM
	ld a,c			;8e9e
	call 040c4h		;8e9f   ; hl_mas_a: HL = HL + A
	dec hl			;8ea2
	ld a,00dh		;8ea3
	call 0004dh		;8ea5   ; BIOS WRTVRM - Writes data in VRAM
	pop hl			;8ea8
	ld a,020h		;8ea9
	call 040c4h		;8eab   ; hl_mas_a: HL = HL + A
	djnz L_8E98		;8eae
L_8EB0:
	pop bc			;8eb0
	ld a,e			;8eb1
	dec a			;8eb2
	ld h,000h		;8eb3
	ld l,a			;8eb5
	add hl,hl			;8eb6
	add hl,hl			;8eb7
	add hl,hl			;8eb8
	add hl,hl			;8eb9
	add hl,hl			;8eba
	ex de,hl			;8ebb
	pop hl			;8ebc
	add hl,de			;8ebd
	ld a,00bh		;8ebe
	call 0004dh		;8ec0   ; BIOS WRTVRM - Writes data in VRAM
	push hl			;8ec3
	push bc			;8ec4
	inc hl			;8ec5
	ld a,c			;8ec6
	dec a			;8ec7
	dec a			;8ec8
	jr z,L_8ED5		;8ec9
	ld b,000h		;8ecb
	ld c,a			;8ecd
	ld a,00ch		;8ece
	push de			;8ed0
	call 00056h		;8ed1   ; BIOS FILVRM - Fills VRAM with value
	pop de			;8ed4
L_8ED5:
	pop bc			;8ed5
	pop hl			;8ed6
	ld a,c			;8ed7
	call 040c4h		;8ed8   ; hl_mas_a: HL = HL + A
	dec hl			;8edb
	ld a,00bh		;8edc
	jp 0004dh		;8ede   ; BIOS WRTVRM - Writes data in VRAM
L_8EE1:
	ld c,01ch		;8ee1
L_8EE3:
	ld hl,039e2h		;8ee3
	ld b,008h		;8ee6
L_8EE8:
	push bc			;8ee8
	xor a			;8ee9
	ld b,a			;8eea
	call 00056h		;8eeb   ; BIOS FILVRM - Fills VRAM with value
	ld bc,00020h		;8eee
	add hl,bc			;8ef1
	pop bc			;8ef2
	djnz L_8EE8		;8ef3
	ret			;8ef5
L_8EF6:
	ld hl,039c0h		;8ef6
	ld bc,00140h		;8ef9
	xor a			;8efc
	jp 00056h		;8efd   ; BIOS FILVRM - Fills VRAM with value

; ----------------------------------------------------------------------
; DATOS resto_8F00: lo apuntan con el banco puesto p10:8E36 (0x8F00); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:8E36 (15 bytes)
;   0x8f00..0x8f0f  (15 bytes)
DATA_resto_8F00:
	defb 04fh,04eh,04dh,03ch,03bh,03ah,029h,028h,027h,016h,015h,014h,003h,002h,001h	; 8f00  ONM<.:)('......

; ======================================================================
; CODIGO 0x8f0f..0x8f4f  (64 bytes)
; ======================================================================


L_8F0F:
	ld hl,08830h		;8f0f
L_8F12:
	ld a,(0e324h)		;8f12
	ld e,a			;8f15
	ld a,(0e326h)		;8f16
	ld d,a			;8f19
	jr L_8F27		;8f1a
L_8F1C:
	ld hl,06840h		;8f1c
L_8F1F:
	ld a,(0e3a4h)		;8f1f
	ld e,a			;8f22
	ld a,(0e3a6h)		;8f23
	ld d,a			;8f26
L_8F27:
	ld (0f000h),hl		;8f27
	ld a,030h		;8f2a
	ld (0f00fh),a		;8f2c
	call 075b4h		;8f2f
	ld d,001h		;8f32
	jp 07536h		;8f34
L_8F37:
	ld hl,02058h		;8f37
	ld de,08f4fh		;8f3a
	ld bc,00018h		;8f3d
	call 04cc1h		;8f40   ; copia_a_vram_3: copia BC bytes de DE a la VRAM HL en los tres tercios
	ld hl,00058h		;8f43
	ld de,08f67h		;8f46
	ld bc,00018h		;8f49
	jp 04cc1h		;8f4c   ; copia_a_vram_3: copia BC bytes de DE a la VRAM HL en los tres tercios

; ----------------------------------------------------------------------
; DATOS resto_8F4F: lo apuntan con el banco puesto p10:8F3A (0x8F4F), p10:8F46
;   (0x8F67); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:8F3A, p10:8F46 (48 bytes)
;   0x8f4f..0x8f7f  (48 bytes)
DATA_resto_8F4F:
	defb 07eh,07eh,042h,05ah,05ah,042h,07eh,000h,000h,055h,055h,055h,055h,055h,055h,000h	; 8f4f  ~~BZZB~..UUUUUU.
	defb 066h,07eh,066h,07eh,066h,07eh,066h,07eh,050h,0e0h,0e4h,0e4h,0e4h,0e4h,0e0h,0e0h	; 8f5f  f~f~f~f~P.......
	defb 0c0h,0cch,050h,0f0h,050h,040h,0cch,0e0h,0e0h,040h,0e0h,040h,0e0h,040h,0e0h,040h	; 8f6f  ..P.P@...@.@.@.@

; ======================================================================
; CODIGO 0x8f7f..0x8f94  (21 bytes)
; ======================================================================


L_8F7F:
	ld a,(0f0f5h)		;8f7f   ; lee lo que hay en el vecino (bit 0: CD 07 51, bit 1: Nemesis 2 de verdad)
	rra			;8f82
	jr nc,$+47		;8f83
	ld a,(0e30ah)		;8f85
	and a			;8f88
	jr z,$+41		;8f89
	ld b,000h		;8f8b
	ld a,(0e226h)		;8f8d
	dec a			;8f90
	call 040ceh		;8f91   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8F94: 15 destinos del despachador p00:40CE (call en p10:8F91, el
;   indice en A): 8FE1, 9009, 9036, 9047, 904E, 9064, 9077, 9088, 90A4, 90B5,
;   90C5, 90D9, 9105, 9120, 9140; lo leen p10:8F91 (30 bytes)
;   0x8f94..0x8fb2  (30 bytes)
DATA_tabla_8F94:
	defw 08fe1h,09009h,09036h,09047h,0904eh,09064h,09077h,09088h	; 8f94
	defw 090a4h,090b5h,090c5h,090d9h,09105h,09120h,09140h	; 8fa4

; ======================================================================
; CODIGO 0x8fb2..0x8fbb  (9 bytes)
; ======================================================================


L_8FB2:
	ld b,001h		;8fb2
	ld a,(0e226h)		;8fb4
	dec a			;8fb7
	call 040ceh		;8fb8   ; despacha: salta a la entrada A de la tabla que va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8FBB: 19 destinos del despachador p00:40CE (call en p10:8FB8, el
;   indice en A): 8FE1, 9009, 9036, 9047, 9149, 915A, 9183, 91A4, 91B3, 91C7,
;   91F9, 9213, 9237, 9260, 926F, 927B, 928B, 9299, 9140; lo leen p10:8FB8 (38
;   bytes)
;   0x8fbb..0x8fe1  (38 bytes)
DATA_tabla_8FBB:
	defw 08fe1h,09009h,09036h,09047h,09149h,0915ah,09183h,091a4h	; 8fbb
	defw 091b3h,091c7h,091f9h,09213h,09237h,09260h,0926fh,0927bh	; 8fcb
	defw 0928bh,09299h,09140h	; 8fdb  -> L_928B L_9299 L_9140

; ======================================================================
; CODIGO 0x8fe1..0x9353  (882 bytes)
; ======================================================================


L_8FE1:
	ld a,b			;8fe1
	ld (0e216h),a		;8fe2
	and a			;8fe5
	ld a,031h		;8fe6
	jr z,L_8FEC		;8fe8
	ld a,030h		;8fea
L_8FEC:
	call 04d6eh		;8fec   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	call L_8265		;8fef
	ld b,036h		;8ff2
	call graficos_menu		;8ff4   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld b,021h		;8ff7
	call ventana_menu		;8ff9   ; ventana_menu: pinta la ventana del menu B
	call 04ca4h		;8ffc   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
L_8FFF:
	ld hl,0e226h		;8fff
	inc (hl)			;9002
	ret			;9003
L_9004:
	ld (0ee58h),hl		;9004
	jr L_8FFF		;9007
L_9009:
	call L_901F		;9009
	ld c,00dh		;900c
	call L_9017		;900e
	ld hl,00294h		;9011
	jp L_9004		;9014
L_9017:
	ld de,03a04h		;9017
	ld b,008h		;901a
	jp L_944C		;901c
L_901F:
	ld de,093a1h		;901f
	ld hl,038e8h		;9022
	ld bc,00710h		;9025
L_9028:
	push bc			;9028
	ld b,000h		;9029
	call 04cbdh		;902b   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	ld bc,00020h		;902e
	add hl,bc			;9031
	pop bc			;9032
	djnz L_9028		;9033
	ret			;9035
L_9036:
	call L_930C		;9036
	jp nz,L_9497		;9039
	ld hl,0003ch		;903c
	call L_9004		;903f
	ld a,054h		;9042
	jp 04d6eh		;9044   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_9047:
	call L_930C		;9047
	ret nz			;904a
	jp L_8FFF		;904b
L_904E:
	call 04ca4h		;904e   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	ld b,033h		;9051
	call graficos_menu		;9053   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld c,000h		;9056
	ld de,0388ch		;9058
	call L_8CF0		;905b
	ld hl,000f0h		;905e
	jp L_9004		;9061
L_9064:
	call L_930C		;9064
	ret nz			;9067
	xor a			;9068
	ld (0e6abh),a		;9069
	ld hl,000f0h		;906c
	call L_9004		;906f
	ld a,053h		;9072
	jp 04d6eh		;9074   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_9077:
	call L_930C		;9077
	jp nz,L_8029		;907a
	ld c,013h		;907d
	call L_9017		;907f
	ld hl,001e0h		;9082
	jp L_9004		;9085
L_9088:
	call L_930C		;9088
	jp nz,L_9497		;908b
	call 04ca4h		;908e   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_92A0		;9091
	call L_9334		;9094
	ld c,014h		;9097
	call L_9017		;9099
	call L_8FFF		;909c
	ld a,04dh		;909f
	jp 04d6eh		;90a1   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_90A4:
	call L_9316		;90a4
	call L_92E4		;90a7
	ld a,(0ee77h)		;90aa
	and a			;90ad
	ret z			;90ae
	ld hl,003c0h		;90af
	jp L_9004		;90b2
L_90B5:
	call L_9316		;90b5
	call L_930C		;90b8
	jp nz,L_9497		;90bb
	xor a			;90be
	ld (0ee77h),a		;90bf
	jp L_8FFF		;90c2
L_90C5:
	call L_9316		;90c5
	call L_92DE		;90c8
	ld a,(0ee77h)		;90cb
	and a			;90ce
	ret z			;90cf
	call 04eafh		;90d0   ; borra_atributos: los atributos de sprite de la RAM (0xEF80) a 0xE0: fuera de la pantalla
	ld hl,000f0h		;90d3
	jp L_9004		;90d6
L_90D9:
	call L_930C		;90d9
	ret nz			;90dc
	call 04ca4h		;90dd   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_8039		;90e0
	ld b,032h		;90e3
	call graficos_menu		;90e5   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld a,001h		;90e8
	ld c,a			;90ea
	ld b,071h		;90eb
	ld hl,00808h		;90ed
	call L_9E13		;90f0
	ld hl,03906h		;90f3
	ld de,0bdf1h		;90f6
	ld bc,00812h		;90f9
	call L_9028		;90fc
	ld hl,000f0h		;90ff
	jp L_9004		;9102
L_9105:
	call L_930C		;9105
	jp nz,L_9E56		;9108
	ld b,021h		;910b
	call ventana_menu		;910d   ; ventana_menu: pinta la ventana del menu B
	ld c,015h		;9110
	ld de,03a24h		;9112
	ld b,008h		;9115
	call L_944C		;9117
	ld hl,002d0h		;911a
	jp L_9004		;911d
L_9120:
	call L_869C		;9120
	call L_930C		;9123
	jp nz,L_9497		;9126
L_9129:
	call 04ca4h		;9129   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_9251		;912c
	ld de,09397h		;912f
	call 04cf5h		;9132   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld a,0f1h		;9135
	call 04d6eh		;9137   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	ld hl,000f0h		;913a
	jp L_9004		;913d
L_9140:
	call L_930C		;9140
	ret nz			;9143
	xor a			;9144
	ld (0e226h),a		;9145
	ret			;9148
L_9149:
	call 04ca4h		;9149   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_901F		;914c
	ld hl,0382fh		;914f
	call L_9004		;9152
	ld a,04bh		;9155
	jp 04d6eh		;9157   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_915A:
	ld a,(0e203h)		;915a   ; lee la cuenta de cuadros del juego
	and 001h		;915d
	ret nz			;915f
	ld de,09441h		;9160
	ld hl,(0ee58h)		;9163
	ld bc,00102h		;9166
	call L_9028		;9169
	ld hl,(0ee58h)		;916c
	ld de,0396fh		;916f
	rst 20h			;9172
	jr z,L_917D		;9173
	ld de,00020h		;9175
	add hl,de			;9178
	ld (0ee58h),hl		;9179
	ret			;917c
L_917D:
	ld hl,0003ch		;917d
	jp L_9004		;9180
L_9183:
	call L_930C		;9183
	ret nz			;9186
	call 04ca4h		;9187   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_901F		;918a
	ld de,09411h		;918d
	ld hl,038ech		;9190
	ld bc,00608h		;9193
	call L_9028		;9196
	ld hl,0003ch		;9199
	call L_9004		;919c
	ld a,04ch		;919f
	jp 04d6eh		;91a1   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
L_91A4:
	call L_930C		;91a4
	ret nz			;91a7
	ld c,00eh		;91a8
	call L_9017		;91aa
	ld hl,002d0h		;91ad
	jp L_9004		;91b0
L_91B3:
	call L_930C		;91b3
	jp nz,L_9497		;91b6
	call 04ca4h		;91b9   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	ld c,00fh		;91bc
	call L_9017		;91be
	ld hl,002d0h		;91c1
	jp L_9004		;91c4
L_91C7:
	call L_930C		;91c7
	jp nz,L_9497		;91ca
	call 04ca4h		;91cd   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	ld b,035h		;91d0
	call graficos_menu		;91d2   ; graficos_menu: con el 9 en 0xA000, los caracteres y copias del menu B (0xE63A)
	ld b,021h		;91d5
	call ventana_menu		;91d7   ; ventana_menu: pinta la ventana del menu B
	ld a,001h		;91da
	ld c,002h		;91dc
	ld b,030h		;91de
	ld hl,00600h		;91e0
	call L_9E13		;91e3
	ld de,038cch		;91e6
	ld c,001h		;91e9
	call L_8CF0		;91eb
	ld c,010h		;91ee
	call L_9017		;91f0
	ld hl,004b0h		;91f3
	jp L_9004		;91f6
L_91F9:
	call L_930C		;91f9
	push af			;91fc
	call nz,L_920A		;91fd
	pop af			;9200
	jp nz,L_9497		;9201
	ld hl,000f0h		;9204
	jp L_9004		;9207
L_920A:
	ld a,(0e203h)		;920a   ; lee la cuenta de cuadros del juego
	and 007h		;920d
	ret nz			;920f
	jp L_9E56		;9210
L_9213:
	call L_930C		;9213
	ret nz			;9216
	ld a,(0e35eh)		;9217
	or a			;921a
	jr z,L_922B		;921b
	call 04ca4h		;921d   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	ld c,011h		;9220
	call L_9017		;9222
	ld hl,002d0h		;9225
	jp L_9004		;9228
L_922B:
	call L_9275		;922b
	call L_8FFF		;922e
	call L_8FFF		;9231
	jp L_8FFF		;9234
L_9237:
	call L_930C		;9237
	jp nz,L_9497		;923a
	call 04ca4h		;923d   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_9251		;9240
	ld de,038c4h		;9243
	ld c,005h		;9246
	call L_8CF0		;9248
	ld hl,000f0h		;924b
	jp L_9004		;924e
L_9251:
	ld b,001h		;9251
	call ventana_menu		;9253   ; ventana_menu: pinta la ventana del menu B
	ld b,011h		;9256
	call ventana_menu		;9258   ; ventana_menu: pinta la ventana del menu B
	ld b,021h		;925b
	jp ventana_menu		;925d   ; ventana_menu: pinta la ventana del menu B
L_9260:
	call L_930C		;9260
	ret nz			;9263
	ld c,012h		;9264
	call L_9017		;9266
	ld hl,002d0h		;9269
	jp L_9004		;926c
L_926F:
	call L_930C		;926f
	jp nz,L_9497		;9272
L_9275:
	ld hl,00078h		;9275
	jp L_9004		;9278
L_927B:
	call L_930C		;927b
	jp nz,04ca4h		;927e   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	call L_9251		;9281
	xor a			;9284
	ld (0ee32h),a		;9285
	jp L_8FFF		;9288
L_928B:
	call L_9681		;928b
	ld a,(0ee32h)		;928e
	and a			;9291
	ret z			;9292
	ld hl,000f0h		;9293
	jp L_9004		;9296
L_9299:
	call L_930C		;9299
	ret nz			;929c
	jp L_9129		;929d
L_92A0:
	xor a			;92a0
	ld (0ee00h),a		;92a1
	ld (0ee01h),a		;92a4
	ld (0ee77h),a		;92a7
	call borra_c700		;92aa   ; borra_c700: borra 0xC700-0xCFFF
	ld a,(0e227h)		;92ad   ; lee cuantos jugadores (o el modo de dos)
	and a			;92b0
	jr z,L_92D6		;92b1
	dec a			;92b3
	jr nz,L_92D3		;92b4
	ld a,(0e321h)		;92b6
	and a			;92b9
	jr z,L_92D6		;92ba
L_92BC:
	ld hl,0bd30h		;92bc
	ld de,0caf0h		;92bf
L_92C2:
	ld b,005h		;92c2
L_92C4:
	push bc			;92c4
	ld bc,00011h		;92c5
	ldir		;92c8
	pop bc			;92ca
	ld a,04fh		;92cb
	call 040c9h		;92cd   ; de_mas_a: DE = DE + A
	djnz L_92C4		;92d0
	ret			;92d2
L_92D3:
	call L_92BC		;92d3
L_92D6:
	ld hl,0bcdbh		;92d6
	ld de,0c84ch		;92d9
	jr L_92C2		;92dc
L_92DE:
	ld b,001h		;92de
	ld c,034h		;92e0
	jr L_92E8		;92e2
L_92E4:
	ld b,007h		;92e4
	ld c,01ch		;92e6
L_92E8:
	ld hl,0ee00h		;92e8
	inc (hl)			;92eb
	ld a,(hl)			;92ec
	and b			;92ed
	ret nz			;92ee
	inc hl			;92ef
	ld a,(hl)			;92f0
	cp c			;92f1
	jr nc,L_9306		;92f2
	inc (hl)			;92f4
	ld a,040h		;92f5
	sub (hl)			;92f7
	ld de,0c700h		;92f8
	call 040c9h		;92fb   ; de_mas_a: DE = DE + A
	ld hl,03800h		;92fe
	ld b,010h		;9301
	jp L_9647		;9303
L_9306:
	ld a,001h		;9306
	ld (0ee77h),a		;9308
	ret			;930b
L_930C:
	ld hl,(0ee58h)		;930c
	dec hl			;930f
	ld (0ee58h),hl		;9310
	ld a,l			;9313
	or h			;9314
	ret			;9315
L_9316:
	ld hl,0ef81h		;9316
	ld a,(0e203h)		;9319   ; lee la cuenta de cuadros del juego
	and 003h		;931c
	ld de,09353h		;931e
	call 040c9h		;9321   ; de_mas_a: DE = DE + A
	ld a,(de)			;9324
	ld c,a			;9325
	ld b,020h		;9326
L_9328:
	ld a,(hl)			;9328
	sub 008h		;9329
	ld (hl),a			;932b
	inc hl			;932c
	inc hl			;932d
	ld (hl),c			;932e
	inc hl			;932f
	inc hl			;9330
	djnz L_9328		;9331
	ret			;9333
L_9334:
	ld de,09443h		;9334
	call 04d10h		;9337   ; rachas_con_destino: [destino] y rachas de DE a la VRAM
	ld de,0ef80h		;933a   ; apunta a los atributos de sprite en la RAM (32 x 4)
	ld hl,09357h		;933d
	ld b,020h		;9340
L_9342:
	push bc			;9342
	ldi		;9343
	ldi		;9345
	ld a,000h		;9347
	ld (de),a			;9349
	inc de			;934a
	ld a,006h		;934b
	ld (de),a			;934d
	inc de			;934e
	pop bc			;934f
	djnz L_9342		;9350
	ret			;9352

; ----------------------------------------------------------------------
; DATOS resto_9353: lo apuntan con el banco puesto p10:931E (0x9353), p10:933D
;   (0x9357); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:931E, p10:933D (68 bytes)
;   0x9353..0x9397  (68 bytes)
DATA_resto_9353:
	defb 004h,005h,007h,00fh,005h,000h,002h,040h,007h,060h,00ah,0c0h,013h,034h,012h,056h	; 9353  .......@.`...4.V
	defb 015h,0feh,01fh,0deh,024h,023h,024h,023h,02fh,06fh,02bh,0e3h,035h,045h,035h,03eh	; 9363  ....$#$#/o+.5E5>
	defb 035h,06eh,03bh,0a4h,04fh,0deh,046h,04dh,046h,06ch,04eh,0b7h,05ah,0efh,057h,045h	; 9373  5n..O.FMFlN.Z.WE
	defb 059h,061h,05dh,0e6h,06bh,0cbh,06dh,044h,061h,062h,06ah,0dah,07eh,045h,070h,043h	; 9383  Ya].k.mDabj.~EpC
	defb 07eh,063h,076h,0adh	; 9393

; ----------------------------------------------------------------------
; DATOS lista_9397: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:9132 (10 bytes)
;   0x9397..0x93a1  (10 bytes)
DATA_lista_9397:
	defb 04ch,039h,02bh,01fh,01ch,000h,01ch,025h,01bh,0ffh	; 9397  L9+....%..

; ----------------------------------------------------------------------
; DATOS resto_93A1: lo apuntan con el banco puesto p10:901F (0x93A1), p10:918D
;   (0x9411), p10:9160 (0x9441); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p10:901F, p10:918D, p10:9160 (162 bytes)
;   0x93a1..0x9443  (162 bytes)
DATA_resto_93A1:
	defb 000h,000h,000h,000h,000h,000h,000h,010h,040h,000h,000h,000h,000h,000h,000h,000h	; 93a1  ........@.......
	defb 000h,000h,000h,000h,000h,011h,012h,013h,043h,042h,041h,000h,000h,000h,000h,000h	; 93b1  ........CBA.....
	defb 000h,000h,000h,000h,000h,014h,015h,016h,046h,045h,044h,000h,000h,000h,000h,000h	; 93c1  ........FED.....
	defb 000h,000h,000h,000h,017h,018h,019h,01ah,04ah,049h,048h,047h,000h,000h,000h,000h	; 93d1  ........JIHG....
	defb 027h,028h,058h,057h,01bh,01ch,01dh,01eh,04eh,04dh,04ch,04bh,027h,028h,058h,057h	; 93e1  '(XW....NMLK'(XW
	defb 029h,02ah,05ah,059h,01fh,020h,021h,022h,052h,051h,050h,04fh,029h,02ah,05ah,059h	; 93f1  )*ZY. !"RQPO)*ZY
	defb 02bh,02ch,05ch,05bh,023h,024h,025h,026h,056h,055h,054h,053h,02bh,02ch,05ch,05bh	; 9401  +,\[#$%&VUTS+,\[
	defb 000h,000h,000h,02eh,05eh,000h,000h,000h,000h,000h,02fh,030h,060h,05fh,000h,000h	; 9411  ....^...../0`_..
	defb 000h,031h,032h,033h,063h,062h,061h,000h,034h,035h,036h,037h,067h,066h,065h,064h	; 9421  .123cba.4567gfed
	defb 038h,03ah,03bh,01eh,04eh,06bh,06ah,068h,01fh,020h,021h,039h,069h,051h,050h,04fh	; 9431  8:..Nkjh. !9iQPO
	defb 02dh,05dh	; 9441

; ----------------------------------------------------------------------
; DATOS rachas_d_9443: [destino en la VRAM] y rachas (p00:4D10 -> p00:4D16);
;   lo leen p10:9337 (7 bytes)
;   0x9443..0x944a  (7 bytes)
DATA_rachas_d_9443:
	defb 000h,018h,081h,080h,01fh,000h,000h	; 9443

; ======================================================================
; CODIGO 0x944a..0x959a  (336 bytes)
; ======================================================================


L_944A:
	ld b,004h		;944a
L_944C:
	ld a,(0002bh)		;944c
	and 00fh		;944f
	ld hl,0b002h		;9451
	jr z,L_9459		;9454
	ld hl,0b4b6h		;9456
L_9459:
	xor a			;9459
	jr L_946C		;945a
L_945C:
	ld a,(0002bh)		;945c
	and 00fh		;945f
	ld hl,0b725h		;9461
	jr z,L_9469		;9464
	ld hl,0b90ah		;9466
L_9469:
	ld a,001h		;9469
	ld b,a			;946b
L_946C:
	ld (0ee2eh),a		;946c
	ld a,c			;946f
empieza_texto:		; prepara el texto A de la tabla HL para escribirlo letra a letra
	call 04e31h		;9470   ; palabra_a_hl: HL = la palabra HL + 2 x A
	ld a,b			;9473
	ld (0ee2bh),a		;9474
	ld (0ee2ch),a		;9477
	xor a			;947a
	ld (0ee21h),a		;947b
	ld (0ee2dh),a		;947e
	ld (0ee26h),de		;9481
	ld (0ee24h),de		;9485
	ld a,(hl)			;9489
	ld b,a			;948a
	inc hl			;948b
	call 040c9h		;948c   ; de_mas_a: DE = DE + A
	ld (0ee22h),de		;948f
	ld (0ee28h),hl		;9493
	ret			;9496
L_9497:
	xor a			;9497
	jr L_949C		;9498
L_949A:
	ld a,001h		;949a
L_949C:
	ld (0f000h),a		;949c
	ld a,(0ee21h)		;949f
	and a			;94a2
	ret nz			;94a3
	ld a,(0f000h)		;94a4
	and a			;94a7
	jr nz,L_94B7		;94a8
	ld hl,0ee2dh		;94aa
	ld a,(hl)			;94ad
	and a			;94ae
	jp nz,L_9540		;94af
	ld hl,0ee2bh		;94b2
	dec (hl)			;94b5
	ret nz			;94b6
L_94B7:
	ld hl,(0ee28h)		;94b7
	ld a,(hl)			;94ba
	inc hl			;94bb
	ld (0ee28h),hl		;94bc
	ld b,a			;94bf
	inc b			;94c0
	jr z,L_94E5		;94c1
	inc b			;94c3
	jr z,L_94EB		;94c4
	inc b			;94c6
	jr z,L_9518		;94c7
	inc b			;94c9
	jp z,L_954D		;94ca
L_94CD:
	ld hl,(0ee22h)		;94cd
	call 0004dh		;94d0   ; BIOS WRTVRM - Writes data in VRAM
	ld hl,(0ee22h)		;94d3
	inc hl			;94d6
	ld (0ee22h),hl		;94d7
	ld a,(0ee2eh)		;94da
	and a			;94dd
	ld a,033h		;94de
	call z,04d6eh		;94e0   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	jr L_950D		;94e3
L_94E5:
	ld a,001h		;94e5
	ld (0ee21h),a		;94e7
	ret			;94ea
L_94EB:
	ld hl,(0ee28h)		;94eb
	ld b,(hl)			;94ee
	inc hl			;94ef
	ld (0ee28h),hl		;94f0
	ld a,(0ee2eh)		;94f3
	and a			;94f6
	ld de,00040h		;94f7
	jr z,L_94FF		;94fa
	ld de,00020h		;94fc
L_94FF:
	ld hl,(0ee24h)		;94ff
	add hl,de			;9502
	ld (0ee24h),hl		;9503
	ld a,b			;9506
	call 040c4h		;9507   ; hl_mas_a: HL = HL + A
	ld (0ee22h),hl		;950a
L_950D:
	call L_9539		;950d
	ld a,(0f000h)		;9510
	and a			;9513
	ret z			;9514
	jp L_949A		;9515
L_9518:
	ld hl,(0ee28h)		;9518
	ld a,(hl)			;951b
	ld b,a			;951c
	inc hl			;951d
	ld (0ee28h),hl		;951e
	ld de,(0ee26h)		;9521
	ld (0ee24h),de		;9525
	ld (0ee26h),de		;9529
	call 040c9h		;952d   ; de_mas_a: DE = DE + A
	ld (0ee22h),de		;9530
	ld a,078h		;9534
	ld (0ee2dh),a		;9536
L_9539:
	ld a,(0ee2ch)		;9539
	ld (0ee2bh),a		;953c
	ret			;953f
L_9540:
	dec (hl)			;9540
	ret nz			;9541
	ld hl,(0ee22h)		;9542
	xor a			;9545
	ld l,a			;9546
	ld bc,00100h		;9547
	jp 00056h		;954a   ; BIOS FILVRM - Fills VRAM with value
L_954D:
	ld hl,0ee2fh		;954d
	ld a,(hl)			;9550
	and a			;9551
	jr nz,L_958D		;9552
	ld (hl),001h		;9554
	ld hl,(0ee28h)		;9556
	ld (0ee1eh),hl		;9559
	ld a,(0e227h)		;955c   ; lee cuantos jugadores (o el modo de dos)
	ld hl,095abh		;955f
	and a			;9562
	jr z,L_9578		;9563
	ld hl,0959ah		;9565
	cp 002h		;9568
	jr z,L_9578		;956a
	ld a,(0e321h)		;956c
	and a			;956f
	ld hl,095abh		;9570
	jr z,L_9578		;9573
	ld hl,095b5h		;9575
L_9578:
	ld a,(hl)			;9578
	inc hl			;9579
	ld de,(0ee22h)		;957a
	call 040c9h		;957e   ; de_mas_a: DE = DE + A
	ld (0ee22h),de		;9581
	ld a,(hl)			;9585
	inc hl			;9586
	ld (0ee28h),hl		;9587
	jp L_94CD		;958a
L_958D:
	ld (hl),000h		;958d
	ld hl,(0ee1eh)		;958f
	ld a,(hl)			;9592
	inc hl			;9593
	ld (0ee28h),hl		;9594
	jp L_94CD		;9597

; ----------------------------------------------------------------------
; DATOS resto_959A: lo apuntan con el banco puesto p10:9565 (0x959A), p10:955F
;   (0x95AB), p10:9570 (0x95AB), p10:9575 (0x95B5); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p10:9565, p10:955F,
;   p10:9570, p10:9575 (35 bytes)
;   0x959a..0x95bd  (35 bytes)
DATA_resto_959A:
	defb 000h,078h,039h,06dh,08bh,07ch,070h,099h,039h,04eh,07ah,08ah,094h,079h,095h,039h	; 959a  .x9m.|p.9Nz..y.9
	defb 0fch,003h,078h,039h,06dh,08bh,07ch,070h,099h,039h,0fch,004h,07ah,08ah,094h,079h	; 95aa  ..x9m.|p.9..z..y
	defb 095h,039h,0fch	; 95ba

; ======================================================================
; CODIGO 0x95bd..0x9736  (377 bytes)
; ======================================================================


L_95BD:
	call 04e28h		;95bd   ; palabra_de_hl: DE = la palabra HL + 2 x A
	ex de,hl			;95c0
abre_ventana:		; copia la cabecera de ventana de HL (7 bytes) a 0xEE10
	ld de,0ee10h		;95c1
	ld bc,00007h		;95c4
	ldir		;95c7
	xor a			;95c9
	ld (de),a			;95ca
	inc e			;95cb
	ld (de),a			;95cc
	ret			;95cd
L_95CE:
	ld a,(0ee18h)		;95ce
	and a			;95d1
	ret nz			;95d2
	ld de,0c700h		;95d3
	ld a,(0ee10h)		;95d6
	and a			;95d9
	jr nz,L_95F5		;95da
	ld a,020h		;95dc
	call 040c9h		;95de   ; de_mas_a: DE = DE + A
	call L_9670		;95e1
	ld a,(0ee17h)		;95e4
	call 040c4h		;95e7   ; hl_mas_a: HL = HL + A
	ld a,(0ee13h)		;95ea
	ld c,a			;95ed
	ld b,000h		;95ee
	or a			;95f0
	sbc hl,bc		;95f1
	jr L_9606		;95f3
L_95F5:
	ld a,040h		;95f5
	call 040c9h		;95f7   ; de_mas_a: DE = DE + A
	call L_9670		;95fa
	ld a,(0ee17h)		;95fd
	ld c,a			;9600
	ld b,000h		;9601
	or a			;9603
	sbc hl,bc		;9604
L_9606:
	ld a,(0ee12h)		;9606
	ld c,a			;9609
	ld de,(0ee15h)		;960a
L_960E:
	push hl			;960e
	ld a,(0ee13h)		;960f
	ld b,a			;9612
L_9613:
	ld a,(de)			;9613
	ld (hl),a			;9614
	inc hl			;9615
	inc de			;9616
	djnz L_9613		;9617
	pop hl			;9619
	ld a,060h		;961a
	call 040c4h		;961c   ; hl_mas_a: HL = HL + A
	dec c			;961f
	jr nz,L_960E		;9620
	ld a,(0ee11h)		;9622
	ld bc,00602h		;9625
	bit 4,a		;9628
	jr nz,L_9636		;962a
	ld bc,00301h		;962c
	bit 3,a		;962f
	jr nz,L_9636		;9631
	ld bc,00000h		;9633
L_9636:
	ld d,b			;9636
	ld e,000h		;9637
	ld hl,0c720h		;9639
	add hl,de			;963c
	ex de,hl			;963d
	ld b,c			;963e
	ld c,000h		;963f
	ld hl,03800h		;9641
	add hl,bc			;9644
	ld b,008h		;9645
L_9647:
	push bc			;9647
	push hl			;9648
	push de			;9649
	ld bc,00020h		;964a
	call 04cbdh		;964d   ; copia_a_vram: copia BC bytes de DE a la VRAM HL (LDIRVM)
	pop de			;9650
	pop hl			;9651
	ld a,020h		;9652
	call 040c4h		;9654   ; hl_mas_a: HL = HL + A
	ld a,060h		;9657
	call 040c9h		;9659   ; de_mas_a: DE = DE + A
	pop bc			;965c
	djnz L_9647		;965d
	ld hl,0ee17h		;965f
	inc (hl)			;9662
	inc (hl)			;9663
	ld b,(hl)			;9664
	ld a,(0ee14h)		;9665
	cp b			;9668
	ret nc			;9669
	ld a,001h		;966a
	ld (0ee18h),a		;966c
	ret			;966f
L_9670:
	ld a,(0ee11h)		;9670
	ld l,a			;9673
	ld h,000h		;9674
	add hl,hl			;9676
	add hl,hl			;9677
	add hl,hl			;9678
	add hl,hl			;9679
	add hl,hl			;967a
	ld b,h			;967b
	ld c,l			;967c
	add hl,hl			;967d
	add hl,bc			;967e
	add hl,de			;967f
	ret			;9680
L_9681:
	ld a,(0ee32h)		;9681
	and a			;9684
	ret nz			;9685
	ld hl,0ee08h		;9686
	ld b,(hl)			;9689
	djnz L_96A1		;968a
	call L_9702		;968c
	ld hl,0ee32h		;968f
	ld a,(hl)			;9692
	and a			;9693
	ret z			;9694
	ld (hl),000h		;9695
	ld a,0f0h		;9697
	ld (0ee34h),a		;9699
L_969C:
	ld hl,0ee08h		;969c
	inc (hl)			;969f
	ret			;96a0
L_96A1:
	djnz L_96AD		;96a1
	ld hl,0ee34h		;96a3
	dec (hl)			;96a6
	ret nz			;96a7
	call L_9742		;96a8
	jr L_969C		;96ab
L_96AD:
	djnz L_96BE		;96ad
	call L_974C		;96af
	ld hl,0ee32h		;96b2
	ld a,(hl)			;96b5
	and a			;96b6
	ret z			;96b7
	xor a			;96b8
	ld (hl),a			;96b9
	ld (0ee08h),a		;96ba
	ret			;96bd
L_96BE:
	inc (hl)			;96be
	ld hl,0ee33h		;96bf
	ld a,(hl)			;96c2
	cp 002h		;96c3
	jr nc,L_96CF		;96c5
	call L_96D5		;96c7
	ld hl,0ee33h		;96ca
	inc (hl)			;96cd
	ret			;96ce
L_96CF:
	ld a,001h		;96cf
	ld (0ee32h),a		;96d1
	ret			;96d4
L_96D5:
	call 04ca4h		;96d5   ; borra_nombres: borra la tabla de nombres (0x3800, 0x300 bytes) con FILVRM
	xor a			;96d8
	call L_971C		;96d9
	call L_9742		;96dc
	xor a			;96df
	ld (0ee32h),a		;96e0
	ld a,(0e226h)		;96e3
	ld hl,09751h		;96e6
	and a			;96e9
	jr z,L_96F9		;96ea
	ld hl,09755h		;96ec
	ld a,(0002bh)		;96ef
	and 00fh		;96f2
	jr z,L_96F9		;96f4
	ld hl,09759h		;96f6
L_96F9:
	ld a,(0ee33h)		;96f9
	call 04e28h		;96fc   ; palabra_de_hl: DE = la palabra HL + 2 x A
	jp 04cf5h		;96ff   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
L_9702:
	ld de,09736h		;9702
L_9705:
	ld hl,0ee30h		;9705
	ld a,(hl)			;9708
	inc (hl)			;9709
	cp 008h		;970a
	ret c			;970c
	ld (hl),000h		;970d
	inc l			;970f
	ld b,(hl)			;9710
	inc (hl)			;9711
	ld a,(hl)			;9712
	cp 006h		;9713
	jr nc,L_9730		;9715
	ld b,a			;9717
	call 040c9h		;9718   ; de_mas_a: DE = DE + A
	ld a,(de)			;971b
L_971C:
	ld hl,00800h		;971c
	ex af,af'			;971f
	ld a,(0e226h)		;9720
	and a			;9723
	ld bc,00200h		;9724
	jr z,L_972C		;9727
	ld bc,007c0h		;9729
L_972C:
	ex af,af'			;972c
	jp 00056h		;972d   ; BIOS FILVRM - Fills VRAM with value
L_9730:
	ld a,001h		;9730
	ld (0ee32h),a		;9732
	ret			;9735

; ----------------------------------------------------------------------
; DATOS resto_9736: lo apuntan con el banco puesto p10:9702 (0x9736), p10:974C
;   (0x973C); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:9702, p10:974C (12 bytes)
;   0x9736..0x9742  (12 bytes)
DATA_resto_9736:
	defb 000h,040h,050h,070h,0e0h,0f0h,0f0h,0e0h,070h,050h,040h,000h	; 9736  .@Pp....pP@.

; ======================================================================
; CODIGO 0x9742..0x9751  (15 bytes)
; ======================================================================


L_9742:
	xor a			;9742
	ld hl,0ee30h		;9743
	ld (hl),a			;9746
	inc l			;9747
	ld (hl),a			;9748
	inc l			;9749
	ld (hl),a			;974a
	ret			;974b
L_974C:
	ld de,0973ch		;974c
	jr $-74		;974f

; ----------------------------------------------------------------------
; DATOS resto_9751: lo apuntan con el banco puesto p10:96E6 (0x9751), p10:96EC
;   (0x9755), p10:96F6 (0x9759); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p10:96E6, p10:96EC, p10:96F6 (308 bytes)
;   0x9751..0x9885  (308 bytes)
DATA_resto_9751:
	defb 05dh,097h,072h,097h,084h,097h,0dah,097h,0f4h,097h,039h,098h,087h,039h,034h,028h	; 9751  ].r.......9..94(
	defb 025h,000h,033h,021h,027h,021h,000h,023h,02fh,02eh,034h,029h,02eh,035h,025h,033h	; 9761  %.3!'!.#/.4).5%3
	defb 0ffh,088h,039h,02bh,02fh,02eh,021h,02dh,029h,000h,030h,032h,025h,033h,025h,02eh	; 9771  ..9+/.!-).02%3%.
	defb 034h,033h,0ffh,006h,039h,044h,03dh,046h,04dh,033h,079h,039h,0a1h,05dh,039h,075h	; 9781  43..9D=FM3y9.]9u
	defb 0bfh,0c0h,053h,0e0h,0e1h,050h,0e2h,064h,04ah,032h,0feh,045h,039h,046h,040h,046h	; 9791  ..S..P.dJ2.E9F@F
	defb 033h,0bch,0bdh,08ah,07eh,091h,07ah,053h,0dah,052h,0c1h,0f6h,062h,0e3h,064h,04dh	; 97a1  3...~.zS.R..b.dM
	defb 03ch,05eh,032h,0feh,08bh,039h,0c3h,043h,033h,07ah,08ah,094h,079h,095h,039h,0feh	; 97b1  <^2..9.C3z..y.9.
	defb 0e8h,042h,033h,07ch,08ch,096h,07bh,097h,039h,0feh,0cah,039h,0c0h,03eh,033h,078h	; 97c1  .B3|..{.9..9.>3x
	defb 039h,06dh,08bh,034h,07ch,070h,099h,039h,0ffh,065h,039h,0bch,0bdh,08ah,07eh,091h	; 97d1  9m.4|p.9.e9...~.
	defb 07ah,000h,057h,04ch,0e4h,052h,0e5h,055h,06ah,03bh,04eh,000h,010h,014h,0e5h,034h	; 97e1  z.WL.R.Uj.N....4
	defb 034h,034h,0ffh,024h,039h,02bh,01fh,01ch,000h,01ah,029h,02ch,02ah,01fh,000h,019h	; 97f1  44.$9+....),*...
	defb 023h,026h,02eh,000h,026h,027h,01ch,029h,018h,02bh,020h,026h,025h,0feh,063h,039h	; 9801  #&..&'.).+ &%.c9
	defb 02bh,02ch,029h,025h,01ch,01bh,000h,026h,02ch,02bh,000h,02bh,026h,000h,019h,01ch	; 9811  +,)%...&,+.+&...
	defb 000h,018h,000h,01dh,018h,020h,023h,02ch,029h,01ch,0feh,0abh,039h,018h,01dh,02bh	; 9821  ..... #,)...9..+
	defb 01ch,029h,000h,018h,023h,023h,032h,0ffh,024h,039h,01fh,026h,02eh,01ch,02dh,01ch	; 9831  .)..##2.$9.&..-.
	defb 029h,033h,02bh,01fh,01ch,000h,027h,023h,018h,025h,01ch,02bh,000h,023h,018h,02bh	; 9841  )3+...'#.%.+.#.+
	defb 020h,02ah,0feh,064h,039h,02ah,02bh,020h,023h,023h,000h,018h,02eh,018h,020h,02bh	; 9851   *.d9*+ ##.... +
	defb 02ah,000h,030h,026h,02ch,029h,000h,029h,01ch,02ah,01ah,02ch,01ch,032h,0feh,0c7h	; 9861  *.0&,).).*.,.2..
	defb 039h,01eh,026h,000h,01dh,026h,029h,000h,02bh,01fh,01ch,000h,01dh,020h,01eh,01fh	; 9871  9.&..&).+.... ..
	defb 02bh,035h,035h,0ffh	; 9881

; ======================================================================
; CODIGO 0x9885..0x9a14  (399 bytes)
; ======================================================================


L_9885:
	ld hl,0eea1h		;9885
	inc (hl)			;9888
	ret			;9889
L_988A:
	ld a,(0eea1h)		;988a
	ld b,a			;988d
	cp 003h		;988e
	jr c,L_98A0		;9890
	push bc			;9892
	call L_9B32		;9893
	pop bc			;9896
	ld hl,0eeach		;9897
	ld a,(hl)			;989a
	inc hl			;989b
	or (hl)			;989c
	jp z,L_9A43		;989d
L_98A0:
	djnz L_98B9		;98a0
	ld de,09c46h		;98a2
	call 04cf5h		;98a5   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld a,001h		;98a8
	ld c,a			;98aa
	ld b,00ah		;98ab
	ld hl,01008h		;98ad
	call L_9E13		;98b0
	call L_9B42		;98b3
	jp L_9885		;98b6
L_98B9:
	djnz L_98CC		;98b9
	ld a,(0e203h)		;98bb   ; lee la cuenta de cuadros del juego
	and 007h		;98be
	ret nz			;98c0
	call L_9E56		;98c1
	ld a,(0ee50h)		;98c4
	and a			;98c7
	ret nz			;98c8
	jp L_9885		;98c9
L_98CC:
	djnz L_992F		;98cc
	ld c,014h		;98ce
	call L_8EE3		;98d0
	ld a,(0002bh)		;98d3
	and 00fh		;98d6
	ld de,09c15h		;98d8
	jr z,L_98E0		;98db
	ld de,09c1ah		;98dd
L_98E0:
	call 04cf5h		;98e0   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	push hl			;98e3
	ld a,(0eea9h)		;98e4
	ld hl,0eea2h		;98e7
	call 040c4h		;98ea   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;98ed
	ld a,(0002bh)		;98ee
	and 00fh		;98f1
	ld de,09aa9h		;98f3
	jr z,L_98FB		;98f6
	ld de,09abfh		;98f8
L_98FB:
	ld a,c			;98fb
	call 04e21h		;98fc   ; palabra_de_de: DE = la palabra DE + 2 x A
	pop hl			;98ff
	ld c,0ffh		;9900
	call 04cfdh		;9902   ; lista_a_vram_aqui: la lista de DE en la VRAM HL (sin destino delante)
	ld a,(0002bh)		;9905
	and 00fh		;9908
	ld de,09c24h		;990a
	jr z,L_9912		;990d
	ld de,09c2eh		;990f
L_9912:
	call 04cf5h		;9912   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	ld a,001h		;9915
	ld c,a			;9917
	ld b,015h		;9918
	ld hl,01200h		;991a
	call L_9E13		;991d
	ld de,09c36h		;9920
	call 04cf5h		;9923   ; lista_a_vram: la lista de DE a la VRAM ([destino] y bytes, 0xFE otro destino, 0xFF acaba)
	call L_9B4D		;9926
	call L_9BDB		;9929
	jp L_9885		;992c
L_992F:
	djnz L_9942		;992f
	ld a,(0e203h)		;9931   ; lee la cuenta de cuadros del juego
	and 007h		;9934
	ret nz			;9936
	call L_9E56		;9937
	ld a,(0ee50h)		;993a
	and a			;993d
	ret nz			;993e
	jp L_9885		;993f
L_9942:
	djnz L_995D		;9942
	call L_9ADC		;9944
	ld a,(0e30eh)		;9947
	and 003h		;994a
	jr nz,L_9957		;994c
	ld a,(0e30eh)		;994e
	and 010h		;9951
	jp nz,L_9A34		;9953
	ret			;9956
L_9957:
	ld hl,0eea1h		;9957
	ld (hl),003h		;995a
	ret			;995c
L_995D:
	call 041c7h		;995d   ; banco_9_en_a000: pone el banco 9 en 0xA000 (y su copia en 0xF0F1-3)
	ld hl,03200h		;9960
	ld de,0aa6eh		;9963
	call 04d16h		;9966   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld hl,03228h		;9969
	ld de,0aa6eh		;996c
	call 04d16h		;996f   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld hl,03250h		;9972
	ld de,0aa6eh		;9975
	call 04d16h		;9978   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld hl,03278h		;997b
	ld de,0aa8dh		;997e
	call 04d16h		;9981   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld hl,01200h		;9984
	ld de,0aac3h		;9987
	call 04d16h		;998a   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld hl,01228h		;998d
	ld de,0aad6h		;9990
	call 04d16h		;9993   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld hl,01250h		;9996
	ld de,0aae9h		;9999
	call 04d16h		;999c   ; rachas: descomprime las rachas de DE en la VRAM HL
	ld hl,01278h		;999f
	ld de,0aafch		;99a2
	call 04d16h		;99a5   ; rachas: descomprime las rachas de DE en la VRAM HL
	call 041c3h		;99a8   ; banco_15_en_a000: pone el banco 15 en 0xA000 (y su copia en 0xF0F1-3)
	ld bc,00303h		;99ab
	ld de,0e362h		;99ae
L_99B1:
	ld a,(de)			;99b1
	and a			;99b2
	jr z,L_99B9		;99b3
	inc c			;99b5
	inc de			;99b6
	djnz L_99B1		;99b7
L_99B9:
	ld a,c			;99b9
	ld (0e21bh),a		;99ba   ; guarda la fase en curso
	ld bc,00300h		;99bd
	ld de,0eea2h		;99c0
	ld hl,0e362h		;99c3
	xor a			;99c6
L_99C7:
	bit 0,(hl)		;99c7
	jr nz,L_99CE		;99c9
	ld (de),a			;99cb
	inc de			;99cc
	inc c			;99cd
L_99CE:
	inc a			;99ce
	inc hl			;99cf
	djnz L_99C7		;99d0
	ex de,hl			;99d2
	ld (hl),0ffh		;99d3
	ld a,c			;99d5
	dec a			;99d6
	ld (0eeaeh),a		;99d7
	xor a			;99da
	ld (0eea9h),a		;99db
	call L_9A64		;99de
	ld hl,03000h		;99e1
	ld (0eeach),hl		;99e4
	ld hl,0e362h		;99e7
	ld a,(hl)			;99ea
	inc hl			;99eb
	or (hl)			;99ec
	inc hl			;99ed
	or (hl)			;99ee
	jr nz,L_9A09		;99ef
	ld a,r		;99f1
	rra			;99f3
	and 007h		;99f4
	ld hl,09a14h		;99f6
	add a,a			;99f9
	add a,a			;99fa
	call 040c4h		;99fb   ; hl_mas_a: HL = HL + A
	ld de,0e233h		;99fe
	ld bc,00003h		;9a01
	ldir		;9a04
	jp L_9885		;9a06
L_9A09:
	ld hl,0e233h		;9a09
	inc (hl)			;9a0c
	inc hl			;9a0d
	inc (hl)			;9a0e
	inc hl			;9a0f
	inc (hl)			;9a10
	jp L_9885		;9a11

; ----------------------------------------------------------------------
; DATOS resto_9A14: lo apuntan con el banco puesto p10:99F6 (0x9A14); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:99F6 (32 bytes)
;   0x9a14..0x9a34  (32 bytes)
DATA_resto_9A14:
	defb 000h,001h,002h,000h,001h,002h,000h,000h,002h,000h,001h,000h,000h,001h,002h,000h	; 9a14  ................
	defb 001h,002h,000h,000h,002h,000h,001h,000h,000h,001h,002h,000h,001h,002h,000h,000h	; 9a24  ................

; ======================================================================
; CODIGO 0x9a34..0x9aa9  (117 bytes)
; ======================================================================


L_9A34:
	ld a,(0eea9h)		;9a34
	ld de,0eea2h		;9a37
	call 040c9h		;9a3a   ; de_mas_a: DE = DE + A
	ld a,(de)			;9a3d
	add a,003h		;9a3e
	ld (0e21bh),a		;9a40   ; guarda la fase en curso
L_9A43:
	ld a,(0e21bh)		;9a43   ; lee la fase en curso
	sub 003h		;9a46
	ld de,0e233h		;9a48
	call 040c9h		;9a4b   ; de_mas_a: DE = DE + A
	ld a,(de)			;9a4e
	ld (0e35fh),a		;9a4f
	ld a,001h		;9a52
	ld (0eea0h),a		;9a54
	ld a,(0e21bh)		;9a57   ; lee la fase en curso
	dec a			;9a5a
	ld hl,0e360h		;9a5b
	call 040c4h		;9a5e   ; hl_mas_a: HL = HL + A
	ld (hl),001h		;9a61
	ret			;9a63
L_9A64:
	ld ix,0eea2h		;9a64
	ld a,(0002bh)		;9a68
	and 00fh		;9a6b
	ld hl,03a58h		;9a6d
	jr z,L_9A75		;9a70
	ld hl,03a57h		;9a72
L_9A75:
	ld (0eeaah),hl		;9a75
L_9A78:
	ld a,(ix+000h)		;9a78
	inc a			;9a7b
	ret z			;9a7c
	dec a			;9a7d
	call L_9A85		;9a7e
	inc ix		;9a81
	jr L_9A78		;9a83
L_9A85:
	push af			;9a85
	ld a,(0002bh)		;9a86
	and 00fh		;9a89
	ld de,09aa9h		;9a8b
	jr z,L_9A93		;9a8e
	ld de,09abfh		;9a90
L_9A93:
	pop af			;9a93
	call 04e21h		;9a94   ; palabra_de_de: DE = la palabra DE + 2 x A
	ld hl,(0eeaah)		;9a97
	push hl			;9a9a
	ld a,040h		;9a9b
	call 040c4h		;9a9d   ; hl_mas_a: HL = HL + A
	ld (0eeaah),hl		;9aa0
	pop hl			;9aa3
	ld c,0ffh		;9aa4
	jp 04cfdh		;9aa6   ; lista_a_vram_aqui: la lista de DE en la VRAM HL (sin destino delante)

; ----------------------------------------------------------------------
; DATOS resto_9AA9: lo apuntan con el banco puesto p10:98F3 (0x9AA9), p10:9A8B
;   (0x9AA9), p10:98F8 (0x9ABF), p10:9A90 (0x9ABF); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p10:98F3, p10:9A8B,
;   p10:98F8, p10:9A90 (51 bytes)
;   0x9aa9..0x9adc  (51 bytes)
DATA_resto_9AA9:
	defb 0afh,09ah,0b5h,09ah,0bbh,09ah,06fh,070h,082h,06fh,07ah,0ffh,08ah,071h,091h,081h	; 9aa9  ......op.oz..q..
	defb 06fh,0ffh,074h,08bh,076h,0ffh,0c5h,09ah,0cdh,09ah,0d5h,09ah,01ch,020h,026h,025h	; 9ab9  o.t.v........ &%
	defb 01ch,02ch,02ah,0ffh,023h,018h,02dh,020h,025h,020h,018h,0ffh,022h,020h,01ch,029h	; 9ac9  .,*.#.- % .." .)
	defb 022h,01ch,0ffh	; 9ad9

; ======================================================================
; CODIGO 0x9adc..0x9b2c  (80 bytes)
; ======================================================================


L_9ADC:
	ld hl,0eea9h		;9adc
	ld a,(0e30eh)		;9adf
	and 003h		;9ae2
	jr z,L_9B08		;9ae4
	rra			;9ae6
	jr nc,L_9AF9		;9ae7
	ld a,045h		;9ae9
	call 04d6eh		;9aeb   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	dec (hl)			;9aee
	ld a,(hl)			;9aef
	inc a			;9af0
	jr nz,L_9B08		;9af1
	ld a,(0eeaeh)		;9af3
	ld (hl),a			;9af6
	jr L_9B08		;9af7
L_9AF9:
	ld a,045h		;9af9
	call 04d6eh		;9afb   ; pide_sonido: pide el sonido A con los bancos 4-5-6 (p04:6472) y devuelve los de antes
	inc (hl)			;9afe
	ld a,(0eeaeh)		;9aff
	inc a			;9b02
	cp (hl)			;9b03
	jr nz,L_9B08		;9b04
	ld (hl),000h		;9b06
L_9B08:
	xor a			;9b08
	ld hl,03a56h		;9b09
	call 0004dh		;9b0c   ; BIOS WRTVRM - Writes data in VRAM
	xor a			;9b0f
	ld hl,03a96h		;9b10
	call 0004dh		;9b13   ; BIOS WRTVRM - Writes data in VRAM
	xor a			;9b16
	ld hl,03ad6h		;9b17
	call 0004dh		;9b1a   ; BIOS WRTVRM - Writes data in VRAM
	ld a,(0eea9h)		;9b1d
	ld de,09b2ch		;9b20
	call 04e21h		;9b23   ; palabra_de_de: DE = la palabra DE + 2 x A
	ex de,hl			;9b26
	ld a,055h		;9b27
	jp 0004dh		;9b29   ; BIOS WRTVRM - Writes data in VRAM

; ----------------------------------------------------------------------
; DATOS resto_9B2C: lo apuntan con el banco puesto p10:9B20 (0x9B2C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:9B20 (6 bytes)
;   0x9b2c..0x9b32  (6 bytes)
DATA_resto_9B2C:
	defb 056h,03ah,096h,03ah,0d6h,03ah	; 9b2c

; ======================================================================
; CODIGO 0x9b32..0x9bcc  (154 bytes)
; ======================================================================


L_9B32:
	ld hl,0eeach		;9b32
	ld a,(hl)			;9b35
	sub 001h		;9b36
	daa			;9b38
	ld (hl),a			;9b39
	jr nc,L_9B42		;9b3a
	inc hl			;9b3c
	ld a,(hl)			;9b3d
	sub 001h		;9b3e
	daa			;9b40
	ld (hl),a			;9b41
L_9B42:
	ld de,0eeadh		;9b42
	ld hl,03a1ah		;9b45
	ld b,002h		;9b48
	jp 05a63h		;9b4a
L_9B4D:
	ld a,(0eea9h)		;9b4d
	ld de,0eea2h		;9b50
	call 040c9h		;9b53   ; de_mas_a: DE = DE + A
	ld a,(de)			;9b56
	ld de,0e233h		;9b57
	call 040c9h		;9b5a   ; de_mas_a: DE = DE + A
	ld a,(de)			;9b5d
	ld c,a			;9b5e
	add a,a			;9b5f
	add a,c			;9b60
	ld de,09bcch		;9b61
	call 040c9h		;9b64   ; de_mas_a: DE = DE + A
	push de			;9b67
	pop ix		;9b68
	ld hl,03a0ah		;9b6a
	call L_9B7D		;9b6d
	inc ix		;9b70
	ld hl,03a0eh		;9b72
	call L_9B7D		;9b75
	inc ix		;9b78
	ld hl,03a12h		;9b7a
L_9B7D:
	ld de,05150h		;9b7d
	ld a,(ix+000h)		;9b80
	and 003h		;9b83
	call nz,L_9BA2		;9b85
	ld de,05352h		;9b88
	ld a,(ix+000h)		;9b8b
	rra			;9b8e
	rra			;9b8f
	and 003h		;9b90
	call nz,L_9BA2		;9b92
	ld de,05400h		;9b95
	ld a,(ix+000h)		;9b98
	rra			;9b9b
	rra			;9b9c
	rra			;9b9d
	rra			;9b9e
	and 003h		;9b9f
	ret z			;9ba1
L_9BA2:
	ld b,a			;9ba2
L_9BA3:
	ld a,e			;9ba3
	call 0004dh		;9ba4   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;9ba7
	ld a,d			;9ba8
	call 0004dh		;9ba9   ; BIOS WRTVRM - Writes data in VRAM
	ld a,01fh		;9bac
	call 040c4h		;9bae   ; hl_mas_a: HL = HL + A
	push bc			;9bb1
	push hl			;9bb2
	ld a,l			;9bb3
	and 0e0h		;9bb4
	ld l,a			;9bb6
	ld bc,03a60h		;9bb7
	and a			;9bba
	sbc hl,bc		;9bbb
	jr nz,L_9BC7		;9bbd
	pop hl			;9bbf
	ld a,020h		;9bc0
	call 040c4h		;9bc2   ; hl_mas_a: HL = HL + A
	jr L_9BC8		;9bc5
L_9BC7:
	pop hl			;9bc7
L_9BC8:
	pop bc			;9bc8
	djnz L_9BA3		;9bc9
	ret			;9bcb

; ----------------------------------------------------------------------
; DATOS resto_9BCC: lo apuntan con el banco puesto p10:9B61 (0x9BCC); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:9B61 (15 bytes)
;   0x9bcc..0x9bdb  (15 bytes)
DATA_resto_9BCC:
	defb 020h,014h,001h,024h,021h,028h,031h,029h,014h,01ah,019h,029h,00fh,02ah,01eh	; 9bcc   ..$!(1)...).*.

; ======================================================================
; CODIGO 0x9bdb..0x9bf4  (25 bytes)
; ======================================================================


L_9BDB:
	ld a,(0eea9h)		;9bdb
	ld de,0eea2h		;9bde
	call 040c9h		;9be1   ; de_mas_a: DE = DE + A
	ld a,(de)			;9be4
	ld de,09bf4h		;9be5
	call 04e21h		;9be8   ; palabra_de_de: DE = la palabra DE + 2 x A
	ld bc,00303h		;9beb
	ld hl,03a45h		;9bee
	jp L_874E		;9bf1

; ----------------------------------------------------------------------
; DATOS resto_9BF4: lo apuntan con el banco puesto p10:9BE5 (0x9BF4), p10:98D8
;   (0x9C15); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p10:9BE5, p10:98D8 (38 bytes)
;   0x9bf4..0x9c1a  (38 bytes)
DATA_resto_9BF4:
	defb 0fah,09bh,003h,09ch,00ch,09ch,000h,041h,000h,040h,042h,043h,000h,044h,000h,000h	; 9bf4  .......A.@BC.D..
	defb 04bh,000h,04ah,04ch,04dh,000h,04eh,000h,000h,046h,000h,045h,047h,048h,000h,049h	; 9c04  K.JLM.N..F.EGH.I
	defb 000h,0e2h,039h,0bch,0bdh,0ffh	; 9c14

; ----------------------------------------------------------------------
; DATOS lista_9C1A: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:98E0 (10 bytes)
;   0x9c1a..0x9c24  (10 bytes)
DATA_lista_9C1A:
	defb 0e2h,039h,027h,023h,018h,025h,01ch,02bh,000h,0ffh	; 9c1a  .9'#.%.+..

; ----------------------------------------------------------------------
; DATOS resto_9C24: lo apuntan con el banco puesto p10:990A (0x9C24); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:990A (10 bytes)
;   0x9c24..0x9c2e  (10 bytes)
DATA_resto_9C24:
	defb 022h,03ah,029h,018h,01bh,018h,029h,0eah,0ebh,0ffh	; 9c24  ":)...)...

; ----------------------------------------------------------------------
; DATOS lista_9C2E: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:9912 (8 bytes)
;   0x9c2e..0x9c36  (8 bytes)
DATA_lista_9C2E:
	defb 022h,03ah,029h,018h,01bh,018h,029h,0ffh	; 9c2e  ":)...).

; ----------------------------------------------------------------------
; DATOS lista_9C36: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:9923 (16 bytes)
;   0x9c36..0x9c46  (16 bytes)
DATA_lista_9C36:
	defb 068h,03ah,04fh,04fh,04fh,04fh,04fh,04fh,04fh,04fh,04fh,04fh,04fh,04fh,04fh,0ffh	; 9c36  h:OOOOOOOOOOOOO.

; ----------------------------------------------------------------------
; DATOS lista_9C46: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:98A5 (7 bytes)
;   0x9c46..0x9c4d  (7 bytes)
DATA_lista_9C46:
	defb 0f7h,039h,02bh,020h,024h,01ch,0ffh	; 9c46

; ======================================================================
; CODIGO 0x9c4d..0x9e03  (438 bytes)
; ======================================================================


L_9C4D:
	xor a			;9c4d
	jr L_9C52		;9c4e
L_9C50:
	ld a,001h		;9c50
L_9C52:
	ld (0ee0ah),a		;9c52
	call L_9C8F		;9c55
	call L_9CFE		;9c58
	call L_9D3E		;9c5b
L_9C5E:
	ld hl,0ed00h		;9c5e
	ld b,010h		;9c61
L_9C63:
	ld a,(hl)			;9c63
	and a			;9c64
	push hl			;9c65
	call nz,L_9C72		;9c66
	pop hl			;9c69
	ld a,010h		;9c6a
	call 040c4h		;9c6c   ; hl_mas_a: HL = HL + A
	djnz L_9C63		;9c6f
	ret			;9c71
L_9C72:
	ld a,l			;9c72
	srl a		;9c73
	srl a		;9c75
	ld de,0efc0h		;9c77
	call 040c9h		;9c7a   ; de_mas_a: DE = DE + A
	inc l			;9c7d
	inc l			;9c7e
	ld a,(hl)			;9c7f
	ld (de),a			;9c80
	inc l			;9c81
	inc l			;9c82
	inc e			;9c83
	ld a,(hl)			;9c84
	ld (de),a			;9c85
	inc e			;9c86
	ld a,0fch		;9c87
	ld (de),a			;9c89
	inc e			;9c8a
	ld a,00fh		;9c8b
	ld (de),a			;9c8d
	ret			;9c8e
L_9C8F:
	ld a,(0e203h)		;9c8f   ; lee la cuenta de cuadros del juego
	ld c,a			;9c92
	and 003h		;9c93
	ret nz			;9c95
	ld hl,0ed00h		;9c96
	ld b,010h		;9c99
L_9C9B:
	ld a,(hl)			;9c9b
	and a			;9c9c
	jr z,L_9CA7		;9c9d
	ld a,010h		;9c9f
	call 040c4h		;9ca1   ; hl_mas_a: HL = HL + A
	djnz L_9C9B		;9ca4
	ret			;9ca6
L_9CA7:
	ld a,(0ee0ah)		;9ca7
	and a			;9caa
	jr nz,L_9CB6		;9cab
	exx			;9cad
	ld hl,0ee02h		;9cae
	ld a,(hl)			;9cb1
	and a			;9cb2
	ret z			;9cb3
	dec (hl)			;9cb4
	exx			;9cb5
L_9CB6:
	ld (hl),001h		;9cb6
	inc l			;9cb8
	inc l			;9cb9
	ld a,c			;9cba
	rra			;9cbb
	rra			;9cbc
	rra			;9cbd
	jr c,L_9CD2		;9cbe
	rra			;9cc0
	ld a,0bfh		;9cc1
	jr c,L_9CC6		;9cc3
	xor a			;9cc5
L_9CC6:
	ld (hl),a			;9cc6
	ld e,a			;9cc7
	inc l			;9cc8
	inc l			;9cc9
	ld a,r		;9cca
	add a,a			;9ccc
	add a,c			;9ccd
	ld (hl),a			;9cce
	ld d,a			;9ccf
	jr L_9CE4		;9cd0
L_9CD2:
	ld b,a			;9cd2
	ld a,r		;9cd3
	add a,a			;9cd5
	add a,c			;9cd6
	ld (hl),a			;9cd7
	ld e,a			;9cd8
	inc l			;9cd9
	inc l			;9cda
	rr b		;9cdb
	ld a,0ffh		;9cdd
	jr c,L_9CE2		;9cdf
	xor a			;9ce1
L_9CE2:
	ld (hl),a			;9ce2
	ld d,a			;9ce3
L_9CE4:
	push hl			;9ce4
	call L_9D82		;9ce5
	pop hl			;9ce8
	inc l			;9ce9
	ld a,(0f012h)		;9cea
	ld (hl),a			;9ced
	inc l			;9cee
	ld a,(0f013h)		;9cef
	ld (hl),a			;9cf2
	inc l			;9cf3
	ld a,(0f014h)		;9cf4
	ld (hl),a			;9cf7
	inc l			;9cf8
	ld a,(0f015h)		;9cf9
	ld (hl),a			;9cfc
	ret			;9cfd
L_9CFE:
	ld ix,0ed00h		;9cfe
	ld b,010h		;9d02
L_9D04:
	ld a,(ix+000h)		;9d04
	and a			;9d07
	call nz,L_9D13		;9d08
	ld de,00010h		;9d0b
	add ix,de		;9d0e
	djnz L_9D04		;9d10
	ret			;9d12
L_9D13:
	ld e,(ix+005h)		;9d13
	ld d,(ix+006h)		;9d16
	call L_9D30		;9d19
	ld e,(ix+007h)		;9d1c
	ld d,(ix+008h)		;9d1f
L_9D22:
	ld l,(ix+003h)		;9d22
	ld h,(ix+004h)		;9d25
	add hl,de			;9d28
	ld (ix+003h),l		;9d29
	ld (ix+004h),h		;9d2c
	ret			;9d2f
L_9D30:
	ld l,(ix+001h)		;9d30
	ld h,(ix+002h)		;9d33
	add hl,de			;9d36
	ld (ix+001h),l		;9d37
	ld (ix+002h),h		;9d3a
	ret			;9d3d
L_9D3E:
	ld hl,0ed00h		;9d3e
	ld b,010h		;9d41
L_9D43:
	ld a,(hl)			;9d43
	and a			;9d44
	push hl			;9d45
	push bc			;9d46
	call nz,L_9D54		;9d47
	pop bc			;9d4a
	pop hl			;9d4b
	ld a,010h		;9d4c
	call 040c4h		;9d4e   ; hl_mas_a: HL = HL + A
	djnz L_9D43		;9d51
	ret			;9d53
L_9D54:
	inc l			;9d54
	inc l			;9d55
	ld a,(hl)			;9d56
	sub 054h		;9d57
	cp 018h		;9d59
	ret nc			;9d5b
	inc l			;9d5c
	inc l			;9d5d
	ld a,(hl)			;9d5e
	sub 074h		;9d5f
	cp 018h		;9d61
	ret nc			;9d63
	dec l			;9d64
	dec l			;9d65
	dec l			;9d66
	dec l			;9d67
	ld (hl),000h		;9d68
	ld e,l			;9d6a
	ld d,h			;9d6b
	push de			;9d6c
	inc de			;9d6d
	ld bc,00009h		;9d6e
	ldir		;9d71
	pop de			;9d73
	ld a,e			;9d74
	srl a		;9d75
	srl a		;9d77
	ld hl,0efc0h		;9d79
	call 040c4h		;9d7c   ; hl_mas_a: HL = HL + A
	ld (hl),0e0h		;9d7f
	ret			;9d81
L_9D82:
	ld a,040h		;9d82
	ld (0f00fh),a		;9d84
	ld hl,08060h		;9d87
	ld (0f000h),hl		;9d8a
	call 075b4h		;9d8d
	ld d,001h		;9d90
	jp 07536h		;9d92
L_9D95:
	call L_866C		;9d95
	ld hl,09e03h		;9d98
	ld de,0ed00h		;9d9b
	ld bc,010ffh		;9d9e
L_9DA1:
	ld a,001h		;9da1
	ld (de),a			;9da3
	inc de			;9da4
	inc de			;9da5
	ld a,(hl)			;9da6
	and 0f0h		;9da7
	ld (de),a			;9da9
	inc de			;9daa
	inc de			;9dab
	ld a,(hl)			;9dac
	and 00fh		;9dad
	rrca			;9daf
	rrca			;9db0
	rrca			;9db1
	rrca			;9db2
	ld (de),a			;9db3
	inc hl			;9db4
	ld a,00ch		;9db5
	call 040c9h		;9db7   ; de_mas_a: DE = DE + A
	djnz L_9DA1		;9dba
	xor a			;9dbc
	ld (0ee0dh),a		;9dbd
	ld (0ee0eh),a		;9dc0
	ret			;9dc3
L_9DC4:
	ld a,(0e301h)		;9dc4   ; lee la fase (de 1 a 7; 0 en la presentacion)
	cp 004h		;9dc7
	ld a,001h		;9dc9
	jr c,L_9DCE		;9dcb
	xor a			;9dcd
L_9DCE:
	ld (0f000h),a		;9dce
	ld ix,0ed00h		;9dd1
	ld b,010h		;9dd5
L_9DD7:
	push bc			;9dd7
	call L_9DE6		;9dd8
	ld bc,00010h		;9ddb
	add ix,bc		;9dde
	pop bc			;9de0
	djnz L_9DD7		;9de1
	jp L_9C5E		;9de3
L_9DE6:
	ld a,(0f000h)		;9de6
	and a			;9de9
	jr nz,L_9DF2		;9dea
	ld de,0fe80h		;9dec
	jp L_9D22		;9def
L_9DF2:
	ld de,00180h		;9df2
	call L_9D30		;9df5
	ld a,(ix+002h)		;9df8
	cp 070h		;9dfb
	ret c			;9dfd
	ld (ix+002h),000h		;9dfe
	ret			;9e02

; ----------------------------------------------------------------------
; DATOS resto_9E03: lo apuntan con el banco puesto p10:9D98 (0x9E03); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p10:9D98 (16 bytes)
;   0x9e03..0x9e13  (16 bytes)
DATA_resto_9E03:
	defb 013h,039h,020h,02dh,035h,041h,057h,04ah,06eh,074h,07bh,068h,01ch,032h,016h,03fh	; 9e03  .9 -5AWJnt{h.2.?

; ======================================================================
; CODIGO 0x9e13..0x9ed8  (197 bytes)
; ======================================================================


L_9E13:
	ld (0ee55h),a		;9e13
	ld d,a			;9e16
	ld a,b			;9e17
	ld (0ee54h),a		;9e18
	ld a,c			;9e1b
	ld (0ee5ah),a		;9e1c
	ld (0ee52h),hl		;9e1f
	xor a			;9e22
	ld (0ee51h),a		;9e23
	inc a			;9e26
	ld (0ee50h),a		;9e27
	ld a,d			;9e2a
	and a			;9e2b
	ret z			;9e2c
	call L_9E4A		;9e2d
	call L_9E3E		;9e30
	ld hl,(0ee52h)		;9e33
	ld a,(0ee5ah)		;9e36
	ld d,a			;9e39
	xor a			;9e3a
	jp 04cd6h		;9e3b
L_9E3E:
	ld a,(0ee54h)		;9e3e
	ld l,a			;9e41
	ld h,000h		;9e42
	add hl,hl			;9e44
	add hl,hl			;9e45
	add hl,hl			;9e46
	ld c,l			;9e47
	ld b,h			;9e48
	ret			;9e49
L_9E4A:
	call L_9E3E		;9e4a
	ld hl,(0ee52h)		;9e4d
	ld de,0e700h		;9e50   ; apunta a los enemigos (12 fichas de 0x40 bytes)
	jp 00059h		;9e53   ; BIOS LDIRMV - Block transfers to memory from VRAM
L_9E56:
	ld a,(0ee50h)		;9e56
	and a			;9e59
	ret z			;9e5a
	ld a,(0ee55h)		;9e5b
	and a			;9e5e
	jp nz,L_9E97		;9e5f
	ld hl,(0ee52h)		;9e62
	ld a,(0ee54h)		;9e65
	ld b,a			;9e68
L_9E69:
	push hl			;9e69
	push bc			;9e6a
	ld a,(0ee51h)		;9e6b
	and 007h		;9e6e
	call 040c4h		;9e70   ; hl_mas_a: HL = HL + A
	ld bc,00001h		;9e73
	ld a,(0ee5ah)		;9e76
	ld d,a			;9e79
	xor a			;9e7a
	call 04cd6h		;9e7b
	pop bc			;9e7e
	ld de,00008h		;9e7f
	pop hl			;9e82
	add hl,de			;9e83
	djnz L_9E69		;9e84
	ld a,(0ee51h)		;9e86
	inc a			;9e89
	cp 008h		;9e8a
	jr z,L_9E92		;9e8c
	ld (0ee51h),a		;9e8e
	ret			;9e91
L_9E92:
	xor a			;9e92
	ld (0ee50h),a		;9e93
	ret			;9e96
L_9E97:
	ld hl,(0ee52h)		;9e97
	ld a,(0ee54h)		;9e9a
	ld b,a			;9e9d
	ld de,0e700h		;9e9e   ; apunta a los enemigos (12 fichas de 0x40 bytes)
L_9EA1:
	push bc			;9ea1
	push de			;9ea2
	push hl			;9ea3
	ld a,(0ee51h)		;9ea4
	call L_9ECA		;9ea7
	exx			;9eaa
	ld a,(0ee5ah)		;9eab
	ld b,a			;9eae
	call 04cc4h		;9eaf
	ld bc,00008h		;9eb2
	pop hl			;9eb5
	add hl,bc			;9eb6
	pop de			;9eb7
	ex de,hl			;9eb8
	add hl,bc			;9eb9
	ex de,hl			;9eba
	pop bc			;9ebb
	djnz L_9EA1		;9ebc
	ld a,(0ee51h)		;9ebe
	inc a			;9ec1
	cp 008h		;9ec2
	jr z,L_9E92		;9ec4
	ld (0ee51h),a		;9ec6
	ret			;9ec9
L_9ECA:
	and 007h		;9eca
	ld c,a			;9ecc
	call 040c4h		;9ecd   ; hl_mas_a: HL = HL + A
	ld a,c			;9ed0
	call 040c9h		;9ed1   ; de_mas_a: DE = DE + A
	ld bc,00001h		;9ed4
	ret			;9ed7

; ----------------------------------------------------------------------
; DATOS lista_9ED8: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p10:833D (44 bytes)
;   0x9ed8..0x9f04  (44 bytes)
DATA_lista_9ED8:
	defb 06ah,03ah,034h,028h,025h,000h,026h,021h,02eh,034h,021h,033h,034h,029h,023h,0feh	; 9ed8  j:4(%.&!.4!34)#.
	defb 0a4h,03ah,033h,030h,021h,023h,025h,000h,021h,024h,036h,025h,02eh,034h,035h,032h	; 9ee8  .:30!#%.!$6%.452
	defb 025h,000h,023h,02fh,02dh,02dh,025h,02eh,023h,025h,033h,0ffh	; 9ef8  %.#/--%.#%3.

; ----------------------------------------------------------------------
; DATOS relleno_ff: 252 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (252 bytes)
;   0x9f04..0xa000  (252 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f04  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f14  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f24  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f34  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f44  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f54  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f64  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f74  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f84  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9f94  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fa4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fb4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fc4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fd4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9fe4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9ff4  ............
