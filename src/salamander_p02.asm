; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l88e2h:	equ 0x088e2

; ======================================================================
; CODIGO 0x8000..0x818e  (398 bytes)
; ======================================================================


L_8000:
	jr L_8008		;8000
L_8002:
	ld a,(de)			;8002
	sub h			;8003
	cp l			;8004
	ret nc			;8005
	xor a			;8006
	ld (de),a			;8007
L_8008:
	call L_8017		;8008
	scf			;800b
	ret			;800c
L_800D:
	ld a,(0e6a3h)		;800d
	or a			;8010
	ret z			;8011
	ld hl,0ab01h		;8012
	jr L_8002		;8015
L_8017:
	ld a,(0e608h)		;8017
	or a			;801a
	ret nz			;801b
	inc a			;801c
	ld (0e608h),a		;801d
	ld a,037h		;8020
	jp 04d6eh		;8022
L_8025:
	call L_804C		;8025
	jr z,L_8025		;8028
	ret c			;802a
	ld hl,0e658h		;802b
	inc (hl)			;802e
	jr L_8025		;802f
L_8031:
	ld a,(0e620h)		;8031
	ld b,a			;8034
	ld hl,0e627h		;8035
	add a,l			;8038
	ld l,a			;8039
	ld a,(hl)			;803a
	and a			;803b
	ret z			;803c
	ld a,0f8h		;803d
	dec b			;803f
	jr nz,L_8043		;8040
	xor a			;8042
L_8043:
	ld (0f004h),a		;8043
L_8046:
	call L_804C		;8046
	jr z,L_8046		;8049
	ret			;804b
L_804C:
	call 06e2bh		;804c
	ret nz			;804f
	ld hl,0e658h		;8050
	inc (hl)			;8053
	ld b,c			;8054
	ld a,c			;8055
	and 01fh		;8056
	add a,a			;8058
	add a,a			;8059
	add a,a			;805a
	ld e,a			;805b
	ld a,(0f004h)		;805c
	ld d,a			;805f
	bit 6,c		;8060
	ld c,000h		;8062
	jr z,L_8067		;8064
	inc c			;8066
L_8067:
	ld a,(0e620h)		;8067
	or a			;806a
	jr z,L_8070		;806b
	ld a,d			;806d
	ld d,e			;806e
	ld e,a			;806f
L_8070:
	ld a,001h		;8070
	call 065bdh		;8072
	xor a			;8075
	ret			;8076
L_8077:
	ld c,002h		;8077
	ld (ix+014h),c		;8079
	ld (ix+013h),c		;807c
	ld (ix+027h),000h		;807f
	call L_812C		;8083
	sra a		;8086
	ld c,a			;8088
	ld a,(0e658h)		;8089
	and 003h		;808c
	add a,c			;808e
	ld (ix+015h),a		;808f
	ld c,(ix+019h)		;8092
	xor a			;8095
	bit 5,c		;8096
	jr z,L_809C		;8098
	ld a,002h		;809a
L_809C:
	bit 6,c		;809c
	jr nz,L_80A1		;809e
	inc a			;80a0
L_80A1:
	ld (ix+026h),a		;80a1
	ld (ix+010h),00bh		;80a4
	ld c,000h		;80a8
	jr L_80D0		;80aa
L_80AC:
	ld e,(ix+004h)		;80ac
	ld d,(ix+006h)		;80af
	call 07594h		;80b2
	ld a,(0e620h)		;80b5
	rra			;80b8
	ld a,(0f018h)		;80b9
	jr nc,L_80C0		;80bc
	sub 040h		;80be
L_80C0:
	cp 080h		;80c0
	jr c,L_80C6		;80c2
	neg		;80c4
L_80C6:
	ld bc,00202h		;80c6
L_80C9:
	sub 02ah		;80c9
	jr c,L_80D0		;80cb
	dec c			;80cd
	djnz L_80C9		;80ce
L_80D0:
	ld hl,081aeh		;80d0
	ld a,(ix+026h)		;80d3
	ld e,a			;80d6
	add a,a			;80d7
	add a,a			;80d8
	add a,a			;80d9
	call 040c4h		;80da
	ld a,(0e301h)		;80dd
	call 040c4h		;80e0
	ld a,(hl)			;80e3
	add a,c			;80e4
	ld (ix+032h),a		;80e5
	ret			;80e8
L_80E9:
	dec (ix+015h)		;80e9
	ld a,(ix+015h)		;80ec
	and 003h		;80ef
	ret nz			;80f1
	call L_80AC		;80f2
	ld a,(0e620h)		;80f5
	rra			;80f8
	ld a,(0f018h)		;80f9
	jr nc,L_8100		;80fc
	add a,040h		;80fe
L_8100:
	bit 1,(ix+026h)		;8100
	jr nz,L_810D		;8104
	sub 010h		;8106
	cp 060h		;8108
	ret c			;810a
	jr L_8112		;810b
L_810D:
	sub 090h		;810d
	cp 060h		;810f
	ret c			;8111
L_8112:
	ld a,(ix+015h)		;8112
	and a			;8115
	ret nz			;8116
	ld hl,0e607h		;8117
	ld a,(hl)			;811a
	and a			;811b
	jr z,L_8123		;811c
	ld (ix+015h),001h		;811e
	ret			;8122
L_8123:
	ld e,(ix+004h)		;8123
	ld d,(ix+006h)		;8126
	call 074c5h		;8129
L_812C:
	ld a,(0e620h)		;812c
	rra			;812f
	ld hl,0819eh		;8130
	jr c,L_8138		;8133
	ld hl,0818eh		;8135
L_8138:
	ld a,(0e304h)		;8138
	dec a			;813b
	ld a,(0e64fh)		;813c
	jr nz,L_8147		;813f
	cp 002h		;8141
	jr c,L_8147		;8143
	ld a,002h		;8145
L_8147:
	call 040c4h		;8147
	ld c,(hl)			;814a
	inc (ix+027h)		;814b
	ld a,(ix+027h)		;814e
	and 003h		;8151
	jr nz,L_8157		;8153
	sla c		;8155
L_8157:
	ld a,(0e300h)		;8157
	cp 002h		;815a
	ld a,c			;815c
	jr nz,L_8161		;815d
	sub 004h		;815f
L_8161:
	ld c,a			;8161
	ld a,(0e304h)		;8162
	srl a		;8165
	srl a		;8167
	ld b,a			;8169
	ld a,c			;816a
	sub b			;816b
	jr nc,L_816F		;816c
	xor a			;816e
L_816F:
	cp 00ch		;816f
	jr nc,L_8175		;8171
	ld a,00ch		;8173
L_8175:
	ld c,a			;8175
	ld a,(0e301h)		;8176
	and a			;8179
	jr z,L_8180		;817a
	cp 007h		;817c
	jr nz,L_818A		;817e
L_8180:
	ld a,c			;8180
	sub 008h		;8181
	cp 004h		;8183
	jr nc,L_8189		;8185
	ld a,004h		;8187
L_8189:
	ld c,a			;8189
L_818A:
	ld (ix+015h),c		;818a
	ret			;818d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x818e..0x81ce  (64 bytes)
DATA_818E:
	defb 050h,040h,030h,028h,024h,022h,020h,01eh,01ch,01ah,018h,016h,014h,012h,010h,00ch	; 818e  P@0($" .........
	defb 038h,02ah,021h,01ch,018h,017h,016h,015h,014h,013h,012h,011h,010h,00eh,00ch,00ah	; 819e  8*!.............
	defb 000h,00ch,018h,000h,000h,000h,000h,02bh,000h,00fh,01bh,000h,000h,000h,000h,02eh	; 81ae  .......+........
	defb 000h,012h,025h,000h,000h,000h,000h,031h,000h,015h,028h,000h,000h,000h,000h,034h	; 81be  ..%....1..(....4

; ======================================================================
; CODIGO 0x81ce..0x81ee  (32 bytes)
; ======================================================================


L_81CE:
	dec (ix+015h)		;81ce
	ret nz			;81d1
L_81D2:
	ld hl,0e607h		;81d2
	ld a,(hl)			;81d5
	and a			;81d6
	jr z,L_81DE		;81d7
	ld (ix+015h),001h		;81d9
	ret			;81dd
L_81DE:
	ld e,(ix+004h)		;81de
	ld d,(ix+006h)		;81e1
	call 074c5h		;81e4
	call 067cah		;81e7
	ld (ix+015h),a		;81ea
	ret			;81ed

; ----------------------------------------------------------------------
; DATOS sin identificar  0x81ee..0x81f6  (8 bytes)
DATA_81EE:
	defb 030h,00fh,034h,009h,038h,006h,03ch,00dh	; 81ee  0.4.8.<.

; ======================================================================
; CODIGO 0x81f6..0x8517  (801 bytes)
; ======================================================================


L_81F6:
	ld (ix+002h),000h		;81f6
	ld (ix+010h),008h		;81fa
	ld a,(0e35fh)		;81fe
	cp 004h		;8201
	ret c			;8203
	ld e,(ix+004h)		;8204
	ld d,(ix+006h)		;8207
	jp 074c5h		;820a
L_820D:
	ld a,(ix+002h)		;820d
	cp 008h		;8210
	jr nc,L_8228		;8212
	inc (ix+002h)		;8214
	and 006h		;8217
	ld hl,081eeh		;8219
	call 05ad8h		;821c
	ld (ix+030h),a		;821f
	inc hl			;8222
	ld a,(hl)			;8223
	ld (ix+031h),a		;8224
	ret			;8227
L_8228:
	xor a			;8228
	ld (ix+016h),a		;8229
	ld a,(ix+00ch)		;822c
	push af			;822f
	call 06b62h		;8230
	pop af			;8233
	or a			;8234
	ret z			;8235
	cp 002h		;8236
	ld a,02ah		;8238
	jr z,L_823D		;823a
	dec a			;823c
L_823D:
	ld b,a			;823d
	ld a,(ix+004h)		;823e
	and 0f8h		;8241
	ld e,a			;8243
	ld a,(ix+006h)		;8244
	and 0f8h		;8247
	ld d,a			;8249
	ld a,b			;824a
	jp 065bdh		;824b
L_824E:
	ld (ix+010h),009h		;824e
	ld a,002h		;8252
	ld (ix+013h),a		;8254
	ld (ix+014h),a		;8257
	ret			;825a
L_825B:
	call L_824E		;825b
	ld c,004h		;825e
	jp 04882h		;8260
L_8263:
	ld a,(0e337h)		;8263
	ld b,a			;8266
	ld a,(0e3b7h)		;8267
	cp b			;826a
	jr nc,L_826E		;826b
	ld a,b			;826d
L_826E:
	ld (0e63fh),a		;826e
	ld iy,0e300h		;8271
	call L_827C		;8275
	ld iy,0e380h		;8278
L_827C:
	ld a,(iy+020h)		;827c
	or a			;827f
	jp m,L_84DA		;8280
	ret z			;8283
	cp 004h		;8284
	ret z			;8286
	cp 003h		;8287
	jp z,L_8337		;8289
	call L_8447		;828c
	call L_848C		;828f
	call L_83E4		;8292
	call L_831C		;8295
	call 041c7h		;8298
	call L_82A1		;829b
	jp 041d0h		;829e
L_82A1:
	ld a,(0e620h)		;82a1
	or a			;82a4
	ld a,(iy+00fh)		;82a5
	jr z,L_82AC		;82a8
	rra			;82aa
	rra			;82ab
L_82AC:
	and 003h		;82ac
	cp 003h		;82ae
	jr nz,L_82B3		;82b0
	xor a			;82b2
L_82B3:
	ld b,a			;82b3
	or a			;82b4
	jr nz,L_82C7		;82b5
	ld a,(iy+020h)		;82b7
	cp 002h		;82ba
	jr nz,L_82C7		;82bc
	ld a,(0e203h)		;82be
	bit 1,a		;82c1
	jr z,L_82C7		;82c3
	ld b,003h		;82c5
L_82C7:
	ld a,b			;82c7
	ld b,a			;82c8
	add a,a			;82c9
	add a,a			;82ca
	add a,a			;82cb
	add a,b			;82cc
	call 040c4h		;82cd
	push hl			;82d0
	push iy		;82d1
	pop hl			;82d3
	ld de,00027h		;82d4
	add hl,de			;82d7
	ex de,hl			;82d8
	pop hl			;82d9
	ldi		;82da
	call L_8309		;82dc
	call L_8309		;82df
	bit 0,(iy+021h)		;82e2
	jr z,L_82F4		;82e6
	ld (iy+02ah),008h		;82e8
	ld (iy+02eh),00ch		;82ec
	ld (iy+02fh),009h		;82f0
L_82F4:
	ld a,(iy+020h)		;82f4
	cp 002h		;82f7
	ret nz			;82f9
	ld a,(iy+022h)		;82fa
	dec a			;82fd
	ret nz			;82fe
	ld a,(0e203h)		;82ff
	rra			;8302
	ret nc			;8303
	ld (iy+02fh),007h		;8304
	ret			;8308
L_8309:
	ld a,(iy+024h)		;8309
	add a,(hl)			;830c
	ld (de),a			;830d
	inc hl			;830e
	inc e			;830f
	ld a,(iy+026h)		;8310
	add a,(hl)			;8313
	ld (de),a			;8314
	inc hl			;8315
	inc e			;8316
	ldi		;8317
	ldi		;8319
	ret			;831b
L_831C:
	ld b,(iy+020h)		;831c
	ld a,(0e620h)		;831f
	or a			;8322
	jr nz,L_832E		;8323
	dec b			;8325
	ld hl,0a145h		;8326
	ret z			;8329
	ld hl,0a160h		;832a
	ret			;832d
L_832E:
	dec b			;832e
	ld hl,0a184h		;832f
	ret z			;8332
	ld hl,0a19fh		;8333
	ret			;8336
L_8337:
	call L_8447		;8337
	call L_848C		;833a
	call L_83E4		;833d
	call L_83D0		;8340
	call L_83B3		;8343
	call 041c7h		;8346
	call L_834F		;8349
	jp 041d0h		;834c
L_834F:
	ld a,(0e620h)		;834f
	or a			;8352
	ld a,(iy+00fh)		;8353
	jr z,L_835A		;8356
	rra			;8358
	rra			;8359
L_835A:
	and 003h		;835a
	cp 003h		;835c
	jr nz,L_8361		;835e
	xor a			;8360
L_8361:
	ld b,a			;8361
	or a			;8362
	jr nz,L_8374		;8363
	ld a,(iy+022h)		;8365
	or a			;8368
	jr z,L_8374		;8369
	ld a,(0e203h)		;836b
	bit 1,a		;836e
	jr z,L_8374		;8370
	ld b,003h		;8372
L_8374:
	ld a,b			;8374
L_8375:
	ld b,a			;8375
	add a,a			;8376
	add a,a			;8377
	add a,a			;8378
	add a,a			;8379
	add a,b			;837a
	call 040c4h		;837b
	push hl			;837e
	push iy		;837f
	pop hl			;8381
	ld de,00027h		;8382
	add hl,de			;8385
	ex de,hl			;8386
	pop hl			;8387
	ldi		;8388
	call L_8309		;838a
	call L_8309		;838d
	ld a,e			;8390
	add a,018h		;8391
	ld e,a			;8393
	call L_8309		;8394
	call L_8309		;8397
	ld a,(iy+020h)		;839a
	cp 003h		;839d
	ret nz			;839f
	ld a,(iy+022h)		;83a0
	dec a			;83a3
	ret nz			;83a4
	ld a,(0e203h)		;83a5
	rra			;83a8
	ret nc			;83a9
	ld (iy+02bh),007h		;83aa
	ld (iy+02fh),007h		;83ae
	ret			;83b2
L_83B3:
	ld b,(iy+022h)		;83b3
	ld a,(0e620h)		;83b6
	or a			;83b9
	jr nz,L_83C6		;83ba
	inc b			;83bc
	dec b			;83bd
	ld hl,0a1c3h		;83be
	ret z			;83c1
	ld hl,0a229h		;83c2
	ret			;83c5
L_83C6:
	inc b			;83c6
	dec b			;83c7
	ld hl,0a1f6h		;83c8
	ret z			;83cb
	ld hl,0a26dh		;83cc
	ret			;83cf
L_83D0:
	push iy		;83d0
	ld e,(iy+024h)		;83d2
	ld d,(iy+026h)		;83d5
	call 04da6h		;83d8
	ld (iy+024h),e		;83db
	ld (iy+026h),d		;83de
	pop iy		;83e1
	ret			;83e3
L_83E4:
	ld a,(0e620h)		;83e4
	or a			;83e7
	jr nz,L_8415		;83e8
	ld a,(iy+026h)		;83ea
	cp 008h		;83ed
	jr nc,L_83F3		;83ef
	ld a,008h		;83f1
L_83F3:
	cp 0d9h		;83f3
	jr c,L_83F9		;83f5
	ld a,0d8h		;83f7
L_83F9:
	ld (iy+026h),a		;83f9
	ld a,(iy+024h)		;83fc
	add a,010h		;83ff
	ld c,a			;8401
	ld a,c			;8402
	cp 013h		;8403
	jr nc,L_8409		;8405
	ld a,013h		;8407
L_8409:
	cp 0a8h		;8409
	jr c,L_840F		;840b
	ld a,0a7h		;840d
L_840F:
	sub 010h		;840f
	ld (iy+024h),a		;8411
	ret			;8414
L_8415:
	ld a,h			;8415
	cp 0f0h		;8416
	jr c,L_8424		;8418
	rr l		;841a
	ld a,0f0h		;841c
	jr nc,L_8421		;841e
	xor a			;8420
L_8421:
	ld (iy+026h),a		;8421
L_8424:
	ld a,(iy+024h)		;8424
	add a,010h		;8427
	cp 013h		;8429
	jr nc,L_842F		;842b
	ld a,013h		;842d
L_842F:
	ld b,a			;842f
	ld a,(iy+020h)		;8430
	cp 003h		;8433
	ld c,0a5h		;8435
	jr nz,L_843B		;8437
	ld c,097h		;8439
L_843B:
	ld a,b			;843b
	cp c			;843c
	jr c,L_8441		;843d
	dec c			;843f
	ld a,c			;8440
L_8441:
	sub 010h		;8441
	ld (iy+024h),a		;8443
	ret			;8446
L_8447:
	call 041c7h		;8447
	ld a,(iy+00fh)		;844a
	and 00fh		;844d
	add a,a			;844f
	add a,a			;8450
	ld c,a			;8451
	ld b,000h		;8452
	ld hl,0a2f5h		;8454
	add hl,bc			;8457
	ld e,(hl)			;8458
	inc hl			;8459
	ld d,(hl)			;845a
	inc hl			;845b
	ld c,(hl)			;845c
	inc hl			;845d
	ld b,(hl)			;845e
	ld (0f002h),bc		;845f
	ld a,(iy+020h)		;8463
	cp 003h		;8466
	ld a,(iy+037h)		;8468
	jr nz,L_8470		;846b
	ld a,(0e63fh)		;846d
L_8470:
	add a,003h		;8470
	ld (0f000h),a		;8472
	ld b,a			;8475
	ld l,e			;8476
	ld h,d			;8477
L_8478:
	add hl,de			;8478
	djnz L_8478		;8479
	push hl			;847b
	ld hl,(0f002h)		;847c
	ld e,l			;847f
	ld d,h			;8480
	ld a,(0f000h)		;8481
	ld b,a			;8484
L_8485:
	add hl,de			;8485
	djnz L_8485		;8486
	pop de			;8488
	jp 041d0h		;8489
L_848C:
	ld a,(iy+023h)		;848c
	add a,e			;848f
	ld (iy+023h),a		;8490
	ld a,(iy+024h)		;8493
	adc a,d			;8496
	ld (iy+024h),a		;8497
	bit 7,h		;849a
	jr nz,L_84AF		;849c
	ld a,(iy+025h)		;849e
	add a,l			;84a1
	ld (iy+025h),a		;84a2
	ld a,(iy+026h)		;84a5
	adc a,h			;84a8
	ld (iy+026h),a		;84a9
L_84AC:
	push af			;84ac
	pop hl			;84ad
	ret			;84ae
L_84AF:
	call 05ae7h		;84af
	ld a,(iy+025h)		;84b2
	sub l			;84b5
	ld (iy+025h),a		;84b6
	ld a,(iy+026h)		;84b9
	sbc a,h			;84bc
	ld (iy+026h),a		;84bd
	jr L_84AC		;84c0
L_84C2:
	ld a,(iy+020h)		;84c2
	dec a			;84c5
	ret m			;84c6
	ld (iy+020h),0ffh		;84c7
	ld (iy+038h),000h		;84cb
	ld (iy+039h),004h		;84cf
	ld a,001h		;84d3
	ld (0e6c0h),a		;84d5
	jr L_84ED		;84d8
L_84DA:
	dec (iy+039h)		;84da
	ret nz			;84dd
	ld (iy+039h),004h		;84de
	inc (iy+038h)		;84e2
	ld a,(iy+038h)		;84e5
	cp 004h		;84e8
	jp nc,L_84FC		;84ea
L_84ED:
	call 041c7h		;84ed
	ld hl,0a2b1h		;84f0
	ld a,(iy+038h)		;84f3
	call L_8375		;84f6
	jp 041d0h		;84f9
L_84FC:
	ld a,(iy+021h)		;84fc
	ld (0e22ch),a		;84ff
	xor a			;8502
	ld (0e213h),a		;8503
	ld (0e6c0h),a		;8506
	push iy		;8509
	pop hl			;850b
	ld (0e22eh),hl		;850c
	ret			;850f
L_8510:
	ld a,(0e301h)		;8510
	dec a			;8513
	call 040ceh		;8514

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8517..0x8525  (14 bytes)
DATA_8517:
	defb 025h,085h,0a5h,085h,0b5h,085h,0d2h,085h,026h,086h,036h,086h,0b4h,086h	; 8517  %.......&.6...

; ======================================================================
; CODIGO 0x8525..0x876c  (583 bytes)
; ======================================================================


L_8525:
	ld a,(0e309h)		;8525
	dec a			;8528
	jr z,L_8550		;8529
	dec a			;852b
	jr z,L_8562		;852c
	dec a			;852e
	jr z,L_857A		;852f
	dec a			;8531
	jr z,L_858C		;8532
	dec a			;8534
	jp z,L_86EF		;8535
	ld a,(0e629h)		;8538
	or a			;853b
	ret z			;853c
	ld a,001h		;853d
	ld (0e610h),a		;853f
	ld hl,00000h		;8542
	ld (0e614h),hl		;8545
	ld l,018h		;8548
	ld (0e612h),hl		;854a
	jp L_85A0		;854d
L_8550:
	ld a,(0e629h)		;8550
	or a			;8553
	ret z			;8554
	xor a			;8555
	ld (0e610h),a		;8556
	ld hl,001ffh		;8559
	ld (0e625h),hl		;855c
	jp L_85A0		;855f
L_8562:
	ld a,(0e629h)		;8562
	or a			;8565
	ret z			;8566
	ld a,001h		;8567
	ld (0e610h),a		;8569
	ld hl,00018h		;856c
	ld (0e614h),hl		;856f
	ld l,030h		;8572
	ld (0e612h),hl		;8574
	jp L_85A0		;8577
L_857A:
	ld a,(0e629h)		;857a
	or a			;857d
	ret z			;857e
	xor a			;857f
	ld (0e610h),a		;8580
	ld hl,0021fh		;8583
	ld (0e625h),hl		;8586
	jp L_85A0		;8589
L_858C:
	ld a,(0e629h)		;858c
	or a			;858f
	ret z			;8590
	ld l,001h		;8591
L_8593:
	xor a			;8593
	ld (0e644h),a		;8594
	ld h,a			;8597
	ld (0e640h),hl		;8598
	ld a,008h		;859b
	ld (0e642h),a		;859d
L_85A0:
	ld hl,0e309h		;85a0
	inc (hl)			;85a3
	ret			;85a4
L_85A5:
	ld a,(0e309h)		;85a5
	dec a			;85a8
	jp z,L_86EF		;85a9
	ld a,(0e629h)		;85ac
	and a			;85af
	ret z			;85b0
	ld l,002h		;85b1
	jr L_8593		;85b3
L_85B5:
	ld a,(0e309h)		;85b5
	dec a			;85b8
	jp z,L_85C9		;85b9
	dec a			;85bc
	jp z,L_86EF		;85bd
	ld a,(0e629h)		;85c0
	and a			;85c3
	ret z			;85c4
	ld l,008h		;85c5
	jr L_8593		;85c7
L_85C9:
	ld a,(0e644h)		;85c9
	dec a			;85cc
	ret nz			;85cd
	ld l,003h		;85ce
L_85D0:
	jr L_8593		;85d0
L_85D2:
	ld a,(0e309h)		;85d2
	dec a			;85d5
	jr z,L_85F9		;85d6
	dec a			;85d8
	jr z,L_860B		;85d9
	dec a			;85db
	jr z,L_861A		;85dc
	dec a			;85de
	jp z,L_86EF		;85df
	ld a,(0e629h)		;85e2
	and a			;85e5
	ret z			;85e6
	ld a,001h		;85e7
	ld (0e610h),a		;85e9
	ld hl,00000h		;85ec
	ld (0e614h),hl		;85ef
	ld l,018h		;85f2
	ld (0e612h),hl		;85f4
	jr L_85A0		;85f7
L_85F9:
	ld a,(0e629h)		;85f9
	or a			;85fc
	ret z			;85fd
	xor a			;85fe
	ld (0e610h),a		;85ff
	ld hl,0025fh		;8602
	ld (0e625h),hl		;8605
	jp L_85A0		;8608
L_860B:
	ld a,(0e629h)		;860b
	and a			;860e
	ret z			;860f
	call 0bd3eh		;8610
	ld a,001h		;8613
	ld (0e648h),a		;8615
	jr L_85A0		;8618
L_861A:
	call 0bd53h		;861a
	ld a,(0e648h)		;861d
	or a			;8620
	ret nz			;8621
	ld l,004h		;8622
	jr L_85D0		;8624
L_8626:
	ld a,(0e309h)		;8626
	dec a			;8629
	jp z,L_86EF		;862a
	ld a,(0e629h)		;862d
	and a			;8630
	ret z			;8631
	ld l,005h		;8632
	jr L_85D0		;8634
L_8636:
	ld a,(0e309h)		;8636
	dec a			;8639
	jr z,L_8664		;863a
	dec a			;863c
	jr z,L_8676		;863d
	dec a			;863f
	jr z,L_868E		;8640
	dec a			;8642
	jr z,L_86A0		;8643
	dec a			;8645
	jr z,L_86AA		;8646
	dec a			;8648
	jp z,L_86EF		;8649
	ld a,(0e629h)		;864c
	and a			;864f
	ret z			;8650
	ld a,003h		;8651
	ld (0e610h),a		;8653
	ld hl,00000h		;8656
	ld (0e614h),hl		;8659
	ld l,020h		;865c
	ld (0e612h),hl		;865e
	jp L_85A0		;8661
L_8664:
	ld a,(0e629h)		;8664
	and a			;8667
	ret z			;8668
	xor a			;8669
	ld (0e610h),a		;866a
	ld hl,00167h		;866d
	ld (0e625h),hl		;8670
	jp L_85A0		;8673
L_8676:
	ld a,(0e629h)		;8676
	and a			;8679
	ret z			;867a
	ld a,004h		;867b
	ld (0e610h),a		;867d
	ld hl,0003fh		;8680
	ld (0e614h),hl		;8683
	ld l,01fh		;8686
	ld (0e612h),hl		;8688
	jp L_85A0		;868b
L_868E:
	ld a,(0e629h)		;868e
	and a			;8691
	ret z			;8692
	xor a			;8693
	ld (0e610h),a		;8694
	ld hl,00227h		;8697
	ld (0e625h),hl		;869a
	jp L_85A0		;869d
L_86A0:
	ld a,(0e629h)		;86a0
	and a			;86a3
	ret z			;86a4
	ld l,007h		;86a5
	jp L_8593		;86a7
L_86AA:
	ld a,(0e644h)		;86aa
	dec a			;86ad
	ret nz			;86ae
	ld l,006h		;86af
	jp L_8593		;86b1
L_86B4:
	ld a,(0e309h)		;86b4
	dec a			;86b7
	jr z,L_86CD		;86b8
	dec a			;86ba
	jr z,L_86DB		;86bb
	dec a			;86bd
	jr z,L_86E8		;86be
	ld a,(0e629h)		;86c0
	and a			;86c3
	ret z			;86c4
	ld a,001h		;86c5
	ld (0e6c8h),a		;86c7
	jp L_85A0		;86ca
L_86CD:
	ld a,(0e6c8h)		;86cd
	or a			;86d0
	ret nz			;86d1
	ld hl,001dfh		;86d2
	ld (0e625h),hl		;86d5
	jp L_85A0		;86d8
L_86DB:
	ld a,(0e629h)		;86db
	and a			;86de
	ret z			;86df
	ld a,081h		;86e0
	ld (0e6c8h),a		;86e2
	jp L_85A0		;86e5
L_86E8:
	ld a,(0e6c8h)		;86e8
	or a			;86eb
	ret nz			;86ec
	jr L_86F4		;86ed
L_86EF:
	ld a,(0e644h)		;86ef
	dec a			;86f2
	ret nz			;86f3
L_86F4:
	ld a,(0e6c0h)		;86f4
	or a			;86f7
	ret nz			;86f8
	ld a,001h		;86f9
	ld (0e21ah),a		;86fb
	ld a,001h		;86fe
	jp 04d6eh		;8700
L_8703:
	xor a			;8703
	ld (0e309h),a		;8704
	ld hl,00020h		;8707
	ld (0e302h),hl		;870a
	ld a,(0e21bh)		;870d
	ld (0e301h),a		;8710
	ld hl,0e304h		;8713
	ld a,(hl)			;8716
	inc a			;8717
	cp 00fh		;8718
	jr c,L_871E		;871a
	ld a,00fh		;871c
L_871E:
	ld (hl),a			;871e
	ret			;871f
L_8720:
	ld a,(0e600h)		;8720
	and a			;8723
	ret nz			;8724
	ld a,(0e6c0h)		;8725
	and a			;8728
	ret nz			;8729
	ld a,(0e6aah)		;872a
	or a			;872d
	ret nz			;872e
	ld a,(0e638h)		;872f
	or a			;8732
	ret nz			;8733
	ld a,(0e1b8h)		;8734
	bit 0,a		;8737
	ret nz			;8739
	ld a,(0e301h)		;873a
	ld hl,0876ah		;873d
	call 04e28h		;8740
	ld c,e			;8743
	ld b,d			;8744
	ld hl,(0e302h)		;8745
L_8748:
	ld a,(bc)			;8748
	ld e,a			;8749
	inc bc			;874a
	ld a,(bc)			;874b
	ld d,a			;874c
	inc bc			;874d
	rst 20h			;874e
	jr z,L_8767		;874f
	jr c,L_8756		;8751
	inc bc			;8753
	jr L_8748		;8754
L_8756:
	ld a,(bc)			;8756
	ld hl,0e0b0h		;8757
	cp (hl)			;875a
	ret z			;875b
	cp 0ffh		;875c
	ret z			;875e
	call 04d6eh		;875f
	ld a,0f0h		;8762
	jp 04d6eh		;8764
L_8767:
	ld a,0f1h		;8767
	jp 04d6eh		;8769

; ----------------------------------------------------------------------
; DATOS sin identificar  0x876c..0x87a4  (56 bytes)
DATA_876C:
	defb 07ah,087h,080h,087h,086h,087h,08ch,087h,092h,087h,098h,087h,09eh,087h,0f0h,001h	; 876c  z...............
	defb 01bh,0ffh,0ffh,021h,0f0h,001h,01ch,0ffh,0ffh,021h,0fah,001h,01eh,0ffh,0ffh,021h	; 877c  ...!.....!.....!
	defb 040h,002h,01dh,0ffh,0ffh,021h,0b0h,001h,01fh,0ffh,0ffh,021h,008h,002h,020h,0ffh	; 878c  @....!.....!.. .
	defb 0ffh,021h,0dah,002h,019h,0ffh,0ffh,021h	; 879c  .!.....!

; ======================================================================
; CODIGO 0x87a4..0x8853  (175 bytes)
; ======================================================================


L_87A4:
	call L_87B6		;87a4
	call 0a58fh		;87a7
	jp 0a54ah		;87aa
L_87AD:
	call L_87BD		;87ad
	ld iy,0e380h		;87b0
	jr L_87C1		;87b4
L_87B6:
	ld a,(0e227h)		;87b6
	cp 002h		;87b9
	jr z,L_87AD		;87bb
L_87BD:
	ld iy,0e300h		;87bd
L_87C1:
	push iy		;87c1
	pop hl			;87c3
	ld a,(iy+020h)		;87c4
	or a			;87c7
	ret z			;87c8
	inc a			;87c9
	jr nz,L_8825		;87ca
	xor a			;87cc
	ld (iy+034h),a		;87cd
	ld (iy+068h),a		;87d0
	ld (iy+01bh),a		;87d3
	ld a,l			;87d6
	add a,019h		;87d7
	ld l,a			;87d9
	ld d,h			;87da
	ld e,l			;87db
	inc de			;87dc
	ld bc,00006h		;87dd
	ld (hl),000h		;87e0
	ldir		;87e2
	inc hl			;87e4
	ld (hl),001h		;87e5
	inc hl			;87e7
	inc hl			;87e8
	ld (hl),000h		;87e9
	inc hl			;87eb
	ld a,(0e6a5h)		;87ec
	or a			;87ef
	ld bc,0001ch		;87f0
	jr z,L_87FC		;87f3
	ld bc,00004h		;87f5
	add hl,bc			;87f8
	ld bc,00018h		;87f9
L_87FC:
	ld d,h			;87fc
	ld e,l			;87fd
	inc de			;87fe
	ld (hl),000h		;87ff
	ldir		;8801
	inc hl			;8803
	ld (hl),001h		;8804
	inc hl			;8806
	ld (hl),000h		;8807
	inc hl			;8809
	ld bc,00005h		;880a
	ld d,h			;880d
	ld e,l			;880e
	inc de			;880f
	ld (hl),000h		;8810
	ldir		;8812
	ld a,(0e6a5h)		;8814
	or a			;8817
	jr z,L_8838		;8818
	ld a,(0e60bh)		;881a
	cp 003h		;881d
	ret nz			;881f
	ld (iy+017h),0ffh		;8820
	ret			;8824
L_8825:
	ld bc,00044h		;8825
	add hl,bc			;8828
	ld d,h			;8829
	ld e,l			;882a
	inc de			;882b
	ld bc,00003h		;882c
	ld (hl),000h		;882f
	ldir		;8831
	ld a,(0e6a5h)		;8833
	or a			;8836
	ret nz			;8837
L_8838:
	ld a,(iy+021h)		;8838
	add a,a			;883b
	add a,a			;883c
	ld b,a			;883d
	ld a,(0e620h)		;883e
	add a,a			;8841
	add a,b			;8842
	ld hl,08853h		;8843
	call 040c4h		;8846
	ld e,(hl)			;8849
	inc hl			;884a
	ld d,(hl)			;884b
	ld (iy+024h),e		;884c
	ld (iy+026h),d		;884f
	ret			;8852

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8853..0x885b  (8 bytes)
DATA_8853:
	defb 03ah,050h,06ah,050h,06ah,050h,06ah,090h	; 8853  :PjPjPj.

; ======================================================================
; CODIGO 0x885b..0x88e3  (136 bytes)
; ======================================================================


L_885B:
	ld a,(0e304h)		;885b
	srl a		;885e
	cp 00fh		;8860
	jr c,L_8866		;8862
	ld a,00fh		;8864
L_8866:
	ld (0e64fh),a		;8866
	ret			;8869
L_886A:
	xor a			;886a
	ld (0e600h),a		;886b
	ld hl,0e630h		;886e
	ld de,0e631h		;8871
	ld bc,0094fh		;8874
	ld (hl),000h		;8877
	ldir		;8879
	ld hl,0c000h		;887b
	ld de,0c001h		;887e
	ld bc,00fffh		;8881
	ld (hl),a			;8884
	ldir		;8885
	xor a			;8887
	ld (0e215h),a		;8888
	ld a,(0e301h)		;888b
	ld hl,l88e2h		;888e
	call 05ad8h		;8891
	ld (0e605h),a		;8894
	xor a			;8897
	ld (0e629h),a		;8898
	ld a,(0e301h)		;889b
	add a,a			;889e
	ld c,a			;889f
	add a,a			;88a0
	add a,c			;88a1
	ld hl,088f2h		;88a2
	call 040c4h		;88a5
	ld de,0e621h		;88a8
	ld bc,00006h		;88ab
	ldir		;88ae
	ld a,(0e301h)		;88b0
	ld hl,08921h		;88b3
	call 05ad8h		;88b6
	ld (0e620h),a		;88b9
	ld a,(0e301h)		;88bc
	ld hl,088e8h		;88bf
	call 04e28h		;88c2
	ld hl,(0e302h)		;88c5
	rst 20h			;88c8
	jr nc,L_88CE		;88c9
	ld de,00020h		;88cb
L_88CE:
	ld (0e302h),de		;88ce
	xor a			;88d2
	ld (0e309h),a		;88d3
	ld (0e62ah),a		;88d6
	inc a			;88d9
	ld (0e616h),a		;88da
	ld a,040h		;88dd
	ld (0e654h),a		;88df
L_88E2:
	ret			;88e2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x88e3..0x8929  (70 bytes)
DATA_88E3:
	defb 060h,055h,079h,053h,090h,05ch,052h,010h,001h,020h,001h,028h,001h,0f8h,000h,0f4h	; 88e3  `UyS.\R.. .(....
	defb 000h,0e8h,000h,010h,001h,080h,000h,000h,002h,01fh,001h,048h,000h,0f8h,001h,00fh	; 88f3  ...........H....
	defb 002h,060h,000h,010h,002h,00fh,002h,080h,000h,060h,002h,0bfh,001h,080h,000h,0c0h	; 8903  .`.......`......
	defb 001h,0dfh,001h,048h,000h,028h,002h,04fh,001h,000h,000h,0e0h,001h,0bfh,001h,000h	; 8913  ...H.(.O........
	defb 001h,001h,000h,000h,001h,000h	; 8923

; ======================================================================
; CODIGO 0x8929..0x8969  (64 bytes)
; ======================================================================


L_8929:
	ld iy,0e300h		;8929
	call L_8934		;892d
	ld iy,0e380h		;8930
L_8934:
	ld a,(iy+020h)		;8934
	dec a			;8937
	ret m			;8938
	ld a,(iy+00eh)		;8939
	and 020h		;893c
	ret z			;893e
	ld a,(iy+011h)		;893f
	or a			;8942
	ret z			;8943
	ld (iy+01ah),a		;8944
	push iy		;8947
	pop hl			;8949
	ld bc,00011h		;894a
	add hl,bc			;894d
	add a,l			;894e
	ld l,a			;894f
	ld a,(hl)			;8950
	or a			;8951
	ret m			;8952
	ld (iy+011h),000h		;8953
	ld hl,05d8eh		;8957
	push hl			;895a
	ld a,(iy+01ah)		;895b
	ld hl,08967h		;895e
	call 040cfh		;8961
	ld a,00ch		;8964
	jp 04d6eh		;8966

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8969..0x8b1f  (438 bytes)
DATA_8969:
	defb 077h,089h,089h,089h,0d4h,089h,0e9h,089h,029h,08ah,04eh,08ah,087h,08ah,0fdh,034h	; 8969  w.......).N....4
	defb 012h,0fdh,07eh,012h,0feh,007h,038h,004h,0fdh,036h,012h,0ffh,0fdh,077h,037h,0c9h	; 8979  ..~...8..6...w7.
	defb 0fdh,034h,013h,0fdh,07eh,013h,03dh,028h,021h,03dh,028h,00fh,0fdh,07eh,020h,0feh	; 8989  .4..~.=(!=(..~ .
	defb 003h,0d8h,0fdh,036h,040h,007h,0cdh,0adh,08ah,018h,023h,0fdh,07eh,020h,0feh,003h	; 8999  ...6@.....#.~ ..
	defb 0d8h,0fdh,036h,040h,006h,0cdh,0adh,08ah,018h,00bh,0fdh,036h,040h,001h,0fdh,07eh	; 89a9  ..6@.......6@..~
	defb 020h,0feh,003h,038h,009h,0cdh,0bfh,08ah,0fdh,07eh,013h,0b9h,038h,004h,0fdh,036h	; 89b9   ..8.....~..8..6
	defb 013h,0ffh,0fdh,036h,015h,000h,0fdh,036h,016h,000h,0c9h,0cdh,0bfh,08ah,0fdh,034h	; 89c9  ...6...6.......4
	defb 014h,0fdh,07eh,014h,0b9h,038h,004h,0fdh,036h,014h,0ffh,0fdh,077h,041h,018h,03dh	; 89d9  ..~..8..6...wA.=
	defb 0fdh,034h,015h,0fdh,07eh,015h,03dh,028h,014h,0fdh,07eh,020h,0feh,003h,0d8h,0fdh	; 89e9  .4..~.=(..~ ....
	defb 036h,041h,004h,0fdh,036h,040h,000h,0fdh,036h,014h,000h,018h,00bh,0fdh,036h,040h	; 89f9  6A..6@..6.....6@
	defb 002h,0fdh,07eh,020h,0feh,003h,038h,009h,0cdh,0bfh,08ah,0fdh,07eh,015h,0b9h,038h	; 8a09  ..~ ..8.....~..8
	defb 004h,0fdh,036h,015h,0ffh,0fdh,036h,013h,000h,0fdh,036h,016h,000h,0c3h,0a8h,08ah	; 8a19  ..6...6...6.....
	defb 0cdh,0bfh,08ah,0fdh,034h,016h,0fdh,07eh,016h,0b9h,038h,004h,0fdh,036h,016h,0ffh	; 8a29  ....4..~..8..6..
	defb 021h,04ah,08ah,0cdh,0d8h,05ah,0fdh,077h,040h,0afh,0fdh,077h,013h,0fdh,077h,015h	; 8a39  !J...Z.w@..w..w.
	defb 018h,05dh,003h,005h,004h,0fdh,034h,017h,0fdh,07eh,017h,0fdh,077h,030h,00eh,003h	; 8a49  .]....4..~..w0..
	defb 03ah,027h,0e2h,0feh,002h,028h,001h,00ch,021h,00bh,0e6h,034h,07eh,0b9h,038h,019h	; 8a59  :'...(..!..4~.8.
	defb 0fdh,036h,017h,0ffh,03ah,027h,0e2h,0feh,002h,020h,00eh,0fdh,0e5h,0cdh,0a6h,04dh	; 8a69  .6..:'... .....M
	defb 0fdh,036h,017h,0ffh,0cdh,08eh,05dh,0fdh,0e1h,0cdh,0b8h,0a5h,018h,021h,0fdh,036h	; 8a79  .6....]......!.6
	defb 018h,0ffh,0fdh,07eh,020h,03dh,028h,00fh,03dh,0c8h,0fdh,036h,03ch,002h,0fdh,036h	; 8a89  ...~ =(.=..6<..6
	defb 03dh,00ah,0fdh,036h,022h,00ah,0c9h,0fdh,036h,020h,002h,0fdh,036h,022h,00ah,011h	; 8a99  =..6"...6 ..6"..
	defb 080h,000h,018h,003h,011h,000h,001h,02ah,04eh,0e6h,019h,07ch,0feh,010h,038h,002h	; 8aa9  .......*N..|..8.
	defb 026h,00fh,022h,04eh,0e6h,0c9h,0fdh,046h,01ah,0fdh,07eh,010h,087h,087h,080h,021h	; 8ab9  &."N...F..~....!
	defb 0f6h,08ah,0cdh,0c4h,040h,04eh,0fdh,07eh,010h,0d6h,005h,0d8h,047h,0fdh,07eh,020h	; 8ac9  ....@N.~....G.~
	defb 0feh,003h,0d0h,0fdh,07eh,01ah,005h,028h,009h,005h,028h,00ch,0feh,002h,0c0h,00eh	; 8ad9  ....~..(..(.....
	defb 001h,0c9h,0feh,002h,0c0h,00eh,002h,0c9h,0feh,004h,0c0h,00eh,001h,0c9h,0c9h,001h	; 8ae9  ................
	defb 001h,001h,001h,001h,002h,001h,001h,001h,002h,001h,002h,001h,002h,001h,003h,001h	; 8af9  ................
	defb 003h,001h,003h,002h,003h,001h,003h,003h,003h,001h,003h,003h,003h,002h,003h,003h	; 8b09  ................
	defb 005h,005h,003h,002h,002h,004h	; 8b19

; ======================================================================
; CODIGO 0x8b1f..0x8ce4  (453 bytes)
; ======================================================================


L_8B1F:
	ld a,(iy+010h)		;8b1f
	ld hl,08b17h		;8b22
	call 05ad8h		;8b25
	dec a			;8b28
	ld c,a			;8b29
	ld a,(iy+010h)		;8b2a
	add a,a			;8b2d
	add a,a			;8b2e
	ld hl,08af8h		;8b2f
	call 040c4h		;8b32
	ld a,(iy+020h)		;8b35
	cp 003h		;8b38
	jr nc,L_8B46		;8b3a
	ld a,(iy+010h)		;8b3c
	cp 005h		;8b3f
	jr c,L_8B46		;8b41
	ld hl,08b08h		;8b43
L_8B46:
	push iy		;8b46
	pop de			;8b48
	ld a,013h		;8b49
	call 040c9h		;8b4b
	ld b,004h		;8b4e
L_8B50:
	dec c			;8b50
	ld a,(de)			;8b51
	inc a			;8b52
	jr nz,L_8B5C		;8b53
	ld a,c			;8b55
	or a			;8b56
	jr nz,L_8B5C		;8b57
	ld a,(hl)			;8b59
	dec a			;8b5a
	ld (de),a			;8b5b
L_8B5C:
	inc hl			;8b5c
	inc de			;8b5d
	djnz L_8B50		;8b5e
	ret			;8b60
L_8B61:
	ld a,(0ec20h)		;8b61
	or a			;8b64
	ret z			;8b65
	ld a,(0e627h)		;8b66
	or a			;8b69
	jr z,L_8B81		;8b6a
	ld a,(0ec22h)		;8b6c
	jp m,L_8B7D		;8b6f
	sub 008h		;8b72
L_8B74:
	ld (0ec22h),a		;8b74
	ret nc			;8b77
L_8B78:
	xor a			;8b78
	ld (0ec20h),a		;8b79
	ret			;8b7c
L_8B7D:
	add a,008h		;8b7d
	jr L_8B74		;8b7f
L_8B81:
	ld a,(0e628h)		;8b81
	or a			;8b84
	ret z			;8b85
	ld a,008h		;8b86
	jp p,L_8B8D		;8b88
	ld a,0f8h		;8b8b
L_8B8D:
	ld hl,0ec21h		;8b8d
	add a,(hl)			;8b90
	ld (hl),a			;8b91
	cp 0a8h		;8b92
	ret c			;8b94
	jr L_8B78		;8b95
L_8B97:
	ld a,(0ec20h)		;8b97
	or a			;8b9a
	ret z			;8b9b
	ld hl,(0ec21h)		;8b9c
	call 05a99h		;8b9f
	ld (0ec23h),hl		;8ba2
	ld (hl),024h		;8ba5
	inc l			;8ba7
	ld (hl),025h		;8ba8
	ld bc,0003fh		;8baa
	add hl,bc			;8bad
	ld (hl),026h		;8bae
	inc l			;8bb0
	ld (hl),027h		;8bb1
	ret			;8bb3
L_8BB4:
	ld a,(0ec20h)		;8bb4
	or a			;8bb7
	ret z			;8bb8
	ld hl,(0ec23h)		;8bb9
	xor a			;8bbc
	ld (hl),a			;8bbd
	inc l			;8bbe
	ld (hl),a			;8bbf
	ld bc,0003fh		;8bc0
	add hl,bc			;8bc3
	ld (hl),a			;8bc4
	inc l			;8bc5
	ld (hl),a			;8bc6
	ret			;8bc7
L_8BC8:
	ld a,001h		;8bc8
	ld (0e63eh),a		;8bca
	ld ix,0e700h		;8bcd
	ld b,00ch		;8bd1
L_8BD3:
	push bc			;8bd3
	bit 1,(ix+010h)		;8bd4
	jr z,L_8BF0		;8bd8
	ld iy,0e440h		;8bda
	ld de,00018h		;8bde
	ld b,00fh		;8be1
L_8BE3:
	ld a,(iy+000h)		;8be3
	or a			;8be6
	call nz,L_8C10		;8be7
	jr c,L_8BF0		;8bea
	add iy,de		;8bec
	djnz L_8BE3		;8bee
L_8BF0:
	ld de,00040h		;8bf0
	add ix,de		;8bf3
	pop bc			;8bf5
	djnz L_8BD3		;8bf6
	ret			;8bf8
L_8BF9:
	ld a,(iy+00ah)		;8bf9
	dec a			;8bfc
	add a,a			;8bfd
	add a,a			;8bfe
	add a,a			;8bff
	neg		;8c00
	add a,(iy+003h)		;8c02
	ld c,a			;8c05
	ld a,(ix+004h)		;8c06
	sub c			;8c09
	jp nc,L_8C30		;8c0a
	jp L_8C26		;8c0d
L_8C10:
	sub 006h		;8c10
	cp 005h		;8c12
	jp nc,L_8C1D		;8c14
	ld a,(0e620h)		;8c17
	or a			;8c1a
	jr nz,L_8BF9		;8c1b
L_8C1D:
	ld a,(ix+004h)		;8c1d
	sub (iy+003h)		;8c20
	jp nc,L_8C30		;8c23
L_8C26:
	neg		;8c26
	dec a			;8c28
	cp (ix+00eh)		;8c29
	jp c,L_8C34		;8c2c
	ret			;8c2f
L_8C30:
	cp (iy+00dh)		;8c30
	ret nc			;8c33
L_8C34:
	ld a,(ix+006h)		;8c34
	sub (iy+005h)		;8c37
	jp nc,L_8C46		;8c3a
	neg		;8c3d
	cp (ix+00fh)		;8c3f
	jp c,L_8C4A		;8c42
	ret			;8c45
L_8C46:
	cp (iy+00ch)		;8c46
	ret nc			;8c49
L_8C4A:
	call L_8C4F		;8c4a
	scf			;8c4d
	ret			;8c4e
L_8C4F:
	call L_8D13		;8c4f
	bit 4,(ix+010h)		;8c52
	jp nz,L_8D5F		;8c56
	ld a,(iy+000h)		;8c59
	ld b,a			;8c5c
	sub 006h		;8c5d
	cp 005h		;8c5f
	jr c,L_8C67		;8c61
	ld (iy+000h),000h		;8c63
L_8C67:
	dec (ix+00dh)		;8c67
	jr z,L_8C7B		;8c6a
	ld a,b			;8c6c
	cp 00ch		;8c6d
	ret nz			;8c6f
	ld a,(ix+00dh)		;8c70
	sub 01fh		;8c73
	ld (ix+00dh),a		;8c75
	jr z,L_8C7B		;8c78
	ret nc			;8c7a
L_8C7B:
	ld a,(ix+000h)		;8c7b
	cp 004h		;8c7e
	jr nz,L_8C8D		;8c80
	ld a,(ix+019h)		;8c82
	or a			;8c85
	push ix		;8c86
	call z,L_9FF1		;8c88
	pop ix		;8c8b
L_8C8D:
	ld de,00001h		;8c8d
	ld a,(0e63eh)		;8c90
	or a			;8c93
	push af			;8c94
	call nz,05919h		;8c95
	pop af			;8c98
	call z,05936h		;8c99
L_8C9C:
	ld a,(ix+000h)		;8c9c
	ld c,a			;8c9f
	ld b,000h		;8ca0
	ld l,a			;8ca2
	ld h,b			;8ca3
	add hl,hl			;8ca4
	add hl,hl			;8ca5
	add hl,hl			;8ca6
	or a			;8ca7
	sbc hl,bc		;8ca8
	ld bc,06c62h		;8caa
	add hl,bc			;8cad
	ld a,(hl)			;8cae
	rra			;8caf
	rra			;8cb0
	rra			;8cb1
	rra			;8cb2
	and 00fh		;8cb3
	cp 005h		;8cb5
	jr nc,L_8CC2		;8cb7
	ld hl,08ce4h		;8cb9
	call 05ad8h		;8cbc
	call 04d6eh		;8cbf
L_8CC2:
	call L_8CE9		;8cc2
	ld a,(ix+000h)		;8cc5
	push af			;8cc8
	push bc			;8cc9
	call 06b62h		;8cca
	pop bc			;8ccd
	pop af			;8cce
	sub 031h		;8ccf
	cp 002h		;8cd1
	ret c			;8cd3
	sub 007h		;8cd4
	cp 006h		;8cd6
	ret c			;8cd8
	ld a,026h		;8cd9
	ld e,(ix+004h)		;8cdb
	ld d,(ix+006h)		;8cde
	jp 065b5h		;8ce1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8ce4..0x8ce9  (5 bytes)
DATA_8CE4:
	defb 00dh,00eh,00fh,03eh,050h	; 8ce4

; ======================================================================
; CODIGO 0x8ce9..0x8f9c  (691 bytes)
; ======================================================================


L_8CE9:
	ld c,(ix+00ch)		;8ce9
	ld a,(ix+016h)		;8cec
	and a			;8cef
	ret z			;8cf0
	ld c,000h		;8cf1
	ld a,(ix+017h)		;8cf3
	call L_8D05		;8cf6
	ret c			;8cf9
	ld a,(hl)			;8cfa
	inc l			;8cfb
	inc l			;8cfc
	dec (hl)			;8cfd
	ret nz			;8cfe
	dec l			;8cff
	dec l			;8d00
	ld (hl),000h		;8d01
	inc c			;8d03
	ret			;8d04
L_8D05:
	ld hl,0ec30h		;8d05
	ld b,004h		;8d08
L_8D0A:
	cp (hl)			;8d0a
	ret z			;8d0b
	inc l			;8d0c
	inc l			;8d0d
	inc l			;8d0e
	djnz L_8D0A		;8d0f
	scf			;8d11
	ret			;8d12
L_8D13:
	ld a,(ix+000h)		;8d13
	cp 01bh		;8d16
	jr z,L_8D36		;8d18
	cp 004h		;8d1a
	jr z,L_8D27		;8d1c
	cp 00ch		;8d1e
	jr z,L_8D31		;8d20
	cp 016h		;8d22
	jr z,L_8D31		;8d24
	ret			;8d26
L_8D27:
	ld a,(ix+019h)		;8d27
	or a			;8d2a
	ret z			;8d2b
	ld (ix+027h),001h		;8d2c
	ret			;8d30
L_8D31:
	ld (ix+028h),001h		;8d31
	ret			;8d35
L_8D36:
	ld a,(iy+000h)		;8d36
	ld (iy+000h),000h		;8d39
	sub 006h		;8d3d
	cp 005h		;8d3f
	ret nc			;8d41
	ld b,a			;8d42
	ld a,(ix+006h)		;8d43
	and 0f8h		;8d46
	cp 018h		;8d48
	ret c			;8d4a
	ld d,a			;8d4b
	ld e,(iy+003h)		;8d4c
	ld c,000h		;8d4f
	ld a,039h		;8d51
	add a,b			;8d53
	ld b,(iy+006h)		;8d54
	call 065b5h		;8d57
	ld a,042h		;8d5a
	jp 04d6eh		;8d5c
L_8D5F:
	ld (iy+000h),000h		;8d5f
	jp 07ccch		;8d63
L_8D66:
	ld a,(0e6b2h)		;8d66
	and a			;8d69
	ret z			;8d6a
	ld b,a			;8d6b
	ld ix,0eb00h		;8d6c
L_8D70:
	push bc			;8d70
	ld a,(ix+000h)		;8d71
	and a			;8d74
	jr z,L_8D8D		;8d75
	ld iy,0e440h		;8d77
	ld de,00018h		;8d7b
	ld b,00fh		;8d7e
L_8D80:
	ld a,(iy+000h)		;8d80
	or a			;8d83
	call nz,L_8D96		;8d84
	jr c,L_8D8D		;8d87
	add iy,de		;8d89
	djnz L_8D80		;8d8b
L_8D8D:
	ld de,00010h		;8d8d
	add ix,de		;8d90
	pop bc			;8d92
	djnz L_8D70		;8d93
	ret			;8d95
L_8D96:
	ld c,a			;8d96
	ld a,(ix+00dh)		;8d97
	or a			;8d9a
	ret m			;8d9b
	jp z,L_8E29		;8d9c
	push af			;8d9f
	call 041cbh		;8da0
	pop af			;8da3
	call L_8DB0		;8da4
	push af			;8da7
	call 041d0h		;8da8
	pop af			;8dab
	ret nc			;8dac
	jp L_8E72		;8dad
L_8DB0:
	add a,a			;8db0
	add a,a			;8db1
	ld hl,0a0f3h		;8db2
	call 040c4h		;8db5
	ld (0f000h),hl		;8db8
	ld a,c			;8dbb
	sub 006h		;8dbc
	cp 005h		;8dbe
	jp nc,L_8DC9		;8dc0
	ld a,(0e620h)		;8dc3
	or a			;8dc6
	jr nz,L_8DF9		;8dc7
L_8DC9:
	ld a,(ix+004h)		;8dc9
	add a,(hl)			;8dcc
	sub (iy+003h)		;8dcd
	jp nc,L_8DDD		;8dd0
L_8DD3:
	neg		;8dd3
	dec a			;8dd5
	inc hl			;8dd6
	inc hl			;8dd7
	cp (hl)			;8dd8
	jp c,L_8DE1		;8dd9
	ret			;8ddc
L_8DDD:
	cp (iy+00dh)		;8ddd
	ret nc			;8de0
L_8DE1:
	ld hl,(0f000h)		;8de1
	inc hl			;8de4
	ld a,(ix+006h)		;8de5
	add a,(hl)			;8de8
	sub (iy+005h)		;8de9
	jp nc,L_8DF5		;8dec
	neg		;8def
	inc hl			;8df1
	inc hl			;8df2
	cp (hl)			;8df3
	ret			;8df4
L_8DF5:
	cp (iy+00ch)		;8df5
	ret			;8df8
L_8DF9:
	ld a,(iy+00ah)		;8df9
	dec a			;8dfc
	add a,a			;8dfd
	add a,a			;8dfe
	add a,a			;8dff
	neg		;8e00
	add a,(iy+003h)		;8e02
	ld c,a			;8e05
	ld a,(ix+004h)		;8e06
	add a,(hl)			;8e09
	sub c			;8e0a
	jp nc,L_8DDD		;8e0b
	jp L_8DD3		;8e0e
L_8E11:
	ld a,(iy+00ah)		;8e11
	dec a			;8e14
	add a,a			;8e15
	add a,a			;8e16
	add a,a			;8e17
	neg		;8e18
	add a,(iy+003h)		;8e1a
	ld c,a			;8e1d
	ld a,(ix+004h)		;8e1e
	add a,(hl)			;8e21
	sub c			;8e22
	jp nc,L_8E51		;8e23
	jp L_8E40		;8e26
L_8E29:
	ld a,c			;8e29
	sub 006h		;8e2a
	cp 003h		;8e2c
	jp nc,L_8E37		;8e2e
	ld a,(0e620h)		;8e31
	or a			;8e34
	jr nz,L_8E11		;8e35
L_8E37:
	ld a,(ix+004h)		;8e37
	sub (iy+003h)		;8e3a
	jp nc,L_8E51		;8e3d
L_8E40:
	neg		;8e40
	dec a			;8e42
	ld c,(ix+00ah)		;8e43
	sla c		;8e46
	sla c		;8e48
	sla c		;8e4a
	cp c			;8e4c
	jp c,L_8E55		;8e4d
	ret			;8e50
L_8E51:
	cp (iy+00dh)		;8e51
	ret nc			;8e54
L_8E55:
	ld a,(ix+006h)		;8e55
	sub (iy+005h)		;8e58
	jp nc,L_8E6E		;8e5b
	neg		;8e5e
	ld c,(ix+009h)		;8e60
	sla c		;8e63
	sla c		;8e65
	sla c		;8e67
	cp c			;8e69
	jp c,L_8E72		;8e6a
	ret			;8e6d
L_8E6E:
	cp (iy+00ch)		;8e6e
	ret nc			;8e71
L_8E72:
	call L_8E77		;8e72
	scf			;8e75
	ret			;8e76
L_8E77:
	call 063c4h		;8e77
	ld a,(iy+000h)		;8e7a
	ld b,a			;8e7d
	sub 006h		;8e7e
	cp 005h		;8e80
	jr c,L_8E88		;8e82
	ld (iy+000h),000h		;8e84
L_8E88:
	dec (ix+008h)		;8e88
	jr z,L_8E9C		;8e8b
	ld a,b			;8e8d
	cp 00ch		;8e8e
	ret nz			;8e90
	ld a,(ix+008h)		;8e91
	sub 01fh		;8e94
	ld (ix+008h),a		;8e96
	jr z,L_8E9C		;8e99
	ret nc			;8e9b
L_8E9C:
	ld a,(ix+000h)		;8e9c
	cp 015h		;8e9f
	jr z,L_8EC1		;8ea1
	ld de,00010h		;8ea3
	call 05919h		;8ea6
	ld b,00fh		;8ea9
	ld a,b			;8eab
	call 04d6eh		;8eac
	call 063cfh		;8eaf
	ld e,(ix+004h)		;8eb2
	ld d,(ix+006h)		;8eb5
	ld a,d			;8eb8
	cp 0e0h		;8eb9
	jr c,L_8EC6		;8ebb
	ld d,0e0h		;8ebd
	jr L_8EC6		;8ebf
L_8EC1:
	ld (ix+001h),001h		;8ec1
	ret			;8ec5
L_8EC6:
	ld a,d			;8ec6
	cp 0e8h		;8ec7
	ret nc			;8ec9
	ld a,e			;8eca
	cp 0a8h		;8ecb
	ret nc			;8ecd
	ld hl,0ec00h		;8ece
	ld b,004h		;8ed1
L_8ED3:
	ld a,(hl)			;8ed3
	and a			;8ed4
	jr z,L_8EDF		;8ed5
	ld a,008h		;8ed7
	add a,l			;8ed9
	ld l,a			;8eda
	djnz L_8ED3		;8edb
	xor a			;8edd
	ret			;8ede
L_8EDF:
	ld a,005h		;8edf
	sub b			;8ee1
	ld (hl),a			;8ee2
	inc l			;8ee3
	ld (hl),004h		;8ee4
	inc l			;8ee6
	ld (hl),e			;8ee7
	inc l			;8ee8
	ld (hl),d			;8ee9
	inc l			;8eea
	inc l			;8eeb
	inc l			;8eec
	ld (hl),002h		;8eed
	scf			;8eef
	ret			;8ef0
L_8EF1:
	ld a,(0e640h)		;8ef1
	or a			;8ef4
	ret nz			;8ef5
	ld a,(0e301h)		;8ef6
	cp 005h		;8ef9
	ret nz			;8efb
	ld ix,0eb80h		;8efc
	ld b,004h		;8f00
L_8F02:
	push bc			;8f02
	call L_8F0F		;8f03
	pop bc			;8f06
	ld de,00010h		;8f07
	add ix,de		;8f0a
	djnz L_8F02		;8f0c
	ret			;8f0e
L_8F0F:
	ld a,(ix+000h)		;8f0f
	or a			;8f12
	ret z			;8f13
	ld iy,0e440h		;8f14
	ld b,00fh		;8f18
	ld de,00018h		;8f1a
L_8F1D:
	ld a,(iy+000h)		;8f1d
	or a			;8f20
	jr z,L_8F27		;8f21
	call L_8F2C		;8f23
	ret c			;8f26
L_8F27:
	add iy,de		;8f27
	djnz L_8F1D		;8f29
	ret			;8f2b
L_8F2C:
	ld a,(ix+00eh)		;8f2c
	sub (iy+005h)		;8f2f
	jp nc,L_8F3D		;8f32
	neg		;8f35
	cp 010h		;8f37
	jp c,L_8F41		;8f39
	ret			;8f3c
L_8F3D:
	cp (iy+00ch)		;8f3d
	ret nc			;8f40
L_8F41:
	ld a,(ix+00dh)		;8f41
	sub (iy+003h)		;8f44
	jp nc,L_8F53		;8f47
	neg		;8f4a
	dec a			;8f4c
	cp 010h		;8f4d
	jp c,L_8F57		;8f4f
	ret			;8f52
L_8F53:
	cp (iy+00dh)		;8f53
	ret nc			;8f56
L_8F57:
	call L_8F5F		;8f57
	call L_9061		;8f5a
	scf			;8f5d
	ret			;8f5e
L_8F5F:
	dec (ix+00fh)		;8f5f
	jr z,L_8F79		;8f62
	ld a,(iy+000h)		;8f64
	cp 00ch		;8f67
	jp nz,L_8D5F		;8f69
	ld a,(ix+00fh)		;8f6c
	sub 01fh		;8f6f
	ld (ix+00fh),a		;8f71
	jr z,L_8F79		;8f74
	jp nc,L_8D5F		;8f76
L_8F79:
	ld a,040h		;8f79
	call 04d6eh		;8f7b
	ld (ix+000h),000h		;8f7e
	ld de,00010h		;8f82
	call 05919h		;8f85
	ld e,(ix+00dh)		;8f88
	ld d,(ix+00eh)		;8f8b
	push de			;8f8e
	call L_8EC6		;8f8f
	pop hl			;8f92
	ld bc,00202h		;8f93
	ld de,08f9ch		;8f96
	jp 05042h		;8f99

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8f9c..0x8fa0  (4 bytes)
DATA_8F9C:
	defb 0d2h,0d3h,0d4h,0d5h	; 8f9c

; ======================================================================
; CODIGO 0x8fa0..0x90ee  (334 bytes)
; ======================================================================


L_8FA0:
	ld a,(0e640h)		;8fa0
	or a			;8fa3
	ret nz			;8fa4
	ld a,(0e301h)		;8fa5
	cp 004h		;8fa8
	ret nz			;8faa
	ld ix,0eb80h		;8fab
	call L_8FB6		;8faf
	ld ix,0eb90h		;8fb2
L_8FB6:
	ld a,(ix+000h)		;8fb6
	or a			;8fb9
	ret z			;8fba
	ld iy,0e440h		;8fbb
	ld b,00fh		;8fbf
	ld de,00018h		;8fc1
L_8FC4:
	ld a,(iy+000h)		;8fc4
	or a			;8fc7
	jr z,L_8FCE		;8fc8
	call L_8FD3		;8fca
	ret c			;8fcd
L_8FCE:
	add iy,de		;8fce
	djnz L_8FC4		;8fd0
	ret			;8fd2
L_8FD3:
	ld a,(ix+004h)		;8fd3
	sub (iy+005h)		;8fd6
	jp nc,L_8FE6		;8fd9
	neg		;8fdc
	cp (ix+006h)		;8fde
	jp c,L_8FEB		;8fe1
	jr L_901F		;8fe4
L_8FE6:
	cp (iy+00ch)		;8fe6
	jr nc,L_901F		;8fe9
L_8FEB:
	ld a,(ix+001h)		;8feb
	sub (iy+003h)		;8fee
	jp nc,L_8FFF		;8ff1
	neg		;8ff4
	dec a			;8ff6
	cp (ix+009h)		;8ff7
	jp c,L_9059		;8ffa
	jr L_9005		;8ffd
L_8FFF:
	cp (iy+00dh)		;8fff
	jp c,L_9059		;9002
L_9005:
	ld a,(ix+002h)		;9005
	sub (iy+003h)		;9008
	jp nc,L_9019		;900b
	neg		;900e
	dec a			;9010
	cp (ix+00ah)		;9011
	jp c,L_9059		;9014
	jr L_901F		;9017
L_9019:
	cp (iy+00dh)		;9019
	jp c,L_9059		;901c
L_901F:
	ld a,(ix+004h)		;901f
	add a,(ix+007h)		;9022
	ccf			;9025
	ret nc			;9026
	sub (iy+005h)		;9027
	jp nc,L_9036		;902a
	neg		;902d
	cp (ix+008h)		;902f
	jp c,L_903A		;9032
	ret			;9035
L_9036:
	cp (iy+00ch)		;9036
	ret nc			;9039
L_903A:
	ld a,(ix+003h)		;903a
	sub (iy+003h)		;903d
	jp nc,L_904C		;9040
	neg		;9043
	dec a			;9045
	cp 018h		;9046
	jp c,L_9050		;9048
	ret			;904b
L_904C:
	cp (iy+00dh)		;904c
	ret nc			;904f
L_9050:
	call L_9094		;9050
	ret z			;9053
	call L_9061		;9054
	scf			;9057
	ret			;9058
L_9059:
	call L_9066		;9059
	call L_9061		;905c
	scf			;905f
	ret			;9060
L_9061:
	ld (iy+000h),000h		;9061
	ret			;9065
L_9066:
	dec (ix+00bh)		;9066
	jr z,L_9080		;9069
	ld a,(iy+000h)		;906b
	cp 00ch		;906e
	jp nz,L_90B4		;9070
	ld a,(ix+00bh)		;9073
	sub 01fh		;9076
	ld (ix+00bh),a		;9078
	jr z,L_9080		;907b
	jp nc,L_90B4		;907d
L_9080:
	ld (ix+000h),000h		;9080
	ld a,00fh		;9084
	call 04d6eh		;9086
	ld a,018h		;9089
	add a,020h		;908b
	ld e,a			;908d
	ld d,(ix+004h)		;908e
	jp L_8EC6		;9091
L_9094:
	ld a,(ix+00ch)		;9094
	and a			;9097
	ret z			;9098
	dec (ix+00ch)		;9099
	ret z			;909c
	ld a,(iy+000h)		;909d
	cp 00ch		;90a0
	jr nz,L_90B4		;90a2
	ld a,(ix+00ch)		;90a4
	sub 01fh		;90a7
	ld (ix+00ch),a		;90a9
	ret z			;90ac
	jr nc,L_90B4		;90ad
	ld (ix+00ch),000h		;90af
	ret			;90b3
L_90B4:
	call L_8D5F		;90b4
	or 0ffh		;90b7
	ret			;90b9
L_90BA:
	ld hl,0e204h		;90ba
	bit 3,(hl)		;90bd
	ld c,0ffh		;90bf
	jr nz,L_90C4		;90c1
	inc c			;90c3
L_90C4:
	ld a,(0e227h)		;90c4
	add a,a			;90c7
	ld hl,090eeh		;90c8
	call 040c4h		;90cb
	ld e,(hl)			;90ce
	inc hl			;90cf
	ld d,(hl)			;90d0
	inc hl			;90d1
	push hl			;90d2
	ex de,hl			;90d3
	call L_90E8		;90d4
	pop hl			;90d7
	ld c,000h		;90d8
	ld e,(hl)			;90da
	inc hl			;90db
	ld d,(hl)			;90dc
	inc hl			;90dd
	push hl			;90de
	ex de,hl			;90df
	call L_90E8		;90e0
	pop hl			;90e3
	ld e,(hl)			;90e4
	inc hl			;90e5
	ld d,(hl)			;90e6
	ex de,hl			;90e7
L_90E8:
	ld de,0b66dh		;90e8
	jp 04cfdh		;90eb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x90ee..0x90f8  (10 bytes)
DATA_90EE:
	defb 02ah,03ah,06ah,03ah,0aah,03ah,02ah,03ah,06ah,03ah	; 90ee  *:j:.:*:j:

; ======================================================================
; CODIGO 0x90f8..0x9295  (413 bytes)
; ======================================================================


L_90F8:
	ld a,005h		;90f8
	jr L_90FE		;90fa
L_90FC:
	ld a,00ah		;90fc
L_90FE:
	ld (ix+029h),000h		;90fe
	ld (ix+013h),001h		;9102
	ld (ix+014h),002h		;9106
	ld (ix+002h),a		;910a
	ld (ix+028h),a		;910d
	call 06872h		;9110
	ld de,00400h		;9113
	ld a,(ix+019h)		;9116
	set 1,a		;9119
	ld (ix+019h),a		;911b
	bit 0,a		;911e
	call nz,05adfh		;9120
	call 06856h		;9123
L_9126:
	jp 04fa9h		;9126
L_9129:
	call L_9163		;9129
	jp c,06b62h		;912c
	call L_9157		;912f
	call L_9137		;9132
	jr L_9126		;9135
L_9137:
	dec (ix+002h)		;9137
	ret nz			;913a
	ld a,(ix+028h)		;913b
	ld (ix+002h),a		;913e
	ld a,(ix+006h)		;9141
	and a			;9144
	ld b,001h		;9145
	jr z,L_914F		;9147
	inc b			;9149
	sub 008h		;914a
	ld (ix+006h),a		;914c
L_914F:
	ld a,(ix+014h)		;914f
	add a,b			;9152
	ld (ix+014h),a		;9153
	ret			;9156
L_9157:
	inc (ix+029h)		;9157
	bit 0,(ix+029h)		;915a
	ret z			;915e
	inc (ix+032h)		;915f
	ret			;9162
L_9163:
	ld a,(ix+004h)		;9163
	bit 7,(ix+008h)		;9166
	ld b,008h		;916a
	jr z,L_9170		;916c
	ld b,0f8h		;916e
L_9170:
	add a,b			;9170
	ld l,a			;9171
	ld h,(ix+006h)		;9172
	call 05a99h		;9175
	ld b,(ix+014h)		;9178
L_917B:
	call 07eeeh		;917b
	ret c			;917e
	inc hl			;917f
	djnz L_917B		;9180
	ret			;9182
L_9183:
	ld ix,0ec00h		;9183
	ld de,00008h		;9187
	ld b,004h		;918a
L_918C:
	ld a,(ix+000h)		;918c
	and a			;918f
	call nz,L_9198		;9190
	add ix,de		;9193
	djnz L_918C		;9195
	ret			;9197
L_9198:
	call L_91D0		;9198
	ld a,(0e627h)		;919b
	and a			;919e
	jr z,L_91B5		;919f
	ld a,(ix+003h)		;91a1
	jp m,L_91AF		;91a4
	sub 008h		;91a7
	jr c,L_91DC		;91a9
L_91AB:
	ld (ix+003h),a		;91ab
	ret			;91ae
L_91AF:
	add a,008h		;91af
	jr c,L_91DC		;91b1
	jr L_91AB		;91b3
L_91B5:
	ld a,(0e628h)		;91b5
	or a			;91b8
	ret z			;91b9
	ld a,(ix+002h)		;91ba
	jp m,L_91CA		;91bd
	add a,008h		;91c0
	cp 0a0h		;91c2
	jr nc,L_91DC		;91c4
L_91C6:
	ld (ix+002h),a		;91c6
	ret			;91c9
L_91CA:
	sub 008h		;91ca
	jr c,L_91DC		;91cc
	jr L_91C6		;91ce
L_91D0:
	dec (ix+001h)		;91d0
	ret nz			;91d3
	ld (ix+001h),004h		;91d4
	dec (ix+006h)		;91d8
	ret p			;91db
L_91DC:
	ld (ix+000h),000h		;91dc
	ret			;91e0
L_91E1:
	ld ix,0ec00h		;91e1
	ld iy,0eac0h		;91e5
	ld b,004h		;91e9
L_91EB:
	push bc			;91eb
	call L_91FC		;91ec
	ld bc,00008h		;91ef
	add ix,bc		;91f2
	ld c,010h		;91f4
	add iy,bc		;91f6
	pop bc			;91f8
	djnz L_91EB		;91f9
	ret			;91fb
L_91FC:
	ld a,(ix+000h)		;91fc
	or a			;91ff
	ret z			;9200
	ld l,(ix+002h)		;9201
	ld h,(ix+003h)		;9204
	call 05a99h		;9207
	ld (ix+004h),l		;920a
	ld (ix+005h),h		;920d
	push iy		;9210
	pop de			;9212
	ld a,004h		;9213
L_9215:
	ld bc,00004h		;9215
	ldir		;9218
	ld c,03ch		;921a
	add hl,bc			;921c
	dec a			;921d
	jr nz,L_9215		;921e
	ret			;9220
L_9221:
	ld ix,0ec00h		;9221
	ld iy,0eac0h		;9225
	ld b,004h		;9229
L_922B:
	push bc			;922b
	call L_923C		;922c
	ld bc,00008h		;922f
	add ix,bc		;9232
	ld c,010h		;9234
	add iy,bc		;9236
	pop bc			;9238
	djnz L_922B		;9239
	ret			;923b
L_923C:
	ld a,(ix+000h)		;923c
	or a			;923f
	ret z			;9240
	ld e,(ix+004h)		;9241
	ld d,(ix+005h)		;9244
	push iy		;9247
	pop hl			;9249
	ld a,004h		;924a
L_924C:
	ld bc,00004h		;924c
	ldir		;924f
	ld c,03ch		;9251
	ex de,hl			;9253
	add hl,bc			;9254
	ex de,hl			;9255
	dec a			;9256
	jr nz,L_924C		;9257
	ret			;9259
L_925A:
	ld ix,0ec00h		;925a
	ld b,004h		;925e
L_9260:
	push bc			;9260
	call L_926D		;9261
	ld bc,00008h		;9264
	add ix,bc		;9267
	pop bc			;9269
	djnz L_9260		;926a
	ret			;926c
L_926D:
	ld a,(ix+000h)		;926d
	and a			;9270
	ret z			;9271
	ld hl,09295h		;9272
	ld a,(ix+006h)		;9275
	add a,a			;9278
	add a,a			;9279
	add a,a			;927a
	add a,a			;927b
	call 040c4h		;927c
	ld e,(ix+004h)		;927f
	ld d,(ix+005h)		;9282
	ld a,004h		;9285
L_9287:
	ld bc,00004h		;9287
	ldir		;928a
	ld c,03ch		;928c
	ex de,hl			;928e
	add hl,bc			;928f
	ex de,hl			;9290
	dec a			;9291
	jr nz,L_9287		;9292
	ret			;9294

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9295..0x92c5  (48 bytes)
DATA_9295:
	defb 000h,000h,000h,000h,000h,04eh,04fh,000h,000h,047h,045h,000h,000h,000h,000h,000h	; 9295  .....NO..GE.....
	defb 000h,049h,04ah,000h,04bh,040h,03dh,000h,046h,044h,04ch,000h,04dh,048h,000h,000h	; 92a5  .IJ.K@=.FDL.MH..
	defb 03ah,03bh,03ch,03dh,03eh,03fh,040h,041h,042h,043h,044h,045h,046h,047h,048h,000h	; 92b5  :.<=>?@ABCDEFGH.

; ======================================================================
; CODIGO 0x92c5..0x92e9  (36 bytes)
; ======================================================================


L_92C5:
	call 04f9bh		;92c5
	ld (ix+027h),018h		;92c8
	ld (ix+024h),004h		;92cc
	ld (ix+028h),000h		;92d0
	ld a,(ix+019h)		;92d4
	ld b,000h		;92d7
	srl a		;92d9
	jr c,L_92DE		;92db
	inc b			;92dd
L_92DE:
	ld hl,092e5h		;92de
	add a,a			;92e1
	add a,a			;92e2
	call 040c4h		;92e3
	jp 06c2dh		;92e6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x92e9..0x92f9  (16 bytes)
DATA_92E9:
	defb 000h,0feh,000h,001h,000h,0ffh,000h,002h,000h,001h,000h,002h,000h,002h,000h,001h	; 92e9  ................

; ======================================================================
; CODIGO 0x92f9..0x9322  (41 bytes)
; ======================================================================


L_92F9:
	ld a,(ix+031h)		;92f9
	cp 008h		;92fc
	jr z,L_9306		;92fe
	ld hl,09322h		;9300
	call 0a01dh		;9303
L_9306:
	call 04f7dh		;9306
	ld a,(ix+001h)		;9309
	dec a			;930c
	jr z,L_931B		;930d
	dec (ix+027h)		;930f
	ret nz			;9312
	ld (ix+026h),001h		;9313
	inc (ix+001h)		;9317
	ret			;931a
L_931B:
	dec (ix+026h)		;931b
	ret nz			;931e
	jp 06c0fh		;931f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9322..0x9326  (4 bytes)
DATA_9322:
	defb 00ah,00bh,00fh,003h	; 9322

; ======================================================================
; CODIGO 0x9326..0x946b  (325 bytes)
; ======================================================================


L_9326:
	push ix		;9326
	pop hl			;9328
	ld (0e68ah),hl		;9329
	ld a,001h		;932c
	ld (0e689h),a		;932e
	ld a,(0e620h)		;9331
	rra			;9334
	jr c,L_933D		;9335
	ld (ix+006h),000h		;9337
	jr L_9369		;933b
L_933D:
	ld (ix+004h),0a8h		;933d
	jr L_9369		;9341
L_9343:
	ld a,(ix+019h)		;9343
	and a			;9346
	jr z,L_9369		;9347
	ld b,a			;9349
	ld a,(0e620h)		;934a
	rra			;934d
	ld a,b			;934e
	jr nc,L_935E		;934f
	cp 002h		;9351
	ld c,04ch		;9353
	jr z,L_9359		;9355
	ld c,0a8h		;9357
L_9359:
	ld (ix+004h),c		;9359
	jr L_9369		;935c
L_935E:
	cp 002h		;935e
	ld c,080h		;9360
	jr z,L_9366		;9362
	ld c,000h		;9364
L_9366:
	ld (ix+006h),c		;9366
L_9369:
	call L_9375		;9369
	ld (ix+026h),000h		;936c
	ld d,(ix+006h)		;9370
	jr L_93B1		;9373
L_9375:
	xor a			;9375
	ld (ix+02ah),a		;9376
	ld (ix+02bh),a		;9379
	ret			;937c
L_937D:
	ld a,(ix+031h)		;937d
	xor 007h		;9380
	ld (ix+031h),a		;9382
	jr L_9391		;9385
L_9387:
	ld a,(0e203h)		;9387
	and 004h		;938a
	add a,050h		;938c
	ld (ix+030h),a		;938e
L_9391:
	ld a,(ix+001h)		;9391
	and a			;9394
	jr z,L_93A0		;9395
	dec (ix+025h)		;9397
	ret nz			;939a
	dec (ix+001h)		;939b
	jr L_93A9		;939e
L_93A0:
	dec (ix+025h)		;93a0
	ret nz			;93a3
	ld a,(ix+029h)		;93a4
	and a			;93a7
	ret nz			;93a8
L_93A9:
	call L_943A		;93a9
	call L_93B1		;93ac
	jr L_93E3		;93af
L_93B1:
	ld e,(ix+004h)		;93b1
	ld a,(0e64fh)		;93b4
	add a,a			;93b7
	sub 038h		;93b8
	neg		;93ba
	call 06807h		;93bc
	xor a			;93bf
	bit 7,(ix+008h)		;93c0
	jr nz,L_93C7		;93c4
	inc a			;93c6
L_93C7:
	ld c,(ix+027h)		;93c7
	ld (ix+02ah),c		;93ca
	ld (ix+027h),a		;93cd
	xor a			;93d0
	bit 7,(ix+00ah)		;93d1
	jr nz,L_93D8		;93d5
	inc a			;93d7
L_93D8:
	ld c,(ix+028h)		;93d8
	ld (ix+02bh),c		;93db
	ld (ix+028h),a		;93de
	jr L_942E		;93e1
L_93E3:
	ld a,(ix+02ah)		;93e3
	ld c,(ix+027h)		;93e6
	xor c			;93e9
	jr nz,L_9411		;93ea
	ld a,(ix+02bh)		;93ec
	ld c,(ix+028h)		;93ef
	xor c			;93f2
	ret z			;93f3
	inc (ix+001h)		;93f4
	call 06872h		;93f7
	ld de,00180h		;93fa
	ld b,001h		;93fd
	ld a,(0e324h)		;93ff
	cp (ix+004h)		;9402
	jr nc,L_940B		;9405
	dec b			;9407
	call 05adfh		;9408
L_940B:
	ld (ix+027h),b		;940b
	jp 06856h		;940e
L_9411:
	inc (ix+001h)		;9411
	call 06872h		;9414
	ld de,00180h		;9417
	ld b,001h		;941a
	ld a,(0e326h)		;941c
	cp (ix+006h)		;941f
	jr nc,L_9428		;9422
	dec b			;9424
	call 05adfh		;9425
L_9428:
	ld (ix+028h),b		;9428
	jp 0685dh		;942b
L_942E:
	call 065abh		;942e
	and 003h		;9431
	ld c,006h		;9433
	add a,c			;9435
	ld (ix+025h),a		;9436
	ret			;9439
L_943A:
	ld a,(ix+026h)		;943a
	ld hl,0946bh		;943d
	call 040c4h		;9440
	ld l,(hl)			;9443
	ld a,(ix+026h)		;9444
	inc a			;9447
	and 007h		;9448
	ld (ix+026h),a		;944a
	ld a,(ix+001h)		;944d
	and a			;9450
	jr z,L_9465		;9451
	ld a,(0e324h)		;9453
	sub (ix+004h)		;9456
	jr nc,L_9465		;9459
	ld a,(ix+006h)		;945b
	sub l			;945e
L_945F:
	jr nc,L_9463		;945f
	neg		;9461
L_9463:
	ld d,a			;9463
	ret			;9464
L_9465:
	ld a,(ix+006h)		;9465
	add a,l			;9468
	jr L_945F		;9469

; ----------------------------------------------------------------------
; DATOS sin identificar  0x946b..0x9473  (8 bytes)
DATA_946B:
	defb 010h,00ch,008h,006h,004h,002h,001h,000h	; 946b  ........

; ======================================================================
; CODIGO 0x9473..0x991e  (1195 bytes)
; ======================================================================


L_9473:
	ld a,(0e6d0h)		;9473
	or a			;9476
	ret nz			;9477
	ld iy,0e300h		;9478
	call L_9483		;947c
	ld iy,0e380h		;947f
L_9483:
	ld a,(0e6c0h)		;9483
	or a			;9486
	ret nz			;9487
	ld a,(iy+020h)		;9488
	dec a			;948b
	ret m			;948c
	cp 003h		;948d
	ret z			;948f
	call L_954D		;9490
	call L_9515		;9493
	ret nc			;9496
	ld (ix+000h),000h		;9497
	ld a,(iy+020h)		;949b
	cp 003h		;949e
	jp nz,L_9684		;94a0
L_94A3:
	xor a			;94a3
	ld (0e630h),a		;94a4
	ld (0e215h),a		;94a7
	push iy		;94aa
	call L_94E9		;94ac
	pop iy		;94af
	call L_94DC		;94b1
	ld e,(iy+024h)		;94b4
	ld d,(iy+026h)		;94b7
	call 04da6h		;94ba
	call L_94DC		;94bd
	ld a,(0e620h)		;94c0
	or a			;94c3
	jr nz,L_94D6		;94c4
	ld a,d			;94c6
	add a,010h		;94c7
	ld d,a			;94c9
L_94CA:
	ld (iy+024h),e		;94ca
	ld (iy+026h),d		;94cd
	call 0a54ah		;94d0
	jp 05ef7h		;94d3
L_94D6:
	ld a,e			;94d6
	add a,010h		;94d7
	ld e,a			;94d9
	jr L_94CA		;94da
L_94DC:
	ld a,(iy+03ch)		;94dc
	ld (iy+020h),a		;94df
	ld a,(iy+03dh)		;94e2
	ld (iy+022h),a		;94e5
	ret			;94e8
L_94E9:
	ld iy,0e300h		;94e9
	call L_94F4		;94ed
	ld iy,0e380h		;94f0
L_94F4:
	ld a,(iy+013h)		;94f4
	or a			;94f7
	jr z,L_9504		;94f8
	ld (iy+013h),0ffh		;94fa
	ld (iy+040h),001h		;94fe
	jr L_9512		;9502
L_9504:
	ld a,(iy+015h)		;9504
	or a			;9507
	jr z,L_9512		;9508
	ld (iy+015h),0ffh		;950a
	ld (iy+040h),002h		;950e
L_9512:
	jp 05ef7h		;9512
L_9515:
	ld a,(iy+024h)		;9515
	add a,e			;9518
	ld e,a			;9519
	ld a,(iy+026h)		;951a
	add a,d			;951d
	ld d,a			;951e
	ld ix,0ea00h		;951f
	ld bc,00202h		;9523
	exx			;9526
	ld de,00010h		;9527
	ld b,008h		;952a
L_952C:
	exx			;952c
	ld a,(ix+000h)		;952d
	or a			;9530
	jr z,L_9545		;9531
	ld a,(ix+004h)		;9533
	sub e			;9536
	cp l			;9537
	jr c,L_953D		;9538
	add a,c			;953a
	jr nc,L_9545		;953b
L_953D:
	ld a,(ix+006h)		;953d
	sub d			;9540
	cp h			;9541
	ret c			;9542
	add a,b			;9543
	ret c			;9544
L_9545:
	exx			;9545
	add ix,de		;9546
	djnz L_952C		;9548
	exx			;954a
	xor a			;954b
	ret			;954c
L_954D:
	ld a,(0e620h)		;954d
	or a			;9550
	jr nz,L_9566		;9551
	ld a,(iy+020h)		;9553
	cp 004h		;9556
	ld de,00104h		;9558
	ld hl,00c08h		;955b
	ret nz			;955e
	ld de,00108h		;955f
	ld hl,01808h		;9562
	ret			;9565
L_9566:
	ld a,(iy+020h)		;9566
	cp 004h		;9569
	ld de,00404h		;956b
	ld hl,0080ch		;956e
	ret nz			;9571
	ld de,00408h		;9572
	ld hl,00418h		;9575
	ret			;9578
L_9579:
	ld a,(0e620h)		;9579
	or a			;957c
	jr nz,L_9592		;957d
	ld a,(iy+020h)		;957f
	cp 004h		;9582
	ld de,00c01h		;9584
	ld hl,00c10h		;9587
	ret nz			;958a
	ld de,01801h		;958b
	ld hl,00310h		;958e
	ret			;9591
L_9592:
	ld a,(iy+020h)		;9592
	cp 004h		;9595
	ld de,00000h		;9597
	ld hl,01008h		;959a
	ret nz			;959d
	ld de,00000h		;959e
	ld hl,0100ch		;95a1
	ret			;95a4
L_95A5:
	ld iy,0e300h		;95a5
	call L_95B0		;95a9
	ld iy,0e380h		;95ac
L_95B0:
	ld a,(iy+020h)		;95b0
	cp 002h		;95b3
	jr z,L_95BF		;95b5
	cp 003h		;95b7
	ret nz			;95b9
	ld a,(iy+022h)		;95ba
	or a			;95bd
	ret z			;95be
L_95BF:
	call L_9579		;95bf
	call L_9515		;95c2
	ret nc			;95c5
	ld (ix+000h),000h		;95c6
	jp L_960B		;95ca
L_95CD:
	xor a			;95cd
	ld (0e63eh),a		;95ce
	ld iy,0e300h		;95d1
	call L_95DC		;95d5
	ld iy,0e380h		;95d8
L_95DC:
	ld a,(iy+020h)		;95dc
	cp 002h		;95df
	jr z,L_95EB		;95e1
	cp 003h		;95e3
	ret nz			;95e5
	ld a,(iy+022h)		;95e6
	or a			;95e9
	ret z			;95ea
L_95EB:
	call L_9579		;95eb
	call L_96B1		;95ee
	ret nc			;95f1
	ld a,(ix+000h)		;95f2
	cp 035h		;95f5
	ret z			;95f7
	cp 01bh		;95f8
	ret z			;95fa
	cp 020h		;95fb
	ret z			;95fd
	cp 00ch		;95fe
	ret z			;9600
	sub 029h		;9601
	cp 002h		;9603
	ret c			;9605
	push af			;9606
	call L_8C7B		;9607
	pop af			;960a
L_960B:
	dec (iy+022h)		;960b
	ret nz			;960e
	ld (iy+022h),000h		;960f
	ld a,(iy+020h)		;9613
	cp 003h		;9616
	jr z,L_9625		;9618
	ld (iy+020h),001h		;961a
	ld (iy+018h),000h		;961e
	jp 05d8eh		;9622
L_9625:
	xor a			;9625
	ld (0e33dh),a		;9626
	ld (0e3bdh),a		;9629
	inc a			;962c
	ld (0e33ch),a		;962d
	ld (0e3bch),a		;9630
	push iy		;9633
	ld (iy+018h),000h		;9635
	call 05d8eh		;9639
	call 04da6h		;963c
	ld (iy+018h),000h		;963f
	call 05d8eh		;9643
	pop iy		;9646
	ret			;9648
L_9649:
	ld a,(0e6d0h)		;9649
	or a			;964c
	ret nz			;964d
	xor a			;964e
	ld (0e63eh),a		;964f
	ld iy,0e300h		;9652
	call L_965D		;9656
	ld iy,0e380h		;9659
L_965D:
	ld a,(0e6c0h)		;965d
	or a			;9660
	ret nz			;9661
	ld a,(iy+020h)		;9662
	dec a			;9665
	cp 003h		;9666
	ret nc			;9668
	call L_954D		;9669
	call L_96B1		;966c
	ret nc			;966f
	ld a,(ix+000h)		;9670
	cp 035h		;9673
	jp z,L_974A		;9675
	sub 029h		;9678
	jp z,L_97C9		;967a
	dec a			;967d
	jp z,L_9806		;967e
	call L_8C7B		;9681
L_9684:
	ld a,(0e202h)		;9684
	bit 6,a		;9687
	ret z			;9689
	ld a,(iy+020h)		;968a
	sub 003h		;968d
	jp z,L_94A3		;968f
	dec a			;9692
	ret z			;9693
	ld a,(0e6d0h)		;9694
	or a			;9697
	ret nz			;9698
	xor a			;9699
	ld (0e630h),a		;969a
	ld (0e215h),a		;969d
	ld (iy+01bh),000h		;96a0
	ld a,027h		;96a4
	call 04d6eh		;96a6
	ld a,0f0h		;96a9
	call 04d6eh		;96ab
	jp L_84C2		;96ae
L_96B1:
	ld a,(iy+024h)		;96b1
	add a,e			;96b4
	ld e,a			;96b5
	ld a,(iy+026h)		;96b6
	add a,d			;96b9
	ld d,a			;96ba
	ld ix,0e700h		;96bb
	ld b,00ch		;96bf
	exx			;96c1
	ld de,00040h		;96c2
	exx			;96c5
L_96C6:
	bit 0,(ix+010h)		;96c6
	jr z,L_96F2		;96ca
	ld a,(ix+004h)		;96cc
	sub e			;96cf
	jp nc,L_96DE		;96d0
	neg		;96d3
	cp (ix+00eh)		;96d5
	jp c,L_96E1		;96d8
	jp L_96F2		;96db
L_96DE:
	cp l			;96de
	jr nc,L_96F2		;96df
L_96E1:
	ld a,(ix+006h)		;96e1
	sub d			;96e4
	jp nc,L_96F0		;96e5
	neg		;96e8
	cp (ix+00fh)		;96ea
	jr nc,L_96F2		;96ed
	ret			;96ef
L_96F0:
	cp h			;96f0
	ret c			;96f1
L_96F2:
	ld a,(ix+000h)		;96f2
	cp 037h		;96f5
	jr nz,L_96FF		;96f7
	call L_970F		;96f9
	ret c			;96fc
	jr L_9707		;96fd
L_96FF:
	cp 038h		;96ff
	jr nz,L_9707		;9701
	call L_970F		;9703
	ret c			;9706
L_9707:
	exx			;9707
	add ix,de		;9708
	exx			;970a
	djnz L_96C6		;970b
	xor a			;970d
	ret			;970e
L_970F:
	push bc			;970f
	push ix		;9710
	pop bc			;9712
	ld a,034h		;9713
	add a,c			;9715
	ld c,a			;9716
	exx			;9717
	ld c,003h		;9718
	exx			;971a
L_971B:
	ld a,(bc)			;971b
	inc c			;971c
	inc c			;971d
	sub e			;971e
	jp nc,L_972B		;971f
	neg		;9722
	cp 008h		;9724
	jp c,L_972E		;9726
	jr L_9740		;9729
L_972B:
	cp l			;972b
	jr nc,L_9740		;972c
L_972E:
	dec c			;972e
	ld a,(bc)			;972f
	inc c			;9730
	sub d			;9731
	jp nc,L_973D		;9732
	neg		;9735
	cp 010h		;9737
	jr nc,L_9740		;9739
L_973B:
	pop bc			;973b
	ret			;973c
L_973D:
	cp h			;973d
	jr c,L_973B		;973e
L_9740:
	inc c			;9740
	inc c			;9741
	exx			;9742
	dec c			;9743
	exx			;9744
	jr nz,L_971B		;9745
	pop bc			;9747
	xor a			;9748
	ret			;9749
L_974A:
	push af			;974a
	call 06b62h		;974b
	pop af			;974e
	ld de,00005h		;974f
	call 05936h		;9752
	ld a,04fh		;9755
	call 04d6eh		;9757
	ld a,(iy+020h)		;975a
	cp 003h		;975d
	jr nz,L_9779		;975f
	push iy		;9761
	ld hl,0e69bh		;9763
	inc (hl)			;9766
	bit 0,(hl)		;9767
	ld iy,0e300h		;9769
	jr z,L_9773		;976d
	ld iy,0e380h		;976f
L_9773:
	call L_9779		;9773
	pop iy		;9776
	ret			;9778
L_9779:
	ld a,(iy+01bh)		;9779
	add a,001h		;977c
	daa			;977e
	ld (iy+01bh),a		;977f
	cp 015h		;9782
	jr c,L_97C6		;9784
	ld (iy+01bh),000h		;9786
	ld a,(iy+010h)		;978a
	cp 007h		;978d
	jr c,L_9796		;978f
	call 059c1h		;9791
	jr L_97C6		;9794
L_9796:
	inc a			;9796
	ld (iy+010h),a		;9797
	call L_8B1F		;979a
	call 05d8eh		;979d
	ld a,(iy+010h)		;97a0
	ld (iy+068h),a		;97a3
	ld (iy+069h),05ah		;97a6
	call 060beh		;97aa
	push iy		;97ad
	call 04da6h		;97af
	ld (iy+068h),000h		;97b2
	ld (iy+069h),000h		;97b6
	pop iy		;97ba
	ld a,043h		;97bc
	call 04d6eh		;97be
	ld a,055h		;97c1
	call 04d6eh		;97c3
L_97C6:
	jp 059f3h		;97c6
L_97C9:
	call 06b62h		;97c9
	ld a,(iy+020h)		;97cc
	cp 003h		;97cf
	jr nz,L_97EB		;97d1
	push iy		;97d3
	ld hl,0e69ch		;97d5
	inc (hl)			;97d8
	bit 0,(hl)		;97d9
	ld iy,0e300h		;97db
	jr z,L_97E5		;97df
	ld iy,0e380h		;97e1
L_97E5:
	call L_97EB		;97e5
	pop iy		;97e8
	ret			;97ea
L_97EB:
	ld a,(iy+011h)		;97eb
	inc a			;97ee
	cp 008h		;97ef
	jr c,L_97F5		;97f1
	ld a,001h		;97f3
L_97F5:
	ld (iy+011h),a		;97f5
	ld de,00005h		;97f8
	call 05936h		;97fb
	ld a,010h		;97fe
	call 04d6eh		;9800
	jp 05d8eh		;9803
L_9806:
	call 06b62h		;9806
	ld a,052h		;9809
	call 04d6eh		;980b
	ld a,(iy+042h)		;980e
	add a,001h		;9811
	daa			;9813
	ld (iy+042h),a		;9814
	dec a			;9817
	jr nz,L_981F		;9818
	ld a,013h		;981a
	call 05df1h		;981c
L_981F:
	bit 0,(iy+021h)		;981f
	ld hl,03aceh		;9823
	jr z,L_982A		;9826
	ld l,0deh		;9828
L_982A:
	push iy		;982a
	pop de			;982c
	ld a,042h		;982d
	call 040c9h		;982f
	ld b,001h		;9832
	jp 05a63h		;9834
L_9837:
	ld a,(0e227h)		;9837
	cp 002h		;983a
	ret nz			;983c
	ld a,(0e630h)		;983d
	cp 005h		;9840
	ret nz			;9842
	ld iy,0e300h		;9843
	ld a,(iy+020h)		;9847
	dec a			;984a
	cp 002h		;984b
	ret nc			;984d
	ld ix,0e380h		;984e
	ld a,(ix+020h)		;9852
	dec a			;9855
	cp 002h		;9856
	ret nc			;9858
	ld a,(0e620h)		;9859
	ld bc,00810h		;985c
	or a			;985f
	jr z,L_9865		;9860
	ld bc,01008h		;9862
L_9865:
	ld a,(iy+024h)		;9865
	sub (ix+024h)		;9868
	jr nc,L_986F		;986b
	neg		;986d
L_986F:
	cp b			;986f
	ret nc			;9870
	ld a,(iy+026h)		;9871
	sub (ix+026h)		;9874
	jr nc,L_987B		;9877
	neg		;9879
L_987B:
	cp c			;987b
	ret nc			;987c
	ld a,(iy+020h)		;987d
	ld (iy+03ch),a		;9880
	ld a,(ix+020h)		;9883
	ld (ix+03ch),a		;9886
	ld a,(iy+022h)		;9889
	ld (iy+03dh),a		;988c
	ld b,(ix+022h)		;988f
	ld (ix+03dh),b		;9892
	add a,b			;9895
	ld (iy+022h),a		;9896
	ld (ix+022h),a		;9899
	ld bc,00304h		;989c
	ld a,(iy+01dh)		;989f
	or a			;98a2
	jr nz,L_98A7		;98a3
	inc b			;98a5
	dec c			;98a6
L_98A7:
	ld (iy+020h),b		;98a7
	ld (ix+020h),c		;98aa
	xor a			;98ad
	ld (iy+01dh),a		;98ae
	ld (ix+01dh),a		;98b1
	ld hl,03007h		;98b4
	call L_993B		;98b7
	push ix		;98ba
	call L_98C1		;98bc
	pop iy		;98bf
L_98C1:
	ld a,(iy+020h)		;98c1
	cp 003h		;98c4
	ld a,014h		;98c6
	jr z,L_98CB		;98c8
	inc a			;98ca
L_98CB:
	call 05df1h		;98cb
	ld a,057h		;98ce
	jp 04d6eh		;98d0
L_98D3:
	ld iy,0e300h		;98d3
	call L_98DE		;98d7
	ld iy,0e380h		;98da
L_98DE:
	ld a,(0ec20h)		;98de
	or a			;98e1
	ret z			;98e2
	ld a,(iy+020h)		;98e3
	dec a			;98e6
	ret m			;98e7
	ld a,(iy+024h)		;98e8
	add a,004h		;98eb
	ld e,a			;98ed
	ld a,(iy+026h)		;98ee
	inc a			;98f1
	ld d,a			;98f2
	ld a,(0ec21h)		;98f3
	sub e			;98f6
	cp 008h		;98f7
	jr c,L_98FE		;98f9
	add a,00fh		;98fb
	ret nc			;98fd
L_98FE:
	ld a,(0ec22h)		;98fe
	sub d			;9901
	cp 00bh		;9902
	jr c,L_9909		;9904
	add a,00fh		;9906
	ret nc			;9908
L_9909:
	ld de,00030h		;9909
	call 05936h		;990c
	ld a,052h		;990f
	call 04d6eh		;9911
	ld hl,0ec20h		;9914
	ld a,(hl)			;9917
	ld (hl),000h		;9918
	dec a			;991a
	call 040ceh		;991b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x991e..0x992a  (12 bytes)
DATA_991E:
	defb 02ah,099h,046h,099h,051h,099h,045h,099h,057h,099h,067h,099h	; 991e  *.F.Q.E.W.g.

; ======================================================================
; CODIGO 0x992a..0x9c73  (841 bytes)
; ======================================================================


L_992A:
	ld hl,01001h		;992a
	ld b,00fh		;992d
L_992F:
	call L_993B		;992f
	ld a,(iy+021h)		;9932
	ld (0e228h),a		;9935
	jp 05e79h		;9938
L_993B:
	di			;993b
	ld (0e630h),hl		;993c
	ld a,03ch		;993f
	ld (0e632h),a		;9941
	ei			;9944
L_9945:
	ret			;9945
L_9946:
	ld (iy+034h),001h		;9946
	ld hl,01502h		;994a
	ld b,010h		;994d
	jr L_992F		;994f
L_9951:
	ld l,003h		;9951
	ld b,012h		;9953
	jr L_992F		;9955
L_9957:
	ld (iy+01dh),001h		;9957
	ld hl,01005h		;995b
	call 04da6h		;995e
	ld (iy+01dh),000h		;9961
	jr L_993B		;9965
L_9967:
	ld hl,03006h		;9967
	ld b,011h		;996a
	jr L_992F		;996c
L_996E:
	ld a,(0e689h)		;996e
	or a			;9971
	ret z			;9972
	ld hl,(0e68ah)		;9973
	ld a,l			;9976
	add a,004h		;9977
	ld l,a			;9979
	ld e,(hl)			;997a
	inc l			;997b
	inc l			;997c
	ld d,(hl)			;997d
	ld hl,01108h		;997e
	ld iy,0e400h		;9981
	ld b,004h		;9985
L_9987:
	push bc			;9987
	call L_9995		;9988
	ld bc,00010h		;998b
	add iy,bc		;998e
	pop bc			;9990
	ret c			;9991
	djnz L_9987		;9992
	ret			;9994
L_9995:
	ld a,(iy+000h)		;9995
	or a			;9998
	ret z			;9999
	ld a,(iy+004h)		;999a
	sub e			;999d
	add a,l			;999e
	cp h			;999f
	ret nc			;99a0
	ld a,(iy+006h)		;99a1
	sub d			;99a4
	add a,l			;99a5
	cp h			;99a6
	ret nc			;99a7
	call L_99AD		;99a8
	scf			;99ab
	ret			;99ac
L_99AD:
	ld hl,(0e68ah)		;99ad
	push hl			;99b0
	pop ix		;99b1
	call L_8C7B		;99b3
	ld hl,0e60bh		;99b6
	dec (hl)			;99b9
	ld (iy+000h),000h		;99ba
	ld h,(iy+001h)		;99be
	ld l,(iy+002h)		;99c1
	push hl			;99c4
	call L_99EC		;99c5
	pop hl			;99c8
	ld b,004h		;99c9
	ld iy,0e400h		;99cb
L_99CF:
	ld a,(iy+000h)		;99cf
	or a			;99d2
	jr z,L_99E4		;99d3
	ld a,h			;99d5
	xor (iy+001h)		;99d6
	jr nz,L_99E4		;99d9
	ld a,(iy+002h)		;99db
	cp l			;99de
	jr c,L_99E4		;99df
	dec (iy+002h)		;99e1
L_99E4:
	ld de,00010h		;99e4
	add iy,de		;99e7
	djnz L_99CF		;99e9
	ret			;99eb
L_99EC:
	ld a,(iy+001h)		;99ec
	ld iy,0e300h		;99ef
	xor (iy+021h)		;99f3
	jr z,L_99FC		;99f6
	ld iy,0e380h		;99f8
L_99FC:
	dec (iy+030h)		;99fc
	ld a,(iy+030h)		;99ff
	ld (iy+017h),a		;9a02
	call 05d8eh		;9a05
	ld a,(0e227h)		;9a08
	cp 002h		;9a0b
	ret nz			;9a0d
	call 04da6h		;9a0e
	ld a,(iy+030h)		;9a11
	ld (iy+017h),a		;9a14
	jp 05d8eh		;9a17
L_9A1A:
	ld a,(0e644h)		;9a1a
	and a			;9a1d
	ret nz			;9a1e
	ld ix,0ec80h		;9a1f
	ld a,(ix+000h)		;9a23
	and a			;9a26
	ret z			;9a27
	ld iy,0e440h		;9a28
	ld b,00fh		;9a2c
L_9A2E:
	push bc			;9a2e
	ld a,(iy+000h)		;9a2f
	or a			;9a32
	call nz,L_9A3F		;9a33
	ld de,00018h		;9a36
	add iy,de		;9a39
	pop bc			;9a3b
	djnz L_9A2E		;9a3c
	ret			;9a3e
L_9A3F:
	ld a,(0ec80h)		;9a3f
	cp 009h		;9a42
	ret z			;9a44
	ld hl,0ecd5h		;9a45
	exx			;9a48
	ld de,0ecc7h		;9a49
	ld hl,0ecf4h		;9a4c
	exx			;9a4f
	push hl			;9a50
	ld hl,09c72h		;9a51
	call 05ad8h		;9a54
	pop hl			;9a57
	ld b,a			;9a58
L_9A59:
	push bc			;9a59
	exx			;9a5a
	ld (0e6d9h),hl		;9a5b
	ld (0e6dbh),de		;9a5e
	exx			;9a62
	ld (0e6ddh),hl		;9a63
	call L_9A75		;9a66
	exx			;9a69
	inc l			;9a6a
	exx			;9a6b
	ld hl,(0e6ddh)		;9a6c
	inc l			;9a6f
	inc l			;9a70
	pop bc			;9a71
	djnz L_9A59		;9a72
	ret			;9a74
L_9A75:
	push hl			;9a75
	exx			;9a76
	ld a,(de)			;9a77
	inc e			;9a78
	exx			;9a79
	ld l,a			;9a7a
	exx			;9a7b
	ld a,(de)			;9a7c
	inc e			;9a7d
	exx			;9a7e
	ld h,a			;9a7f
	ld (0e6d7h),hl		;9a80
	pop hl			;9a83
	ld c,(hl)			;9a84
	inc l			;9a85
	ld b,(hl)			;9a86
	ld hl,0e6d7h		;9a87
L_9A8A:
	ld e,(hl)			;9a8a
	ld a,(iy+000h)		;9a8b
	sub 006h		;9a8e
	cp 006h		;9a90
	ld d,(iy+003h)		;9a92
	jr nc,L_9AA9		;9a95
	ld a,(0e620h)		;9a97
	and a			;9a9a
	jr z,L_9AA9		;9a9b
	ld a,(iy+00ah)		;9a9d
	dec a			;9aa0
	ret m			;9aa1
	add a,a			;9aa2
	add a,a			;9aa3
	add a,a			;9aa4
	neg		;9aa5
	add a,d			;9aa7
	ld d,a			;9aa8
L_9AA9:
	ld a,e			;9aa9
	sub d			;9aaa
	jp nc,L_9AB5		;9aab
	neg		;9aae
	cp c			;9ab0
	jp c,L_9AB9		;9ab1
	ret			;9ab4
L_9AB5:
	cp (iy+00dh)		;9ab5
	ret nc			;9ab8
L_9AB9:
	inc l			;9ab9
	ld a,(hl)			;9aba
	sub (iy+005h)		;9abb
	jp nc,L_9AC8		;9abe
	neg		;9ac1
	cp b			;9ac3
	jp c,L_9ACC		;9ac4
	ret			;9ac7
L_9AC8:
	cp (iy+00ch)		;9ac8
	ret nc			;9acb
L_9ACC:
	exx			;9acc
	ld a,(iy+000h)		;9acd
	ld b,a			;9ad0
	ld (iy+000h),000h		;9ad1
	ld a,(hl)			;9ad5
	exx			;9ad6
	or a			;9ad7
	ret z			;9ad8
	exx			;9ad9
	dec (hl)			;9ada
	jr z,L_9B02		;9adb
	ld a,b			;9add
	cp 00ch		;9ade
	jr nz,L_9AEA		;9ae0
	ld a,(hl)			;9ae2
	sub 01fh		;9ae3
	ld (hl),a			;9ae5
	jr z,L_9B02		;9ae6
	jr c,L_9B02		;9ae8
L_9AEA:
	exx			;9aea
	ld a,(0e6c8h)		;9aeb
	or a			;9aee
	jp nz,L_9C28		;9aef
	ld a,018h		;9af2
	call 04d6eh		;9af4
	ld hl,(0e6d7h)		;9af7
	ex de,hl			;9afa
	ld a,026h		;9afb
	ld c,000h		;9afd
	jp 065b5h		;9aff
L_9B02:
	ld (hl),000h		;9b02
	exx			;9b04
	ld a,(0ec80h)		;9b05
	cp 005h		;9b08
	jr z,L_9B44		;9b0a
	cp 006h		;9b0c
	jr z,L_9B56		;9b0e
	cp 007h		;9b10
	jr z,L_9B19		;9b12
	cp 004h		;9b14
	jp nz,L_9C1D		;9b16
L_9B19:
	ld hl,(0e6d9h)		;9b19
	ld de,0ecf4h		;9b1c
	or a			;9b1f
	sbc hl,de		;9b20
	ld a,l			;9b22
	cp 002h		;9b23
	ret z			;9b25
	jr c,L_9B29		;9b26
	dec a			;9b28
L_9B29:
	ld h,a			;9b29
	ld a,(0ecfeh)		;9b2a
	cp h			;9b2d
	jr nz,L_9B35		;9b2e
	ld a,001h		;9b30
	ld (0ecffh),a		;9b32
L_9B35:
	ld a,h			;9b35
	ld hl,0ecefh		;9b36
	call 040c4h		;9b39
	ld a,024h		;9b3c
	ld (hl),a			;9b3e
L_9B3F:
	ld a,015h		;9b3f
	jp 04d6eh		;9b41
L_9B44:
	ld hl,(0e6d9h)		;9b44
	ld de,0ecf4h		;9b47
	or a			;9b4a
	sbc hl,de		;9b4b
	jp nz,L_9C1D		;9b4d
	ld a,01ch		;9b50
	ld (0ecf0h),a		;9b52
	ret			;9b55
L_9B56:
	ld hl,(0e6d9h)		;9b56
	ld de,0ecf4h		;9b59
	or a			;9b5c
	sbc hl,de		;9b5d
	ld a,l			;9b5f
	cp 002h		;9b60
	jr c,L_9B6C		;9b62
	jp z,L_9C18		;9b64
	cp 006h		;9b67
	jp z,L_9C1D		;9b69
L_9B6C:
	ld b,a			;9b6c
	ld (0f000h),a		;9b6d
	inc b			;9b70
	ld c,001h		;9b71
L_9B73:
	sla c		;9b73
	djnz L_9B73		;9b75
	ld a,(0ecfdh)		;9b77
	and c			;9b7a
	jr nz,L_9BC3		;9b7b
	ld a,(0ecfdh)		;9b7d
	or c			;9b80
	ld (0ecfdh),a		;9b81
	ld a,(0f000h)		;9b84
	cp 005h		;9b87
	jr nz,L_9B8D		;9b89
	ld a,002h		;9b8b
L_9B8D:
	ld hl,0ecb4h		;9b8d
	add a,a			;9b90
	add a,a			;9b91
	call 040c4h		;9b92
	ld a,(hl)			;9b95
	and a			;9b96
	push af			;9b97
	ld c,(hl)			;9b98
	inc l			;9b99
	inc l			;9b9a
	ld b,(hl)			;9b9b
	pop af			;9b9c
	ld a,c			;9b9d
	jr z,L_9BA2		;9b9e
	ld a,0e0h		;9ba0
L_9BA2:
	ld hl,(0e6dbh)		;9ba2
	ld (hl),a			;9ba5
	inc l			;9ba6
	ld (hl),b			;9ba7
	ld hl,(0e6d9h)		;9ba8
	ld (hl),00ah		;9bab
	ld hl,(0e6ddh)		;9bad
	ld (hl),010h		;9bb0
	inc l			;9bb2
	ld (hl),010h		;9bb3
L_9BB5:
	ld hl,0ec9bh		;9bb5
	ld a,(0f000h)		;9bb8
L_9BBB:
	add a,a			;9bbb
	add a,a			;9bbc
	call 040c4h		;9bbd
	ld (hl),0e0h		;9bc0
	ret			;9bc2
L_9BC3:
	ld a,(0f000h)		;9bc3
	cp 005h		;9bc6
	jr nz,L_9BCC		;9bc8
	ld a,002h		;9bca
L_9BCC:
	push af			;9bcc
	ld hl,0ecb3h		;9bcd
	call L_9BBB		;9bd0
	pop af			;9bd3
	ld hl,0ecefh		;9bd4
	call 040c4h		;9bd7
	ld (hl),018h		;9bda
	call L_9B3F		;9bdc
	ld hl,(0e6dbh)		;9bdf
	ld (hl),0e0h		;9be2
	ld a,(0f000h)		;9be4
	cp 002h		;9be7
	jr c,L_9BED		;9be9
	ret z			;9beb
	dec a			;9bec
L_9BED:
	cp 004h		;9bed
	jr z,L_9C12		;9bef
	ld c,a			;9bf1
	ld a,(0ecfeh)		;9bf2
	cp c			;9bf5
	ret nz			;9bf6
	ld a,(0ecfdh)		;9bf7
	and 0f7h		;9bfa
	ld (0ecfdh),a		;9bfc
	ld hl,(0ecbbh)		;9bff
	ld a,h			;9c02
	or a			;9c03
	jr z,L_9C08		;9c04
	ld l,0e0h		;9c06
L_9C08:
	ld a,l			;9c08
	ld hl,(0e6dbh)		;9c09
	ld (hl),a			;9c0c
	xor a			;9c0d
	ld (0ecebh),a		;9c0e
	ret			;9c11
L_9C12:
	ld a,001h		;9c12
	ld (0ecffh),a		;9c14
	ret			;9c17
L_9C18:
	ld (0f000h),a		;9c18
	jr L_9BB5		;9c1b
L_9C1D:
	ld a,002h		;9c1d
	ld (0e644h),a		;9c1f
	ld de,00100h		;9c22
	jp 05936h		;9c25
L_9C28:
	ld a,(0e6c8h)		;9c28
	rla			;9c2b
	ld de,(0e6c9h)		;9c2c
	ld c,000h		;9c30
	ld a,026h		;9c32
	jr c,L_9C38		;9c34
	ld a,038h		;9c36
L_9C38:
	jp 065bdh		;9c38
L_9C3B:
	ld hl,0e6c8h		;9c3b
	bit 7,(hl)		;9c3e
	ret z			;9c40
	jr L_9C4A		;9c41
L_9C43:
	ld hl,0e6c8h		;9c43
	ld a,(hl)			;9c46
	cp 002h		;9c47
	ret nz			;9c49
L_9C4A:
	ld iy,0e440h		;9c4a
	ld b,00fh		;9c4e
L_9C50:
	push bc			;9c50
	ld a,(iy+000h)		;9c51
	or a			;9c54
	call nz,L_9C61		;9c55
	ld de,00018h		;9c58
	add iy,de		;9c5b
	pop bc			;9c5d
	djnz L_9C50		;9c5e
	ret			;9c60
L_9C61:
	ld ix,0ec80h		;9c61
	ld hl,0e6c9h		;9c65
	ld bc,01010h		;9c68
	exx			;9c6b
	ld hl,0e6cfh		;9c6c
	exx			;9c6f
	jp L_9A8A		;9c70

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9c73..0x9c7b  (8 bytes)
DATA_9C73:
	defb 001h,001h,003h,005h,002h,007h,005h,001h	; 9c73  ........

; ======================================================================
; CODIGO 0x9c7b..0x9c88  (13 bytes)
; ======================================================================


L_9C7B:
	ld a,(0e6c8h)		;9c7b
	bit 7,a		;9c7e
	ret z			;9c80
	and 07fh		;9c81
	ret z			;9c83
	dec a			;9c84
	call 040ceh		;9c85

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9c88..0x9c90  (8 bytes)
DATA_9C88:
	defb 090h,09ch,0adh,09ch,0f9h,09ch,00bh,09dh	; 9c88  ........

; ======================================================================
; CODIGO 0x9c90..0x9d21  (145 bytes)
; ======================================================================


L_9C90:
	ld hl,0e6c8h		;9c90
	inc (hl)			;9c93
	inc l			;9c94
	ld (hl),050h		;9c95
	inc l			;9c97
	ld (hl),0a0h		;9c98
	inc l			;9c9a
	ld (hl),010h		;9c9b
	inc l			;9c9d
	ld (hl),000h		;9c9e
	inc l			;9ca0
	inc l			;9ca1
	inc l			;9ca2
	ld (hl),032h		;9ca3
	xor a			;9ca5
	ld (0e644h),a		;9ca6
	ld (0e648h),a		;9ca9
	ret			;9cac
L_9CAD:
	ld a,(0e644h)		;9cad
	or a			;9cb0
	jr z,L_9CC2		;9cb1
	ld hl,0e6cbh		;9cb3
	ld (hl),03ch		;9cb6
	ld a,025h		;9cb8
	call 04d6eh		;9cba
L_9CBD:
	ld hl,0e6c8h		;9cbd
	inc (hl)			;9cc0
	ret			;9cc1
L_9CC2:
	ld hl,0e6cbh		;9cc2
	dec (hl)			;9cc5
	ret nz			;9cc6
	ld (hl),018h		;9cc7
	inc l			;9cc9
	ld a,(hl)			;9cca
	and 007h		;9ccb
	inc (hl)			;9ccd
	ld hl,09d21h		;9cce
	call 05ad8h		;9cd1
	ld b,a			;9cd4
	srl b		;9cd5
	srl b		;9cd7
	srl b		;9cd9
	srl b		;9cdb
	dec b			;9cdd
	ld e,050h		;9cde
	ld d,0b0h		;9ce0
	push af			;9ce2
	push de			;9ce3
	ld a,041h		;9ce4
	ld c,000h		;9ce6
	call 065bdh		;9ce8
	pop de			;9ceb
	pop af			;9cec
	and 00fh		;9ced
	ret z			;9cef
	ld b,a			;9cf0
	dec b			;9cf1
	ld a,041h		;9cf2
	ld c,000h		;9cf4
	jp 065bdh		;9cf6
L_9CF9:
	ld hl,0e6cbh		;9cf9
	dec (hl)			;9cfc
	ret nz			;9cfd
	ld a,024h		;9cfe
	call 04d6eh		;9d00
	ld hl,00001h		;9d03
	ld (0e6aah),hl		;9d06
	jr L_9CBD		;9d09
L_9D0B:
	call 041bfh		;9d0b
	call 0a32ah		;9d0e
	call 041d0h		;9d11
	ld a,(0e6aeh)		;9d14
	and a			;9d17
	ret z			;9d18
	xor a			;9d19
	ld (0e6aah),a		;9d1a
	ld (0e6c8h),a		;9d1d
	ret			;9d20

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9d21..0x9d29  (8 bytes)
DATA_9D21:
	defb 010h,030h,020h,013h,012h,023h,020h,030h	; 9d21  .0 ..# 0

; ======================================================================
; CODIGO 0x9d29..0x9d44  (27 bytes)
; ======================================================================


L_9D29:
	ld (ix+002h),008h		;9d29
	ld (ix+010h),007h		;9d2d
	ld de,0f900h		;9d31
	call 0685dh		;9d34
	ld a,(ix+019h)		;9d37
	ld hl,09d44h		;9d3a
	call 05ad8h		;9d3d
	ld d,a			;9d40
	jp 06856h		;9d41

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9d44..0x9d47  (3 bytes)
DATA_9D44:
	defb 0fch,000h,004h	; 9d44

; ======================================================================
; CODIGO 0x9d47..0x9db4  (109 bytes)
; ======================================================================


L_9D47:
	ld hl,09db8h		;9d47
	call 0a01dh		;9d4a
	ld hl,09db4h		;9d4d
	call L_9DA7		;9d50
	ld a,(ix+001h)		;9d53
	dec a			;9d56
	jr z,L_9D6C		;9d57
	dec a			;9d59
	jr z,L_9D8F		;9d5a
	dec (ix+002h)		;9d5c
	ret nz			;9d5f
	ld (ix+002h),010h		;9d60
	inc (ix+001h)		;9d64
	ld (ix+010h),003h		;9d67
	ret			;9d6b
L_9D6C:
	dec (ix+002h)		;9d6c
	ret nz			;9d6f
	inc (ix+001h)		;9d70
	ld (ix+010h),007h		;9d73
	call 06877h		;9d77
	ld d,0fch		;9d7a
	call 0685dh		;9d7c
	ld e,(ix+004h)		;9d7f
	ld a,(ix+006h)		;9d82
	sub 008h		;9d85
	ld d,a			;9d87
	ld c,000h		;9d88
	ld a,040h		;9d8a
	jp 065b5h		;9d8c
L_9D8F:
	ld a,(0e326h)		;9d8f
	cp (ix+006h)		;9d92
	ret nc			;9d95
	ld a,(0e324h)		;9d96
	cp (ix+004h)		;9d99
	ld bc,00040h		;9d9c
	jr nc,L_9DA4		;9d9f
	ld bc,0ffc0h		;9da1
L_9DA4:
	jp 06bf3h		;9da4
L_9DA7:
	ld a,(0e203h)		;9da7
	rra			;9daa
	and 003h		;9dab
	call 05ad8h		;9dad
	ld (ix+030h),a		;9db0
	ret			;9db3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9db4..0x9dbc  (8 bytes)
DATA_9DB4:
	defb 058h,05ch,060h,05ch,00ch,002h,003h,002h	; 9db4  X\`\....

; ======================================================================
; CODIGO 0x9dbc..0x9feb  (559 bytes)
; ======================================================================


L_9DBC:
	ld (ix+002h),004h		;9dbc
	ld (ix+013h),002h		;9dc0
	ld l,(ix+004h)		;9dc4
	ld h,(ix+006h)		;9dc7
	call 05a99h		;9dca
	ld (ix+011h),l		;9dcd
	ld (ix+012h),h		;9dd0
	ld (ix+010h),005h		;9dd3
	ld (ix+014h),001h		;9dd7
	call 06877h		;9ddb
	ld d,0f8h		;9dde
	jp 0685dh		;9de0
L_9DE3:
	ld a,(ix+006h)		;9de3
	or a			;9de6
	jp z,06b62h		;9de7
	call L_9E19		;9dea
	jp c,06b62h		;9ded
	ld a,(ix+032h)		;9df0
	xor 001h		;9df3
	ld (ix+032h),a		;9df5
	dec (ix+002h)		;9df8
	ret nz			;9dfb
	ld (ix+002h),004h		;9dfc
	ld a,(ix+004h)		;9e00
	sub 008h		;9e03
	ld (ix+004h),a		;9e05
	ld a,(ix+013h)		;9e08
	add a,002h		;9e0b
	ld (ix+013h),a		;9e0d
	ld a,(ix+00eh)		;9e10
	add a,010h		;9e13
	ld (ix+00eh),a		;9e15
	ret			;9e18
L_9E19:
	ld l,(ix+004h)		;9e19
	ld a,(ix+006h)		;9e1c
	bit 7,(ix+00ah)		;9e1f
	ld b,008h		;9e23
	jr z,L_9E29		;9e25
	ld b,0f8h		;9e27
L_9E29:
	add a,b			;9e29
	ld h,a			;9e2a
	call 05a99h		;9e2b
	ld b,(ix+013h)		;9e2e
L_9E31:
	call 07eeeh		;9e31
	ret c			;9e34
	ld de,00040h		;9e35
	add hl,de			;9e38
	djnz L_9E31		;9e39
	ret			;9e3b
L_9E3C:
	ld (ix+037h),004h		;9e3c
	ld a,(0e301h)		;9e40
	cp 006h		;9e43
	ld a,0cch		;9e45
	jr nz,L_9E4F		;9e47
	ld (ix+030h),058h		;9e49
	ld a,05ch		;9e4d
L_9E4F:
	ld (ix+036h),a		;9e4f
	call 04eaah		;9e52
	jp 0a018h		;9e55
L_9E58:
	ld a,(ix+004h)		;9e58
	ld (ix+034h),a		;9e5b
	ld a,(ix+006h)		;9e5e
	ld (ix+035h),a		;9e61
	ret			;9e64
L_9E65:
	bit 0,(ix+001h)		;9e65
	jr nz,L_9E83		;9e69
	ld a,(ix+004h)		;9e6b
	sub 005h		;9e6e
	cp 094h		;9e70
	ret nc			;9e72
	ld a,(ix+006h)		;9e73
	sub 005h		;9e76
	cp 0ech		;9e78
	ret nc			;9e7a
	inc (ix+001h)		;9e7b
	ld (ix+002h),0ffh		;9e7e
	ret			;9e82
L_9E83:
	bit 7,(ix+008h)		;9e83
	ld a,(ix+004h)		;9e87
	jr z,L_9E8E		;9e8a
	sub 018h		;9e8c
L_9E8E:
	add a,010h		;9e8e
	ld l,a			;9e90
	ld h,(ix+006h)		;9e91
	call 07ed4h		;9e94
	call c,L_9ED6		;9e97
	bit 7,(ix+00ah)		;9e9a
	ld a,(ix+006h)		;9e9e
	jr z,L_9EA5		;9ea1
	sub 018h		;9ea3
L_9EA5:
	add a,010h		;9ea5
	ld h,a			;9ea7
	ld l,(ix+004h)		;9ea8
	call 07ebfh		;9eab
	jr c,L_9ED1		;9eae
	ld a,(0e301h)		;9eb0
	cp 003h		;9eb3
	jr z,L_9EBF		;9eb5
	ld a,(ix+002h)		;9eb7
	or a			;9eba
	ret z			;9ebb
	dec (ix+002h)		;9ebc
L_9EBF:
	ld a,(ix+004h)		;9ebf
	sub 005h		;9ec2
	cp 094h		;9ec4
	call nc,L_9ED6		;9ec6
	ld a,(ix+006h)		;9ec9
	sub 005h		;9ecc
	cp 0ech		;9ece
	ret c			;9ed0
L_9ED1:
	call 06887h		;9ed1
	jr L_9ED9		;9ed4
L_9ED6:
	call 06897h		;9ed6
L_9ED9:
	ld a,039h		;9ed9
	jp 04d6eh		;9edb
L_9EDE:
	ld (ix+013h),001h		;9ede
	ld a,(ix+019h)		;9ee2
	jr L_9F07		;9ee5
L_9EE7:
	ld (ix+013h),002h		;9ee7
	ld a,038h		;9eeb
	jr L_9F07		;9eed
L_9EEF:
	ld (ix+013h),001h		;9eef
	ld a,033h		;9ef3
	jr L_9F07		;9ef5
L_9EF7:
	ld (ix+013h),002h		;9ef7
	ld a,(ix+019h)		;9efb
	jr L_9F07		;9efe
L_9F00:
	ld (ix+013h),003h		;9f00
	ld a,(ix+019h)		;9f04
L_9F07:
	ld (ix+032h),a		;9f07
	ld l,(ix+004h)		;9f0a
	ld h,(ix+006h)		;9f0d
	call 05a99h		;9f10
	ld (ix+011h),l		;9f13
	ld (ix+012h),h		;9f16
	ld (ix+010h),001h		;9f19
	ld (ix+014h),001h		;9f1d
	ret			;9f21
L_9F22:
	ld a,(ix+001h)		;9f22
	dec a			;9f25
	jr z,L_9F3B		;9f26
	ld a,(ix+014h)		;9f28
	add a,003h		;9f2b
	ld (ix+014h),a		;9f2d
	ld a,(ix+00fh)		;9f30
	add a,018h		;9f33
	ld (ix+00fh),a		;9f35
	jp L_9F51		;9f38
L_9F3B:
	ld a,(ix+014h)		;9f3b
	sub 003h		;9f3e
	ld (ix+014h),a		;9f40
	ld a,(ix+00fh)		;9f43
	sub 018h		;9f46
	ld (ix+00fh),a		;9f48
	cp 019h		;9f4b
	ret nc			;9f4d
	jp 06b62h		;9f4e
L_9F51:
	ld a,(ix+006h)		;9f51
	sub 018h		;9f54
	ld (ix+006h),a		;9f56
	cp 019h		;9f59
	ret nc			;9f5b
	ld b,a			;9f5c
	rra			;9f5d
	rra			;9f5e
	rra			;9f5f
	rra			;9f60
	and 003h		;9f61
	add a,(ix+014h)		;9f63
	ld (ix+014h),a		;9f66
	ld a,b			;9f69
	add a,(ix+00fh)		;9f6a
	ld (ix+00fh),a		;9f6d
	inc (ix+001h)		;9f70
	ld (ix+006h),000h		;9f73
	ret			;9f77
L_9F78:
	call 06bcdh		;9f78
	call 067cah		;9f7b
	ld (ix+015h),a		;9f7e
	set 4,(ix+010h)		;9f81
	ld b,001h		;9f85
	ld h,b			;9f87
	ld l,000h		;9f88
	ld (ix+027h),l		;9f8a
	ld a,(ix+019h)		;9f8d
	or a			;9f90
	jr nz,L_9FA3		;9f91
	ld b,a			;9f93
	res 4,(ix+010h)		;9f94
	ld (ix+031h),003h		;9f98
	inc a			;9f9c
	ld (0e664h),a		;9f9d
	ld h,b			;9fa0
	ld l,0e0h		;9fa1
L_9FA3:
	ld (ix+00ch),b		;9fa3
	ld a,(ix+006h)		;9fa6
	ld (ix+025h),a		;9fa9
	ld de,00300h		;9fac
	jp 06881h		;9faf
L_9FB2:
	ld a,(ix+019h)		;9fb2
	or a			;9fb5
	jr z,L_9FBE		;9fb6
	ld hl,0a029h		;9fb8
	call 0a01dh		;9fbb
L_9FBE:
	call L_9FE5		;9fbe
	call 07626h		;9fc1
	bit 0,(ix+001h)		;9fc4
	ret nz			;9fc8
	bit 0,(ix+027h)		;9fc9
	jr nz,$+72		;9fcd
	call 04e58h		;9fcf
	and 01fh		;9fd2
	sub 00fh		;9fd4
	add a,(ix+025h)		;9fd6
	cp (ix+006h)		;9fd9
	ld bc,00080h		;9fdc
	jr nc,L_9FE2		;9fdf
	dec b			;9fe1
L_9FE2:
	jp 06c01h		;9fe2
L_9FE5:
	ld hl,09febh		;9fe5
	jp 06bd5h		;9fe8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9feb..0x9ff1  (6 bytes)
DATA_9FEB:
	defb 0a0h,0a4h,0a8h,0ach,0a8h,0a4h	; 9feb

; ======================================================================
; CODIGO 0x9ff1..0x9fff  (14 bytes)
; ======================================================================


L_9FF1:
	ld ix,0e9c0h		;9ff1
	ld b,00ch		;9ff5
L_9FF7:
	push bc			;9ff7
	ld a,(ix+000h)		;9ff8
	cp 004h		;9ffb
	jr nz,$+11		;9ffd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9fff..0xa000  (1 bytes)
DATA_9FFF:
	defb 0ddh	; 9fff
