; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 01 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l7424h:	equ 0x07424

; ======================================================================
; CODIGO 0x6000..0x60cd  (205 bytes)
; ======================================================================


L_6000:
	call m,05adfh		;6000
	add hl,de			;6003
L_6004:
	ld a,015h		;6004
	ld de,00020h		;6006
L_6009:
	ld b,020h		;6009
L_600B:
	outi		;600b
	jp nz,L_600B		;600d
	add hl,de			;6010
	dec a			;6011
	jp nz,L_6009		;6012
	ret			;6015
L_6016:
	ld hl,03800h		;6016
	call 04cb1h		;6019
	exx			;601c
	ld hl,0ca00h		;601d
	ld de,00020h		;6020
	exx			;6023
	ld b,015h		;6024
L_6026:
	exx			;6026
	ld b,020h		;6027
L_6029:
	ld a,(hl)			;6029
	inc hl			;602a
	cp 052h		;602b
	jr c,L_6034		;602d
	cp 0a2h		;602f
	jr nc,L_6034		;6031
	xor a			;6033
L_6034:
	out (c),a		;6034
	djnz L_6029		;6036
	add hl,de			;6038
	dec a			;6039
	exx			;603a
	djnz L_6026		;603b
	ret			;603d
L_603E:
	xor a			;603e
	ld (0e630h),a		;603f
	ld a,(0e228h)		;6042
	ld iy,0e300h		;6045
	xor (iy+021h)		;6049
	jr z,L_6052		;604c
	ld iy,0e380h		;604e
L_6052:
	jp 05d62h		;6052
L_6055:
	ld iy,0e300h		;6055
	call L_6060		;6059
	ld iy,0e380h		;605c
L_6060:
	ld a,(iy+020h)		;6060
	or a			;6063
	ret z			;6064
	cp 004h		;6065
	ret z			;6067
	cp 003h		;6068
	jr z,L_60B9		;606a
	cp 0ffh		;606c
	jr z,L_60A0		;606e
	ld a,(iy+027h)		;6070
	add a,a			;6073
	add a,a			;6074
	ld hl,095f7h		;6075
	call 040c4h		;6078
	push hl			;607b
	bit 0,(iy+021h)		;607c
	ld hl,01800h		;6080
	jr z,L_6088		;6083
	ld hl,01840h		;6085
L_6088:
	call 04cb1h		;6088
	exx			;608b
	pop hl			;608c
	ld a,002h		;608d
L_608F:
	ld e,(hl)			;608f
	inc hl			;6090
	ld d,(hl)			;6091
	inc hl			;6092
	ex de,hl			;6093
	ld b,020h		;6094
L_6096:
	outi		;6096
	jp nz,L_6096		;6098
	ex de,hl			;609b
	dec a			;609c
	jr nz,L_608F		;609d
	ret			;609f
L_60A0:
	ld hl,01a00h		;60a0
L_60A3:
	call 04cb1h		;60a3
	exx			;60a6
	ld a,(iy+027h)		;60a7
	and 07fh		;60aa
	add a,a			;60ac
	add a,a			;60ad
	add a,a			;60ae
	ld hl,0962fh		;60af
	call 040c4h		;60b2
	ld a,004h		;60b5
	jr L_608F		;60b7
L_60B9:
	ld hl,01800h		;60b9
	jr L_60A3		;60bc
L_60BE:
	ld a,(iy+068h)		;60be
	ld hl,060cch		;60c1
	call 05ad8h		;60c4
	ld hl,028d8h		;60c7
	jp 05dfdh		;60ca

; ----------------------------------------------------------------------
; DATOS sin identificar  0x60cd..0x60d4  (7 bytes)
DATA_60CD:
	defb 004h,009h,008h,005h,00ch,00dh,00eh	; 60cd

; ======================================================================
; CODIGO 0x60d4..0x651c  (1096 bytes)
; ======================================================================


L_60D4:
	ld de,00010h		;60d4
	exx			;60d7
	ld ix,0ea00h		;60d8
	ld de,0efe0h		;60dc
	ld b,008h		;60df
L_60E1:
	ld a,(ix+000h)		;60e1
	and a			;60e4
	jr z,L_6102		;60e5
	ld a,(ix+004h)		;60e7
	ld (de),a			;60ea
	inc e			;60eb
	ld a,(ix+006h)		;60ec
	ld (de),a			;60ef
	inc e			;60f0
	ld a,(ix+00bh)		;60f1
	ld (de),a			;60f4
	inc e			;60f5
	ld a,(ix+00ch)		;60f6
	ld (de),a			;60f9
	inc e			;60fa
L_60FB:
	exx			;60fb
	add ix,de		;60fc
	exx			;60fe
	djnz L_60E1		;60ff
	ret			;6101
L_6102:
	ld a,0e0h		;6102
	ld (de),a			;6104
	inc e			;6105
	inc e			;6106
	inc e			;6107
	inc e			;6108
	jp L_60FB		;6109
L_610C:
	ld a,(0e6aah)		;610c
	or a			;610f
	ret nz			;6110
	call 041d8h		;6111
	call L_611A		;6114
	jp 041d0h		;6117
L_611A:
	ld ix,0e700h		;611a
	ld de,0efb0h		;611e
	ld b,00ch		;6121
L_6123:
	push bc			;6123
	ld a,(ix+000h)		;6124
	or a			;6127
	jr z,L_615D		;6128
	bit 7,(ix+00bh)		;612a
	jr z,L_615D		;612e
	cp 03fh		;6130
	jp z,L_6217		;6132
	cp 03eh		;6135
	jp z,L_620F		;6137
	cp 031h		;613a
	jp z,L_620F		;613c
	cp 032h		;613f
	jp z,L_620F		;6141
	cp 036h		;6144
	jp z,L_620F		;6146
	cp 040h		;6149
	jp z,L_6170		;614b
	sub 039h		;614e
	cp 005h		;6150
	jr c,L_6168		;6152
	bit 6,(ix+00bh)		;6154
	jr z,L_6178		;6158
	call nz,L_61B6		;615a
L_615D:
	exx			;615d
	ld de,00040h		;615e
	add ix,de		;6161
	exx			;6163
	pop bc			;6164
	djnz L_6123		;6165
	ret			;6167
L_6168:
	push de			;6168
	call 04ebdh		;6169
	pop de			;616c
	jp L_615D		;616d
L_6170:
	push de			;6170
	call 04f07h		;6171
	pop de			;6174
	jp L_615D		;6175
L_6178:
	ld a,(ix+00bh)		;6178
	and 03fh		;617b
	ld b,a			;617d
	jp z,L_615D		;617e
	ld a,(ix+004h)		;6181
	ld (de),a			;6184
	inc e			;6185
	ld a,(ix+006h)		;6186
	ld (de),a			;6189
	inc e			;618a
	ld a,(ix+030h)		;618b
	ld (de),a			;618e
	inc e			;618f
	ld a,(ix+031h)		;6190
	ld (de),a			;6193
	inc e			;6194
	dec b			;6195
	jp z,L_615D		;6196
	push ix		;6199
	pop hl			;619b
	ld a,034h		;619c
	add a,l			;619e
	ld l,a			;619f
	jr nc,L_61A3		;61a0
	inc h			;61a2
L_61A3:
	push bc			;61a3
	ld a,(hl)			;61a4
	ld (de),a			;61a5
	inc l			;61a6
	inc e			;61a7
	ld a,(hl)			;61a8
	ld (de),a			;61a9
	inc l			;61aa
	inc e			;61ab
	ldi		;61ac
	ldi		;61ae
	pop bc			;61b0
	djnz L_61A3		;61b1
	jp L_615D		;61b3
L_61B6:
	ld a,(ix+004h)		;61b6
	cp 0b8h		;61b9
	ret nc			;61bb
	push de			;61bc
	ld de,090a1h		;61bd
	ld a,(ix+032h)		;61c0
	call 04e21h		;61c3
	ex de,hl			;61c6
	ld e,(ix+011h)		;61c7
	ld d,(ix+012h)		;61ca
	ld b,(ix+013h)		;61cd
	ld c,(ix+006h)		;61d0
	xor a			;61d3
	sub c			;61d4
	jr nz,L_61D9		;61d5
	ld a,0f8h		;61d7
L_61D9:
	rra			;61d9
	rra			;61da
	rra			;61db
	and 01fh		;61dc
	ld c,(ix+014h)		;61de
	cp c			;61e1
	jr nc,L_61E5		;61e2
	ld c,a			;61e4
L_61E5:
	push bc			;61e5
	ld a,c			;61e6
	ld b,000h		;61e7
	ldir		;61e9
	sub (ix+014h)		;61eb
	jr z,L_61F7		;61ee
	neg		;61f0
	add a,l			;61f2
	ld l,a			;61f3
	jr nc,L_61F7		;61f4
	inc h			;61f6
L_61F7:
	pop bc			;61f7
	ld a,040h		;61f8
	sub c			;61fa
	add a,e			;61fb
	ld e,a			;61fc
	jr nc,L_6200		;61fd
	inc d			;61ff
L_6200:
	djnz L_61E5		;6200
	pop de			;6202
	ret			;6203
L_6204:
	ld b,(ix+013h)		;6204
L_6207:
	ld (hl),a			;6207
	ld de,00040h		;6208
	add hl,de			;620b
	djnz L_6207		;620c
	ret			;620e
L_620F:
	push de			;620f
	call L_622B		;6210
	pop de			;6213
	jp L_615D		;6214
L_6217:
	push de			;6217
	call L_621F		;6218
	pop de			;621b
	jp L_615D		;621c
L_621F:
	ld a,(ix+020h)		;621f
	and a			;6222
	jr nz,L_622B		;6223
	ld a,(ix+004h)		;6225
	cp 0b8h		;6228
	ret nc			;622a
L_622B:
	ld a,(ix+019h)		;622b
	bit 1,a		;622e
	ld l,(ix+011h)		;6230
	ld h,(ix+012h)		;6233
	jp z,L_6251		;6236
	ld a,(0e640h)		;6239
	and a			;623c
	ld b,0c8h		;623d
	jr z,L_6243		;623f
	ld b,0a0h		;6241
L_6243:
	ld a,(ix+032h)		;6243
	and 001h		;6246
	add a,b			;6248
	ld b,(ix+014h)		;6249
L_624C:
	ld (hl),a			;624c
	inc hl			;624d
	djnz L_624C		;624e
	ret			;6250
L_6251:
	ld a,(0e640h)		;6251
	ld b,0cah		;6254
	and a			;6256
	jr z,L_625B		;6257
	ld b,0a2h		;6259
L_625B:
	ld a,(ix+032h)		;625b
	and 001h		;625e
	add a,b			;6260
	jr L_6204		;6261
L_6263:
	call 041d8h		;6263
	call L_626C		;6266
	jp 0416eh		;6269
L_626C:
	ld a,(0e6b2h)		;626c
	and a			;626f
	ret z			;6270
	ld b,a			;6271
	ld ix,0eb00h		;6272
L_6276:
	xor a			;6276
	ld (0f000h),a		;6277
	ld a,(ix+000h)		;627a
	and a			;627d
	jr z,L_62A5		;627e
	cp 008h		;6280
	jr z,L_62B5		;6282
	cp 00ch		;6284
	jr z,L_62B5		;6286
	cp 00bh		;6288
	jr z,L_62A5		;628a
	cp 009h		;628c
	jr z,L_62AD		;628e
	cp 013h		;6290
	jr z,L_62B5		;6292
	cp 016h		;6294
	jr z,L_62AD		;6296
	cp 012h		;6298
	jr z,L_62B5		;629a
	cp 00eh		;629c
	jr z,L_62B5		;629e
L_62A0:
	push bc			;62a0
	call L_62C0		;62a1
	pop bc			;62a4
L_62A5:
	ld de,00010h		;62a5
	add ix,de		;62a8
	djnz L_6276		;62aa
	ret			;62ac
L_62AD:
	ld a,(ix+001h)		;62ad
	inc a			;62b0
	jr nz,L_62A5		;62b1
	jr L_62BB		;62b3
L_62B5:
	ld a,(ix+001h)		;62b5
	inc a			;62b8
	jr nz,L_62A0		;62b9
L_62BB:
	call L_79FE		;62bb
	jr L_62A5		;62be
L_62C0:
	jr L_62F4		;62c0
L_62C2:
	call 041d8h		;62c2
	call L_62CB		;62c5
	jp 0416eh		;62c8
L_62CB:
	ld a,(0e6b2h)		;62cb
	and a			;62ce
	ret z			;62cf
	ld b,a			;62d0
	ld ix,0eb00h		;62d1
	ld a,0ffh		;62d5
	ld (0f000h),a		;62d7
L_62DA:
	push bc			;62da
	ld a,(ix+000h)		;62db
	cp 016h		;62de
	jr nz,L_62E8		;62e0
	ld a,(ix+001h)		;62e2
	inc a			;62e5
	jr nz,L_62EB		;62e6
L_62E8:
	call L_62F4		;62e8
L_62EB:
	pop bc			;62eb
	ld de,00010h		;62ec
	add ix,de		;62ef
	djnz L_62DA		;62f1
	ret			;62f3
L_62F4:
	ld a,(ix+000h)		;62f4
	and a			;62f7
	ret z			;62f8
	cp 00bh		;62f9
	ret z			;62fb
	cp 015h		;62fc
	ret z			;62fe
	cp 014h		;62ff
	ret z			;6301
	ld a,(ix+007h)		;6302
	ld de,08b8dh		;6305
	call 04e21h		;6308
	ld a,(ix+000h)		;630b
	cp 002h		;630e
	jr z,L_6330		;6310
	cp 004h		;6312
	jr nz,L_6348		;6314
	ld a,(ix+001h)		;6316
	cp 002h		;6319
	jr nz,L_6330		;631b
	ld b,(ix+00ch)		;631d
	ld a,(ix+00bh)		;6320
	and a			;6323
	jr nz,L_632D		;6324
	ld a,014h		;6326
	sub (ix+00ah)		;6328
	sub b			;632b
	ld b,a			;632c
L_632D:
	ld a,b			;632d
	jr L_6341		;632e
L_6330:
	ld a,(ix+00ah)		;6330
	ld b,a			;6333
	and a			;6334
	ret z			;6335
	ld a,(ix+00bh)		;6336
	and a			;6339
	jr z,L_6348		;633a
	ld a,b			;633c
	sub 014h		;633d
	neg		;633f
L_6341:
	add a,a			;6341
	ld b,a			;6342
	add a,a			;6343
	add a,b			;6344
	call 040c9h		;6345
L_6348:
	ld b,(ix+009h)		;6348
	ld c,(ix+00ah)		;634b
	ld a,(0f000h)		;634e
	and a			;6351
	jp z,L_638E		;6352
	ld a,(0e620h)		;6355
	or a			;6358
	jr z,L_636B		;6359
	ld a,(ix+003h)		;635b
	and a			;635e
	jr nz,L_6370		;635f
	ld a,(ix+004h)		;6361
	cp 07fh		;6364
	jp nc,0502dh		;6366
	jr L_6370		;6369
L_636B:
	ld a,(ix+005h)		;636b
	dec a			;636e
	ret z			;636f
L_6370:
	push bc			;6370
	push de			;6371
	call L_64F8		;6372
	call 05aadh		;6375
	pop de			;6378
	pop bc			;6379
	ex de,hl			;637a
	ld a,c			;637b
L_637C:
	push de			;637c
	ld c,(ix+009h)		;637d
	ld b,000h		;6380
	ldir		;6382
	pop de			;6384
	ld c,040h		;6385
	ex de,hl			;6387
	add hl,bc			;6388
	ex de,hl			;6389
	dec a			;638a
	jr nz,L_637C		;638b
	ret			;638d
L_638E:
	ld a,(0e620h)		;638e
	or a			;6391
	jr z,L_63A4		;6392
	ld a,(ix+003h)		;6394
	and a			;6397
	jr nz,L_63A9		;6398
	ld a,(ix+004h)		;639a
	cp 07fh		;639d
	jp nc,04fc2h		;639f
	jr L_63A9		;63a2
L_63A4:
	ld a,(ix+005h)		;63a4
	dec a			;63a7
	ret z			;63a8
L_63A9:
	push bc			;63a9
	call L_64F8		;63aa
	call 05aadh		;63ad
	pop bc			;63b0
L_63B1:
	ld b,(ix+009h)		;63b1
	push hl			;63b4
	xor a			;63b5
L_63B6:
	ld (hl),a			;63b6
	inc hl			;63b7
	djnz L_63B6		;63b8
	pop hl			;63ba
	ld a,040h		;63bb
	call 040c4h		;63bd
	dec c			;63c0
	jr nz,L_63B1		;63c1
	ret			;63c3
L_63C4:
	ld c,00bh		;63c4
	ld a,(ix+008h)		;63c6
	dec a			;63c9
	ld a,c			;63ca
	call nz,04d6eh		;63cb
	ret			;63ce
L_63CF:
	push ix		;63cf
	call L_63D7		;63d1
	pop ix		;63d4
	ret			;63d6
L_63D7:
	ld a,(ix+000h)		;63d7
	cp 00ch		;63da
	jr z,L_6450		;63dc
	cp 008h		;63de
	jr z,L_6450		;63e0
	cp 011h		;63e2
	call z,L_647E		;63e4
	cp 013h		;63e7
	jp z,L_64DD		;63e9
	cp 012h		;63ec
	jp z,L_64D1		;63ee
	cp 00eh		;63f1
	jp z,L_64C9		;63f3
	cp 016h		;63f6
	jp z,L_64C5		;63f8
	cp 007h		;63fb
	jp z,L_64B8		;63fd
L_6400:
	ld a,(ix+000h)		;6400
	call L_79FE		;6403
	and a			;6406
	ret z			;6407
	cp 001h		;6408
	jr z,L_6415		;640a
	cp 003h		;640c
	jr z,L_6415		;640e
	cp 00ah		;6410
	jr z,L_6415		;6412
	ret nz			;6414
L_6415:
	ld d,(ix+006h)		;6415
	ld e,(ix+004h)		;6418
	ld l,(ix+005h)		;641b
	ld h,(ix+003h)		;641e
	ld b,001h		;6421
	call L_7AD2		;6423
	call z,L_6434		;6426
	ld a,(ix+00bh)		;6429
	rra			;642c
	rl b		;642d
	ld a,015h		;642f
	jp L_7811		;6431
L_6434:
	ld a,(0e620h)		;6434
	and a			;6437
	jr z,L_6446		;6438
	ld a,e			;643a
	cp 028h		;643b
	ld b,003h		;643d
	ret c			;643f
	dec b			;6440
	cp 060h		;6441
	ret c			;6443
	dec b			;6444
	ret			;6445
L_6446:
	ld a,d			;6446
	cp 050h		;6447
	ret c			;6449
	inc b			;644a
	cp 0a8h		;644b
	ret c			;644d
	inc b			;644e
	ret			;644f
L_6450:
	ld a,0ffh		;6450
	ld (ix+001h),a		;6452
	ld (ix+00dh),a		;6455
	ld a,(ix+00bh)		;6458
	or a			;645b
	ld b,011h		;645c
	jr nz,L_6471		;645e
	ld a,004h		;6460
	sub (ix+00ah)		;6462
	add a,a			;6465
	add a,a			;6466
	add a,a			;6467
	neg		;6468
	add a,(ix+004h)		;646a
	ld (ix+004h),a		;646d
	dec b			;6470
L_6471:
	ld (ix+007h),b		;6471
	ld (ix+009h),004h		;6474
	ld (ix+00ah),004h		;6478
	jr L_6415		;647c
L_647E:
	call L_79FE		;647e
	call L_6486		;6481
	jr L_6415		;6484
L_6486:
	bit 1,(ix+00bh)		;6486
	ret z			;648a
	ld a,(0e354h)		;648b
	and a			;648e
	ret z			;648f
	ld hl,0e6d2h		;6490
	ld (hl),a			;6493
	inc l			;6494
	ld a,(ix+004h)		;6495
	add a,010h		;6498
	ld e,a			;649a
	ld (hl),a			;649b
	inc l			;649c
	ld a,(ix+006h)		;649d
	ld d,a			;64a0
	ld (hl),a			;64a1
	ex de,hl			;64a2
	call 05a99h		;64a3
	ld bc,00403h		;64a6
L_64A9:
	push bc			;64a9
L_64AA:
	ld (hl),000h		;64aa
	inc l			;64ac
	djnz L_64AA		;64ad
	ld a,l			;64af
	add a,03ch		;64b0
	ld l,a			;64b2
	pop bc			;64b3
	dec c			;64b4
	jr nz,L_64A9		;64b5
	ret			;64b7
L_64B8:
	ld a,(0e301h)		;64b8
	cp 003h		;64bb
	ld b,049h		;64bd
	jr z,L_64DF		;64bf
	ld b,01dh		;64c1
	jr L_64DF		;64c3
L_64C5:
	ld b,04ah		;64c5
	jr L_64DF		;64c7
L_64C9:
	ld a,(0e301h)		;64c9
	cp 005h		;64cc
	jp nz,L_6400		;64ce
L_64D1:
	ld b,058h		;64d1
	bit 0,(ix+00bh)		;64d3
	jr nz,L_64DF		;64d7
	ld b,04bh		;64d9
	jr L_64DF		;64db
L_64DD:
	ld b,057h		;64dd
L_64DF:
	ld a,0ffh		;64df
	ld (ix+001h),a		;64e1
	ld (ix+00dh),a		;64e4
	ld (ix+007h),b		;64e7
	ld a,(ix+000h)		;64ea
	cp 012h		;64ed
	jp z,L_6415		;64ef
	cp 00eh		;64f2
	jp z,L_6415		;64f4
	ret			;64f7
L_64F8:
	ld l,(ix+004h)		;64f8
	ld h,(ix+003h)		;64fb
	ld e,(ix+006h)		;64fe
	ld d,(ix+005h)		;6501
	ret			;6504
L_6505:
	ld e,(ix+020h)		;6505
	ld d,(ix+021h)		;6508
	call 05adfh		;650b
L_650E:
	ld (ix+020h),e		;650e
	ld (ix+021h),d		;6511
	ret			;6514
L_6515:
	ld (ix+020h),e		;6515
	ld (ix+021h),d		;6518
	ret			;651b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x651c..0x6528  (12 bytes)
DATA_651C:
	defb 07ah,0b7h,0fch,0dfh,05ah,0ddh,073h,022h,0ddh,072h,023h,0c9h	; 651c  z...Z.s".r#.

; ======================================================================
; CODIGO 0x6528..0x654e  (38 bytes)
; ======================================================================


L_6528:
	ld a,(ix+007h)		;6528
	add a,(ix+020h)		;652b
	ld (ix+007h),a		;652e
	ld a,(ix+008h)		;6531
	adc a,(ix+021h)		;6534
	ld (ix+008h),a		;6537
	ret			;653a
L_653B:
	ld a,(ix+009h)		;653b
	add a,(ix+020h)		;653e
	ld (ix+009h),a		;6541
	ld a,(ix+00ah)		;6544
	adc a,(ix+021h)		;6547
	ld (ix+00ah),a		;654a
	ret			;654d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x654e..0x6561  (19 bytes)
DATA_654E:
	defb 0ddh,05eh,007h,0ddh,056h,008h,07ah,0b7h,0fch,0dfh,05ah,0ddh,06eh,022h,0ddh,066h	; 654e  .^..V.z...Z.n".f
	defb 023h,0e7h,0c9h	; 655e

; ======================================================================
; CODIGO 0x6561..0x6571  (16 bytes)
; ======================================================================


L_6561:
	ld e,(ix+009h)		;6561
	ld d,(ix+00ah)		;6564
	call 05adfh		;6567
	ld (ix+009h),e		;656a
	ld (ix+00ah),d		;656d
	ret			;6570

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6571..0x6581  (16 bytes)
DATA_6571:
	defb 0ddh,05eh,007h,0ddh,056h,008h,0cdh,0dfh,05ah,0ddh,073h,007h,0ddh,072h,008h,0c9h	; 6571  .^..V...Z.s..r..

; ======================================================================
; CODIGO 0x6581..0x66c1  (320 bytes)
; ======================================================================


L_6581:
	ld a,(0e203h)		;6581
	and 01fh		;6584
	ret			;6586
L_6587:
	call L_6581		;6587
	ret nz			;658a
	dec (ix+025h)		;658b
	ret nz			;658e
	xor a			;658f
	ret			;6590
L_6591:
	ld a,(0e203h)		;6591
	and b			;6594
	ret nz			;6595
	ld a,(ix+026h)		;6596
	inc a			;6599
	cp c			;659a
	jr c,L_659E		;659b
	xor a			;659d
L_659E:
	ld (ix+026h),a		;659e
	call 05ad8h		;65a1
	ld (ix+030h),a		;65a4
	ld (ix+032h),a		;65a7
	ret			;65aa
L_65AB:
	ld a,r		;65ab
	rrca			;65ad
	rrca			;65ae
	rrca			;65af
	ld hl,0e203h		;65b0
	xor (hl)			;65b3
	ret			;65b4
L_65B5:
	push ix		;65b5
	call L_65BD		;65b7
	pop ix		;65ba
	ret			;65bc
L_65BD:
	ld (0e650h),a		;65bd
	cp 023h		;65c0
	jr nz,L_65C9		;65c2
	ld a,(0e689h)		;65c4
	or a			;65c7
	ret nz			;65c8
L_65C9:
	ld (0f019h),de		;65c9
	ld a,l			;65cd
	ld (0e65dh),a		;65ce
	ld a,h			;65d1
	ld (0e65ch),a		;65d2
	ld a,b			;65d5
	ld (0e65fh),a		;65d6
	xor a			;65d9
	ld (0e653h),a		;65da
	ld a,c			;65dd
	ld (0e651h),a		;65de
	ld hl,0e700h		;65e1
	ld b,00ch		;65e4
	ld de,00040h		;65e6
	xor a			;65e9
L_65EA:
	cp (hl)			;65ea
	jr z,L_65F2		;65eb
	add hl,de			;65ed
	djnz L_65EA		;65ee
	xor a			;65f0
	ret			;65f1
L_65F2:
	push hl			;65f2
	ld a,(0e650h)		;65f3
	ld l,a			;65f6
	ld h,000h		;65f7
	ld e,l			;65f9
	ld d,h			;65fa
	add hl,hl			;65fb
	add hl,hl			;65fc
	add hl,hl			;65fd
	or a			;65fe
	sbc hl,de		;65ff
	ld de,06c5dh		;6601
	add hl,de			;6604
	ex de,hl			;6605
	pop hl			;6606
	ld a,(de)			;6607
	bit 6,a		;6608
	jr nz,L_661C		;660a
	and 03fh		;660c
	ld b,a			;660e
	ld a,(0e655h)		;660f
	add a,b			;6612
	cp 00dh		;6613
	jr c,L_6619		;6615
	xor a			;6617
	ret			;6618
L_6619:
	ld (0e655h),a		;6619
L_661C:
	push de			;661c
	ld de,(0f019h)		;661d
	exx			;6621
	ld hl,0e652h		;6622
	inc (hl)			;6625
	exx			;6626
	push hl			;6627
	pop ix		;6628
	ld a,(0e650h)		;662a
	ld (0e653h),a		;662d
	ld (hl),a			;6630
	inc l			;6631
	xor a			;6632
	ld (hl),a			;6633
	inc l			;6634
	ld (hl),a			;6635
	inc l			;6636
	ld (hl),a			;6637
	inc l			;6638
	ld (hl),e			;6639
	inc l			;663a
	ld (hl),a			;663b
	inc l			;663c
	ld (hl),d			;663d
	ld de,00005h		;663e
	add hl,de			;6641
	pop de			;6642
	ex de,hl			;6643
	ldi		;6644
	ld a,(0e651h)		;6646
	ld (de),a			;6649
	inc e			;664a
	ldi		;664b
	ldi		;664d
	ldi		;664f
	ld a,007h		;6651
	ld (de),a			;6653
	ld a,005h		;6654
	call 040c9h		;6656
	call L_67CA		;6659
	ld (de),a			;665c
	inc e			;665d
	ld a,(0e650h)		;665e
	cp 026h		;6661
	jr z,L_667F		;6663
	xor a			;6665
	ld (de),a			;6666
	ld a,(0e650h)		;6667
	cp 00ah		;666a
	jr z,L_6676		;666c
	cp 00bh		;666e
	jr z,L_6676		;6670
	cp 031h		;6672
	jr nz,L_667F		;6674
L_6676:
	ld a,001h		;6676
	ld (de),a			;6678
	inc e			;6679
	ld a,(0e696h)		;667a
	ld (de),a			;667d
	dec e			;667e
L_667F:
	inc e			;667f
	inc e			;6680
	xor a			;6681
	ld (de),a			;6682
	inc e			;6683
	ld a,(0e65fh)		;6684
	ld (de),a			;6687
	inc e			;6688
	xor a			;6689
	ld (de),a			;668a
	ld a,006h		;668b
	call 040c9h		;668d
	ld a,(0e650h)		;6690
	cp 03fh		;6693
	jr nz,L_66A1		;6695
	ld a,(0e65dh)		;6697
	ld (de),a			;669a
	inc e			;669b
	ld a,(0e65ch)		;669c
	ld (de),a			;669f
	dec e			;66a0
L_66A1:
	ld a,010h		;66a1
	call 040c9h		;66a3
	ldi		;66a6
	ld a,(hl)			;66a8
	and 00fh		;66a9
	ld (de),a			;66ab
	inc hl			;66ac
	inc de			;66ad
	ldi		;66ae
	ld a,(0e651h)		;66b0
	and a			;66b3
	jr z,L_66BA		;66b4
	ld (ix+031h),008h		;66b6
L_66BA:
	ld a,(0e650h)		;66ba
	dec a			;66bd
	call 040ceh		;66be

; ----------------------------------------------------------------------
; DATOS tabla_66C1: 65 destinos del despachador p00:40CE (call en p01:66BE, el
;   indice en A): 8077, 67A6, A103, 9F78, 679D, 678B, A02D, A18A, A23A, 6767,
;   6743, 674C, 6755, 9343, A784, B954, 6794, A4E5, 67E0, BB83, BABB, 675E,
;   67B8, 67AF, A2BE, 67E0, A295, 6779, 6782, A2E6, A385, A3FB, BDBF, 67E0,
;   9326, 9E3C, BD00, 81F6, BD30, 6770, 824E, 825B, 67E0, 67E0, 67E0, 67E0,
;   67E0, A460, 90F8, 90FC, 9343, 92C5, BBBA, BF36, 67E0, 67C1, 9EDE, 9EE7,
;   9EEF, 9EF7, 9F00, B8C2, BA37, 9DBC, 9D29; lo leen p01:66BE (130 bytes)
;   0x66c1..0x6743  (130 bytes)
DATA_tabla_66C1:
	defw 08077h,067a6h,0a103h,09f78h,0679dh,0678bh,0a02dh,0a18ah	; 66c1
	defw 0a23ah,06767h,06743h,0674ch,06755h,09343h,0a784h,0b954h	; 66d1
	defw 06794h,0a4e5h,067e0h,0bb83h,0babbh,0675eh,067b8h,067afh	; 66e1
	defw 0a2beh,067e0h,0a295h,06779h,06782h,0a2e6h,0a385h,0a3fbh	; 66f1
	defw 0bdbfh,067e0h,09326h,09e3ch,0bd00h,081f6h,0bd30h,06770h	; 6701
	defw 0824eh,0825bh,067e0h,067e0h,067e0h,067e0h,067e0h,0a460h	; 6711
	defw 090f8h,090fch,09343h,092c5h,0bbbah,0bf36h,067e0h,067c1h	; 6721
	defw 09edeh,09ee7h,09eefh,09ef7h,09f00h,0b8c2h,0ba37h,09dbch	; 6731
	defw 09d29h	; 6741

; ======================================================================
; CODIGO 0x6743..0x67e1  (158 bytes)
; ======================================================================


L_6743:
	call 041bbh		;6743
	call 0be62h		;6746
	jp 041d0h		;6749
L_674C:
	call 041cbh		;674c
	call 0a715h		;674f
	jp 041d0h		;6752
L_6755:
	call 041cbh		;6755
	call 0a784h		;6758
	jp 041d0h		;675b
L_675E:
	call 041cbh		;675e
	call 0a804h		;6761
	jp 041d0h		;6764
L_6767:
	call 041cbh		;6767
	call 0a871h		;676a
	jp 041d0h		;676d
L_6770:
	call 041cbh		;6770
	call 0b01ah		;6773
	jp 041d0h		;6776
L_6779:
	call 041cbh		;6779
	call 0aaedh		;677c
	jp 041d0h		;677f
L_6782:
	call 041cbh		;6782
	call 0aaf9h		;6785
	jp 041d0h		;6788
L_678B:
	call 041cbh		;678b
	call 0acd4h		;678e
	jp 041d0h		;6791
L_6794:
	call 041cbh		;6794
	call 0a99ah		;6797
	jp 041d0h		;679a
L_679D:
	call 041cbh		;679d
	call 0ae10h		;67a0
	jp 041d0h		;67a3
L_67A6:
	call 041cbh		;67a6
	call 0b250h		;67a9
	jp 041d0h		;67ac
L_67AF:
	call 041cbh		;67af
	call 0b31eh		;67b2
	jp 041d0h		;67b5
L_67B8:
	call 041cbh		;67b8
	call 0b47ch		;67bb
	jp 041d0h		;67be
L_67C1:
	call 041bfh		;67c1
	call 0a469h		;67c4
	jp 041d0h		;67c7
L_67CA:
	push hl			;67ca
	ld hl,067e1h		;67cb
	jr L_67D4		;67ce
L_67D0:
	push hl			;67d0
	ld hl,067f1h		;67d1
L_67D4:
	ld a,(0e64fh)		;67d4
	call 040c4h		;67d7
	ld a,r		;67da
	and 007h		;67dc
	add a,(hl)			;67de
	pop hl			;67df
L_67E0:
	ret			;67e0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x67e1..0x6801  (32 bytes)
DATA_67E1:
	defb 068h,060h,048h,040h,038h,030h,028h,024h,020h,01ch,01ah,018h,014h,010h,00eh,00ch	; 67e1  h`H@80($ .......
	defb 040h,038h,030h,02bh,027h,023h,020h,01dh,01ah,018h,016h,014h,012h,010h,00eh,00ch	; 67f1  @80+'# .........

; ======================================================================
; CODIGO 0x6801..0x6830  (47 bytes)
; ======================================================================


L_6801:
	ld e,(ix+004h)		;6801
	ld d,(ix+006h)		;6804
L_6807:
	call L_6828		;6807
	call L_752E		;680a
L_680D:
	ld de,(0f012h)		;680d
	call L_6856		;6811
	ld de,(0f014h)		;6814
	jr $+69		;6818
L_681A:
	call L_6828		;681a
	ld e,(ix+004h)		;681d
	ld d,(ix+006h)		;6820
	call L_7522		;6823
	jr L_680D		;6826
L_6828:
	push af			;6828
	push hl			;6829
	call L_74B4		;682a
	pop hl			;682d
	pop af			;682e
	ret			;682f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6830..0x6832  (2 bytes)
DATA_6830:
	defb 03eh,080h	; 6830

; ======================================================================
; CODIGO 0x6832..0x6864  (50 bytes)
; ======================================================================


L_6832:
	ld e,(ix+004h)		;6832
	ld d,(ix+006h)		;6835
	ld (0f00fh),a		;6838
	ld a,h			;683b
	ld (0f000h),a		;683c
	ld a,l			;683f
	ld (0f001h),a		;6840
	call L_75B4		;6843
	ld d,001h		;6846
	call L_7536		;6848
	ld de,(0f014h)		;684b
	call L_685D		;684f
	ld de,(0f012h)		;6852
L_6856:
	ld (ix+007h),e		;6856
	ld (ix+008h),d		;6859
	ret			;685c
L_685D:
	ld (ix+009h),e		;685d
	ld (ix+00ah),d		;6860
	ret			;6863

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6864..0x6872  (14 bytes)
DATA_6864:
	defb 0ddh,05eh,009h,0ddh,056h,00ah,0c9h,0ddh,05eh,007h,0ddh,056h,008h,0c9h	; 6864  .^..V...^..V..

; ======================================================================
; CODIGO 0x6872..0x68f1  (127 bytes)
; ======================================================================


L_6872:
	call L_687C		;6872
	jr $-31		;6875
L_6877:
	ld d,000h		;6877
	ld e,d			;6879
	jr $-36		;687a
L_687C:
	ld d,000h		;687c
	ld e,d			;687e
	jr $-34		;687f
L_6881:
	call L_685D		;6881
	ex de,hl			;6884
	jr $-47		;6885
L_6887:
	ld e,(ix+009h)		;6887
	ld d,(ix+00ah)		;688a
	call 05adfh		;688d
	ld (ix+009h),e		;6890
	ld (ix+00ah),d		;6893
	ret			;6896
L_6897:
	ld e,(ix+007h)		;6897
	ld d,(ix+008h)		;689a
	call 05adfh		;689d
	ld (ix+007h),e		;68a0
	ld (ix+008h),d		;68a3
	ret			;68a6
L_68A7:
	ld ix,0e700h		;68a7
	ld b,00ch		;68ab
L_68AD:
	push bc			;68ad
	ld a,(ix+000h)		;68ae
	and a			;68b1
	jr z,L_68DA		;68b2
	call L_68E3		;68b4
	ld a,(ix+000h)		;68b7
	or a			;68ba
	jr z,L_68DA		;68bb
	call L_6A03		;68bd
	jr c,L_68DA		;68c0
	call L_6A6F		;68c2
	jr c,L_68DA		;68c5
	call L_6AEB		;68c7
	ld a,(ix+000h)		;68ca
	cp 016h		;68cd
	call z,L_6C3F		;68cf
	ld a,(ix+000h)		;68d2
	cp 024h		;68d5
	call z,09e58h		;68d7
L_68DA:
	ld bc,00040h		;68da
	add ix,bc		;68dd
	pop bc			;68df
	djnz L_68AD		;68e0
L_68E2:
	ret			;68e2
L_68E3:
	ld a,(ix+000h)		;68e3
	cp 026h		;68e6
	jr z,L_68EA		;68e8
L_68EA:
	ld a,(ix+000h)		;68ea
	dec a			;68ed
	call 040ceh		;68ee

; ----------------------------------------------------------------------
; DATOS tabla_68F1: 65 destinos del despachador p00:40CE (call en p01:68EE, el
;   indice en A): 80E9, 69CD, A121, 9FB2, 69C4, 69B2, A086, A1AA, A257, 698E,
;   6973, 697C, A2DC, 9387, A2DC, B985, 69BB, A50F, 68E2, BB9B, BAD5, 6985,
;   69DF, 69D6, A2DC, 68E2, A2A6, 69A0, 69A9, A305, A3A3, A426, BDF2, 68E2,
;   937D, 9E65, 69F1, 820D, BD35, 6997, 68E2, 68E2, 68E2, 68E2, 68E2, 68E2,
;   68E2, A46D, 9129, 9129, 9387, 92F9, BBEC, BEBC, 68E2, 69FA, 9F22, 9F22,
;   9F22, 9F22, 9F22, BEBC, 69E8, 9DE3, 9D47; lo leen p01:68EE (130 bytes)
;   0x68f1..0x6973  (130 bytes)
DATA_tabla_68F1:
	defw 080e9h,069cdh,0a121h,09fb2h,069c4h,069b2h,0a086h,0a1aah	; 68f1
	defw 0a257h,0698eh,06973h,0697ch,0a2dch,09387h,0a2dch,0b985h	; 6901
	defw 069bbh,0a50fh,068e2h,0bb9bh,0bad5h,06985h,069dfh,069d6h	; 6911
	defw 0a2dch,068e2h,0a2a6h,069a0h,069a9h,0a305h,0a3a3h,0a426h	; 6921
	defw 0bdf2h,068e2h,0937dh,09e65h,069f1h,0820dh,0bd35h,06997h	; 6931
	defw 068e2h,068e2h,068e2h,068e2h,068e2h,068e2h,068e2h,0a46dh	; 6941
	defw 09129h,09129h,09387h,092f9h,0bbech,0bebch,068e2h,069fah	; 6951
	defw 09f22h,09f22h,09f22h,09f22h,09f22h,0bebch,069e8h,09de3h	; 6961
	defw 09d47h	; 6971

; ======================================================================
; CODIGO 0x6973..0x6c64  (753 bytes)
; ======================================================================


L_6973:
	call 041bbh		;6973
	call 0be86h		;6976
	jp 041d0h		;6979
L_697C:
	call 041cbh		;697c
	call 0a81ah		;697f
	jp 041d0h		;6982
L_6985:
	call 041cbh		;6985
	call 0a832h		;6988
	jp 041d0h		;698b
L_698E:
	call 041cbh		;698e
	call 0a8c6h		;6991
	jp 041d0h		;6994
L_6997:
	call 041cbh		;6997
	call 0b044h		;699a
	jp 041d0h		;699d
L_69A0:
	call 041cbh		;69a0
	call 0ab27h		;69a3
	jp 041d0h		;69a6
L_69A9:
	call 041cbh		;69a9
	call 0ab71h		;69ac
	jp 041d0h		;69af
L_69B2:
	call 041cbh		;69b2
	call 0ad06h		;69b5
	jp 041d0h		;69b8
L_69BB:
	call 041cbh		;69bb
	call 0a9c6h		;69be
	jp 041d0h		;69c1
L_69C4:
	call 041cbh		;69c4
	call 0ae84h		;69c7
	jp 041d0h		;69ca
L_69CD:
	call 041cbh		;69cd
	call 0b284h		;69d0
	jp 041d0h		;69d3
L_69D6:
	call 041cbh		;69d6
	call 0b35eh		;69d9
	jp 041d0h		;69dc
L_69DF:
	call 041cbh		;69df
	call 0b4bbh		;69e2
	jp 041d0h		;69e5
L_69E8:
	call 041cbh		;69e8
	call 0baa0h		;69eb
	jp 041d0h		;69ee
L_69F1:
	call 041cbh		;69f1
	call 0bd13h		;69f4
	jp 041d0h		;69f7
L_69FA:
	call 041bfh		;69fa
	call 0a4b5h		;69fd
	jp 041d0h		;6a00
L_6A03:
	ld a,(ix+010h)		;6a03
	and 008h		;6a06
	ret z			;6a08
	ld a,(0e627h)		;6a09
	and a			;6a0c
	ret z			;6a0d
	ld a,(ix+000h)		;6a0e
	cp 03fh		;6a11
	jr z,L_6A2E		;6a13
	ld a,(0e627h)		;6a15
	bit 7,a		;6a18
	ld a,(ix+006h)		;6a1a
	jr z,L_6A23		;6a1d
	add a,008h		;6a1f
	jr L_6A25		;6a21
L_6A23:
	sub 008h		;6a23
L_6A25:
	ld (ix+006h),a		;6a25
	ret nc			;6a28
	call L_6B62		;6a29
	scf			;6a2c
	ret			;6a2d
L_6A2E:
	ld a,(ix+019h)		;6a2e
	cp 003h		;6a31
	jr nz,L_6A48		;6a33
	ld a,(ix+021h)		;6a35
	and a			;6a38
	jr nz,L_6A48		;6a39
	ld a,(ix+006h)		;6a3b
	and a			;6a3e
	jr nz,L_6A48		;6a3f
	dec (ix+014h)		;6a41
	jp z,L_6B62		;6a44
	ret			;6a47
L_6A48:
	ld a,(0e627h)		;6a48
	bit 7,a		;6a4b
	ld l,(ix+006h)		;6a4d
	ld h,(ix+021h)		;6a50
	ld de,00008h		;6a53
	jr z,L_6A60		;6a56
	add hl,de			;6a58
	ld de,00150h		;6a59
	rst 20h			;6a5c
	ccf			;6a5d
	jr L_6A63		;6a5e
L_6A60:
	or a			;6a60
	sbc hl,de		;6a61
L_6A63:
	ld (ix+006h),l		;6a63
	ld (ix+021h),h		;6a66
	ret nc			;6a69
	call L_6B62		;6a6a
	scf			;6a6d
	ret			;6a6e
L_6A6F:
	ld a,(ix+010h)		;6a6f
	and 008h		;6a72
	ret z			;6a74
	ld a,(0e628h)		;6a75
	and a			;6a78
	ret z			;6a79
	ld a,(ix+000h)		;6a7a
	cp 03fh		;6a7d
	jr z,L_6A9F		;6a7f
	ld a,(0e628h)		;6a81
	bit 7,a		;6a84
	ld a,(ix+004h)		;6a86
	jr z,L_6A91		;6a89
	sub 008h		;6a8b
	jr c,L_6A9A		;6a8d
	jr L_6A93		;6a8f
L_6A91:
	add a,008h		;6a91
L_6A93:
	ld (ix+004h),a		;6a93
	cp 0a8h		;6a96
	ccf			;6a98
	ret nc			;6a99
L_6A9A:
	call L_6B62		;6a9a
	scf			;6a9d
	ret			;6a9e
L_6A9F:
	ld a,(ix+019h)		;6a9f
	and a			;6aa2
	jr z,L_6AD5		;6aa3
	dec a			;6aa5
	jr nz,L_6AB5		;6aa6
	ld a,(ix+013h)		;6aa8
	cp (ix+022h)		;6aab
	jr z,L_6AB5		;6aae
	inc (ix+013h)		;6ab0
	or a			;6ab3
	ret			;6ab4
L_6AB5:
	ld a,(0e628h)		;6ab5
	bit 7,a		;6ab8
	ld l,(ix+004h)		;6aba
	ld h,(ix+020h)		;6abd
	ld de,00008h		;6ac0
	jr z,L_6AC8		;6ac3
	ld de,0fff8h		;6ac5
L_6AC8:
	add hl,de			;6ac8
	ld (ix+004h),l		;6ac9
	ld (ix+020h),h		;6acc
	ld a,l			;6acf
	cp 0a8h		;6ad0
	ret nz			;6ad2
	jr L_6A9A		;6ad3
L_6AD5:
	ld l,(ix+004h)		;6ad5
	ld h,(ix+020h)		;6ad8
	ld a,h			;6adb
	and a			;6adc
	jr nz,L_6AB5		;6add
	ld a,l			;6adf
	cp 0a8h		;6ae0
	jr c,L_6AB5		;6ae2
	dec (ix+013h)		;6ae4
	jp z,L_6B62		;6ae7
	ret			;6aea
L_6AEB:
	bit 2,(ix+010h)		;6aeb
	jr z,L_6AFA		;6aef
	call L_6B01		;6af1
	ret c			;6af4
L_6AF5:
	call L_6B62		;6af5
	or a			;6af8
	ret			;6af9
L_6AFA:
	call L_6B13		;6afa
	ret c			;6afd
	jp L_6AF5		;6afe
L_6B01:
	push ix		;6b01
	pop hl			;6b03
	inc l			;6b04
	inc l			;6b05
	inc l			;6b06
	ld d,h			;6b07
	ld e,l			;6b08
	inc e			;6b09
	inc e			;6b0a
	inc e			;6b0b
	inc e			;6b0c
	call L_6B57		;6b0d
	call L_6B57		;6b10
L_6B13:
	ld a,(ix+000h)		;6b13
	ld c,0b0h		;6b16
	cp 039h		;6b18
	jr z,L_6B39		;6b1a
	ld c,0a8h		;6b1c
	cp 03fh		;6b1e
	jr nz,L_6B39		;6b20
	ld a,(ix+020h)		;6b22
	and a			;6b25
	jr nz,L_6B2D		;6b26
	ld a,(ix+004h)		;6b28
	cp c			;6b2b
	ret nc			;6b2c
L_6B2D:
	ld a,(ix+021h)		;6b2d
	and a			;6b30
	scf			;6b31
	ret nz			;6b32
	ld a,(ix+006h)		;6b33
	cp 0f9h		;6b36
	ret			;6b38
L_6B39:
	ld a,(ix+004h)		;6b39
	cp c			;6b3c
	ret nc			;6b3d
	ld a,(ix+000h)		;6b3e
	cp 00ah		;6b41
	jr z,L_6B4B		;6b43
	ld a,(ix+006h)		;6b45
	cp 0f9h		;6b48
	ret			;6b4a
L_6B4B:
	bit 7,(ix+00ah)		;6b4b
	scf			;6b4f
	ret nz			;6b50
	ld a,(ix+006h)		;6b51
	cp 0f8h		;6b54
	ret			;6b56
L_6B57:
	ld a,(de)			;6b57
	add a,(hl)			;6b58
	ld (hl),a			;6b59
	inc l			;6b5a
	inc e			;6b5b
	ld a,(de)			;6b5c
	adc a,(hl)			;6b5d
	ld (hl),a			;6b5e
	inc l			;6b5f
	inc e			;6b60
	ret			;6b61
L_6B62:
	ld hl,0e652h		;6b62
	dec (hl)			;6b65
	ld l,(ix+000h)		;6b66
	ld h,000h		;6b69
	ld e,l			;6b6b
	ld d,h			;6b6c
	add hl,hl			;6b6d
	add hl,hl			;6b6e
	add hl,hl			;6b6f
	or a			;6b70
	sbc hl,de		;6b71
	ld de,06c5dh		;6b73
	add hl,de			;6b76
	ld a,(hl)			;6b77
	bit 6,a		;6b78
	jr nz,L_6B85		;6b7a
	and 03fh		;6b7c
	ld hl,0e655h		;6b7e
	sub (hl)			;6b81
	neg		;6b82
	ld (hl),a			;6b84
L_6B85:
	call L_6BA5		;6b85
	xor a			;6b88
	ld (ix+000h),a		;6b89
	ld (ix+00bh),a		;6b8c
	ld (ix+010h),a		;6b8f
	bit 0,(ix+016h)		;6b92
	ret z			;6b96
	ld a,(ix+017h)		;6b97
	call 08d05h		;6b9a
	ret c			;6b9d
	inc l			;6b9e
	dec (hl)			;6b9f
	ret nz			;6ba0
	dec l			;6ba1
	ld (hl),000h		;6ba2
	ret			;6ba4
L_6BA5:
	ld a,(ix+000h)		;6ba5
	cp 004h		;6ba8
	jr z,L_6BB4		;6baa
	cp 023h		;6bac
	ret nz			;6bae
	xor a			;6baf
	ld (0e689h),a		;6bb0
	ret			;6bb3
L_6BB4:
	ld a,(ix+019h)		;6bb4
	or a			;6bb7
	ret nz			;6bb8
	xor a			;6bb9
	ld (0e664h),a		;6bba
	ret			;6bbd
L_6BBE:
	call 04e58h		;6bbe
	and 00fh		;6bc1
	add a,014h		;6bc3
	ld hl,0e64fh		;6bc5
	sub (hl)			;6bc8
	ld (ix+002h),a		;6bc9
	ret			;6bcc
L_6BCD:
	xor a			;6bcd
	ld (ix+024h),a		;6bce
	ld (ix+026h),a		;6bd1
	ret			;6bd4
L_6BD5:
	inc (ix+024h)		;6bd5
	ld a,(ix+024h)		;6bd8
	and 003h		;6bdb
	ret nz			;6bdd
	inc (ix+026h)		;6bde
	ld a,(ix+026h)		;6be1
	cp 006h		;6be4
	jr nz,L_6BEC		;6be6
	xor a			;6be8
	ld (ix+026h),a		;6be9
L_6BEC:
	call 05ad8h		;6bec
	ld (ix+030h),a		;6bef
	ret			;6bf2
L_6BF3:
	ld l,(ix+007h)		;6bf3
	ld h,(ix+008h)		;6bf6
	add hl,bc			;6bf9
	ld (ix+007h),l		;6bfa
	ld (ix+008h),h		;6bfd
	ret			;6c00
L_6C01:
	ld l,(ix+009h)		;6c01
	ld h,(ix+00ah)		;6c04
	add hl,bc			;6c07
	ld (ix+009h),l		;6c08
	ld (ix+00ah),h		;6c0b
	ret			;6c0e
L_6C0F:
	call L_65AB		;6c0f
	and 00fh		;6c12
	ld (ix+026h),010h		;6c14
	ld (ix+025h),a		;6c18
	ld c,a			;6c1b
	ld a,(0e64fh)		;6c1c
	ld b,001h		;6c1f
	cp 006h		;6c21
	jr c,L_6C26		;6c23
	inc b			;6c25
L_6C26:
	ld a,c			;6c26
	call 04f1eh		;6c27
	jp L_6881		;6c2a
L_6C2D:
	ld e,(hl)			;6c2d
	inc hl			;6c2e
	ld d,(hl)			;6c2f
	call L_685D		;6c30
	inc hl			;6c33
	ld e,(hl)			;6c34
	inc hl			;6c35
	ld d,(hl)			;6c36
	bit 0,b		;6c37
	call nz,05adfh		;6c39
	jp L_6856		;6c3c
L_6C3F:
	ld a,(ix+004h)		;6c3f
	add a,010h		;6c42
	ld (ix+034h),a		;6c44
	ld (ix+038h),a		;6c47
	ld a,(ix+006h)		;6c4a
	add a,008h		;6c4d
	jr nc,L_6C55		;6c4f
	ld (ix+034h),0e0h		;6c51
L_6C55:
	ld (ix+035h),a		;6c55
	sub 010h		;6c58
	jr nc,L_6C60		;6c5a
	ld (ix+038h),0e0h		;6c5c
L_6C60:
	ld (ix+039h),a		;6c60
	ret			;6c63

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c64..0x6e2b  (455 bytes)
DATA_6C64:
	defb 0c0h,001h,010h,010h,0b0h,015h,000h,081h,001h,010h,010h,060h,00ah,000h,0c0h,008h	; 6c64  ...........`....
	defb 010h,010h,000h,040h,000h,081h,001h,010h,010h,0a0h,006h,000h,081h,001h,010h,010h	; 6c74  ...@............
	defb 0d0h,01ah,000h,081h,001h,010h,010h,050h,005h,000h,081h,001h,010h,010h,0c0h,007h	; 6c84  .......P........
	defb 000h,081h,001h,010h,010h,0b0h,008h,000h,081h,001h,010h,010h,0c0h,007h,000h,0c0h	; 6c94  ................
	defb 001h,010h,010h,000h,000h,004h,0c0h,001h,010h,010h,000h,000h,005h,0c0h,0ffh,020h	; 6ca4  ...............
	defb 020h,000h,020h,006h,081h,0ffh,010h,010h,080h,01eh,000h,081h,001h,010h,010h,050h	; 6cb4   . ............P
	defb 003h,000h,081h,0ffh,010h,010h,080h,017h,000h,081h,001h,010h,010h,0b0h,002h,000h	; 6cc4  ................
	defb 081h,001h,010h,010h,084h,007h,000h,081h,001h,010h,010h,084h,009h,000h,081h,0ffh	; 6cd4  ................
	defb 000h,000h,000h,007h,000h,0c0h,0ffh,008h,010h,000h,000h,008h,0c0h,010h,020h,018h	; 6ce4  .............. .
	defb 000h,020h,007h,083h,0ffh,020h,010h,0c8h,00eh,000h,081h,001h,010h,010h,094h,007h	; 6cf4  . ... ..........
	defb 000h,081h,001h,010h,010h,0a0h,007h,000h,081h,0ffh,010h,010h,080h,00eh,000h,081h	; 6d04  ................
	defb 001h,010h,010h,090h,00eh,000h,0c0h,00eh,020h,020h,000h,020h,021h,081h,001h,010h	; 6d14  ........  . !...
	defb 010h,0a8h,013h,000h,081h,001h,010h,010h,0a8h,013h,000h,081h,001h,010h,010h,070h	; 6d24  ...............p
	defb 004h,000h,081h,001h,010h,010h,06ch,008h,000h,0c0h,0ffh,010h,020h,000h,000h,022h	; 6d34  ......l..... .."
	defb 0c0h,008h,010h,010h,000h,000h,01eh,081h,001h,010h,010h,050h,00ah,000h,081h,001h	; 6d44  ...........P....
	defb 010h,010h,09ch,00fh,000h,082h,0ffh,00eh,00eh,0c8h,00fh,000h,081h,001h,010h,010h	; 6d54  ................
	defb 064h,00ah,000h,081h,000h,010h,010h,030h,00fh,000h,081h,0ffh,004h,004h,02ch,009h	; 6d64  d......0......,.
	defb 000h,081h,001h,010h,010h,0d0h,01ah,000h,0c0h,001h,010h,010h,000h,000h,00ah,0c0h	; 6d74  ................
	defb 001h,010h,010h,000h,000h,023h,081h,001h,010h,010h,000h,002h,037h,081h,001h,010h	; 6d84  .....#......7...
	defb 010h,000h,008h,038h,081h,001h,010h,010h,000h,008h,038h,081h,001h,010h,010h,000h	; 6d94  ...8......8.....
	defb 000h,000h,081h,001h,010h,010h,000h,000h,006h,081h,001h,010h,010h,0b4h,004h,000h	; 6da4  ................
	defb 0c0h,0ffh,005h,010h,000h,000h,005h,0c0h,0ffh,005h,010h,000h,000h,005h,081h,001h	; 6db4  ................
	defb 010h,010h,050h,00ah,000h,081h,001h,010h,010h,090h,03fh,000h,0c0h,001h,010h,010h	; 6dc4  ..P.......?.....
	defb 000h,000h,037h,0c0h,0ffh,008h,008h,000h,000h,000h,081h,0ffh,010h,010h,068h,00bh	; 6dd4  ..7...........h.
	defb 000h,084h,0ffh,008h,010h,0a0h,002h,000h,0c0h,0ffh,002h,008h,000h,000h,000h,0c0h	; 6de4  ................
	defb 0ffh,010h,008h,000h,000h,000h,0c0h,0ffh,008h,008h,000h,000h,000h,0c0h,0ffh,00ah	; 6df4  ................
	defb 008h,000h,000h,000h,0c0h,0ffh,012h,008h,000h,000h,000h,0c0h,0ffh,008h,008h,000h	; 6e04  ................
	defb 000h,000h,0c0h,0ffh,008h,008h,000h,000h,024h,0c0h,0ffh,010h,008h,000h,000h,042h	; 6e14  ........$......B
	defb 081h,008h,010h,010h,058h,00ch,000h	; 6e24

; ======================================================================
; CODIGO 0x6e2b..0x6e89  (94 bytes)
; ======================================================================


L_6E2B:
	ld a,(0e301h)		;6e2b
	cp 007h		;6e2e
	jr z,L_6E44		;6e30
	call 041d8h		;6e32
	ld a,(0e658h)		;6e35
	ld hl,084bah		;6e38
	call 04e66h		;6e3b
	push af			;6e3e
	call 041d0h		;6e3f
	pop af			;6e42
	ret			;6e43
L_6E44:
	di			;6e44
	ld a,0c9h		;6e45
	ld (0fd9ah),a		;6e47
	ld a,(0f0f4h)		;6e4a
	ld h,080h		;6e4d
	call 00024h		;6e4f   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,00eh		;6e52
	ld (09000h),a		;6e54
	ld a,(0e658h)		;6e57
	ld de,0956ch		;6e5a
	call 04e6eh		;6e5d
	push af			;6e60
	push bc			;6e61
	ld a,(0f0f6h)		;6e62
	ld h,080h		;6e65
	call 00024h		;6e67   ; BIOS ENASLT - Switches to specified slot and page definitively
	call 041d0h		;6e6a
	ld a,0c3h		;6e6d
	ld (0fd9ah),a		;6e6f
	pop bc			;6e72
	pop af			;6e73
	ei			;6e74
	ret			;6e75
L_6E76:
	ld a,(0e640h)		;6e76
	dec a			;6e79
	ret m			;6e7a
	ld c,a			;6e7b
	call 041bfh		;6e7c
	ld a,c			;6e7f
	call L_6E86		;6e80
	jp 041d0h		;6e83
L_6E86:
	call 040ceh		;6e86

; ----------------------------------------------------------------------
; DATOS tabla_6E89: 8 destinos del despachador p00:40CE (call en p01:6E86, el
;   indice en A): A870, A68D, ACC8, AB03, B154, AEB4, AE9C, B405; lo leen
;   p01:6E86 (16 bytes)
;   0x6e89..0x6e99  (16 bytes)
DATA_tabla_6E89:
	defw 0a870h,0a68dh,0acc8h,0ab03h,0b154h,0aeb4h,0ae9ch,0b405h	; 6e89

; ======================================================================
; CODIGO 0x6e99..0x6f1d  (132 bytes)
; ======================================================================


L_6E99:
	call 08031h		;6e99
	call L_7088		;6e9c
	ld a,(0e6beh)		;6e9f
	or a			;6ea2
	call nz,L_71AF		;6ea3
	call L_6EC5		;6ea6
	ret nz			;6ea9
	call L_6F33		;6eaa
	ld a,(0e690h)		;6ead
	and a			;6eb0
	ret nz			;6eb1
	ld a,(0e653h)		;6eb2
	and a			;6eb5
	jr z,L_6ED7		;6eb6
	ld hl,0e652h		;6eb8
	ld a,00bh		;6ebb
	sub (hl)			;6ebd
	ld hl,0e692h		;6ebe
	cp (hl)			;6ec1
	ret c			;6ec2
	jr L_6ED7		;6ec3
L_6EC5:
	ld hl,0e654h		;6ec5
	ld a,(hl)			;6ec8
	and a			;6ec9
	jr z,L_6ED0		;6eca
	dec (hl)			;6ecc
	or 0ffh		;6ecd
	ret			;6ecf
L_6ED0:
	ld a,(0e640h)		;6ed0
	and a			;6ed3
	ret nz			;6ed4
	xor a			;6ed5
	ret			;6ed6
L_6ED7:
	call 041d8h		;6ed7
	ld a,(0e301h)		;6eda
	ld de,08550h		;6edd
	call 04e21h		;6ee0
	ld hl,(0e302h)		;6ee3
	ld a,l			;6ee6
	rr h		;6ee7
	rra			;6ee9
	rr h		;6eea
	rra			;6eec
	rra			;6eed
	rra			;6eee
	rra			;6eef
	and 01fh		;6ef0
	call 040c9h		;6ef2
	ld a,(de)			;6ef5
	push af			;6ef6
	rra			;6ef7
	rra			;6ef8
	rra			;6ef9
	rra			;6efa
	and 00fh		;6efb
	push af			;6efd
	call 041d0h		;6efe
	pop af			;6f01
	call L_6F18		;6f02
	pop bc			;6f05
	ld a,(0e64fh)		;6f06
	cp 00ah		;6f09
	jp c,041d0h		;6f0b
	ld a,b			;6f0e
	pop af			;6f0f
	and 00fh		;6f10
	call L_6F18		;6f12
	jp 041d0h		;6f15
L_6F18:
	dec a			;6f18
	ret m			;6f19
	call 040ceh		;6f1a

; ----------------------------------------------------------------------
; DATOS tabla_6F1D: 11 destinos del despachador p00:40CE (call en p01:6F1A, el
;   indice en A): 7169, 71AF, 735B, 72EE, 71C6, 7307, 72BB, 73C7, 724B, 71BF,
;   7245; lo leen p01:6F1A (22 bytes)
;   0x6f1d..0x6f33  (22 bytes)
DATA_tabla_6F1D:
	defw 07169h,071afh,0735bh,072eeh,071c6h,07307h,072bbh,073c7h	; 6f1d
	defw 0724bh,071bfh,07245h	; 6f2d  -> L_724B L_71BF L_7245

; ======================================================================
; CODIGO 0x6f33..0x6ff8  (197 bytes)
; ======================================================================


L_6F33:
	ld a,(0e301h)		;6f33
	cp 007h		;6f36
	ret z			;6f38
	ld hl,0e690h		;6f39
	ld a,(hl)			;6f3c
	and a			;6f3d
	jr z,L_6FA2		;6f3e
	dec a			;6f40
	jr z,L_6F9A		;6f41
	inc l			;6f43
	dec (hl)			;6f44
	ret nz			;6f45
	ld a,(0e693h)		;6f46
	ld b,008h		;6f49
	cp 00bh		;6f4b
	jr z,L_6F57		;6f4d
	cp 00ah		;6f4f
	ld b,004h		;6f51
	jr z,L_6F57		;6f53
	ld b,006h		;6f55
L_6F57:
	ld (hl),b			;6f57
	inc l			;6f58
	dec (hl)			;6f59
	jr nz,L_6F60		;6f5a
	dec l			;6f5c
	dec l			;6f5d
	ld (hl),000h		;6f5e
L_6F60:
	ld hl,0e67eh		;6f60
	inc (hl)			;6f63
	ld b,(hl)			;6f64
	ld a,(0e620h)		;6f65
	or a			;6f68
	jr z,L_6F7A		;6f69
	ld a,(0e693h)		;6f6b
	cp 00bh		;6f6e
	jr z,L_6F7A		;6f70
	ld a,(0e695h)		;6f72
	ld d,a			;6f75
	ld e,000h		;6f76
	jr L_6F80		;6f78
L_6F7A:
	ld a,(0e695h)		;6f7a
	ld e,a			;6f7d
	ld d,0f8h		;6f7e
L_6F80:
	ld a,(0e693h)		;6f80
	ld c,000h		;6f83
	call L_65BD		;6f85
	ld a,(0e653h)		;6f88
	and a			;6f8b
	ret nz			;6f8c
	ld hl,0e67eh		;6f8d
	dec (hl)			;6f90
	ld hl,0e692h		;6f91
	inc (hl)			;6f94
	dec l			;6f95
	dec l			;6f96
	ld (hl),001h		;6f97
	ret			;6f99
L_6F9A:
	ld a,(0e652h)		;6f9a
	cp 007h		;6f9d
	ret nc			;6f9f
	inc (hl)			;6fa0
	ret			;6fa1
L_6FA2:
	ld a,(0e627h)		;6fa2
	and a			;6fa5
	jr nz,L_6FAD		;6fa6
	ld a,(0e628h)		;6fa8
	and a			;6fab
	ret z			;6fac
L_6FAD:
	ld hl,07006h		;6fad
	ld a,(0e301h)		;6fb0
	call 040c4h		;6fb3
	ld d,000h		;6fb6
	ld e,(hl)			;6fb8
	ld hl,(0e302h)		;6fb9
	rst 20h			;6fbc
	ret nc			;6fbd
	ld a,l			;6fbe
	and 007h		;6fbf
	ret nz			;6fc1
	ld hl,00101h		;6fc2
	ld (0e690h),hl		;6fc5
	ld hl,0e696h		;6fc8
	ld a,(hl)			;6fcb
	inc a			;6fcc
	jr nz,L_6FD0		;6fcd
	inc a			;6fcf
L_6FD0:
	ld (hl),a			;6fd0
	ld a,(0e301h)		;6fd1
	ld hl,0704dh		;6fd4
	call 05ad8h		;6fd7
	ld (0e693h),a		;6fda
	call L_701A		;6fdd
	ld (0e695h),a		;6fe0
	ld a,006h		;6fe3
	ld (0e692h),a		;6fe5
	ld a,0ffh		;6fe8
	ld (0e67eh),a		;6fea
	xor a			;6fed
	call 08d05h		;6fee
	jr nc,$+29		;6ff1
	xor a			;6ff3
	ld (0e690h),a		;6ff4
	ret			;6ff7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6ff8..0x700e  (22 bytes)
DATA_6FF8:
	defb 02ah,002h,0e3h,011h,040h,000h,0e7h,03eh,00ah,038h,0d7h,03eh,00bh,018h,0d3h,080h	; 6ff8  *...@..>.8.>....
	defb 048h,048h,080h,080h,000h,000h	; 7008

; ======================================================================
; CODIGO 0x700e..0x704e  (64 bytes)
; ======================================================================


L_700E:
	ld a,(0e696h)		;700e
	ld (hl),a			;7011
	inc l			;7012
	ld a,(0e692h)		;7013
	ld (hl),a			;7016
	inc l			;7017
	ld (hl),a			;7018
	ret			;7019
L_701A:
	ld hl,0e663h		;701a
	inc (hl)			;701d
	ld a,(0e693h)		;701e
	cp 00bh		;7021
	jr z,L_7032		;7023
	cp 00ah		;7025
	jr z,L_703B		;7027
	ld a,(hl)			;7029
	and 001h		;702a
	ld a,030h		;702c
	ret z			;702e
	xor 040h		;702f
	ret			;7031
L_7032:
	ld a,(hl)			;7032
	and 001h		;7033
	ld a,020h		;7035
	ret z			;7037
	ld a,080h		;7038
	ret			;703a
L_703B:
	ld a,(hl)			;703b
	and 001h		;703c
	ld hl,01848h		;703e
	jr z,L_7046		;7041
	ld hl,088b0h		;7043
L_7046:
	ld a,(0e620h)		;7046
	or a			;7049
	ld a,h			;704a
	ret z			;704b
	ld a,l			;704c
	ret			;704d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x704e..0x7059  (11 bytes)
DATA_704E:
	defb 00ah,00ah,00ah,00bh,00bh,00bh,000h,00eh,007h,018h,006h	; 704e  ...........

; ======================================================================
; CODIGO 0x7059..0x707c  (35 bytes)
; ======================================================================


L_7059:
	ld c,002h		;7059
	jr L_705F		;705b
L_705D:
	ld c,003h		;705d
L_705F:
	ld hl,0e656h		;705f
	ld a,(hl)			;7062
	inc (hl)			;7063
	and c			;7064
	ld c,000h		;7065
	ret nz			;7067
	inc c			;7068
	ret			;7069
L_706A:
	ld hl,0e302h		;706a
	ld (0f008h),hl		;706d
L_7070:
	call L_70B1		;7070
	jr z,L_7070		;7073
	ret c			;7075
	ld hl,0e67ch		;7076
	inc (hl)			;7079
	jr L_7070		;707a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x707c..0x7088  (12 bytes)
DATA_707C:
	defb 0cdh,01fh,071h,028h,0fbh,0d8h,021h,077h,0e6h,034h,018h,0f4h	; 707c  ..q(..!w.4..

; ======================================================================
; CODIGO 0x7088..0x7135  (173 bytes)
; ======================================================================


L_7088:
	ld a,(0e610h)		;7088
	and a			;708b
	jr nz,L_70FC		;708c
	ld hl,0e302h		;708e
	ld (0f008h),hl		;7091
	ld a,(0e627h)		;7094
	and a			;7097
	jr nz,L_709F		;7098
	ld a,(0e628h)		;709a
	and a			;709d
	ret z			;709e
L_709F:
	ld a,(0e620h)		;709f
	and a			;70a2
	ld a,0f8h		;70a3
	jr z,L_70A8		;70a5
	xor a			;70a7
L_70A8:
	ld (0f004h),a		;70a8
L_70AB:
	call L_70B1		;70ab
	jr z,L_70AB		;70ae
	ret			;70b0
L_70B1:
	call 041d8h		;70b1
	ld a,(0e67ch)		;70b4
	ld hl,085d1h		;70b7
	call L_7139		;70ba
	jp nz,041d0h		;70bd
	ld hl,0e67ch		;70c0
	inc (hl)			;70c3
L_70C4:
	ld e,b			;70c4
	srl a		;70c5
	srl a		;70c7
	ld b,a			;70c9
	ld a,(0f004h)		;70ca
	ld d,a			;70cd
	ld a,(0e610h)		;70ce
	and a			;70d1
	jr z,L_70DA		;70d2
	cp 003h		;70d4
	jr c,L_70E0		;70d6
	jr L_70E3		;70d8
L_70DA:
	ld a,(0e620h)		;70da
	and a			;70dd
	jr z,L_70E3		;70de
L_70E0:
	ld a,e			;70e0
	ld e,d			;70e1
	ld d,a			;70e2
L_70E3:
	ld a,c			;70e3
	ld l,a			;70e4
	and 03fh		;70e5
	cp c			;70e7
	ld c,000h		;70e8
	jr z,L_70F2		;70ea
	inc c			;70ec
	rl l		;70ed
	jr nc,L_70F2		;70ef
	inc c			;70f1
L_70F2:
	push af			;70f2
	call 041d0h		;70f3
	pop af			;70f6
	call L_65BD		;70f7
	xor a			;70fa
	ret			;70fb
L_70FC:
	ld hl,0e612h		;70fc
	ld (0f008h),hl		;70ff
	ld a,(0e627h)		;7102
	and a			;7105
	jr nz,L_710D		;7106
	ld a,(0e628h)		;7108
	and a			;710b
	ret z			;710c
L_710D:
	ld a,(0e610h)		;710d
	ld hl,07134h		;7110
	call 05ad8h		;7113
	ld (0f004h),a		;7116
L_7119:
	call L_711F		;7119
	jr z,L_7119		;711c
	ret			;711e
L_711F:
	call 041d8h		;711f
	ld a,(0e677h)		;7122
	ld hl,085dfh		;7125
	call L_7139		;7128
	jp nz,041d0h		;712b
	ld hl,0e677h		;712e
	inc (hl)			;7131
	jp L_70C4		;7132

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7135..0x7139  (4 bytes)
DATA_7135:
	defb 0a0h,000h,000h,0f8h	; 7135

; ======================================================================
; CODIGO 0x7139..0x71a7  (110 bytes)
; ======================================================================


L_7139:
	push af			;7139
	ld a,(0e301h)		;713a
	call 04e28h		;713d
	pop af			;7140
	add a,a			;7141
	add a,a			;7142
	call 040c9h		;7143
	ex de,hl			;7146
	ld e,(hl)			;7147
	inc hl			;7148
	ld a,(hl)			;7149
	cp e			;714a
	jr nz,L_7154		;714b
	cp 0ffh		;714d
	jr nz,L_7154		;714f
	or a			;7151
	scf			;7152
	ret			;7153
L_7154:
	and 003h		;7154
	ld d,a			;7156
	ld a,(hl)			;7157
	inc hl			;7158
	ld c,(hl)			;7159
	inc hl			;715a
	ld b,(hl)			;715b
	ld hl,(0f008h)		;715c
	push af			;715f
	ld a,(hl)			;7160
	inc hl			;7161
	ld h,(hl)			;7162
	ld l,a			;7163
	pop af			;7164
	and a			;7165
	sbc hl,de		;7166
	ret			;7168
L_7169:
	ld hl,0e673h		;7169
	ld a,(hl)			;716c
	and a			;716d
	jr nz,L_7177		;716e
	ld (hl),004h		;7170
	inc l			;7172
	ld c,030h		;7173
	jr L_719E		;7175
L_7177:
	inc l			;7177
	dec (hl)			;7178
	ret nz			;7179
	ld (hl),005h		;717a
	dec l			;717c
	dec (hl)			;717d
	ld a,(hl)			;717e
	xor 003h		;717f
	ld b,a			;7181
	jr nz,L_7189		;7182
	ld a,(0e664h)		;7184
	or a			;7187
	ret nz			;7188
L_7189:
	ld e,000h		;7189
	ld a,r		;718b
	xor (hl)			;718d
	and 007h		;718e
	ld hl,071a7h		;7190
	call 040c4h		;7193
	ld d,(hl)			;7196
	ld c,000h		;7197
	ld a,004h		;7199
	jp L_65BD		;719b
L_719E:
	ld a,(0e64fh)		;719e
	add a,a			;71a1
	sub c			;71a2
	neg		;71a3
	ld (hl),a			;71a5
	ret			;71a6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x71a7..0x71af  (8 bytes)
DATA_71A7:
	defb 030h,0e0h,060h,0a0h,080h,050h,040h,0c0h	; 71a7  0.`..P@.

; ======================================================================
; CODIGO 0x71af..0x7235  (134 bytes)
; ======================================================================


L_71AF:
	ld a,(0e301h)		;71af
	cp 007h		;71b2
	ld a,028h		;71b4
	jr z,L_71BA		;71b6
	ld a,005h		;71b8
L_71BA:
	ld (0f000h),a		;71ba
	jr L_71CB		;71bd
L_71BF:
	ld a,006h		;71bf
	ld (0f000h),a		;71c1
	jr L_71CB		;71c4
L_71C6:
	ld a,017h		;71c6
	ld (0f000h),a		;71c8
L_71CB:
	ld hl,0e66fh		;71cb
	ld a,(hl)			;71ce
	and a			;71cf
	jr z,L_722F		;71d0
	inc l			;71d2
	dec (hl)			;71d3
	ret nz			;71d4
	ld a,(0e64fh)		;71d5
	add a,a			;71d8
	sub 041h		;71d9
	neg		;71db
	ld (hl),a			;71dd
	dec l			;71de
	dec (hl)			;71df
	ld a,(hl)			;71e0
	and 007h		;71e1
	ld b,a			;71e3
	ld hl,0723dh		;71e4
	ld a,(0e620h)		;71e7
	rra			;71ea
	jr c,L_71F0		;71eb
	ld hl,07235h		;71ed
L_71F0:
	ld a,b			;71f0
	call 05ad8h		;71f1
	ld e,a			;71f4
	ld d,000h		;71f5
	call L_705D		;71f7
	ld a,(0f000h)		;71fa
	cp 005h		;71fd
	jr z,L_722C		;71ff
	cp 028h		;7201
	jr z,L_722C		;7203
	cp 006h		;7205
	jr nz,L_721F		;7207
	ld a,(0e301h)		;7209
	cp 004h		;720c
	jr nz,L_721F		;720e
	ld hl,0e303h		;7210
	ld a,(hl)			;7213
	dec a			;7214
	jr z,L_721F		;7215
	dec hl			;7217
	ld a,(hl)			;7218
	cp 0e1h		;7219
	jr nc,L_721F		;721b
	ld e,080h		;721d
L_721F:
	ld a,(0e203h)		;721f
	and 001h		;7222
	ld b,a			;7224
	ld a,(0f000h)		;7225
	jr z,L_722C		;7228
	ld d,0f8h		;722a
L_722C:
	jp L_65BD		;722c
L_722F:
	ld (hl),008h		;722f
	inc l			;7231
	ld (hl),001h		;7232
	ret			;7234

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7235..0x7245  (16 bytes)
DATA_7235:
	defb 020h,080h,020h,020h,080h,020h,080h,080h,020h,0d8h,020h,020h,0d8h,020h,0d8h,0d8h	; 7235   .  . .. .  . ..

; ======================================================================
; CODIGO 0x7245..0x72b3  (110 bytes)
; ======================================================================


L_7245:
	ld b,008h		;7245
	ld a,00dh		;7247
	jr L_724F		;7249
L_724B:
	ld b,004h		;724b
	ld a,019h		;724d
L_724F:
	ld (0f000h),a		;724f
	ld hl,0e668h		;7252
	dec (hl)			;7255
	ret p			;7256
	ld hl,0e68eh		;7257
	inc (hl)			;725a
	ld a,(hl)			;725b
	and 007h		;725c
	ld hl,072b3h		;725e
	call 05ad8h		;7261
	add a,b			;7264
	ld hl,0e668h		;7265
	ld (hl),a			;7268
	cp 018h		;7269
	jr c,L_7274		;726b
	ld a,(0e64fh)		;726d
	sub (hl)			;7270
	neg		;7271
	ld (hl),a			;7273
L_7274:
	ld a,r		;7274
	and 078h		;7276
	call L_7286		;7278
	ld e,000h		;727b
	ld bc,00000h		;727d
	ld a,(0f000h)		;7280
	jp L_65BD		;7283
L_7286:
	ld c,a			;7286
	ld a,(0f000h)		;7287
	cp 00dh		;728a
	jr z,L_7295		;728c
	ld a,(0e301h)		;728e
	cp 003h		;7291
	jr z,L_729A		;7293
L_7295:
	ld a,c			;7295
	add a,038h		;7296
	ld d,a			;7298
	ret			;7299
L_729A:
	ld hl,(0e302h)		;729a
	ld de,00170h		;729d
	ld b,070h		;72a0
	rst 20h			;72a2
	ld e,060h		;72a3
	jr c,L_72AB		;72a5
	ld b,018h		;72a7
	ld e,058h		;72a9
L_72AB:
	ld a,c			;72ab
	cp e			;72ac
	jr c,L_72B0		;72ad
	sub e			;72af
L_72B0:
	add a,b			;72b0
	ld d,a			;72b1
	ret			;72b2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x72b3..0x72bb  (8 bytes)
DATA_72B3:
	defb 003h,004h,020h,002h,004h,005h,003h,004h	; 72b3  .. .....

; ======================================================================
; CODIGO 0x72bb..0x73bb  (256 bytes)
; ======================================================================


L_72BB:
	ld hl,0e675h		;72bb
	dec (hl)			;72be
	ret p			;72bf
	ld (hl),002h		;72c0
	inc hl			;72c2
	ld a,(hl)			;72c3
	or a			;72c4
	jr nz,L_72CD		;72c5
	ld (hl),006h		;72c7
	dec hl			;72c9
	ld (hl),080h		;72ca
	ret			;72cc
L_72CD:
	dec (hl)			;72cd
	bit 0,(hl)		;72ce
	ld e,048h		;72d0
	jr z,L_72D6		;72d2
	ld e,060h		;72d4
L_72D6:
	ld a,(0e203h)		;72d6
	rra			;72d9
	and 001h		;72da
	ld b,a			;72dc
	ld d,0f8h		;72dd
	jr z,L_72E3		;72df
	ld d,000h		;72e1
L_72E3:
	ld hl,0e67bh		;72e3
	call L_7059		;72e6
	ld a,018h		;72e9
	jp L_65BD		;72eb
L_72EE:
	ld hl,0e678h		;72ee
	dec (hl)			;72f1
	ret p			;72f2
	ld a,(0e64fh)		;72f3
	add a,a			;72f6
	sub 030h		;72f7
	neg		;72f9
	ld (hl),a			;72fb
	ld de,0f830h		;72fc
	ld bc,00001h		;72ff
	ld a,008h		;7302
	jp L_65BD		;7304
L_7307:
	ld hl,0e686h		;7307
	dec (hl)			;730a
	ret p			;730b
	ld a,(0e64fh)		;730c
	cp 006h		;730f
	ld a,00ah		;7311
	jr c,L_7317		;7313
	ld a,006h		;7315
L_7317:
	ld (hl),a			;7317
	inc hl			;7318
	inc (hl)			;7319
	ld a,(hl)			;731a
	and 003h		;731b
	jr nz,L_7325		;731d
	dec hl			;731f
	ld c,050h		;7320
	jp L_719E		;7322
L_7325:
	and 001h		;7325
	or a			;7327
	ld bc,01008h		;7328
	jr z,L_7330		;732b
	ld bc,0d078h		;732d
L_7330:
	ld a,(0e620h)		;7330
	rra			;7333
	ld e,c			;7334
	ld d,0f8h		;7335
	jr nc,L_733C		;7337
	ld e,000h		;7339
	ld d,b			;733b
L_733C:
	ld b,003h		;733c
L_733E:
	push bc			;733e
	push de			;733f
	call L_705D		;7340
	ld a,011h		;7343
	call L_65BD		;7345
	pop de			;7348
	ld a,(0e620h)		;7349
	rra			;734c
	ld hl,01200h		;734d
	jr c,L_7355		;7350
	ld hl,00012h		;7352
L_7355:
	add hl,de			;7355
	ex de,hl			;7356
	pop bc			;7357
	djnz L_733E		;7358
	ret			;735a
L_735B:
	ld hl,0e682h		;735b
	ld a,(hl)			;735e
	and a			;735f
	jr nz,L_7388		;7360
	ld (hl),005h		;7362
	inc l			;7364
	ld a,(0e64fh)		;7365
	add a,a			;7368
	sub 040h		;7369
	neg		;736b
	ld (hl),a			;736d
	call L_65AB		;736e
	and 007h		;7371
	ld hl,0e203h		;7373
	bit 0,(hl)		;7376
	ld hl,0e660h		;7378
	jr z,L_737F		;737b
	add a,084h		;737d
L_737F:
	ld (hl),a			;737f
	ld a,(0e326h)		;7380
	rla			;7383
	ret nc			;7384
	set 6,(hl)		;7385
	ret			;7387
L_7388:
	inc l			;7388
	dec (hl)			;7389
	ret nz			;738a
	ld (hl),006h		;738b
	ld a,(0e660h)		;738d
	ld c,a			;7390
	bit 6,a		;7391
	ld b,004h		;7393
	jr nz,L_7399		;7395
	ld b,0fch		;7397
L_7399:
	bit 7,a		;7399
	dec a			;739b
	jr nz,L_73A0		;739c
	inc a			;739e
	inc a			;739f
L_73A0:
	ld (0e660h),a		;73a0
	ld a,c			;73a3
	and 00fh		;73a4
	ld hl,073bbh		;73a6
	call 05ad8h		;73a9
	ld hl,0e682h		;73ac
	dec (hl)			;73af
	ld e,000h		;73b0
	ld d,a			;73b2
	call L_7059		;73b3
	ld a,009h		;73b6
	jp L_65BD		;73b8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x73bb..0x73c7  (12 bytes)
DATA_73BB:
	defb 020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b0h,0c0h,0d0h	; 73bb   0@P`p......

; ======================================================================
; CODIGO 0x73c7..0x7426  (95 bytes)
; ======================================================================


L_73C7:
	ld hl,0e68ch		;73c7
	ld a,(hl)			;73ca
	dec (hl)			;73cb
	and a			;73cc
	ret nz			;73cd
	ld b,001h		;73ce
	call L_73FF		;73d0
	dec b			;73d3
	ret z			;73d4
	ld a,r		;73d5
	and 03fh		;73d7
	add a,05ah		;73d9
	ld (0e68ch),a		;73db
	ld b,008h		;73de
L_73E0:
	push bc			;73e0
	push de			;73e1
	ld a,b			;73e2
	ld hl,l7424h		;73e3
	call 04e31h		;73e6
	ld a,(de)			;73e9
	add a,l			;73ea
	ld l,a			;73eb
	inc e			;73ec
	inc e			;73ed
	ld a,(de)			;73ee
	add a,h			;73ef
	ld d,a			;73f0
	ld e,l			;73f1
	ld b,c			;73f2
	ld c,000h		;73f3
	ld a,030h		;73f5
	call L_65BD		;73f7
	pop de			;73fa
	pop bc			;73fb
	djnz L_73E0		;73fc
	ret			;73fe
L_73FF:
	ld a,(0e227h)		;73ff
	cp 002h		;7402
	jr nz,L_7413		;7404
	ld hl,0e68dh		;7406
	ld a,(hl)			;7409
	inc (hl)			;740a
	ld de,0e3a6h		;740b
	ld c,001h		;740e
	rra			;7410
	jr c,L_7418		;7411
L_7413:
	ld de,0e326h		;7413
	ld c,000h		;7416
L_7418:
	ld a,(de)			;7418
	sub 030h		;7419
	cp 090h		;741b
	ret nc			;741d
	dec e			;741e
	dec e			;741f
	ld a,(de)			;7420
	cp 0a0h		;7421
	ret z			;7423
L_7424:
	dec b			;7424
	ret			;7425

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7426..0x7436  (16 bytes)
DATA_7426:
	defb 0dfh,021h,021h,021h,021h,0dfh,0dfh,0dfh,0d0h,000h,000h,030h,030h,000h,000h,0d0h	; 7426  .!!!!......00...

; ======================================================================
; CODIGO 0x7436..0x752c  (246 bytes)
; ======================================================================


L_7436:
	ld a,(0e630h)		;7436
	cp 005h		;7439
	jr nz,L_7442		;743b
	ld a,(0e203h)		;743d
	rra			;7440
	ret c			;7441
L_7442:
	ld ix,0ea00h		;7442
	ld b,008h		;7446
L_7448:
	ld a,(ix+000h)		;7448
	and a			;744b
	jr z,L_746B		;744c
	cp 082h		;744e
	call z,0bd13h		;7450
	ld a,(ix+000h)		;7453
	cp 083h		;7456
	call z,0bd35h		;7458
	call L_6B01		;745b
	jr nc,L_7467		;745e
	ld a,(ix+006h)		;7460
	cp 0f8h		;7463
	jr c,L_746B		;7465
L_7467:
	ld (ix+000h),000h		;7467
L_746B:
	ld de,00010h		;746b
	add ix,de		;746e
	djnz L_7448		;7470
	ret			;7472
L_7473:
	ld ix,0ea00h		;7473
	ld b,008h		;7477
L_7479:
	ld a,(ix+000h)		;7479
	and a			;747c
	jr z,L_748C		;747d
	bit 7,a		;747f
	jr nz,L_748C		;7481
	call L_7494		;7483
	jr nc,L_748C		;7486
	ld (ix+000h),000h		;7488
L_748C:
	ld de,00010h		;748c
	add ix,de		;748f
	djnz L_7479		;7491
	ret			;7493
L_7494:
	ld l,(ix+004h)		;7494
	ld h,(ix+006h)		;7497
	call 05a99h		;749a
	ld a,(0e605h)		;749d
	cp (hl)			;74a0
	ret			;74a1
L_74A2:
	ld (0f012h),bc		;74a2
	ld (0f014h),hl		;74a6
	ld a,e			;74a9
	add a,008h		;74aa
	ld e,a			;74ac
	ld a,(0f00eh)		;74ad
	and a			;74b0
	ret nz			;74b1
	jr L_74EA		;74b2
L_74B4:
	ld hl,0e63dh		;74b4
	ld a,(0e227h)		;74b7
	cp 002h		;74ba
	ld a,000h		;74bc
	jr nz,L_74C3		;74be
	ld a,(hl)			;74c0
	xor 001h		;74c1
L_74C3:
	ld (hl),a			;74c3
	ret			;74c4
L_74C5:
	call L_74B4		;74c5
	ld a,(0e64fh)		;74c8
	add a,a			;74cb
	add a,060h		;74cc
	cp 070h		;74ce
	jr c,L_74D4		;74d0
	ld a,070h		;74d2
L_74D4:
	ld (0f00fh),a		;74d4
	ld a,e			;74d7
	add a,008h		;74d8
	ld e,a			;74da
	push de			;74db
	call L_7531		;74dc
	pop de			;74df
	ld a,(0f00eh)		;74e0
	and a			;74e3
	ret nz			;74e4
	ld a,(0e654h)		;74e5
	and a			;74e8
	ret nz			;74e9
L_74EA:
	ld hl,0ea00h		;74ea
	ld b,008h		;74ed
L_74EF:
	ld a,(hl)			;74ef
	and a			;74f0
	jr z,L_74FA		;74f1
	ld a,010h		;74f3
	add a,l			;74f5
	ld l,a			;74f6
	djnz L_74EF		;74f7
	ret			;74f9
L_74FA:
	ld a,001h		;74fa
	ld (0e607h),a		;74fc
	ld (hl),a			;74ff
	inc l			;7500
	inc l			;7501
	inc l			;7502
	xor a			;7503
	ld (hl),a			;7504
	inc l			;7505
	ld (hl),e			;7506
	inc l			;7507
	ld (hl),a			;7508
	inc l			;7509
	ld (hl),d			;750a
	inc l			;750b
	ld de,(0f012h)		;750c
	ld (hl),e			;7510
	inc l			;7511
	ld (hl),d			;7512
	ld de,(0f014h)		;7513
	inc l			;7517
	ld (hl),e			;7518
	inc l			;7519
	ld (hl),d			;751a
	inc l			;751b
	ld (hl),02ch		;751c
	inc l			;751e
	ld (hl),009h		;751f
	ret			;7521
L_7522:
	ld (0f00fh),a		;7522
	call L_7594		;7525
	ld d,001h		;7528
	jr $+12		;752a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x752c..0x752e  (2 bytes)
DATA_752C:
	defb 03eh,080h	; 752c

; ======================================================================
; CODIGO 0x752e..0x763a  (268 bytes)
; ======================================================================


L_752E:
	ld (0f00fh),a		;752e
L_7531:
	call L_7594		;7531
L_7534:
	ld d,000h		;7534
L_7536:
	ld a,(0f017h)		;7536
	ld e,a			;7539
	ld a,(0e64fh)		;753a
	cp 007h		;753d
	jr c,L_755E		;753f
	dec d			;7541
	jr z,L_755E		;7542
	ld a,r		;7544
	ld b,a			;7546
	and 00fh		;7547
	bit 6,b		;7549
	jr z,L_7556		;754b
	ld b,a			;754d
	ld a,c			;754e
	sub b			;754f
	jr nc,L_7553		;7550
	xor a			;7552
L_7553:
	ld e,a			;7553
	jr L_755E		;7554
L_7556:
	add a,e			;7556
	cp 03fh		;7557
	jr c,L_755D		;7559
	ld a,03fh		;755b
L_755D:
	ld e,a			;755d
L_755E:
	ld d,000h		;755e
	ld a,e			;7560
	sub 03fh		;7561
	neg		;7563
	ld hl,0773ah		;7565
	push hl			;7568
	add hl,de			;7569
	ld c,(hl)			;756a
	pop hl			;756b
	ld e,a			;756c
	add hl,de			;756d
	ld a,(hl)			;756e
	ld (0f016h),a		;756f
	ld e,c			;7572
	call L_7608		;7573
	ld a,(0f010h)		;7576
	and a			;7579
	call nz,05adfh		;757a
	ld (0f012h),de		;757d
	ld a,(0f016h)		;7581
	ld e,a			;7584
	call L_7608		;7585
	ld a,(0f011h)		;7588
	and a			;758b
	call nz,05adfh		;758c
	ld (0f014h),de		;758f
	ret			;7593
L_7594:
	ld a,(0e63dh)		;7594
	or a			;7597
	jr z,L_75A8		;7598
	ld a,(0e3a4h)		;759a
	ld (0f000h),a		;759d
	ld a,(0e3a6h)		;75a0
	ld (0f001h),a		;75a3
	jr L_75B4		;75a6
L_75A8:
	ld a,(0e324h)		;75a8
	ld (0f000h),a		;75ab
	ld a,(0e326h)		;75ae
	ld (0f001h),a		;75b1
L_75B4:
	ld hl,0f010h		;75b4
	ld (hl),000h		;75b7
	ld a,(0f000h)		;75b9
	sub e			;75bc
	jr nc,L_75C2		;75bd
	neg		;75bf
	inc (hl)			;75c1
L_75C2:
	inc hl			;75c2
	ld (hl),000h		;75c3
	and 0f0h		;75c5
	ld e,a			;75c7
	ld a,(0f001h)		;75c8
	sub d			;75cb
	jr nc,L_75D1		;75cc
	neg		;75ce
	inc (hl)			;75d0
L_75D1:
	ld d,a			;75d1
	ld hl,0f00eh		;75d2
	ld (hl),000h		;75d5
	add a,e			;75d7
	jr c,L_75DF		;75d8
	cp 030h		;75da
	jr nc,L_75DF		;75dc
	inc (hl)			;75de
L_75DF:
	ld a,d			;75df
	rra			;75e0
	rra			;75e1
	rra			;75e2
	rra			;75e3
	and 00fh		;75e4
	add a,e			;75e6
	ld hl,0763ah		;75e7
	call 040c4h		;75ea
	ld a,(hl)			;75ed
	ld (0f017h),a		;75ee
	ld c,a			;75f1
	ld hl,(0f010h)		;75f2
	ld a,h			;75f5
	ld b,000h		;75f6
	and a			;75f8
	jr z,L_75FD		;75f9
	ld b,080h		;75fb
L_75FD:
	cp l			;75fd
	ld a,c			;75fe
	jr z,L_7603		;75ff
	neg		;7601
L_7603:
	add a,b			;7603
	ld (0f018h),a		;7604
	ret			;7607
L_7608:
	ld a,(0f00fh)		;7608
	ld h,a			;760b
	call L_761A		;760c
	xor a			;760f
	add hl,hl			;7610
	adc a,a			;7611
	add hl,hl			;7612
	adc a,a			;7613
	add hl,hl			;7614
	adc a,a			;7615
	ld l,h			;7616
	ld h,a			;7617
	ex de,hl			;7618
	ret			;7619
L_761A:
	ld b,008h		;761a
	ld l,000h		;761c
	ld d,l			;761e
L_761F:
	add hl,hl			;761f
	jr nc,L_7623		;7620
	add hl,de			;7622
L_7623:
	djnz L_761F		;7623
	ret			;7625
L_7626:
	dec (ix+015h)		;7626
	ret nz			;7629
	ld e,(ix+004h)		;762a
	ld d,(ix+006h)		;762d
	call L_74C5		;7630
	call L_67CA		;7633
	ld (ix+015h),a		;7636
	ret			;7639

; ----------------------------------------------------------------------
; DATOS sin identificar  0x763a..0x777a  (320 bytes)
DATA_763A:
	defb 020h,00dh,008h,006h,004h,004h,003h,003h,002h,002h,002h,002h,001h,001h,001h,001h	; 763a   ...............
	defb 033h,020h,016h,010h,00dh,00bh,009h,008h,007h,006h,006h,005h,005h,004h,004h,004h	; 764a  3 ..............
	defb 038h,02ah,020h,019h,015h,011h,00fh,00dh,00ch,00ah,009h,009h,008h,007h,007h,006h	; 765a  8* .............
	defb 03ah,02fh,027h,020h,01bh,017h,014h,012h,010h,00eh,00dh,00ch,00bh,00ah,00ah,009h	; 766a  :/' ............
	defb 03bh,033h,02bh,025h,020h,01ch,019h,016h,014h,012h,010h,00fh,00eh,00dh,00ch,00bh	; 767a  .3+% ...........
	defb 03ch,035h,02eh,029h,024h,020h,01ch,01ah,017h,015h,014h,012h,011h,010h,00fh,00eh	; 768a  <5.)$ ..........
	defb 03dh,037h,031h,02ch,027h,023h,020h,01dh,01ah,018h,016h,015h,013h,012h,011h,010h	; 769a  =71,'# .........
	defb 03dh,038h,033h,02eh,02ah,026h,023h,020h,01dh,01bh,019h,017h,016h,015h,013h,012h	; 76aa  =83.*&# ........
	defb 03dh,039h,034h,030h,02ch,028h,025h,022h,020h,01eh,01ch,01ah,018h,017h,015h,014h	; 76ba  =940,(%" .......
	defb 03eh,039h,035h,031h,02eh,02ah,027h,025h,022h,020h,01eh,01ch,01ah,019h,017h,016h	; 76ca  >951.*'%" ......
	defb 03eh,03ah,036h,033h,02fh,02ch,029h,027h,024h,022h,020h,01eh,01ch,01bh,019h,018h	; 76da  >:63/,)'$" .....
	defb 03eh,03bh,037h,034h,031h,02eh,02bh,028h,026h,024h,022h,020h,01eh,01dh,01bh,01ah	; 76ea  >.741.+(&$" ....
	defb 03eh,03bh,038h,035h,032h,02fh,02ch,02ah,028h,025h,023h,022h,020h,01eh,01dh,01ch	; 76fa  >.852/,*(%#" ...
	defb 03eh,03bh,038h,036h,033h,030h,02eh,02bh,029h,027h,025h,023h,021h,020h,01eh,01dh	; 770a  >.8630.+)'%#! ..
	defb 03eh,03ch,039h,036h,034h,031h,02fh,02ch,02ah,028h,026h,025h,023h,021h,020h,01eh	; 771a  ><9641/,*(&%#! .
	defb 03fh,03ch,039h,037h,034h,032h,030h,02dh,02bh,029h,028h,026h,024h,023h,021h,020h	; 772a  ?<97420-+)(&$#!
	defb 000h,006h,00ch,012h,019h,01fh,026h,02ch,032h,038h,03eh,044h,04ah,050h,056h,05ch	; 773a  ......&,28>DJPV\
	defb 062h,068h,06dh,073h,079h,07eh,084h,089h,08eh,093h,099h,09eh,0a2h,0a7h,0ach,0b1h	; 774a  bhmsy~..........
	defb 0b5h,0b9h,0beh,0c2h,0c6h,0cah,0ceh,0d1h,0d5h,0d8h,0dch,0dfh,0e2h,0e5h,0e7h,0eah	; 775a  ................
	defb 0edh,0efh,0f1h,0f3h,0f5h,0f7h,0f8h,0fah,0fbh,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; 776a  ................

; ======================================================================
; CODIGO 0x777a..0x786d  (243 bytes)
; ======================================================================


L_777A:
	ld a,(0e620h)		;777a
	ld de,0ffd0h		;777d
	and a			;7780
	jr nz,L_7786		;7781
	ld de,00040h		;7783
L_7786:
	ld a,(0f004h)		;7786
	ld l,a			;7789
	ld h,000h		;778a
	add hl,de			;778c
	ld a,l			;778d
	ld (0f005h),a		;778e
	ld a,h			;7791
	ld (0f006h),a		;7792
	call L_77C9		;7795
	jr z,L_777A		;7798
	ret c			;779a
	ld hl,0e659h		;779b
	inc (hl)			;779e
	jr L_777A		;779f
L_77A1:
	ld a,(0e610h)		;77a1
	and a			;77a4
	jp nz,L_7905		;77a5
	ld a,(0e627h)		;77a8
	and a			;77ab
	jr nz,L_77B8		;77ac
	ld a,(0e628h)		;77ae
	or a			;77b1
	ret z			;77b2
	ld de,0ffd0h		;77b3
	jr L_77BB		;77b6
L_77B8:
	ld de,00140h		;77b8
L_77BB:
	ld a,e			;77bb
	ld (0f005h),a		;77bc
	ld a,d			;77bf
	ld (0f006h),a		;77c0
L_77C3:
	call L_77C9		;77c3
	jr z,L_77C3		;77c6
	ret			;77c8
L_77C9:
	call L_78EC		;77c9
	ret nz			;77cc
	ld hl,0e659h		;77cd
	inc (hl)			;77d0
	call L_77D6		;77d1
	xor a			;77d4
	ret			;77d5
L_77D6:
	bit 7,c		;77d6
	jr z,L_77E0		;77d8
	ld a,(0e305h)		;77da
	cp 004h		;77dd
	ret c			;77df
L_77E0:
	ld a,b			;77e0
	and 0f8h		;77e1
	ld e,a			;77e3
	ld l,000h		;77e4
	ld a,(0f005h)		;77e6
	ld d,a			;77e9
	ld a,(0f006h)		;77ea
	ld h,a			;77ed
	ld a,(0e610h)		;77ee
	and a			;77f1
	jr z,L_77FB		;77f2
	dec a			;77f4
	cp 002h		;77f5
	jr c,L_7801		;77f7
	jr L_7807		;77f9
L_77FB:
	ld a,(0e620h)		;77fb
	and a			;77fe
	jr z,L_7807		;77ff
L_7801:
	ld a,e			;7801
	ld e,d			;7802
	ld d,a			;7803
	ld a,l			;7804
	ld l,h			;7805
	ld h,a			;7806
L_7807:
	ld a,c			;7807
	rlca			;7808
	rlca			;7809
	rlca			;780a
	and 003h		;780b
	ld b,a			;780d
	ld a,c			;780e
	and 01fh		;780f
L_7811:
	ld (0f010h),a		;7811
	ld a,b			;7814
	ld (0f011h),a		;7815
	ld (0f012h),de		;7818
	ld (0f014h),hl		;781c
	ld hl,0eb00h		;781f
	ld de,00010h		;7822
	xor a			;7825
	ld b,008h		;7826
L_7828:
	cp (hl)			;7828
	jr z,L_7830		;7829
	add hl,de			;782b
	djnz L_7828		;782c
	xor a			;782e
	ret			;782f
L_7830:
	push hl			;7830
	pop ix		;7831
	ld a,(0f010h)		;7833
	ld (hl),a			;7836
	push af			;7837
	inc l			;7838
	ld (hl),000h		;7839
	ld de,(0f012h)		;783b
	inc l			;783f
	ld a,d			;7840
	cp 0f8h		;7841
	ld a,000h		;7843
	jr z,L_7848		;7845
	dec a			;7847
L_7848:
	ld (hl),a			;7848
	inc l			;7849
	ld a,(0f014h)		;784a
	ld (hl),a			;784d
	inc l			;784e
	ld (hl),e			;784f
	inc l			;7850
	ld a,(0f015h)		;7851
	ld (hl),a			;7854
	inc l			;7855
	ld (hl),d			;7856
	ld a,l			;7857
	add a,005h		;7858
	ld l,a			;785a
	ld a,(0f011h)		;785b
	ld (hl),a			;785e
	inc l			;785f
	inc l			;7860
	ld (hl),0ffh		;7861
	pop af			;7863
	call L_7869		;7864
	scf			;7867
L_7868:
	ret			;7868
L_7869:
	dec a			;7869
	call 040ceh		;786a

; ----------------------------------------------------------------------
; DATOS tabla_786D: 23 destinos del despachador p00:40CE (call en p01:786A, el
;   indice en A): B796, 78DA, 7868, 78E3, 78B6, 78BF, B7F0, 78C8, 7868, B7D4,
;   789B, 78D1, BA66, B7C6, 78AD, 78A4, B9FC, B796, B7E6, A49F, BC91, BCAF,
;   AC44; lo leen p01:786A (46 bytes)
;   0x786d..0x789b  (46 bytes)
DATA_tabla_786D:
	defw 0b796h,078dah,07868h,078e3h,078b6h,078bfh,0b7f0h,078c8h	; 786d
	defw 07868h,0b7d4h,0789bh,078d1h,0ba66h,0b7c6h,078adh,078a4h	; 787d
	defw 0b9fch,0b796h,0b7e6h,0a49fh,0bc91h,0bcafh,0ac44h	; 788d

; ======================================================================
; CODIGO 0x789b..0x7a17  (380 bytes)
; ======================================================================


L_789B:
	call 041cbh		;789b
	call 0b720h		;789e
	jp 041d0h		;78a1
L_78A4:
	call 041cbh		;78a4
	call 0b5fch		;78a7
	jp 041d0h		;78aa
L_78AD:
	call 041cbh		;78ad
	call 0bac3h		;78b0
	jp 041d0h		;78b3
L_78B6:
	call 041cbh		;78b6
	call 0bb8ch		;78b9
	jp 041d0h		;78bc
L_78BF:
	call 041cbh		;78bf
	call 0bb8ch		;78c2
	jp 041d0h		;78c5
L_78C8:
	call 041bfh		;78c8
	call 0be62h		;78cb
	jp 041d0h		;78ce
L_78D1:
	call 041bfh		;78d1
	call 0be4eh		;78d4
	jp 041d0h		;78d7
L_78DA:
	call 041bfh		;78da
	call 0bfdeh		;78dd
	jp 041d0h		;78e0
L_78E3:
	call 041bfh		;78e3
	call 0bfdeh		;78e6
	jp 041d0h		;78e9
L_78EC:
	call 041d8h		;78ec
	ld a,(0e301h)		;78ef
	ld hl,09205h		;78f2
	call 04e28h		;78f5
	ld a,(0e659h)		;78f8
	call L_793C		;78fb
	ld hl,(0e302h)		;78fe
	rst 20h			;7901
	jp 0416eh		;7902
L_7905:
	ld de,000a0h		;7905
	ld a,e			;7908
	ld (0f005h),a		;7909
	ld a,d			;790c
	ld (0f006h),a		;790d
L_7910:
	call L_7916		;7910
	jr z,L_7910		;7913
	ret			;7915
L_7916:
	call L_7923		;7916
	ret nz			;7919
	ld hl,0e688h		;791a
	inc (hl)			;791d
	call L_77D6		;791e
	xor a			;7921
	ret			;7922
L_7923:
	call 041d8h		;7923
	ld a,(0e301h)		;7926
	ld hl,09213h		;7929
	call 04e28h		;792c
	ld a,(0e688h)		;792f
	call L_793C		;7932
	ld hl,(0e612h)		;7935
	rst 20h			;7938
	jp 0416eh		;7939
L_793C:
	ld b,a			;793c
	add a,a			;793d
	add a,b			;793e
	call 040c9h		;793f
	ex de,hl			;7942
	ld e,(hl)			;7943
	inc hl			;7944
	ld a,(hl)			;7945
	ld b,a			;7946
	and 007h		;7947
	ld d,a			;7949
	inc hl			;794a
	ld c,(hl)			;794b
	ret			;794c
L_794D:
	ld hl,0eb70h		;794d
	ld de,0fff0h		;7950
	ld bc,00808h		;7953
L_7956:
	ld a,(hl)			;7956
	and a			;7957
	jr nz,L_795E		;7958
	dec c			;795a
	add hl,de			;795b
	djnz L_7956		;795c
L_795E:
	ld a,c			;795e
	ld (0e6b2h),a		;795f
	ret			;7962
L_7963:
	ld ix,0eb00h		;7963
	ld a,(0e6b2h)		;7967
	and a			;796a
	ret z			;796b
	ld b,a			;796c
L_796D:
	push bc			;796d
	call L_797A		;796e
	pop bc			;7971
	ld de,00010h		;7972
	add ix,de		;7975
	djnz L_796D		;7977
	ret			;7979
L_797A:
	ld a,(ix+000h)		;797a
	and a			;797d
	ret z			;797e
	call L_7A13		;797f
	call L_7A03		;7982
	ld a,(0e628h)		;7985
	and a			;7988
	jr z,L_79C5		;7989
	ld a,(ix+000h)		;798b
	cp 006h		;798e
	jr nz,L_7997		;7990
	ld a,(ix+001h)		;7992
	dec a			;7995
	ret z			;7996
L_7997:
	ld a,(0e628h)		;7997
	bit 7,a		;799a
	ld l,(ix+004h)		;799c
	ld h,(ix+003h)		;799f
	ld de,00008h		;79a2
	jr nz,L_79B3		;79a5
	add hl,de			;79a7
	ld a,h			;79a8
	or a			;79a9
	jr nz,L_79BF		;79aa
	ld a,l			;79ac
	cp 0a8h		;79ad
	jr nc,L_79FE		;79af
	jr L_79BF		;79b1
L_79B3:
	or a			;79b3
	sbc hl,de		;79b4
	ld a,h			;79b6
	or a			;79b7
	jr z,L_79BF		;79b8
	ld a,l			;79ba
	cp 0c0h		;79bb
	jr c,L_79FE		;79bd
L_79BF:
	ld (ix+004h),l		;79bf
	ld (ix+003h),h		;79c2
L_79C5:
	ld a,(0e627h)		;79c5
	and a			;79c8
	ret z			;79c9
	bit 7,a		;79ca
	ld l,(ix+006h)		;79cc
	ld h,(ix+005h)		;79cf
	ld de,00008h		;79d2
	jr nz,L_79F0		;79d5
	or a			;79d7
	sbc hl,de		;79d8
	ld a,h			;79da
	inc a			;79db
	jr nz,L_79F7		;79dc
	ex de,hl			;79de
	ld l,(ix+009h)		;79df
	ld h,000h		;79e2
	add hl,hl			;79e4
	add hl,hl			;79e5
	add hl,hl			;79e6
	ex de,hl			;79e7
	call 05adfh		;79e8
	rst 20h			;79eb
	jr c,L_79FE		;79ec
	jr L_79F7		;79ee
L_79F0:
	add hl,de			;79f0
	ld de,00150h		;79f1
	rst 20h			;79f4
	jr nc,L_79FE		;79f5
L_79F7:
	ld (ix+006h),l		;79f7
	ld (ix+005h),h		;79fa
	ret			;79fd
L_79FE:
	ld (ix+000h),000h		;79fe
	ret			;7a02
L_7A03:
	ld a,(ix+003h)		;7a03
	and a			;7a06
	jr nz,L_7A0E		;7a07
	ld a,(ix+005h)		;7a09
	and a			;7a0c
	ret z			;7a0d
L_7A0E:
	ld (ix+00dh),0ffh		;7a0e
L_7A12:
	ret			;7a12
L_7A13:
	dec a			;7a13
	call 040ceh		;7a14

; ----------------------------------------------------------------------
; DATOS tabla_7A17: 23 destinos del despachador p00:40CE (call en p01:7A14, el
;   indice en A): B6E9, 7A84, 7A12, 7A8D, 7A60, 7A69, B8CC, 7A72, 7A12, B814,
;   7A45, 7A7B, BA71, B87F, 7A57, 7A4E, BA26, B6E9, B8D1, A4AA, BC2C, BCC1,
;   7A96; lo leen p01:7A14 (46 bytes)
;   0x7a17..0x7a45  (46 bytes)
DATA_tabla_7A17:
	defw 0b6e9h,07a84h,07a12h,07a8dh,07a60h,07a69h,0b8cch,07a72h	; 7a17
	defw 07a12h,0b814h,07a45h,07a7bh,0ba71h,0b87fh,07a57h,07a4eh	; 7a27
	defw 0ba26h,0b6e9h,0b8d1h,0a4aah,0bc2ch,0bcc1h,07a96h	; 7a37

; ======================================================================
; CODIGO 0x7a45..0x7c77  (562 bytes)
; ======================================================================


L_7A45:
	call 041cbh		;7a45
	call 0b73dh		;7a48
	jp 041d0h		;7a4b
L_7A4E:
	call 041cbh		;7a4e
	call 0b624h		;7a51
	jp 041d0h		;7a54
L_7A57:
	call 041cbh		;7a57
	call 0babeh		;7a5a
	jp 041d0h		;7a5d
L_7A60:
	call 041cbh		;7a60
	call 0bbb6h		;7a63
	jp 041d0h		;7a66
L_7A69:
	call 041cbh		;7a69
	call 0bc17h		;7a6c
	jp 041d0h		;7a6f
L_7A72:
	call 041bfh		;7a72
	call 0bdc9h		;7a75
	jp 041d0h		;7a78
L_7A7B:
	call 041bfh		;7a7b
	call 0bdfah		;7a7e
	jp 041d0h		;7a81
L_7A84:
	call 041bfh		;7a84
	call 0beb2h		;7a87
	jp 041d0h		;7a8a
L_7A8D:
	call 041bfh		;7a8d
	call 0bf05h		;7a90
	jp 041d0h		;7a93
L_7A96:
	call 041bfh		;7a96
	call 0ac67h		;7a99
	jp 041d0h		;7a9c
L_7A9F:
	ld ix,0e700h		;7a9f
	ld b,00ch		;7aa3
L_7AA5:
	ld a,(ix+02fh)		;7aa5
	and a			;7aa8
	jr nz,L_7AC5		;7aa9
	ld a,(ix+000h)		;7aab
	and a			;7aae
	jr z,L_7AC5		;7aaf
	cp 01dh		;7ab1
	jr z,L_7ABD		;7ab3
	cp 020h		;7ab5
	jr z,L_7ABD		;7ab7
	cp 022h		;7ab9
	jr nz,L_7AC5		;7abb
L_7ABD:
	call L_7494		;7abd
	jr nc,L_7AC5		;7ac0
	call L_6B62		;7ac2
L_7AC5:
	ld de,00040h		;7ac5
	add ix,de		;7ac8
	djnz L_7AA5		;7aca
	ret			;7acc
L_7ACD:
	ld a,(ix+003h)		;7acd
	and a			;7ad0
	ret			;7ad1
L_7AD2:
	ld a,(ix+005h)		;7ad2
	and a			;7ad5
	ret nz			;7ad6
	ld a,(ix+006h)		;7ad7
	cp 0f8h		;7ada
	jr nc,L_7AE0		;7adc
	jr L_7ACD		;7ade
L_7AE0:
	or 0ffh		;7ae0
	ret			;7ae2
L_7AE3:
	call L_7AF6		;7ae3
	ret nz			;7ae6
	ld (ix+00dh),c		;7ae7
	ret			;7aea
L_7AEB:
	ld a,(ix+007h)		;7aeb
	sub d			;7aee
	call 040c4h		;7aef
	ld c,(hl)			;7af2
	ld (ix+00dh),c		;7af3
L_7AF6:
	ld a,(ix+003h)		;7af6
	and a			;7af9
	jr nz,L_7B01		;7afa
	ld a,(ix+005h)		;7afc
	and a			;7aff
	ret z			;7b00
L_7B01:
	ld (ix+00dh),0ffh		;7b01
	ret			;7b05
L_7B06:
	call 04ca4h		;7b06
	call L_7BA1		;7b09
	call 04199h		;7b0c
	ld de,038c3h		;7b0f
	ld a,(0e6d1h)		;7b12
	ld c,a			;7b15
	call 08cf0h		;7b16
	ld a,(0e6d1h)		;7b19
	cp 005h		;7b1c
	jr c,L_7B33		;7b1e
	ld a,001h		;7b20
	ld (0e35eh),a		;7b22
	ld a,(0e227h)		;7b25
	cp 002h		;7b28
	jr nz,L_7B31		;7b2a
	ld a,001h		;7b2c
	ld (0e3deh),a		;7b2e
L_7B31:
	jr L_7B70		;7b31
L_7B33:
	ld b,a			;7b33
	ld a,(0002bh)		;7b34
	and 00fh		;7b37
	ld hl,09ffch		;7b39
	jr z,L_7B41		;7b3c
	ld hl,0a01ah		;7b3e
L_7B41:
	ld a,b			;7b41
	call 04e28h		;7b42
	ld a,b			;7b45
	ld hl,0e309h		;7b46
	add a,l			;7b49
	ld l,a			;7b4a
	ld a,(hl)			;7b4b
	add a,a			;7b4c
	ld b,a			;7b4d
	add a,a			;7b4e
	add a,b			;7b4f
	ld c,a			;7b50
	ld b,000h		;7b51
	ld a,(0002bh)		;7b53
	and 00fh		;7b56
	ld hl,0a006h		;7b58
	jr z,L_7B60		;7b5b
	ld hl,0a024h		;7b5d
L_7B60:
	add hl,bc			;7b60
	ld a,(0002bh)		;7b61
	and 00fh		;7b64
	ld bc,00003h		;7b66
	jr z,L_7B6D		;7b69
	ld c,006h		;7b6b
L_7B6D:
	call 04cbeh		;7b6d
L_7B70:
	jp 0416eh		;7b70
L_7B73:
	ld a,001h		;7b73
	ld (0e30ah),a		;7b75
	ld a,(0e227h)		;7b78
	cp 002h		;7b7b
	jr nz,L_7B84		;7b7d
	ld a,001h		;7b7f
	ld (0e38ah),a		;7b81
L_7B84:
	call 04ca4h		;7b84
	call L_7BA1		;7b87
	ld de,03863h		;7b8a
	ld c,00ah		;7b8d
L_7B8F:
	call 04199h		;7b8f
	call 0944ah		;7b92
	jr L_7B70		;7b95
L_7B97:
	call 04ca4h		;7b97
	ld de,03863h		;7b9a
	ld c,00bh		;7b9d
	jr L_7B8F		;7b9f
L_7BA1:
	call 041bfh		;7ba1
	call 0b9e1h		;7ba4
	call 041c3h		;7ba7
	ld hl,02190h		;7baa
	ld de,0a912h		;7bad
	call 04ce5h		;7bb0
	ld hl,02760h		;7bb3
	ld de,0af9ah		;7bb6
	ld bc,00068h		;7bb9
	call 04cc1h		;7bbc
	ld hl,02560h		;7bbf
	ld de,0ae8ah		;7bc2
	ld bc,00110h		;7bc5
	ld a,(0e6d1h)		;7bc8
	cp 005h		;7bcb
	jr nz,L_7BD5		;7bcd
	ld de,0ac8ah		;7bcf
	ld bc,00200h		;7bd2
L_7BD5:
	call 04cc1h		;7bd5
	ld hl,00008h		;7bd8
	ld bc,007f8h		;7bdb
	ld a,0f0h		;7bde
	jp 04cd4h		;7be0
L_7BE3:
	call L_7C06		;7be3
	jr z,L_7BE3		;7be6
	ret c			;7be8
	ld hl,0e67dh		;7be9
	inc (hl)			;7bec
	jp L_7BE3		;7bed
L_7BF0:
	ld hl,(0e627h)		;7bf0
	ld a,h			;7bf3
	or l			;7bf4
	ret z			;7bf5
	ld a,l			;7bf6
	or a			;7bf7
	ld a,0f8h		;7bf8
	jr nz,L_7BFD		;7bfa
	xor a			;7bfc
L_7BFD:
	ld (0f004h),a		;7bfd
L_7C00:
	call L_7C06		;7c00
	jr z,L_7C00		;7c03
	ret			;7c05
L_7C06:
	call 041cbh		;7c06
	ld a,(0e67dh)		;7c09
	ld hl,0a181h		;7c0c
	call 04e66h		;7c0f
	jp nz,041d0h		;7c12
	ld hl,0e67dh		;7c15
	inc (hl)			;7c18
	ld a,c			;7c19
	and 0f8h		;7c1a
	ld e,a			;7c1c
	ld a,(0f004h)		;7c1d
	ld d,a			;7c20
	ld a,(0e620h)		;7c21
	or a			;7c24
	jr z,L_7C2A		;7c25
	ld a,d			;7c27
	ld d,e			;7c28
	ld e,a			;7c29
L_7C2A:
	ld a,c			;7c2a
	and 007h		;7c2b
	ld c,a			;7c2d
	call L_7C36		;7c2e
	call 041d0h		;7c31
	xor a			;7c34
	ret			;7c35
L_7C36:
	ld a,(0e227h)		;7c36
	cp 002h		;7c39
	jr z,L_7C41		;7c3b
	ld a,c			;7c3d
	cp 005h		;7c3e
	ret nc			;7c40
L_7C41:
	ld a,(0ec20h)		;7c41
	or a			;7c44
	ret nz			;7c45
	ld a,(0e630h)		;7c46
	or a			;7c49
	ret nz			;7c4a
	ld hl,0ec20h		;7c4b
	ld (hl),c			;7c4e
	inc l			;7c4f
	ld (hl),e			;7c50
	inc l			;7c51
	ld (hl),d			;7c52
	jp 04882h		;7c53
L_7C56:
	exx			;7c56
	ld a,(0e605h)		;7c57
	ld c,a			;7c5a
	exx			;7c5b
	ld iy,0e440h		;7c5c
	ld b,00fh		;7c60
L_7C62:
	push bc			;7c62
	call L_7C6F		;7c63
	ld bc,00018h		;7c66
	add iy,bc		;7c69
	pop bc			;7c6b
	djnz L_7C62		;7c6c
	ret			;7c6e
L_7C6F:
	ld a,(iy+000h)		;7c6f
	dec a			;7c72
	ret m			;7c73
	call 040ceh		;7c74

; ----------------------------------------------------------------------
; DATOS tabla_7C77: 12 destinos del despachador p00:40CE (call en p01:7C74, el
;   indice en A): 7C8F, 7E4D, 7E4D, 7E4D, 7D90, 7CFA, 7D65, 7CDA, 7D65, 7D61,
;   7E4D, 7E4D; lo leen p01:7C74 (24 bytes)
;   0x7c77..0x7c8f  (24 bytes)
DATA_tabla_7C77:
	defw 07c8fh,07e4dh,07e4dh,07e4dh,07d90h,07cfah,07d65h,07cdah	; 7c77
	defw 07d65h,07d61h,07e4dh,07e4dh	; 7c87  -> L_7D65 L_7D61 L_7E4D L_7E4D

; ======================================================================
; CODIGO 0x7c8f..0x7e7f  (496 bytes)
; ======================================================================


L_7C8F:
	ld a,(0e620h)		;7c8f
	or a			;7c92
	jr nz,L_7CBE		;7c93
	ld a,(iy+005h)		;7c95
	sub 008h		;7c98
	ld h,a			;7c9a
	call L_7CA6		;7c9b
L_7C9E:
	ld a,(iy+000h)		;7c9e
	or a			;7ca1
	ret z			;7ca2
	ld h,(iy+005h)		;7ca3
L_7CA6:
	ld l,(iy+003h)		;7ca6
L_7CA9:
	call L_7EA2		;7ca9
	ret nc			;7cac
	ld a,(0e640h)		;7cad
	or a			;7cb0
	jr nz,L_7CB8		;7cb1
	call L_7FD4		;7cb3
	jr L_7CBB		;7cb6
L_7CB8:
	call L_7CCC		;7cb8
L_7CBB:
	jp L_7D31		;7cbb
L_7CBE:
	ld a,(iy+003h)		;7cbe
	add a,008h		;7cc1
	ld l,a			;7cc3
	ld h,(iy+005h)		;7cc4
	call L_7CA9		;7cc7
	jr L_7C9E		;7cca
L_7CCC:
	ld a,(0e609h)		;7ccc
	or a			;7ccf
	ret nz			;7cd0
	inc a			;7cd1
	ld (0e609h),a		;7cd2
	ld a,00bh		;7cd5
	jp 04d6eh		;7cd7
L_7CDA:
	ld a,(0e301h)		;7cda
	cp 003h		;7cdd
	ld a,001h		;7cdf
	jr z,L_7CE4		;7ce1
	dec a			;7ce3
L_7CE4:
	ld (0e6a3h),a		;7ce4
	call L_7CFA		;7ce7
	xor a			;7cea
	ld (0e6a3h),a		;7ceb
	ret			;7cee
L_7CEF:
	ld h,(iy+005h)		;7cef
	ld l,(iy+003h)		;7cf2
L_7CF5:
	call 05a99h		;7cf5
	ex de,hl			;7cf8
	ret			;7cf9
L_7CFA:
	ld a,(iy+00ah)		;7cfa
	or a			;7cfd
	ret z			;7cfe
	ld b,a			;7cff
	call L_7CEF		;7d00
L_7D03:
	ld a,(0e620h)		;7d03
	or a			;7d06
	jr nz,L_7D36		;7d07
L_7D09:
	call L_7E63		;7d09
	jr nc,L_7D19		;7d0c
	ld a,(0e640h)		;7d0e
	or a			;7d11
	jr nz,L_7CB8		;7d12
	call L_7FD4		;7d14
	jr nc,L_7D1E		;7d17
L_7D19:
	inc de			;7d19
	djnz L_7D09		;7d1a
	or a			;7d1c
	ret			;7d1d
L_7D1E:
	ld a,(iy+00ah)		;7d1e
	inc b			;7d21
	sub b			;7d22
	jr c,L_7D31		;7d23
	jp z,L_7D31		;7d25
	ld (iy+00ah),a		;7d28
	ld (iy+001h),002h		;7d2b
	scf			;7d2f
	ret			;7d30
L_7D31:
	call 0aa64h		;7d31
	scf			;7d34
	ret			;7d35
L_7D36:
	call L_7E63		;7d36
	jr nc,L_7D47		;7d39
	ld a,(0e640h)		;7d3b
	or a			;7d3e
	jp nz,L_7CB8		;7d3f
	call L_7FD4		;7d42
	jr nc,L_7D51		;7d45
L_7D47:
	ex de,hl			;7d47
	ld de,0ffc0h		;7d48
	add hl,de			;7d4b
	ex de,hl			;7d4c
	djnz L_7D36		;7d4d
	or a			;7d4f
	ret			;7d50
L_7D51:
	ld a,(iy+00ah)		;7d51
	sub b			;7d54
	jp z,L_7D31		;7d55
	ld (iy+00ah),a		;7d58
	ld (iy+001h),002h		;7d5b
	scf			;7d5f
	ret			;7d60
L_7D61:
	ld a,003h		;7d61
	jr L_7D67		;7d63
L_7D65:
	ld a,002h		;7d65
L_7D67:
	ld (0f000h),a		;7d67
	ld a,(iy+00ah)		;7d6a
	or a			;7d6d
	ret z			;7d6e
	ld b,a			;7d6f
	call L_7CEF		;7d70
L_7D73:
	push bc			;7d73
	push de			;7d74
	call L_7D03		;7d75
	pop de			;7d78
	pop bc			;7d79
	ret c			;7d7a
	inc de			;7d7b
	ld a,(0e620h)		;7d7c
	or a			;7d7f
	jr nz,L_7D87		;7d80
	ld hl,0003fh		;7d82
	add hl,de			;7d85
	ex de,hl			;7d86
L_7D87:
	exx			;7d87
	ld hl,0f000h		;7d88
	dec (hl)			;7d8b
	exx			;7d8c
	jr nz,L_7D73		;7d8d
	ret			;7d8f
L_7D90:
	call L_7CEF		;7d90
	ld (0f000h),de		;7d93
	ld a,(iy+00ah)		;7d97
	or a			;7d9a
	jr z,L_7DED		;7d9b
	ld b,a			;7d9d
	ld a,(0e620h)		;7d9e
	or a			;7da1
	jr nz,L_7E02		;7da2
	ld c,000h		;7da4
L_7DA6:
	call L_7E63		;7da6
	jr nc,L_7DB9		;7da9
	ld a,(0e640h)		;7dab
	or a			;7dae
	jp nz,L_7CB8		;7daf
	call L_7FD4		;7db2
	jp nc,L_7D31		;7db5
	inc c			;7db8
L_7DB9:
	ld a,040h		;7db9
	call 040c9h		;7dbb
	djnz L_7DA6		;7dbe
	ld a,c			;7dc0
	or a			;7dc1
	jp nz,L_7D31		;7dc2
	ld a,(0e627h)		;7dc5
	or a			;7dc8
	jr z,L_7DED		;7dc9
	ld de,(0f000h)		;7dcb
	dec de			;7dcf
	ld b,(iy+00ah)		;7dd0
	ld c,000h		;7dd3
L_7DD5:
	call L_7E63		;7dd5
	jr nc,L_7DE1		;7dd8
	call L_7FD4		;7dda
	jp nc,L_7D31		;7ddd
	inc c			;7de0
L_7DE1:
	ld a,040h		;7de1
	call 040c9h		;7de3
	djnz L_7DD5		;7de6
	ld a,c			;7de8
	or a			;7de9
	jp nz,L_7D31		;7dea
L_7DED:
	ld a,(iy+00ah)		;7ded
	add a,a			;7df0
	add a,a			;7df1
	add a,a			;7df2
	ld b,a			;7df3
	ld a,(0e620h)		;7df4
	or a			;7df7
	jr nz,L_7DFE		;7df8
	ld (iy+00dh),b		;7dfa
	ret			;7dfd
L_7DFE:
	ld (iy+00ch),b		;7dfe
	ret			;7e01
L_7E02:
	ld c,000h		;7e02
L_7E04:
	call L_7E63		;7e04
	jr nc,L_7E17		;7e07
	ld a,(0e640h)		;7e09
	or a			;7e0c
	jp nz,L_7CB8		;7e0d
	call L_7FD4		;7e10
	jp nc,L_7D31		;7e13
	inc c			;7e16
L_7E17:
	inc de			;7e17
	djnz L_7E04		;7e18
	ld a,c			;7e1a
	or a			;7e1b
	jp nz,L_7D31		;7e1c
	ld a,(0e627h)		;7e1f
	or a			;7e22
	jr z,L_7DED		;7e23
	ld hl,(0f000h)		;7e25
	ld de,00040h		;7e28
	add hl,de			;7e2b
	ex de,hl			;7e2c
	ld b,(iy+00ah)		;7e2d
	ld c,000h		;7e30
L_7E32:
	call L_7E63		;7e32
	jr nc,L_7E3E		;7e35
	call L_7FD4		;7e37
	jp nc,L_7D31		;7e3a
	inc c			;7e3d
L_7E3E:
	ld a,040h		;7e3e
	call 040c9h		;7e40
	djnz L_7E32		;7e43
	ld a,c			;7e45
	or a			;7e46
	jp nz,L_7D31		;7e47
	jp L_7DED		;7e4a
L_7E4D:
	ld h,(iy+005h)		;7e4d
	ld l,(iy+003h)		;7e50
	call L_7EA2		;7e53
	ret nc			;7e56
	ld a,(0e640h)		;7e57
	or a			;7e5a
	ret z			;7e5b
	ld (iy+000h),000h		;7e5c
	jp L_7CCC		;7e60
L_7E63:
	ld a,(de)			;7e63
	exx			;7e64
	cp c			;7e65
	ccf			;7e66
	exx			;7e67
	ret nc			;7e68
	ld a,(0e640h)		;7e69
	sub 007h		;7e6c
	cp 001h		;7e6e
	ccf			;7e70
	ret c			;7e71
	ld a,(de)			;7e72
	sub 090h		;7e73
	cp 005h		;7e75
	ccf			;7e77
	ret nc			;7e78
	sub 030h		;7e79
	cp 005h		;7e7b
	ccf			;7e7d
	ret			;7e7e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7e7f..0x7e9c  (29 bytes)
DATA_7E7F:
	defb 0fdh,07eh,000h,0feh,005h,0cah,0edh,07dh,0fdh,07eh,00ah,087h,087h,087h,047h,03ah	; 7e7f  .~.....}.~....G:
	defb 020h,0e6h,0b7h,020h,004h,0fdh,070h,00ch,0c9h,0fdh,070h,00dh,0c9h	; 7e8f   .. ..p...p..

; ======================================================================
; CODIGO 0x7e9c..0x8000  (356 bytes)
; ======================================================================


L_7E9C:
	call L_7CF5		;7e9c
	jp L_7E63		;7e9f
L_7EA2:
	call L_7CF5		;7ea2
	call L_7E63		;7ea5
	ret c			;7ea8
	ld a,(0e620h)		;7ea9
	or a			;7eac
	jr z,L_7EB7		;7ead
	ld hl,0ffc0h		;7eaf
	add hl,de			;7eb2
	ex de,hl			;7eb3
	jp L_7E63		;7eb4
L_7EB7:
	inc de			;7eb7
	ld a,e			;7eb8
	and 01fh		;7eb9
	ret z			;7ebb
	jp L_7E63		;7ebc
L_7EBF:
	call 05a99h		;7ebf
	ld (0e6bch),hl		;7ec2
L_7EC5:
	ld a,(0e605h)		;7ec5
	ld c,a			;7ec8
	call L_7EE7		;7ec9
	ret c			;7ecc
	ld de,00040h		;7ecd
	add hl,de			;7ed0
	jp L_7EE7		;7ed1
L_7ED4:
	call 05a99h		;7ed4
	ld (0e6bch),hl		;7ed7
L_7EDA:
	ld a,(0e605h)		;7eda
	ld c,a			;7edd
	call L_7EE7		;7ede
	ret c			;7ee1
	inc hl			;7ee2
	ld a,l			;7ee3
	and 01fh		;7ee4
	ret z			;7ee6
L_7EE7:
	ld a,(hl)			;7ee7
	cp c			;7ee8
	ccf			;7ee9
	ret			;7eea
L_7EEB:
	call 05a99h		;7eeb
L_7EEE:
	ld a,(0e605h)		;7eee
	ld c,a			;7ef1
	jr L_7EE7		;7ef2
L_7EF4:
	ld h,(ix+006h)		;7ef4
	ld a,(ix+004h)		;7ef7
	add a,010h		;7efa
	ld l,a			;7efc
	jr L_7ED4		;7efd
L_7EFF:
	ld h,(ix+006h)		;7eff
	ld l,(ix+004h)		;7f02
	dec l			;7f05
	jr L_7ED4		;7f06
L_7F08:
	ld iy,0e300h		;7f08
	call L_7F26		;7f0c
	jr nc,L_7F1C		;7f0f
L_7F11:
	ld a,(iy+020h)		;7f11
	cp 003h		;7f14
	jp z,094a3h		;7f16
	jp 09684h		;7f19
L_7F1C:
	ld iy,0e380h		;7f1c
	call L_7F26		;7f20
	ret nc			;7f23
	jr L_7F11		;7f24
L_7F26:
	ld a,(0e6c0h)		;7f26
	or a			;7f29
	ret nz			;7f2a
	exx			;7f2b
	ld a,(0e605h)		;7f2c
	ld c,a			;7f2f
	exx			;7f30
	ld a,(iy+020h)		;7f31
	dec a			;7f34
	cp 003h		;7f35
	ret nc			;7f37
	cp 002h		;7f38
	jr z,L_7F82		;7f3a
	ld a,(0e620h)		;7f3c
	or a			;7f3f
	jr nz,L_7F62		;7f40
	ld a,(iy+024h)		;7f42
	add a,008h		;7f45
	ld l,a			;7f47
	ld a,(iy+026h)		;7f48
	ld h,a			;7f4b
	and 007h		;7f4c
	cp 004h		;7f4e
	push af			;7f50
	call L_7CF5		;7f51
	pop af			;7f54
	jr nc,L_7F5B		;7f55
	call L_7F5C		;7f57
	ret c			;7f5a
L_7F5B:
	inc de			;7f5b
L_7F5C:
	ld a,(de)			;7f5c
	exx			;7f5d
	cp c			;7f5e
	ccf			;7f5f
	exx			;7f60
	ret			;7f61
L_7F62:
	ld a,(iy+026h)		;7f62
	add a,004h		;7f65
	ld h,a			;7f67
	ld a,(iy+024h)		;7f68
	ld l,a			;7f6b
	and 007h		;7f6c
	cp 004h		;7f6e
	push af			;7f70
	call L_7CF5		;7f71
	pop af			;7f74
	jr nc,L_7F7B		;7f75
	call L_7F5C		;7f77
	ret c			;7f7a
L_7F7B:
	ld a,040h		;7f7b
	call 040c9h		;7f7d
	jr L_7F5C		;7f80
L_7F82:
	ld a,(0e620h)		;7f82
	or a			;7f85
	jr nz,L_7FA9		;7f86
	ld a,(iy+024h)		;7f88
	add a,008h		;7f8b
	ld l,a			;7f8d
	ld a,(iy+026h)		;7f8e
	ld h,a			;7f91
	and 007h		;7f92
	cp 004h		;7f94
	push af			;7f96
	call L_7CF5		;7f97
	pop af			;7f9a
	jr nc,L_7FA1		;7f9b
	call L_7F5C		;7f9d
	ret c			;7fa0
L_7FA1:
	inc de			;7fa1
	call L_7F5C		;7fa2
	ret c			;7fa5
	inc de			;7fa6
	jr L_7F5C		;7fa7
L_7FA9:
	ld a,(iy+026h)		;7fa9
	add a,004h		;7fac
	ld h,a			;7fae
	ld a,(iy+024h)		;7faf
	add a,008h		;7fb2
	ld l,a			;7fb4
	and 007h		;7fb5
	cp 004h		;7fb7
	push af			;7fb9
	call L_7CF5		;7fba
	pop af			;7fbd
	jr nc,L_7FC4		;7fbe
	call L_7F5C		;7fc0
	ret c			;7fc3
L_7FC4:
	ld a,040h		;7fc4
	call 040c9h		;7fc6
	call L_7F5C		;7fc9
	ret c			;7fcc
	ld a,040h		;7fcd
	call 040c9h		;7fcf
	jr L_7F5C		;7fd2
L_7FD4:
	ld a,(0e640h)		;7fd4
	or a			;7fd7
	ret nz			;7fd8
	ld a,(0e301h)		;7fd9
	dec a			;7fdc
	jr z,L_7FEA		;7fdd
	dec a			;7fdf
	ld hl,06e04h		;7fe0
	jr z,$+31		;7fe3
	dec a			;7fe5
	jr z,$+39		;7fe6
	xor a			;7fe8
	ret			;7fe9
L_7FEA:
	ld a,(de)			;7fea
	sub 060h		;7feb
	cp 004h		;7fed
	ret nc			;7fef
	add a,05ch		;7ff0
	ld (de),a			;7ff2
	push de			;7ff3
	ld hl,00020h		;7ff4
	add hl,de			;7ff7
	ld a,e			;7ff8
	and 01fh		;7ff9
	add a,a			;7ffb
	add a,020h		;7ffc
	ld (hl),a			;7ffe
	pop de			;7fff
