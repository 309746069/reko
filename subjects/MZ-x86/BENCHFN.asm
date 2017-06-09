;;; Segment 0800 (0800:0000)
0800:0000 BA DB 09 2E 89 16 F8 01 B4 30 CD 21 8B 2E 02 00 .........0.!....
0800:0010 8B 1E 2C 00 8E DA A3 92 00 8C 06 90 00 89 1E 8C ..,.............
0800:0020 00 89 2E AC 00 C7 06 96 00 FF FF E8 34 01 C4 3E ............4..>
0800:0030 8A 00 8B C7 8B D8 B9 FF 7F 26 81 3D 38 37 75 19 .........&.=87u.
0800:0040 26 8B 55 02 80 FA 3D 75 10 80 E6 DF FF 06 96 00 &.U...=u........
0800:0050 80 FE 59 75 04 FF 06 96 00 F2 AE E3 61 43 26 38 ..Yu........aC&8
0800:0060 05 75 D6 80 CD 80 F7 D9 89 0E 8A 00 B9 01 00 D3 .u..............
0800:0070 E3 83 C3 08 83 E3 F8 89 1E 8E 00 8C DA 2B EA 8B .............+..
0800:0080 3E 3C 02 81 FF 00 02 73 07 BF 00 02 89 3E 3C 02 ><.....s.....><.
0800:0090 81 C7 2E 06 72 28 03 3E 3A 02 72 22 B1 04 D3 EF ....r(.>:.r"....
0800:00A0 47 3B EF 72 19 83 3E 3C 02 00 74 07 83 3E 3A 02 G;.r..><..t..>:.
0800:00B0 00 75 0E BF 00 10 3B EF 77 07 8B FD EB 03 E9 21 .u....;.w......!
0800:00C0 01 8B DF 03 DA 89 1E A4 00 89 1E A8 00 A1 90 00 ................
0800:00D0 2B D8 8E C0 B4 4A 57 CD 21 5F D3 E7 FA 8E D2 8B +....JW.!_......
0800:00E0 E7 FB 33 C0 2E 8E 06 F8 01 BF E8 05 B9 2E 06 2B ..3............+
0800:00F0 CF F3 AA 0E FF 16 DA 05 E8 3B 02 E8 23 03 B4 00 .........;..#...
0800:0100 CD 1A 89 16 98 00 89 0E 9A 00 FF 16 DE 05 FF 36 ...............6
0800:0110 88 00 FF 36 86 00 FF 36 84 00 E8 48 01 50 E8 E0 ...6...6...H.P..
0800:0120 01                                              .              

;; fn0800_0121: 0800:0121
fn0800_0121 proc
	mov	ds,cs:[01F8]
	call	01A5
	push	cs
	call	word ptr [05DC]
	xor	ax,ax
	mov	si,ax
	mov	cx,002F
	nop
	cld

l0800_0137:
	add	al,[si]
	adc	ah,00
	inc	si
	loop	0137

l0800_013F:
	sub	ax,0D37
	nop
	jz	014F

l0800_0145:
	mov	cx,0019
	nop
	mov	dx,002F
	call	01DA

l0800_014F:
	mov	bp,sp
	mov	ah,4C
	mov	al,[bp+02]
	int	21
0800:0158                         B9 0E 00 90 BA 48 00 E9         .....H..
0800:0160 87 00                                           ..             

;; fn0800_0162: 0800:0162
fn0800_0162 proc
	push	ds
	mov	ax,3500
	int	21
	mov	[0074],bx
	mov	[0076],es
	mov	ax,3504
	int	21
	mov	[0078],bx
	mov	[007A],es
	mov	ax,3505
	int	21
	mov	[007C],bx
	mov	[007E],es
	mov	ax,3506
	int	21
	mov	[0080],bx
	mov	[0082],es
	mov	ax,2500
	mov	dx,cs
	mov	ds,dx
	mov	dx,0158
	int	21
	pop	ds
	ret

;; fn0800_01A5: 0800:01A5
fn0800_01A5 proc
	push	ds
	mov	ax,2500
	lds	dx,[0074]
	int	21
	pop	ds
	push	ds
	mov	ax,2504
	lds	dx,[0078]
	int	21
	pop	ds
	push	ds
	mov	ax,2505
	lds	dx,[007C]
	int	21
	pop	ds
	push	ds
	mov	ax,2506
	lds	dx,[0080]
	int	21
	pop	ds
	ret
0800:01D2       C7 06 96 00 00 00 CB C3                     ........     

;; fn0800_01DA: 0800:01DA
fn0800_01DA proc
	mov	ah,40
	mov	bx,0002
	int	21
	ret

;; fn0800_01E2: 0800:01E2
fn0800_01E2 proc
	mov	cx,001E
	nop
	mov	dx,0056

;; fn0800_01E9: 0800:01E9
fn0800_01E9 proc
	mov	ds,cs:[01F8]
	call	01DA
	mov	ax,0003
	push	ax
	call	0121
	add	[bx+si],al

;; fn0800_01FA: 0800:01FA
fn0800_01FA proc
	push	bp
	mov	bp,sp
	pop	bp
	ret

;; fn0800_01FF: 0800:01FF
fn0800_01FF proc
	push	bp
	mov	bp,sp
	call	01FA
	call	01FA
	call	01FA
	call	01FA
	call	01FA
	call	01FA
	call	01FA
	call	01FA
	call	01FA
	call	01FA
	pop	bp
	ret

;; fn0800_0222: 0800:0222
fn0800_0222 proc
	push	bp
	mov	bp,sp
	call	01FF
	call	01FF
	call	01FF
	call	01FF
	call	01FF
	call	01FF
	call	01FF
	call	01FF
	call	01FF
	call	01FF
	pop	bp
	ret

;; fn0800_0245: 0800:0245
fn0800_0245 proc
	push	bp
	mov	bp,sp
	call	0222
	call	0222
	call	0222
	call	0222
	call	0222
	call	0222
	call	0222
	call	0222
	call	0222
	pop	bp
	ret

;; main: 0800:0265
main proc
	push	bp
	mov	bp,sp
	sub	sp,08
	mov	ax,0194
	push	ax
	call	0E4B
	pop	cx
	lea	ax,[bp-04]
	push	ax
	mov	ax,01B0
	push	ax
	call	16D4
	pop	cx
	pop	cx
	push	word ptr [bp-02]
	push	word ptr [bp-04]
	mov	ax,01B4
	push	ax
	call	0E4B
	add	sp,06
	mov	word ptr [bp-06],0000
	mov	word ptr [bp-08],0001
	jmp	02A7

l0800_029C:
	call	0245
	add	word ptr [bp-08],01
	adc	word ptr [bp-06],00

l0800_02A7:
	mov	dx,[bp-06]
	mov	ax,[bp-08]
	cmp	dx,[bp-02]
	jl	029C

l0800_02B2:
	jg	02B9

l0800_02B4:
	cmp	ax,[bp-04]
	jbe	029C

l0800_02B9:
	mov	ax,01CE
	push	ax
	call	0E4B
	pop	cx
	mov	sp,bp
	pop	bp
	ret

;; fn0800_02C5: 0800:02C5
fn0800_02C5 proc
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+04]
	or	si,si
	jl	02E4

l0800_02D0:
	cmp	si,58
	jbe	02D8

l0800_02D5:
	mov	si,0057

l0800_02D8:
	mov	[01D8],si
	mov	al,[si+01DA]
	cbw
	xchg	ax,si
	jmp	02F1

l0800_02E4:
	neg	si
	cmp	si,23
	ja	02D5

l0800_02EB:
	mov	word ptr [01D8],FFFF

l0800_02F1:
	mov	ax,si
	mov	[0094],ax
	mov	ax,FFFF
	jmp	02FB

l0800_02FB:
	pop	si
	pop	bp
	ret	0002
0800:0300 C3                                              .              

;; fn0800_0301: 0800:0301
fn0800_0301 proc
	push	bp
	mov	bp,sp
	jmp	0310

l0800_0306:
	mov	bx,[023E]
	shl	bx,01
	call	word ptr [bx+05E8]

l0800_0310:
	mov	ax,[023E]
	dec	word ptr [023E]
	or	ax,ax
	jnz	0306

l0800_031B:
	call	word ptr [0234]
	call	word ptr [0236]
	call	word ptr [0238]
	push	word ptr [bp+04]
	call	0121
	pop	cx
	pop	bp
	ret
0800:0330 00 00 00 00 00 00                               ......         

;; fn0800_0336: 0800:0336
fn0800_0336 proc
	pop	word ptr cs:[0330]
	mov	cs:[0332],ds
	cld
	mov	es,[0090]
	mov	si,0080
	xor	ah,ah
	lodsb
	inc	ax
	mov	bp,es
	xchg	si,dx
	xchg	ax,bx
	mov	si,[008A]
	add	si,02
	mov	cx,0001
	cmp	byte ptr [0092],03
	jc	0374

l0800_0363:
	mov	es,[008C]
	mov	di,si
	mov	cl,7F
	xor	al,al

l0800_036D:
	repne scasb

l0800_036F:
	jcxz	03E7

l0800_0371:
	xor	cl,7F

l0800_0374:
	sub	sp,02
	mov	ax,0001
	add	ax,bx
	add	ax,cx
	and	ax,FFFE
	mov	di,sp
	sub	di,ax
	jc	03E7

l0800_0387:
	mov	sp,di
	mov	ax,es
	mov	ds,ax

;; fn0800_038D: 0800:038D
fn0800_038D proc
	mov	ax,ss
	mov	es,ax
	push	cx
	dec	cx

;; fn0800_0393: 0800:0393
fn0800_0393 proc
	rep movsb

l0800_0395:
	xor	al,al
	stosb
	mov	ds,bp
	xchg	dx,si
	xchg	cx,bx
	mov	ax,bx
	mov	dx,ax
	inc	bx

l0800_03A3:
	call	03BF
	ja	03AF

l0800_03A8:
	jc	03EA

l0800_03AA:
	call	03BF
	ja	03A8

l0800_03AF:
	cmp	al,20
	jz	03BB

l0800_03B3:
	cmp	al,0D
	jz	03BB

l0800_03B7:
	cmp	al,09
	jnz	03A3

l0800_03BB:
	xor	al,al
	jmp	03A3

;; fn0800_03BF: 0800:03BF
fn0800_03BF proc
	or	ax,ax
	jz	03CA

l0800_03C3:
	inc	dx
	stosb
	or	al,al
	jnz	03CA

l0800_03C9:
	inc	bx

l0800_03CA:
	xchg	al,ah
	xor	al,al
	stc
	jcxz	03E6

l0800_03D1:
	lodsb
	dec	cx
	sub	al,22
	jz	03E6

l0800_03D7:
	add	al,22
	cmp	al,5C
	jnz	03E4

l0800_03DD:
	cmp	byte ptr [si],22
	jnz	03E4

l0800_03E2:
	lodsb
	dec	cx

l0800_03E4:
	or	si,si

l0800_03E6:
	ret

;; fn0800_03E7: 0800:03E7
fn0800_03E7 proc
	jmp	01E2

l0800_03EA:
	pop	cx
	add	cx,dx
	mov	ds,cs:[0332]
	mov	[0084],bx
	inc	bx
	add	bx,bx
	mov	si,sp
	mov	bp,sp
	sub	bp,bx
	jc	03E7

l0800_0401:
	mov	sp,bp
	mov	[0086],bp

l0800_0407:
	jcxz	0417

l0800_0409:
	mov	[bp+00],si
	add	bp,02

l0800_040F:
	lodsb
	or	al,al
	loopne	040F

l0800_0415:
	jz	0407

l0800_0417:
	xor	ax,ax
	mov	[bp+00],ax
	jmp	word ptr cs:[0330]

;; fn0800_0421: 0800:0421
fn0800_0421 proc
	mov	cx,[008A]
	push	cx
	call	0570
	pop	cx
	mov	di,ax
	or	ax,ax
	jz	0454

l0800_0430:
	push	ds
	push	ds
	pop	es
	mov	ds,[008C]
	xor	si,si
	cld

l0800_043A:
	rep movsb

l0800_043C:
	pop	ds
	mov	di,ax
	push	es
	push	word ptr [008E]
	call	0570
	add	sp,02
	mov	bx,ax
	pop	es
	mov	[0088],ax
	or	ax,ax
	jnz	0457

l0800_0454:
	jmp	01E2

l0800_0457:
	xor	ax,ax
	mov	cx,FFFF

l0800_045C:
	mov	[bx],di
	add	bx,02

l0800_0461:
	repne scasb

l0800_0463:
	cmp	es:[di],al
	jnz	045C

l0800_0468:
	mov	[bx],ax
	ret
0800:046B                                  55 8B EC 83 3E            U...>
0800:0470 3E 02 20 75 05 B8 01 00 EB 15 8B 46 04 8B 1E 3E >. u.......F...>
0800:0480 02 D1 E3 89 87 E8 05 FF 06 3E 02 33 C0 EB 00 5D .........>.3...]
0800:0490 C3                                              .              

;; fn0800_0491: 0800:0491
fn0800_0491 proc
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,[bp+04]
	mov	ax,[di+06]
	mov	[062A],ax
	cmp	ax,di
	jnz	04AB

l0800_04A3:
	mov	word ptr [062A],0000
	jmp	04BB

l0800_04AB:
	mov	si,[di+04]
	mov	bx,[062A]
	mov	[bx+04],si
	mov	ax,[062A]
	mov	[si+06],ax

l0800_04BB:
	pop	di
	pop	si
	pop	bp
	ret

;; fn0800_04BF: 0800:04BF
fn0800_04BF proc
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,[bp+04]
	mov	ax,[bp+06]
	sub	[di],ax
	mov	si,[di]
	add	si,di
	mov	ax,[bp+06]
	inc	ax
	mov	[si],ax
	mov	[si+02],di
	mov	ax,[0628]
	cmp	ax,di
	jnz	04E6

l0800_04E0:
	mov	[0628],si
	jmp	04EE

l0800_04E6:
	mov	di,si
	add	di,[bp+06]
	mov	[di+02],si

l0800_04EE:
	mov	ax,si
	add	ax,0004
	jmp	04F5

l0800_04F5:
	pop	di
	pop	si
	pop	bp
	ret

;; fn0800_04F9: 0800:04F9
fn0800_04F9 proc
	push	bp
	mov	bp,sp
	push	si
	mov	ax,[bp+04]
	xor	dx,dx
	and	ax,FFFF
	and	dx,0000
	push	dx
	push	ax
	call	0607
	pop	cx
	pop	cx
	mov	si,ax
	cmp	si,FF
	jnz	051B

l0800_0517:
	xor	ax,ax
	jmp	0533

l0800_051B:
	mov	ax,[0628]
	mov	[si+02],ax
	mov	ax,[bp+04]
	inc	ax
	mov	[si],ax
	mov	[0628],si
	mov	ax,[0628]
	add	ax,0004
	jmp	0533

l0800_0533:
	pop	si
	pop	bp
	ret

;; fn0800_0536: 0800:0536
fn0800_0536 proc
	push	bp
	mov	bp,sp
	push	si
	mov	ax,[bp+04]
	xor	dx,dx
	and	ax,FFFF
	and	dx,0000
	push	dx
	push	ax
	call	0607
	pop	cx
	pop	cx
	mov	si,ax
	cmp	si,FF
	jnz	0558

l0800_0554:
	xor	ax,ax
	jmp	056D

l0800_0558:
	mov	[062C],si
	mov	[0628],si
	mov	ax,[bp+04]
	inc	ax
	mov	[si],ax
	mov	ax,si
	add	ax,0004
	jmp	056D

l0800_056D:
	pop	si
	pop	bp
	ret

;; fn0800_0570: 0800:0570
fn0800_0570 proc
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,[bp+04]
	or	di,di
	jz	0581

l0800_057C:
	cmp	di,F4
	jbe	0585

l0800_0581:
	xor	ax,ax
	jmp	05DF

l0800_0585:
	mov	ax,di
	add	ax,000B
	and	ax,FFF8
	mov	di,ax
	cmp	word ptr [062C],00
	jnz	059D

l0800_0596:
	push	di
	call	0536
	pop	cx
	jmp	05DF

l0800_059D:
	mov	si,[062A]
	mov	ax,si
	or	ax,ax
	jz	05D8

l0800_05A7:
	mov	ax,[si]
	mov	dx,di
	add	dx,28
	cmp	ax,dx
	jc	05BB

l0800_05B2:
	push	di
	push	si
	call	04BF
	pop	cx
	pop	cx
	jmp	05DF

l0800_05BB:
	mov	ax,[si]
	cmp	ax,di
	jc	05CF

l0800_05C1:
	push	si
	call	0491
	pop	cx
	inc	word ptr [si]
	mov	ax,si
	add	ax,0004
	jmp	05DF

l0800_05CF:
	mov	si,[si+06]
	cmp	si,[062A]
	jnz	05A7

l0800_05D8:
	push	di
	call	04F9
	pop	cx
	jmp	05DF

l0800_05DF:
	pop	di
	pop	si
	pop	bp
	ret

;; fn0800_05E3: 0800:05E3
fn0800_05E3 proc
	push	bp
	mov	bp,sp
	mov	ax,[bp+04]
	mov	dx,sp
	sub	dx,0100
	cmp	ax,dx
	jnc	05FA

l0800_05F3:
	mov	[009E],ax
	xor	ax,ax
	jmp	0605

l0800_05FA:
	mov	word ptr [0094],0008
	mov	ax,FFFF
	jmp	0605

l0800_0605:
	pop	bp
	ret

;; fn0800_0607: 0800:0607
fn0800_0607 proc
	push	bp
	mov	bp,sp
	mov	ax,[bp+04]
	mov	dx,[bp+06]
	add	ax,[009E]
	adc	dx,00
	mov	cx,ax
	add	cx,0100
	adc	dx,00
	or	dx,dx
	jnz	062E

l0800_0624:
	cmp	cx,sp
	jnc	062E

l0800_0628:
	xchg	[009E],ax
	jmp	0639

l0800_062E:
	mov	word ptr [0094],0008
	mov	ax,FFFF
	jmp	0639

l0800_0639:
	pop	bp
	ret

;; fn0800_063B: 0800:063B
fn0800_063B proc
	push	bp
	mov	bp,sp
	push	word ptr [bp+04]
	call	05E3
	pop	cx
	jmp	0647

l0800_0647:
	pop	bp
	ret
0800:0649                            55 8B EC 8B 46 04 99          U...F..
0800:0650 52 50 E8 B2 FF 8B E5 EB 00 5D C3                RP.......].    

;; fn0800_065B: 0800:065B
fn0800_065B proc
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	push	di
	mov	bx,[bp+04]
	mov	si,[bx]
	mov	ax,si
	mov	[bp-02],ax
	mov	bx,[bp+04]
	test	word ptr [bx+02],0040
	jz	067B

l0800_0677:
	mov	ax,si
	jmp	069A

l0800_067B:
	mov	bx,[bp+04]
	mov	di,[bx+0A]
	jmp	068E

l0800_0683:
	mov	bx,di
	inc	di
	cmp	byte ptr [bx],0A
	jnz	068E

l0800_068B:
	inc	word ptr [bp-02]

l0800_068E:
	mov	ax,si
	dec	si
	or	ax,ax
	jnz	0683

l0800_0695:
	mov	ax,[bp-02]
	jmp	069A

l0800_069A:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	0002

;; fn0800_06A2: 0800:06A2
fn0800_06A2 proc
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+04]
	push	si
	call	0DCD
	pop	cx
	or	ax,ax
	jz	06B7

l0800_06B2:
	mov	ax,FFFF
	jmp	0703

l0800_06B7:
	cmp	word ptr [bp+0A],01
	jnz	06CD

l0800_06BD:
	cmp	word ptr [si],00
	jle	06CD

l0800_06C2:
	push	si
	call	065B
	cwd
	sub	[bp+06],ax
	sbb	[bp+08],dx

l0800_06CD:
	and	word ptr [si+02],FE5F
	mov	word ptr [si],0000
	mov	ax,[si+08]
	mov	[si+0A],ax
	push	word ptr [bp+0A]
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	mov	al,[si+04]
	cbw
	push	ax
	call	0C28
	add	sp,08
	cmp	dx,FF
	jnz	06FF

l0800_06F5:
	cmp	ax,FFFF
	jnz	06FF

l0800_06FA:
	mov	ax,FFFF
	jmp	0701

l0800_06FF:
	xor	ax,ax

l0800_0701:
	jmp	0703

l0800_0703:
	pop	si
	pop	bp
	ret
0800:0706                   55 8B EC 83 EC 04 56 8B 76 04       U.....V.v.
0800:0710 56 E8 B9 06 59 0B C0 74 08 BA FF FF B8 FF FF EB V...Y..t........
0800:0720 35 8A 44 04 98 50 E8 25 16 59 89 56 FE 89 46 FC 5.D..P.%.Y.V..F.
0800:0730 83 3C 00 7E 19 8B 56 FE 8B 46 FC 52 50 56 E8 1A .<.~..V..F.RPV..
0800:0740 FF 99 8B D8 8B CA 58 5A 2B C3 1B D1 EB 06 8B 56 ......XZ+......V
0800:0750 FE 8B 46 FC EB 00 5E 8B E5 5D C3                ..F...^..].    

;; fn0800_075B: 0800:075B
fn0800_075B proc
	push	si
	push	di
	mov	di,0014
	mov	si,0342
	jmp	0778

l0800_0765:
	mov	ax,[si+02]
	and	ax,0300
	cmp	ax,0300
	jnz	0775

l0800_0770:
	push	si
	call	0DCD
	pop	cx

l0800_0775:
	add	si,10

l0800_0778:
	mov	ax,di
	dec	di
	or	ax,ax
	jnz	0765

l0800_077F:
	pop	di
	pop	si
	ret

;; fn0800_0782: 0800:0782
fn0800_0782 proc
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+04]
	test	word ptr [si+02],0200
	jz	0793

l0800_0790:
	call	075B

l0800_0793:
	push	word ptr [si+06]
	mov	ax,[si+08]
	mov	[si+0A],ax
	push	ax
	mov	al,[si+04]
	cbw
	push	ax
	call	09F7
	add	sp,06
	mov	[si],ax
	or	ax,ax
	jle	07B9

l0800_07AE:
	and	word ptr [si+02],FFDF
	xor	ax,ax
	jmp	07DA
0800:07B7                      EB 1C                             ..      

l0800_07B9:
	cmp	word ptr [si],00
	jnz	07CC

l0800_07BE:
	mov	ax,[si+02]
	and	ax,FE7F
	or	ax,0020
	mov	[si+02],ax
	jmp	07D5

l0800_07CC:
	mov	word ptr [si],0000
	or	word ptr [si+02],0010

l0800_07D5:
	mov	ax,FFFF
	jmp	07DA

l0800_07DA:
	pop	si
	pop	bp
	ret	0002
0800:07DF                                              55                U
0800:07E0 8B EC 56 8B 76 04 FF 04 56 E8 06 00 59 EB 00 5E ..V.v...V...Y..^
0800:07F0 5D C3                                           ].             

;; fn0800_07F2: 0800:07F2
fn0800_07F2 proc
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	mov	si,[bp+04]

l0800_07FC:
	dec	word ptr [si]
	jl	080E

l0800_0800:
	inc	word ptr [si+0A]
	mov	bx,[si+0A]
	mov	al,[bx-01]
	mov	ah,00
	jmp	08E2

l0800_080E:
	inc	word ptr [si]
	jl	0819

l0800_0812:
	test	word ptr [si+02],0110
	jz	0824

l0800_0819:
	or	word ptr [si+02],0010
	mov	ax,FFFF
	jmp	08E2

l0800_0824:
	or	word ptr [si+02],0080
	cmp	word ptr [si+06],00
	jz	0842

l0800_082F:
	push	si
	call	0782
	or	ax,ax
	jz	083D

l0800_0837:
	mov	ax,FFFF
	jmp	08E2

l0800_083D:
	jmp	07FC
0800:083F                                              E9                .
0800:0840 A0 00                                           ..             

l0800_0842:
	cmp	word ptr [04AA],00
	jnz	0881

l0800_0849:
	mov	ax,0342
	cmp	ax,si
	jnz	0881

l0800_0850:
	mov	al,[si+04]
	cbw
	push	ax
	call	08F2
	pop	cx
	or	ax,ax
	jnz	0862

l0800_085D:
	and	word ptr [si+02],FDFF

l0800_0862:
	mov	ax,0200
	push	ax
	test	word ptr [si+02],0200
	jz	0872

l0800_086D:
	mov	ax,0001
	jmp	0874

l0800_0872:
	xor	ax,ax

l0800_0874:
	push	ax
	xor	ax,ax
	push	ax
	push	si
	call	0904
	add	sp,08
	jmp	0824

l0800_0881:
	test	word ptr [si+02],0200
	jz	088B

l0800_0888:
	call	075B

l0800_088B:
	mov	ax,0001
	push	ax
	lea	ax,[bp-01]
	push	ax
	mov	al,[si+04]
	cbw
	push	ax
	call	0AB3
	add	sp,06
	cmp	ax,0001
	jz	08C9

l0800_08A3:
	mov	al,[si+04]
	cbw
	push	ax
	call	0D5F
	pop	cx
	cmp	ax,0001
	jz	08B8

l0800_08B1:
	or	word ptr [si+02],0010
	jmp	08C4

l0800_08B8:
	mov	ax,[si+02]
	and	ax,FE7F
	or	ax,0020
	mov	[si+02],ax

l0800_08C4:
	mov	ax,FFFF
	jmp	08E2

l0800_08C9:
	cmp	byte ptr [bp-01],0D
	jnz	08D6

l0800_08CF:
	test	word ptr [si+02],0040
	jz	0881

l0800_08D6:
	and	word ptr [si+02],FFDF
	mov	al,[bp-01]
	mov	ah,00
	jmp	08E2

l0800_08E2:
	pop	si
	mov	sp,bp
	pop	bp
	ret
0800:08E7                      B8 42 03 50 E8 04 FF 59 EB        .B.P...Y.
0800:08F0 00 C3                                           ..             

;; fn0800_08F2: 0800:08F2
fn0800_08F2 proc
	push	bp
	mov	bp,sp
	mov	ax,4400
	mov	bx,[bp+04]
	int	21
	mov	ax,dx
	and	ax,0080
	pop	bp
	ret

;; fn0800_0904: 0800:0904
fn0800_0904 proc
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,[bp+0A]
	mov	si,[bp+04]
	mov	ax,[si+0E]
	cmp	ax,si
	jnz	0922

l0800_0916:
	cmp	word ptr [bp+08],02
	jg	0922

l0800_091C:
	cmp	di,7FFF
	jbe	0928

l0800_0922:
	mov	ax,FFFF
	jmp	09D2

l0800_0928:
	cmp	word ptr [04AC],00
	jnz	093E

l0800_092F:
	mov	ax,0352
	cmp	ax,si
	jnz	093E

l0800_0936:
	mov	word ptr [04AC],0001
	jmp	0952

l0800_093E:
	cmp	word ptr [04AA],00
	jnz	0952

l0800_0945:
	mov	ax,0342
	cmp	ax,si
	jnz	0952

l0800_094C:
	mov	word ptr [04AA],0001

l0800_0952:
	cmp	word ptr [si],00
	jz	0966

l0800_0957:
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	push	ax
	push	si
	call	06A2
	add	sp,08

l0800_0966:
	test	word ptr [si+02],0004
	jz	0974

l0800_096D:
	push	word ptr [si+08]
	call	16AD
	pop	cx

l0800_0974:
	and	word ptr [si+02],FFF3
	mov	word ptr [si+06],0000
	mov	ax,si
	add	ax,0005
	mov	[si+08],ax
	mov	[si+0A],ax
	cmp	word ptr [bp+08],02
	jz	09CE

l0800_098F:
	or	di,di
	jbe	09CE

l0800_0993:
	mov	word ptr [0234],09D6
	cmp	word ptr [bp+06],00
	jnz	09B7

l0800_099F:
	push	di
	call	0570
	pop	cx
	mov	[bp+06],ax
	or	ax,ax
	jz	09B2

l0800_09AB:
	or	word ptr [si+02],0004
	jmp	09B7

l0800_09B2:
	mov	ax,FFFF
	jmp	09D2

l0800_09B7:
	mov	ax,[bp+06]
	mov	[si+0A],ax
	mov	[si+08],ax
	mov	[si+06],di
	cmp	word ptr [bp+08],01
	jnz	09CE

l0800_09C9:
	or	word ptr [si+02],0008

l0800_09CE:
	xor	ax,ax
	jmp	09D2

l0800_09D2:
	pop	di
	pop	si
	pop	bp
	ret
0800:09D6                   56 57 BF 04 00 BE 42 03 EB 10       VW....B...
0800:09E0 F7 44 02 03 00 74 05 56 E8 E2 03 59 4F 83 C6 10 .D...t.V...YO...
0800:09F0 0B FF 75 EC 5F 5E C3                            ..u._^.        

;; fn0800_09F7: 0800:09F7
fn0800_09F7 proc
	push	bp
	mov	bp,sp
	sub	sp,04
	push	si
	push	di
	mov	ax,[bp+08]
	inc	ax
	cmp	ax,0002
	jc	0A15

l0800_0A08:
	mov	bx,[bp+04]
	shl	bx,01
	test	word ptr [bx+0482],0200
	jz	0A1A

l0800_0A15:
	xor	ax,ax
	jmp	0AAD

l0800_0A1A:
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	word ptr [bp+04]
	call	0AB3
	add	sp,06
	mov	[bp-04],ax
	mov	ax,[bp-04]
	inc	ax
	cmp	ax,0002
	jc	0A42

l0800_0A35:
	mov	bx,[bp+04]
	shl	bx,01
	test	word ptr [bx+0482],8000
	jz	0A48

l0800_0A42:
	mov	ax,[bp-04]
	jmp	0AAD
0800:0A47                      90                                .       

l0800_0A48:
	mov	cx,[bp-04]
	mov	si,[bp+06]
	push	ds
	pop	es
	mov	di,si
	mov	bx,si
	cld

l0800_0A55:
	lodsb
	cmp	al,1A
	jz	0A87

l0800_0A5A:
	cmp	al,0D
	jz	0A63

l0800_0A5E:
	stosb
	loop	0A55

l0800_0A61:
	jmp	0A7F

l0800_0A63:
	loop	0A55

l0800_0A65:
	push	es
	push	bx
	mov	ax,0001
	push	ax
	lea	ax,[bp-01]
	push	ax
	push	word ptr [bp+04]
	call	0AB3
	add	sp,06
	pop	bx
	pop	es
	cld
	mov	al,[bp-01]
	stosb

l0800_0A7F:
	cmp	di,bx
	jnz	0A85

l0800_0A83:
	jmp	0A1A

l0800_0A85:
	jmp	0AA7

l0800_0A87:
	push	bx
	mov	ax,0002
	push	ax
	neg	cx
	sbb	ax,ax
	push	ax
	push	cx
	push	word ptr [bp+04]
	call	0C28
	add	sp,08
	mov	bx,[bp+04]
	shl	bx,01
	or	word ptr [bx+0482],0200
	pop	bx

l0800_0AA7:
	mov	ax,di
	sub	ax,bx
	jmp	0AAD

l0800_0AAD:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret

;; fn0800_0AB3: 0800:0AB3
fn0800_0AB3 proc
	push	bp
	mov	bp,sp
	mov	ah,3F
	mov	bx,[bp+04]
	mov	cx,[bp+08]
	mov	dx,[bp+06]
	int	21
	jc	0AC7

l0800_0AC5:
	jmp	0ACD

l0800_0AC7:
	push	ax
	call	02C5
	jmp	0ACD

l0800_0ACD:
	pop	bp
	ret

;; fn0800_0ACF: 0800:0ACF
fn0800_0ACF proc
	push	bp
	mov	bp,sp
	sub	sp,008A
	push	si
	push	di
	mov	ax,[bp+08]
	inc	ax
	cmp	ax,0002
	jnc	0AE6

l0800_0AE1:
	xor	ax,ax
	jmp	0BDC

l0800_0AE6:
	mov	bx,[bp+04]
	shl	bx,01
	test	word ptr [bx+0482],8000
	jz	0B05

l0800_0AF3:
	push	word ptr [bp+08]
	push	word ptr [bp+06]
	push	word ptr [bp+04]
	call	0BE2
	add	sp,06
	jmp	0BDC

l0800_0B05:
	mov	bx,[bp+04]
	shl	bx,01
	and	word ptr [bx+0482],FDFF
	mov	ax,[bp+06]
	mov	[bp+FF7C],ax
	mov	ax,[bp+08]
	mov	[bp+FF78],ax
	lea	si,[bp+FF7E]
	jmp	0B91

l0800_0B24:
	dec	word ptr [bp+FF78]
	mov	bx,[bp+FF7C]
	inc	word ptr [bp+FF7C]
	mov	al,[bx]
	mov	[bp+FF7B],al
	cmp	al,0A
	jnz	0B3E

l0800_0B3A:
	mov	byte ptr [si],0D
	inc	si

l0800_0B3E:
	mov	al,[bp+FF7B]
	mov	[si],al
	inc	si
	lea	ax,[bp+FF7E]
	mov	dx,si
	sub	dx,ax
	cmp	dx,0080
	jl	0B91

l0800_0B53:
	lea	ax,[bp+FF7E]
	mov	di,si
	sub	di,ax
	push	di
	lea	ax,[bp+FF7E]
	push	ax
	push	word ptr [bp+04]
	call	0BE2
	add	sp,06
	mov	[bp+FF76],ax
	cmp	ax,di
	jz	0B8D

l0800_0B72:
	cmp	word ptr [bp+FF76],00
	jnc	0B7E

l0800_0B79:
	mov	ax,FFFF
	jmp	0B8B

l0800_0B7E:
	mov	ax,[bp+08]
	sub	ax,[bp+FF78]
	add	ax,[bp+FF76]
	sub	ax,di

l0800_0B8B:
	jmp	0BDC

l0800_0B8D:
	lea	si,[bp+FF7E]

l0800_0B91:
	cmp	word ptr [bp+FF78],00
	jz	0B9B

l0800_0B98:
	jmp	0B24

l0800_0B9B:
	lea	ax,[bp+FF7E]
	mov	di,si
	sub	di,ax
	mov	ax,di
	or	ax,ax
	jbe	0BD7

l0800_0BA9:
	push	di
	lea	ax,[bp+FF7E]
	push	ax
	push	word ptr [bp+04]
	call	0BE2
	add	sp,06
	mov	[bp+FF76],ax
	cmp	ax,di
	jz	0BD7

l0800_0BC0:
	cmp	word ptr [bp+FF76],00
	jnc	0BCC

l0800_0BC7:
	mov	ax,FFFF
	jmp	0BD5

l0800_0BCC:
	mov	ax,[bp+08]
	add	ax,[bp+FF76]
	sub	ax,di

l0800_0BD5:
	jmp	0BDC

l0800_0BD7:
	mov	ax,[bp+08]
	jmp	0BDC

l0800_0BDC:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret

;; fn0800_0BE2: 0800:0BE2
fn0800_0BE2 proc
	push	bp
	mov	bp,sp
	mov	bx,[bp+04]
	shl	bx,01
	test	word ptr [bx+0482],0800
	jz	0C02

l0800_0BF2:
	mov	ax,0002
	push	ax
	xor	ax,ax
	push	ax
	push	ax
	push	word ptr [bp+04]
	call	0C28
	mov	sp,bp

l0800_0C02:
	mov	ah,40
	mov	bx,[bp+04]
	mov	cx,[bp+08]
	mov	dx,[bp+06]
	int	21
	jc	0C20

l0800_0C11:
	push	ax
	mov	bx,[bp+04]
	shl	bx,01
	or	word ptr [bx+0482],1000
	pop	ax
	jmp	0C26

l0800_0C20:
	push	ax
	call	02C5
	jmp	0C26

l0800_0C26:
	pop	bp
	ret

;; fn0800_0C28: 0800:0C28
fn0800_0C28 proc
	push	bp
	mov	bp,sp
	mov	bx,[bp+04]
	shl	bx,01
	and	word ptr [bx+0482],FDFF
	mov	ah,42
	mov	al,[bp+0A]
	mov	bx,[bp+04]
	mov	cx,[bp+08]
	mov	dx,[bp+06]
	int	21
	jc	0C4A

l0800_0C48:
	jmp	0C51

l0800_0C4A:
	push	ax
	call	02C5
	cwd
	jmp	0C51

l0800_0C51:
	pop	bp
	ret

;; fn0800_0C53: 0800:0C53
fn0800_0C53 proc
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
	push	es
	mov	di,[bp+0A]
	push	ds
	pop	es
	mov	bx,[bp+08]
	cmp	bx,24
	ja	0CC1

l0800_0C69:
	cmp	bl,02
	jc	0CC1

l0800_0C6E:
	mov	ax,[bp+0C]
	mov	cx,[bp+0E]
	or	cx,cx
	jge	0C89

l0800_0C78:
	cmp	byte ptr [bp+06],00
	jz	0C89

l0800_0C7E:
	mov	byte ptr [di],2D
	inc	di
	neg	cx
	neg	ax
	sbb	cx,00

l0800_0C89:
	lea	si,[bp-22]
	jcxz	0C9D

l0800_0C8E:
	xchg	ax,cx
	sub	dx,dx
	div	bx
	xchg	ax,cx
	div	bx
	mov	[si],dl
	inc	si
	jcxz	0CA4

l0800_0C9B:
	jmp	0C8E

l0800_0C9D:
	sub	dx,dx
	div	bx
	mov	[si],dl
	inc	si

l0800_0CA4:
	or	ax,ax
	jnz	0C9D

l0800_0CA8:
	lea	cx,[bp-22]
	neg	cx
	add	cx,si
	cld

l0800_0CB0:
	dec	si
	mov	al,[si]
	sub	al,0A
	jnc	0CBB

l0800_0CB7:
	add	al,3A
	jmp	0CBE

l0800_0CBB:
	add	al,[bp+04]

l0800_0CBE:
	stosb
	loop	0CB0

l0800_0CC1:
	mov	al,00
	stosb
	pop	es
	mov	ax,[bp+0A]
	jmp	0CCA

l0800_0CCA:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	000C
0800:0CD2       55 8B EC 83 7E 08 0A 75 06 8B 46 04 99 EB   U...~..u..F...
0800:0CE0 05 8B 46 04 33 D2 52 50 FF 76 06 FF 76 08 B0 01 ..F.3.RP.v..v...
0800:0CF0 50 B0 61 50 E8 5C FF EB 00 5D C3 55 8B EC FF 76 P.aP.\...].U...v
0800:0D00 06 FF 76 04 FF 76 08 FF 76 0A B0 00 50 B0 61 50 ..v..v..v...P.aP
0800:0D10 E8 40 FF EB 00 5D C3 55 8B EC FF 76 06 FF 76 04 .@...].U...v..v.
0800:0D20 FF 76 08 FF 76 0A 83 7E 0A 0A 75 05 B8 01 00 EB .v..v..~..u.....
0800:0D30 02 33 C0 50 B0 61 50 E8 19 FF EB 00 5D C3 BA AE .3.P.aP.....]...
0800:0D40 04 EB 03 BA B3 04 B9 05 00 90 B4 40 BB 02 00 CD ...........@....
0800:0D50 21 B9 27 00 90 BA B8 04 B4 40 CD 21 E9 83 F4    !.'......@.!...

;; fn0800_0D5F: 0800:0D5F
fn0800_0D5F proc
	push	bp
	mov	bp,sp
	sub	sp,04
	mov	bx,[bp+04]
	shl	bx,01
	test	word ptr [bx+0482],0200
	jz	0D78

l0800_0D72:
	mov	ax,0001
	jmp	0DC9
0800:0D77                      90                                .       

l0800_0D78:
	mov	ax,4400
	mov	bx,[bp+04]
	int	21
	jc	0DC3

l0800_0D82:
	test	dl,80
	jnz	0DBF

l0800_0D87:
	mov	ax,4201
	xor	cx,cx
	xor	dx,dx
	int	21
	jc	0DC3

l0800_0D92:
	push	dx
	push	ax
	mov	ax,4202
	xor	cx,cx
	xor	dx,dx
	int	21
	mov	[bp-04],ax
	mov	[bp-02],dx
	pop	dx
	pop	cx
	jc	0DC3

l0800_0DA7:
	mov	ax,4200
	int	21
	jc	0DC3

l0800_0DAE:
	cmp	dx,[bp-02]
	jc	0DBF

l0800_0DB3:
	ja	0DBA

l0800_0DB5:
	cmp	ax,[bp-04]
	jc	0DBF

l0800_0DBA:
	mov	ax,0001
	jmp	0DC9

l0800_0DBF:
	xor	ax,ax
	jmp	0DC9

l0800_0DC3:
	push	ax
	call	02C5
	jmp	0DC9

l0800_0DC9:
	mov	sp,bp
	pop	bp
	ret

;; fn0800_0DCD: 0800:0DCD
fn0800_0DCD proc
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,[bp+04]
	mov	ax,[si+0E]
	cmp	ax,si
	jz	0DE1

l0800_0DDC:
	mov	ax,FFFF
	jmp	0E47

l0800_0DE1:
	cmp	word ptr [si],00
	jl	0E13

l0800_0DE6:
	test	word ptr [si+02],0008
	jnz	0DF9

l0800_0DED:
	mov	ax,[si+0A]
	mov	dx,si
	add	dx,05
	cmp	ax,dx
	jnz	0E0F

l0800_0DF9:
	mov	word ptr [si],0000
	mov	ax,[si+0A]
	mov	dx,si
	add	dx,05
	cmp	ax,dx
	jnz	0E0F

l0800_0E09:
	mov	ax,[si+08]
	mov	[si+0A],ax

l0800_0E0F:
	xor	ax,ax
	jmp	0E47

l0800_0E13:
	mov	di,[si+06]
	add	di,[si]
	inc	di
	sub	[si],di
	push	di
	mov	ax,[si+08]
	mov	[si+0A],ax
	push	ax
	mov	al,[si+04]
	cbw
	push	ax
	call	0ACF
	add	sp,06
	cmp	ax,di
	jz	0E43

l0800_0E32:
	test	word ptr [si+02],0200
	jnz	0E43

l0800_0E39:
	or	word ptr [si+02],0010
	mov	ax,FFFF
	jmp	0E47

l0800_0E43:
	xor	ax,ax
	jmp	0E47

l0800_0E47:
	pop	di
	pop	si
	pop	bp
	ret

;; fn0800_0E4B: 0800:0E4B
fn0800_0E4B proc
	push	bp
	mov	bp,sp
	mov	ax,0F81
	push	ax
	mov	ax,0352
	push	ax
	push	word ptr [bp+04]
	lea	ax,[bp+06]
	push	ax
	call	1073
	jmp	0E62

l0800_0E62:
	pop	bp
	ret

;; fn0800_0E64: 0800:0E64
fn0800_0E64 proc
	push	bp
	mov	bp,sp
	mov	bx,[bp+06]
	dec	word ptr [bx]
	push	word ptr [bp+06]
	mov	al,[bp+04]
	cbw
	push	ax
	call	0E7D
	mov	sp,bp
	jmp	0E7B

l0800_0E7B:
	pop	bp
	ret

;; fn0800_0E7D: 0800:0E7D
fn0800_0E7D proc
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	mov	si,[bp+06]
	mov	al,[bp+04]
	mov	[bp-01],al

l0800_0E8D:
	inc	word ptr [si]
	jge	0EC7

l0800_0E91:
	mov	al,[bp-01]
	inc	word ptr [si+0A]
	mov	bx,[si+0A]
	mov	[bx-01],al
	test	word ptr [si+02],0008
	jz	0EBF

l0800_0EA4:
	cmp	byte ptr [bp-01],0A
	jz	0EB0

l0800_0EAA:
	cmp	byte ptr [bp-01],0D
	jnz	0EBF

l0800_0EB0:
	push	si
	call	0DCD
	pop	cx
	or	ax,ax
	jz	0EBF

l0800_0EB9:
	mov	ax,FFFF
	jmp	0F66

l0800_0EBF:
	mov	al,[bp-01]
	mov	ah,00
	jmp	0F66

l0800_0EC7:
	dec	word ptr [si]
	test	word ptr [si+02],0090
	jnz	0ED7

l0800_0ED0:
	test	word ptr [si+02],0002
	jnz	0EE2

l0800_0ED7:
	or	word ptr [si+02],0010
	mov	ax,FFFF
	jmp	0F66

l0800_0EE2:
	or	word ptr [si+02],0100
	cmp	word ptr [si+06],00
	jz	0F11

l0800_0EED:
	cmp	word ptr [si],00
	jz	0F02

l0800_0EF2:
	push	si
	call	0DCD
	pop	cx
	or	ax,ax
	jz	0F00

l0800_0EFB:
	mov	ax,FFFF
	jmp	0F66

l0800_0F00:
	jmp	0F0C

l0800_0F02:
	mov	ax,[si+06]
	mov	dx,FFFF
	sub	dx,ax
	mov	[si],dx

l0800_0F0C:
	jmp	0E8D
0800:0F0F                                              EB                .
0800:0F10 55                                              U              

l0800_0F11:
	cmp	byte ptr [bp-01],0A
	jnz	0F36

l0800_0F17:
	test	word ptr [si+02],0040
	jnz	0F36

l0800_0F1E:
	mov	ax,0001
	push	ax
	mov	ax,04E0
	push	ax
	mov	al,[si+04]
	cbw
	push	ax
	call	0BE2
	add	sp,06
	cmp	ax,0001
	jnz	0F4E

l0800_0F36:
	mov	ax,0001
	push	ax
	lea	ax,[bp+04]
	push	ax
	mov	al,[si+04]
	cbw
	push	ax
	call	0BE2
	add	sp,06
	cmp	ax,0001
	jz	0F5F

l0800_0F4E:
	test	word ptr [si+02],0200
	jnz	0F5F

l0800_0F55:
	or	word ptr [si+02],0010
	mov	ax,FFFF
	jmp	0F66

l0800_0F5F:
	mov	al,[bp-01]
	mov	ah,00
	jmp	0F66

l0800_0F66:
	pop	si
	mov	sp,bp
	pop	bp
	ret
0800:0F6B                                  55 8B EC 56 8B            U..V.
0800:0F70 76 04 B8 52 03 50 56 E8 03 FF 59 59 EB 00 5E 5D v..R.PV...YY..^]
0800:0F80 C3 55 8B EC 83 EC 02 56 57 8B 76 04 8B 7E 06 89 .U.....VW.v..~..
0800:0F90 7E FE F7 44 02 08 00 74 26 EB 1A 56 8B 5E 08 FF ~..D...t&..V.^..
0800:0FA0 46 08 8A 07 98 50 E8 D4 FE 59 59 3D FF FF 75 05 F....P...YY=..u.
0800:0FB0 33 C0 E9 87 00 8B C7 4F 0B C0 75 DF E9 78 00 F7 3......O..u..x..
0800:0FC0 44 02 40 00 74 38 83 7C 06 00 74 32 8B 44 06 3B D.@.t8.|..t2.D.;
0800:0FD0 C7 73 2B 83 3C 00 74 0D 56 E8 F1 FD 59 0B C0 74 .s+.<.t.V...Y..t
0800:0FE0 04 33 C0 EB 57 57 FF 76 08 8A 44 04 98 50 E8 F1 .3..WW.v..D..P..
0800:0FF0 FB 83 C4 06 3B C7 73 04 33 C0 EB 40 EB 39 EB 30 ....;.s.3..@.9.0
0800:1000 FF 04 7D 15 8B 5E 08 FF 46 08 8A 07 FF 44 0A 8B ..}..^..F....D..
0800:1010 5C 0A 88 47 FF B4 00 EB 0E 56 8B 5E 08 FF 46 08 \..G.....V.^..F.
0800:1020 FF 37 E8 3F FE 59 59 3D FF FF 75 04 33 C0 EB 0C .7.?.YY=..u.3...
0800:1030 8B C7 4F 0B C0 75 C9 8B 46 FE EB 00 5F 5E 8B E5 ..O..u..F..._^..
0800:1040 5D C2 06 00                                     ]...           

;; fn0800_1044: 0800:1044
fn0800_1044 proc
	jmp	word ptr [05E0]

;; fn0800_1048: 0800:1048
fn0800_1048 proc
	push	bp
	mov	bp,sp
	mov	dx,[bp+04]
	mov	cx,0F04
	mov	bx,04E9
	cld
	mov	al,dh
	shr	al,cl
	xlat
	stosb
	mov	al,dh
	and	al,ch
	xlat
	stosb
	mov	al,dl
	shr	al,cl
	xlat
	stosb
	mov	al,dl
	and	al,ch
	xlat
	stosb
	jmp	106F

l0800_106F:
	pop	bp
	ret	0002

;; fn0800_1073: 0800:1073
fn0800_1073 proc
	push	bp
	mov	bp,sp
	sub	sp,0098
	push	si
	push	di
	mov	word ptr [bp-58],0000
	mov	byte ptr [bp-55],50
	mov	word ptr [bp-02],0000
	jmp	10CD

;; fn0800_108C: 0800:108C
fn0800_108C proc
	push	di
	mov	cx,FFFF
	xor	al,al

l0800_1092:
	repne scasb

l0800_1094:
	not	cx
	dec	cx
	pop	di
	ret

;; fn0800_1099: 0800:1099
fn0800_1099 proc
	mov	[di],al
	inc	di
	dec	byte ptr [bp-55]
	jle	10CC

;; fn0800_10A1: 0800:10A1
fn0800_10A1 proc
	push	bx
	push	cx
	push	dx
	push	es
	lea	ax,[bp-54]
	sub	di,ax
	lea	ax,[bp-54]
	push	ax
	push	di
	push	word ptr [bp+08]
	call	word ptr [bp+0A]
	or	ax,ax
	jnz	10BE

l0800_10B9:
	mov	word ptr [bp-02],0001

l0800_10BE:
	mov	byte ptr [bp-55],50
	add	[bp-58],di
	lea	di,[bp-54]
	pop	es
	pop	dx
	pop	cx
	pop	bx

l0800_10CC:
	ret

l0800_10CD:
	push	es
	cld
	lea	di,[bp-54]
	mov	[bp+FF6A],di
	mov	di,[bp+FF6A]
	mov	si,[bp+06]

l0800_10DD:
	lodsb
	or	al,al
	jz	10F3

l0800_10E2:
	cmp	al,25
	jz	10F6

l0800_10E6:
	mov	[di],al
	inc	di
	dec	byte ptr [bp-55]
	jg	10DD

l0800_10EE:
	call	10A1
	jmp	10DD

l0800_10F3:
	jmp	1572

l0800_10F6:
	mov	[bp+FF76],si
	lodsb
	cmp	al,25
	jz	10E6

l0800_10FF:
	mov	[bp+FF6A],di
	xor	cx,cx
	mov	[bp+FF74],cx
	mov	[bp+FF68],cx
	mov	[bp+FF73],cl
	mov	word ptr [bp+FF6E],FFFF
	mov	word ptr [bp+FF70],FFFF
	jmp	1120

l0800_111F:
	lodsb

l0800_1120:
	xor	ah,ah
	mov	dx,ax
	mov	bx,ax
	sub	bl,20
	cmp	bl,60
	jnc	1175

l0800_112E:
	mov	bl,[bx+04F9]
	mov	ax,bx
	cmp	ax,0017
	jbe	113C

l0800_1139:
	jmp	1560

l0800_113C:
	mov	bx,ax
	shl	bx,01
	jmp	word ptr cs:[bx+1145]
;; Code vector at 0800:1145 (8 bytes)
	0800:1190
	0800:1178
	0800:11D1
	0800:1184
0800:1145                90 11 78 11 D1 11 84 11               ..x.....  
0800:114D                                        F6 11 00              ...
0800:1150 12 42 12 4C 12 5C 12 B7 11 91 12 6C 12 70 12 74 .B.L.\.....l.p.t
0800:1160 12 16 13 C8 13 69 13 89 13 33 15 60 15 60 15 60 .....i...3.`.`.`
0800:1170 15 A3 11 AD 11                                  .....          

l0800_1175:
	jmp	1560

l0800_1178:
	cmp	ch,00
	ja	1175

l0800_117D:
	or	word ptr [bp+FF68],01
	jmp	111F

l0800_1184:
	cmp	ch,00
	ja	1175

l0800_1189:
	or	word ptr [bp+FF68],02
	jmp	111F

l0800_1190:
	cmp	ch,00
	ja	1175

l0800_1195:
	cmp	byte ptr [bp+FF73],2B
	jz	11A0

l0800_119C:
	mov	[bp+FF73],dl

l0800_11A0:
	jmp	111F
0800:11A3          83 A6 68 FF DF B5 05 E9 72 FF 83 8E 68    ..h.....r...h
0800:11B0 FF 20 B5 05 E9 68 FF 80 FD 00 77 44 F7 86 68 FF . ...h....wD..h.
0800:11C0 02 00 75 21 83 8E 68 FF 08 B5 01 E9 51 FF       ..u!..h.....Q. 

l0800_11CE:
	jmp	1560

l0800_11D1:
	mov	di,[bp+04]
	mov	ax,[di]
	add	word ptr [bp+04],02
	cmp	ch,02
	jnc	11E8

l0800_11DF:
	mov	[bp+FF6E],ax
	mov	ch,03
	jmp	111F

l0800_11E8:
	cmp	ch,04
	jnz	11CE

l0800_11ED:
	mov	[bp+FF70],ax
	inc	ch
	jmp	111F
0800:11F6                   80 FD 04 73 D3 B5 04 E9 1F FF       ...s......
0800:1200 92 2C 30 98 80 FD 02 77 1B B5 02 87 86 6E FF 0B .,0....w.....n..
0800:1210 C0 7C D2 D1 E0 8B D0 D1 E0 D1 E0 03 C2 01 86 6E .|.............n
0800:1220 FF E9 FB FE 80 FD 04 75 A5 87 86 70 FF 0B C0 7C .......u...p...|
0800:1230 B4 D1 E0 8B D0 D1 E0 D1 E0 03 C2 01 86 70 FF E9 .............p..
0800:1240 DD FE 83 8E 68 FF 10 B5 05 E9 D3 FE 81 8E 68 FF ....h.........h.
0800:1250 00 01 83 A6 68 FF EF B5 05 E9 C3 FE 83 A6 68 FF ....h.........h.
0800:1260 EF 81 8E 68 FF 80 00 B5 05 E9 B3 FE B7 08 EB 0A ...h............
0800:1270 B7 0A EB 0B B7 10 B3 E9 02 DA C6 86 73 FF 00 C6 ............s...
0800:1280 86 6D FF 00 88 96 6C FF 8B 7E 04 8B 05 33 D2 EB .m....l..~...3..
0800:1290 11 B7 0A C6 86 6D FF 01 88 96 6C FF 8B 7E 04 8B .....m....l..~..
0800:12A0 05 99 47 47 89 76 06 F7 86 68 FF 10 00 74 04 8B ..GG.v...h...t..
0800:12B0 15 47 47 89 7E 04 8D BE 79 FF 0B C0 75 33 0B D2 .GG.~...y...u3..
0800:12C0 75 2F 83 BE 70 FF 00 75 2D 8B BE 6A FF 8B 8E 6E u/..p..u-..j...n
0800:12D0 FF E3 1B 83 F9 FF 74 16 8B 86 68 FF 25 08 00 74 ......t...h.%..t
0800:12E0 04 B2 30 EB 02 B2 20 8A C2 E8 AD FD E2 F9 E9 E9 ..0... .........
0800:12F0 FD 83 8E 68 FF 04 52 50 57 8A C7 98 50 8A 86 6D ...h..RPW...P..m
0800:1300 FF 50 53 E8 4D F9 16 07 8B 96 70 FF 0B D2 7F 03 .PS.M.....p.....
0800:1310 E9 14 01 E9 21 01 88 96 6C FF 89 76 06 8D BE 78 ....!...l..v...x
0800:1320 FF 8B 5E 04 FF 37 43 43 89 5E 04 F7 86 68 FF 20 ..^..7CC.^...h. 
0800:1330 00 74 0F FF 37 43 43 89 5E 04 16 07 E8 09 FD B0 .t..7CC.^.......
0800:1340 3A AA 16 07 E8 01 FD C6 05 00 C6 86 6D FF 00 83 :...........m...
0800:1350 A6 68 FF FB 8D 8E 78 FF 2B F9 87 CF 8B 96 70 FF .h....x.+.....p.
0800:1360 3B D1 7F 02 8B D1 E9 BE 00 89 76 06 88 96 6C FF ;.........v...l.
0800:1370 8B 7E 04 8B 05 83 46 04 02 16 07 8D BE 79 FF 32 .~....F......y.2
0800:1380 E4 89 05 B9 01 00 E9 DF 00 89 76 06 88 96 6C FF ..........v...l.
0800:1390 8B 7E 04 F7 86 68 FF 20 00 75 0C 8B 3D 83 46 04 .~...h. .u..=.F.
0800:13A0 02 1E 07 0B FF EB 0A C4 3D 83 46 04 04 8C C0 0B ........=.F.....
0800:13B0 C7 75 05 1E 07 BF E2 04 E8 D1 FC 3B 8E 70 FF 76 .u.........;.p.v
0800:13C0 04 8B 8E 70 FF E9 A0 00 89 76 06 88 96 6C FF 8B ...p.....v...l..
0800:13D0 7E 04 8B 8E 70 FF 0B C9 7D 03 B9 06 00 57 51 8D ~...p...}....WQ.
0800:13E0 9E 79 FF 53 52 B8 01 00 23 86 68 FF 50 8B 86 68 .y.SR...#.h.P..h
0800:13F0 FF A9 80 00 74 0A B8 02 00 C7 46 FC 04 00 EB 17 ....t.....F.....
0800:1400 A9 00 01 74 0A B8 08 00 C7 46 FC 0A 00 EB 08 C7 ...t.....F......
0800:1410 46 FC 08 00 B8 06 00 50 E8 29 FC 8B 46 FC 01 46 F......P.)..F..F
0800:1420 04 16 07 8D BE 79 FF F7 86 68 FF 08 00 74 1A 8B .....y...h...t..
0800:1430 96 6E FF 0B D2 7E 12 E8 52 FC 26 80 3D 2D 75 01 .n...~..R.&.=-u.
0800:1440 49 2B D1 7E 04 89 96 74 FF 8A 86 73 FF 0A C0 74 I+.~...t...s...t
0800:1450 14 26 80 3D 2D 74 0E 83 AE 74 FF 01 83 96 74 FF .&.=-t...t....t.
0800:1460 00 4F 26 88 05 E8 24 FC 8B F7 8B BE 6A FF 8B 9E .O&...$.....j...
0800:1470 6E FF B8 05 00 23 86 68 FF 3D 05 00 75 16 8A A6 n....#.h.=..u...
0800:1480 6C FF 80 FC 6F 75 10 83 BE 74 FF 00 7F 06 C7 86 l...ou...t......
0800:1490 74 FF 01 00 EB 1F 90 80 FC 78 74 05 80 FC 58 75 t........xt...Xu
0800:14A0 14 83 8E 68 FF 40 4B 4B 83 AE 74 FF 02 7D 06 C7 ...h.@KK..t..}..
0800:14B0 86 74 FF 00 00 03 8E 74 FF F7 86 68 FF 02 00 75 .t.....t...h...u
0800:14C0 0C EB 06 B0 20 E8 D1 FB 4B 3B D9 7F F6 F7 86 68 .... ...K;.....h
0800:14D0 FF 40 00 74 0C B0 30 E8 BF FB 8A 86 6C FF E8 B8 .@.t..0.....l...
0800:14E0 FB 8B 96 74 FF 0B D2 7E 27 2B CA 2B DA 26 8A 04 ...t...~'+.+.&..
0800:14F0 3C 2D 74 08 3C 20 74 04 3C 2B 75 07 26 AC E8 98 <-t.< t.<+u.&...
0800:1500 FB 49 4B 87 CA E3 07 B0 30 E8 8D FB E2 F9 87 CA .IK.....0.......
0800:1510 E3 11 2B D9 26 AC 88 05 47 FE 4E AB 7F 03 E8 80 ..+.&...G.N.....
0800:1520 FB E2 F1 0B DB 7E 09 8B CB B0 20 E8 6B FB E2 F9 .....~.... .k...
0800:1530 E9 A7 FB 89 76 06 8B 7E 04 F7 86 68 FF 20 00 75 ....v..~...h. .u
0800:1540 0A 8B 3D 83 46 04 02 1E 07 EB 06 C4 3D 83 46 04 ..=.F.......=.F.
0800:1550 04 B8 50 00 2A 46 AB 03 46 A8 26 89 05 E9 76 FB ..P.*F..F.&...v.

l0800_1560:
	mov	si,[bp+FF76]
	mov	di,[bp+FF6A]
	mov	al,25

l0800_156A:
	call	1099
	lodsb
	or	al,al
	jnz	156A

l0800_1572:
	cmp	byte ptr [bp-55],50
	jge	157B

l0800_1578:
	call	10A1

l0800_157B:
	pop	es
	cmp	word ptr [bp-02],00
	jz	1589

l0800_1582:
	mov	ax,FFFF
	jmp	158E
0800:1587                      EB 05                             ..      

l0800_1589:
	mov	ax,[bp-58]
	jmp	158E

l0800_158E:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	0008

;; fn0800_1596: 0800:1596
fn0800_1596 proc
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,[bp+04]
	cmp	word ptr [062A],00
	jz	15C1

l0800_15A5:
	mov	bx,[062A]
	mov	di,[bx+06]
	mov	bx,[062A]
	mov	[bx+06],si
	mov	[di+04],si
	mov	[si+06],di
	mov	ax,[062A]
	mov	[si+04],ax
	jmp	15CB

l0800_15C1:
	mov	[062A],si
	mov	[si+04],si
	mov	[si+06],si

l0800_15CB:
	pop	di
	pop	si
	pop	bp
	ret

;; fn0800_15CF: 0800:15CF
fn0800_15CF proc
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	push	di
	mov	si,[bp+06]
	mov	di,[bp+04]
	mov	ax,[si]
	add	[di],ax
	mov	ax,[0628]
	cmp	ax,si
	jnz	15EE

l0800_15E8:
	mov	[0628],di
	jmp	15FB

l0800_15EE:
	mov	ax,[si]
	add	ax,si
	mov	[bp-02],ax
	mov	bx,[bp-02]
	mov	[bx+02],di

l0800_15FB:
	push	si
	call	0491
	pop	cx
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret

;; fn0800_1606: 0800:1606
fn0800_1606 proc
	push	si
	mov	ax,[062C]
	cmp	ax,[0628]
	jnz	1622

l0800_1610:
	push	word ptr [062C]
	call	063B
	pop	cx
	xor	ax,ax
	mov	[0628],ax
	mov	[062C],ax
	jmp	165D

l0800_1622:
	mov	bx,[0628]
	mov	si,[bx+02]
	test	word ptr [si],0001
	jnz	1651

l0800_162F:
	push	si
	call	0491
	pop	cx
	cmp	si,[062C]
	jnz	1644

l0800_163A:
	xor	ax,ax
	mov	[0628],ax
	mov	[062C],ax
	jmp	164A

l0800_1644:
	mov	ax,[si+02]
	mov	[0628],ax

l0800_164A:
	push	si
	call	063B
	pop	cx
	jmp	165D

l0800_1651:
	push	word ptr [0628]
	call	063B
	pop	cx
	mov	[0628],si

l0800_165D:
	pop	si
	ret

;; fn0800_165F: 0800:165F
fn0800_165F proc
	push	bp
	mov	bp,sp
	sub	sp,02
	push	si
	push	di
	mov	si,[bp+04]
	dec	word ptr [si]
	mov	ax,[si]
	add	ax,si
	mov	[bp-02],ax
	mov	di,[si+02]
	test	word ptr [di],0001
	jnz	1690

l0800_167C:
	cmp	si,[062C]
	jz	1690

l0800_1682:
	mov	ax,[si]
	add	[di],ax
	mov	bx,[bp-02]
	mov	[bx+02],di
	mov	si,di
	jmp	1695

l0800_1690:
	push	si
	call	1596
	pop	cx

l0800_1695:
	mov	bx,[bp-02]
	test	word ptr [bx],0001
	jnz	16A7

l0800_169E:
	push	word ptr [bp-02]
	push	si
	call	15CF
	pop	cx
	pop	cx

l0800_16A7:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret

;; fn0800_16AD: 0800:16AD
fn0800_16AD proc
	push	bp
	mov	bp,sp
	push	si
	mov	si,[bp+04]
	or	si,si
	jnz	16BA

l0800_16B8:
	jmp	16D1

l0800_16BA:
	mov	ax,si
	add	ax,FFFC
	mov	si,ax
	cmp	si,[0628]
	jnz	16CC

l0800_16C7:
	call	1606
	jmp	16D1

l0800_16CC:
	push	si
	call	165F
	pop	cx

l0800_16D1:
	pop	si
	pop	bp
	ret

;; fn0800_16D4: 0800:16D4
fn0800_16D4 proc
	push	bp
	mov	bp,sp
	lea	ax,[bp+06]
	push	ax
	push	word ptr [bp+04]
	mov	ax,0342
	push	ax
	mov	ax,1D65
	push	ax
	mov	ax,07F2
	push	ax
	call	16F3
	mov	sp,bp
	jmp	16F1

l0800_16F1:
	pop	bp
	ret

;; fn0800_16F3: 0800:16F3
fn0800_16F3 proc
	push	bp
	mov	bp,sp
	sub	sp,2A
	push	si
	push	di
	mov	word ptr [bp-28],0000
	mov	word ptr [bp-26],0000
	jmp	1721
0800:1707                      90                                .       

;; fn0800_1708: 0800:1708
fn0800_1708 proc
	mov	di,[bp+0C]
	test	byte ptr [bp-29],20
	jz	1718

l0800_1711:
	les	di,[di]
	add	word ptr [bp+0C],04
	ret

l0800_1718:
	mov	di,[di]
	push	ds
	pop	es
	add	word ptr [bp+0C],02
	ret

l0800_1721:
	push	es
	cld
	mov	si,[bp+0A]

l0800_1726:
	lodsb
	or	al,al
	jz	1788

l0800_172B:
	cmp	al,25
	jz	178B

l0800_172F:
	cbw
	xchg	ax,di
	inc	word ptr [bp-26]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	or	ax,ax
	jl	1764

l0800_173F:
	or	di,di
	js	1775

l0800_1743:
	cmp	byte ptr [di+055A],01
	jnz	1775

l0800_174A:
	xchg	ax,bx
	or	bl,bl
	js	1767

l0800_174F:
	cmp	byte ptr [bx+055A],01
	jnz	1767

l0800_1756:
	inc	word ptr [bp-26]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	or	ax,ax
	jg	174A

l0800_1764:
	jmp	1AEB

l0800_1767:
	push	word ptr [bp+08]
	push	bx
	call	word ptr [bp+06]
	pop	cx
	pop	cx
	dec	word ptr [bp-26]
	jmp	1726

l0800_1775:
	cmp	ax,di
	jz	1726

l0800_1779:
	push	word ptr [bp+08]
	push	ax
	call	word ptr [bp+06]
	pop	cx
	pop	cx
	dec	word ptr [bp-26]
	jmp	1AFF

l0800_1788:
	jmp	1AFF

l0800_178B:
	mov	word ptr [bp-22],FFFF
	mov	byte ptr [bp-29],00
	lodsb
	cbw
	mov	[bp+0A],si
	xchg	ax,di
	or	di,di
	jl	17E6

l0800_179E:
	mov	bl,[di+055A]
	xor	bh,bh
	mov	ax,bx
	cmp	ax,0015
	jbe	17AE

l0800_17AB:
	jmp	1AEB

l0800_17AE:
	mov	bx,ax
	shl	bx,01
	jmp	word ptr cs:[bx+17B7]
;; Code vector at 0800:17B7 (47 bytes)
	0800:17E6
0800:17B7                      E6 17 E6 17 E6 17 E3 17 E9        .........
0800:17C0 17 EF 17 C8 19 37 18 37 18 41 18 08 19 03 18 0F .....7.7.A......
0800:17D0 18 09 18 32 18 6C 19 06 1A 24 18 3C 18 95 18 16 ...2.l...$.<....
0800:17E0 18 1D 18 E9 49 FF                               ....I.         

l0800_17E6:
	jmp	1AFF
0800:17E9                            80 4E D7 01 EB A5 83          .N.....
0800:17F0 EF 30 87 7E DE 0B FF 7C 9B B8 0A 00 F7 E7 01 46 .0.~...|.......F
0800:1800 DE EB 91 80 4E D7 08 EB 8B 80 4E D7 04 EB 85 80 ....N.....N.....
0800:1810 4E D7 02 E9 7E FF 80 66 D7 DF E9 77 FF 80 4E D7 N...~..f...w..N.
0800:1820 20 E9 70 FF 8B 46 DA 2B D2 F6 46 D7 01 74 4F E9  .p..F.+..F..tO.
0800:1830 62 FF BE 08 00 EB 0D BE 0A 00 EB 08 BE 10 00 EB b...............
0800:1840 03 BE 00 00 F7 C7 20 00 75 04 80 4E D7 04 8D 46 ...... .u..N...F
0800:1850 DC 50 8D 46 DA 50 8B 46 DE 25 FF 7F 50 8B C6 50 .P.F.P.F.%..P..P
0800:1860 FF 76 08 FF 76 06 FF 76 04 E8 60 03 83 C4 0E 83 .v..v..v..`.....
0800:1870 7E DC 00 7E 18 F6 46 D7 01 75 0F FF 46 D8 E8 87 ~..~..F..u..F...
0800:1880 FE AB F6 46 D7 04 74 02 92 AB E9 96 FE 7C 03 E9 ...F..t......|..
0800:1890 6D 02 E9 56 02 E8 00 00                         m..V....       

;; fn0800_1898: 0800:1898
fn0800_1898 proc
	jmp	1B06
0800:189B                                  FF 76 08 50 FF            .v.P.
0800:18A0 56 06 59 59 FF 4E DA 81 66 DE FF 7F E8 00 00    V.YY.N..f......

;; fn0800_18AF: 0800:18AF
fn0800_18AF proc
	jmp	1B2C
0800:18B2       52 3C 3A 74 15 0B C0 7E 0C FF 76 08 50 FF   R<:t...~..v.P.
0800:18C0 56 06 59 59 FF 4E DA 5A 8C DB EB 1B E8 00 00    V.YY.N.Z.......

;; fn0800_18CF: 0800:18CF
fn0800_18CF proc
	jmp	1B2C
0800:18D2       5B 0B C0 7E 10 52 53 FF 76 08 50 FF 56 06   [..~.RS.v.P.V.
0800:18E0 59 59 FF 4E DA 5B 5A F6 46 D7 01 75 10 E8 18 FE YY.N.[Z.F..u....
0800:18F0 FF 46 D8 92 AB F6 46 D7 20 74 02 93 AB E9 23 FE .F....F. t....#.
0800:1900 7C 03 E9 FA 01 E9 E3 01 8D 46 DC 50 8D 46 DA 50 |........F.P.F.P
0800:1910 B8 FF 7F 23 46 DE 50 FF 76 08 FF 76 06 FF 76 04 ...#F.P.v..v..v.
0800:1920 E8 6F 02 83 C4 0C 83 7E DC 00 7E 38 F6 46 D7 01 .o.....~..~8.F..
0800:1930 74 03 EB 2A 90 E8 D0 FD FF 46 D8 F6 46 D7 04 74 t..*.....F..F..t
0800:1940 05 B8 04 00 EB 0D F6 46 D7 08 74 05 B8 08 00 EB .......F..t.....
0800:1950 02 33 C0 50 57 E8 3E 02 83 C4 04 E9 C5 FD E8 39 .3.PW.>........9
0800:1960 02 E9 BF FD E8 33 02 7C 9C E9 93 01 E8 00 00    .....3.|.......

;; fn0800_196F: 0800:196F
fn0800_196F proc
	jmp	1B06
0800:1972       F6 46 D7 01 75 06 E8 8D FD FF 46 D8 81 66   .F..u.....F..f
0800:1980 DE FF 7F 74 29 F6 46 D7 01 75 01 AA FF 46 DA 06 ...t).F..u...F..
0800:1990 FF 76 08 FF 56 04 59 07 0B C0 7E 12 0A C0 78 09 .v..V.Y...~...x.
0800:19A0 93 80 BF 5A 05 01 93 7E 05 FF 4E DE 7F D7 06 FF ...Z...~..N.....
0800:19B0 76 08 50 FF 56 06 59 59 07 FF 4E DA F6 46 D7 01 v.P.V.YY..N..F..
0800:19C0 75 03 B0 00 AA E9 5B FD F6 46 D7 01 75 03 E8 37 u.....[..F..u..7
0800:19D0 FD 8B 76 DE 0B F6 7D 03 BE 01 00 74 1A FF 46 DA ..v...}....t..F.
0800:19E0 06 FF 76 08 FF 56 04 59 07 F6 46 D7 01 75 01 AA ..v..V.Y..F..u..
0800:19F0 0B C0 7C 0F 4E 7F E6 F6 46 D7 01 75 03 FF 46 D8 ..|.N...F..u..F.
0800:1A00 E9 20 FD E9 E5 00 2B C0 FC 16 07 8D 7E E0 B9 10 . ....+.....~...
0800:1A10 00 F3 AB AC 80 66 D7 EF 3C 5E 75 05 80 4E D7 10 .....f..<^u..N..
0800:1A20 AC B4 00 8A D0 8B F8 B1 03 D3 EF B9 07 01 22 CA ..............".
0800:1A30 D2 E5 08 6B E0 AC 3C 00 74 26 3C 5D 74 25 3C 2D ...k..<.t&<]t%<-
0800:1A40 75 E1 3A 14 77 DD 80 3C 5D 74 D8 AC 2A C2 74 E5 u.:.w..<]t..*.t.
0800:1A50 02 D0 D0 C5 83 D7 00 08 6B E0 FE C8 75 F4 EB D5 ........k...u...
0800:1A60 E9 9C 00 89 76 0A 81 66 DE FF 7F 8B 76 DE F6 46 ....v..f....v..F
0800:1A70 D7 01 75 03 E8 91 FC 4E 7C 50 FF 46 DA 06 FF 76 ..u....N|P.F...v
0800:1A80 08 FF 56 04 59 07 0B C0 7C 4F 96 8B DE B1 03 D3 ..V.Y...|O......
0800:1A90 EE B9 07 01 22 CB D2 E5 84 6A E0 96 93 74 08 F6 ...."....j...t..
0800:1AA0 46 D7 10 74 08 EB 0F F6 46 D7 10 74 09 F6 46 D7 F..t....F..t..F.
0800:1AB0 01 75 C4 AA EB C1 06 FF 76 08 50 FF 56 06 59 59 .u......v.P.V.YY
0800:1AC0 07 FF 4E DA 46 3B 76 DE 7D 09 F6 46 D7 01 75 06 ..N.F;v.}..F..u.
0800:1AD0 FF 46 D8 B0 00 AA E9 4A FC 46 3B 76 DE 7D 0C F6 .F.....J.F;v.}..
0800:1AE0 46 D7 01 75 06 B0 00 AA FF 46 D8                F..u.....F.    

;; fn0800_1AEB: 0800:1AEB
fn0800_1AEB proc
	push	word ptr [bp+08]
	mov	ax,FFFF
	push	ax
	call	word ptr [bp+06]
	pop	cx
	pop	cx
	cmp	word ptr [bp-28],01
	sbb	word ptr [bp-28],00

l0800_1AFF:
	pop	es
	mov	ax,[bp-28]
	jmp	1B8C

;; fn0800_1B06: 0800:1B06
fn0800_1B06 proc
	inc	word ptr [bp-26]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	or	ax,ax
	jle	1B27

l0800_1B14:
	or	al,al
	js	1B21

l0800_1B18:
	xchg	ax,bx
	cmp	byte ptr [bx+055A],01
	xchg	ax,bx
	jz	1B06

l0800_1B21:
	pop	cx
	add	cx,03
	jmp	cx

l0800_1B27:
	jz	1B21

l0800_1B29:
	pop	cx
	jmp	1AEB

;; fn0800_1B2C: 0800:1B2C
fn0800_1B2C proc
	sub	dx,dx
	mov	cx,0004

l0800_1B31:
	dec	word ptr [bp-22]
	jl	1B7B

l0800_1B36:
	push	dx
	push	cx
	inc	word ptr [bp-26]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	pop	cx
	pop	dx
	or	ax,ax
	jle	1B7D

l0800_1B48:
	dec	cl
	jl	1B7D

l0800_1B4C:
	mov	ch,al
	sub	ch,30
	jc	1B7D

l0800_1B53:
	cmp	ch,0A
	jc	1B6F

l0800_1B58:
	sub	ch,11
	jc	1B7D

l0800_1B5D:
	cmp	ch,06
	jc	1B6C

l0800_1B62:
	sub	ch,20
	jc	1B7D

l0800_1B67:
	cmp	ch,06
	jnc	1B7D

l0800_1B6C:
	add	ch,0A

l0800_1B6F:
	shl	dx,01
	shl	dx,01
	shl	dx,01
	shl	dx,01
	add	dl,ch
	jmp	1B31

l0800_1B7B:
	sub	ax,ax

l0800_1B7D:
	cmp	cl,04
	jz	1B88

l0800_1B82:
	pop	cx
	add	cx,03
	jmp	cx

l0800_1B88:
	pop	cx
	jmp	1AEB

l0800_1B8C:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret

;; fn0800_1B92: 0800:1B92
fn0800_1B92 proc
	jmp	word ptr [05E2]

;; fn0800_1B96: 0800:1B96
fn0800_1B96 proc
	jmp	word ptr [05E4]

;; fn0800_1B9A: 0800:1B9A
fn0800_1B9A proc
	jmp	word ptr [05E6]

;; fn0800_1B9E: 0800:1B9E
fn0800_1B9E proc
	push	bx
	sub	bl,30
	jc	1BC7

l0800_1BA4:
	cmp	bl,09
	jbe	1BBB

l0800_1BA9:
	cmp	bl,2A
	ja	1BB3

l0800_1BAE:
	sub	bl,07
	jmp	1BB6

l0800_1BB3:
	sub	bl,27

l0800_1BB6:
	cmp	bl,09
	jbe	1BC7

l0800_1BBB:
	cmp	bl,cl
	jnc	1BC7

l0800_1BBF:
	add	sp,02
	clc
	mov	bh,00

l0800_1BC5:
	jmp	1BCB

l0800_1BC7:
	pop	bx
	stc
	jmp	1BC5

l0800_1BCB:
	ret

;; fn0800_1BCC: 0800:1BCC
fn0800_1BCC proc
	push	bp
	mov	bp,sp
	sub	sp,06
	push	si
	push	di
	mov	byte ptr [bp-05],00
	mov	word ptr [bp-04],0000
	mov	word ptr [bp-02],0001
	push	es
	mov	di,0241

l0800_1BE6:
	inc	word ptr [bp-04]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	or	ax,ax
	jl	1C5A

l0800_1BF4:
	cbw
	xchg	ax,bx
	test	bl,80
	jnz	1C00

l0800_1BFB:
	test	byte ptr [bx+di],01
	jnz	1BE6

l0800_1C00:
	xchg	ax,bx
	dec	word ptr [bp+0C]
	jl	1C61

l0800_1C06:
	cmp	al,2B
	jz	1C11

l0800_1C0A:
	cmp	al,2D
	jnz	1C24

l0800_1C0E:
	inc	byte ptr [bp-05]

l0800_1C11:
	dec	word ptr [bp+0C]
	jl	1C61

l0800_1C16:
	inc	word ptr [bp-04]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	or	ax,ax
	jl	1C5A

l0800_1C24:
	sub	si,si
	mov	di,si
	mov	cx,[bp+0A]
	jcxz	1C7B

l0800_1C2D:
	cmp	cx,24
	ja	1C61

l0800_1C32:
	cmp	cl,02
	jc	1C61

l0800_1C37:
	cmp	al,30
	jnz	1CA7

l0800_1C3B:
	cmp	cl,10
	jnz	1CA5

l0800_1C40:
	dec	word ptr [bp+0C]
	jl	1C78

l0800_1C45:
	inc	word ptr [bp-04]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	cmp	al,78
	jz	1CA5

l0800_1C53:
	cmp	al,58
	jz	1CA5

l0800_1C57:
	jmp	1CCD
0800:1C59                            90                            .     

l0800_1C5A:
	mov	word ptr [bp-02],FFFF
	jmp	1C66

l0800_1C61:
	mov	word ptr [bp-02],0000

l0800_1C66:
	push	word ptr [bp+08]
	push	ax
	call	word ptr [bp+06]
	pop	cx
	pop	cx
	dec	word ptr [bp-04]
	sub	ax,ax
	cwd
	jmp	1D1F

l0800_1C78:
	jmp	1D0F

l0800_1C7B:
	cmp	al,30
	mov	word ptr [bp+0A],000A
	jnz	1CA7

l0800_1C84:
	dec	word ptr [bp+0C]
	jl	1C78

l0800_1C89:
	inc	word ptr [bp-04]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	mov	word ptr [bp+0A],0008
	cmp	al,78
	jz	1CA0

l0800_1C9C:
	cmp	al,58
	jnz	1CCD

l0800_1CA0:
	mov	word ptr [bp+0A],0010

l0800_1CA5:
	jmp	1CBE

l0800_1CA7:
	mov	cx,[bp+0A]
	xchg	ax,bx
	call	1B9E
	xchg	ax,bx
	jc	1C61

l0800_1CB1:
	xchg	ax,si
	jmp	1CBE

l0800_1CB4:
	xchg	ax,si
	mul	word ptr [bp+0A]
	add	si,ax
	adc	di,dx
	jnz	1CEA

l0800_1CBE:
	dec	word ptr [bp+0C]
	jl	1D0F

l0800_1CC3:
	inc	word ptr [bp-04]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx

l0800_1CCD:
	mov	cx,[bp+0A]
	xchg	ax,bx
	call	1B9E
	xchg	ax,bx
	jnc	1CB4

l0800_1CD7:
	jmp	1D03

l0800_1CD9:
	xchg	ax,si
	mul	cx
	xchg	ax,di
	xchg	dx,cx
	mul	dx
	add	si,di
	adc	ax,cx
	xchg	ax,di
	adc	dl,dh
	jnz	1D32

l0800_1CEA:
	dec	word ptr [bp+0C]
	jl	1D0F

l0800_1CEF:
	inc	word ptr [bp-04]
	push	word ptr [bp+08]
	call	word ptr [bp+04]
	pop	cx
	mov	cx,[bp+0A]
	xchg	ax,bx
	call	1B9E
	xchg	ax,bx
	jnc	1CD9

l0800_1D03:
	push	word ptr [bp+08]
	push	ax
	call	word ptr [bp+06]
	pop	cx
	pop	cx
	dec	word ptr [bp-04]

l0800_1D0F:
	mov	dx,di
	xchg	ax,si
	cmp	byte ptr [bp-05],00
	jz	1D1F

l0800_1D18:
	neg	dx
	neg	ax
	sbb	dx,00

l0800_1D1F:
	mov	di,[bp+0E]
	mov	bx,[bp-04]
	add	[di],bx
	mov	di,[bp+10]
	mov	bx,[bp-02]
	mov	[di],bx
	pop	es
	jmp	1D48

l0800_1D32:
	mov	ax,FFFF
	mov	dx,7FFF
	add	al,[bp-05]
	adc	ah,00
	adc	dx,00
	mov	word ptr [bp-02],0002
	jmp	1D1F

l0800_1D48:
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret

;; fn0800_1D4E: 0800:1D4E
fn0800_1D4E proc
	push	bp
	mov	bp,sp
	mov	ax,0001
	push	ax
	xor	ax,ax
	push	ax
	push	ax
	push	word ptr [bp+04]
	call	0C28
	mov	sp,bp
	jmp	1D63

l0800_1D63:
	pop	bp
	ret
0800:1D65                55 8B EC 56 8B 76 06 83 7E 04 FF      U..V.v..~..
0800:1D70 74 35 FF 04 8B 04 3D 01 00 7E 11 8A 46 04 FF 4C t5....=..~..F..L
0800:1D80 0A 8B 5C 0A 88 07 B4 00 EB 22 EB 1B 83 3C 01 75 ..\......"...<.u
0800:1D90 14 8B C6 05 05 00 89 44 0A 8A 46 04 88 44 05 B4 .......D..F..D..
0800:1DA0 00 EB 09 EB 02 FF 0C B8 FF FF EB 00 5E 5D C3 00 ............^]..
;;; Segment 09DB (09DB:0000)
09DB:0000 00 00 00 00 54 75 72 62 6F 2D 43 20 2D 20 43 6F ....Turbo-C - Co
09DB:0010 70 79 72 69 67 68 74 20 28 63 29 20 31 39 38 38 pyright (c) 1988
09DB:0020 20 42 6F 72 6C 61 6E 64 20 49 6E 74 6C 2E 00 4E  Borland Intl..N
09DB:0030 75 6C 6C 20 70 6F 69 6E 74 65 72 20 61 73 73 69 ull pointer assi
09DB:0040 67 6E 6D 65 6E 74 0D 0A 44 69 76 69 64 65 20 65 gnment..Divide e
09DB:0050 72 72 6F 72 0D 0A 41 62 6E 6F 72 6D 61 6C 20 70 rror..Abnormal p
09DB:0060 72 6F 67 72 61 6D 20 74 65 72 6D 69 6E 61 74 69 rogram terminati
09DB:0070 6F 6E 0D 0A 00 00 00 00 00 00 00 00 00 00 00 00 on..............
09DB:0080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
09DB:0090 00 00 00 00 00 00 00 00 00 00 00 00 2E 06 2E 06 ................
09DB:00A0 2E 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
09DB:00B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
; ...
09DB:0190 00 00 00 00 65 6E 74 65 72 20 6E 75 6D 62 65 72 ....enter number
09DB:01A0 20 6F 66 20 69 74 65 72 61 74 69 6F 6E 73 20 00  of iterations .
09DB:01B0 25 6C 64 00 65 78 65 63 75 74 69 6E 67 20 25 6C %ld.executing %l
09DB:01C0 64 20 69 74 65 72 61 74 69 6F 6E 73 0A 00 66 69 d iterations..fi
09DB:01D0 6E 69 73 68 65 64 0A 00 00 00 00 13 02 02 04 05 nished..........
09DB:01E0 06 08 08 08 14 15 05 13 FF 16 05 11 02 FF FF FF ................
09DB:01F0 FF FF FF FF FF FF FF FF FF FF 05 05 FF FF FF FF ................
09DB:0200 FF FF FF FF FF FF FF FF FF FF FF FF 0F FF 23 02 ..............#.
09DB:0210 FF 0F FF FF FF FF 13 FF FF 02 02 05 0F 02 FF FF ................
09DB:0220 FF 13 FF FF FF FF FF FF FF FF 23 FF FF FF FF 23 ..........#....#
09DB:0230 FF 13 FF 00 00 03 00 03 00 03 00 00 00 10 00 00 ................
09DB:0240 00 20 20 20 20 20 20 20 20 20 21 21 21 21 21 20 .         !!!!! 
09DB:0250 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20                 
09DB:0260 20 01 40 40 40 40 40 40 40 40 40 40 40 40 40 40  .@@@@@@@@@@@@@@
09DB:0270 40 02 02 02 02 02 02 02 02 02 02 40 40 40 40 40 @..........@@@@@
09DB:0280 40 40 14 14 14 14 14 14 04 04 04 04 04 04 04 04 @@..............
09DB:0290 04 04 04 04 04 04 04 04 04 04 04 04 40 40 40 40 ............@@@@
09DB:02A0 40 40 18 18 18 18 18 18 08 08 08 08 08 08 08 08 @@..............
09DB:02B0 08 08 08 08 08 08 08 08 08 08 08 08 40 40 40 40 ............@@@@
09DB:02C0 20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............
09DB:02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
; ...
09DB:0340 00 00 00 00 09 02 00 00 00 00 00 00 00 00 00 00 ................
09DB:0350 42 03 00 00 0A 02 01 00 00 00 00 00 00 00 00 00 B...............
09DB:0360 52 03 00 00 02 02 02 00 00 00 00 00 00 00 00 00 R...............
09DB:0370 62 03 00 00 43 02 03 00 00 00 00 00 00 00 00 00 b...C...........
09DB:0380 72 03 00 00 42 02 04 00 00 00 00 00 00 00 00 00 r...B...........
09DB:0390 82 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:03A0 92 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:03B0 A2 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:03C0 B2 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:03D0 C2 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:03E0 D2 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:03F0 E2 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:0400 F2 03 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:0410 02 04 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:0420 12 04 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 ................
09DB:0430 22 04 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 "...............
09DB:0440 32 04 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 2...............
09DB:0450 42 04 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 B...............
09DB:0460 52 04 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 R...............
09DB:0470 62 04 00 00 00 00 FF 00 00 00 00 00 00 00 00 00 b...............
09DB:0480 72 04 01 20 02 20 02 20 04 A0 02 A0 FF FF FF FF r.. . . ........
09DB:0490 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ................
09DB:04A0 FF FF FF FF FF FF FF FF FF FF 00 00 00 00 70 72 ..............pr
09DB:04B0 69 6E 74 20 73 63 61 6E 66 20 3A 20 66 6C 6F 61 int scanf : floa
09DB:04C0 74 69 6E 67 20 70 6F 69 6E 74 20 66 6F 72 6D 61 ting point forma
09DB:04D0 74 73 20 6E 6F 74 20 6C 69 6E 6B 65 64 0D 0A 00 ts not linked...
09DB:04E0 0D 00 28 6E 75 6C 6C 29 00 30 31 32 33 34 35 36 ..(null).0123456
09DB:04F0 37 38 39 41 42 43 44 45 46 00 14 14 01 14 15 14 789ABCDEF.......
09DB:0500 14 14 14 02 00 14 03 04 14 09 05 05 05 05 05 05 ................
09DB:0510 05 05 05 14 14 14 14 14 14 14 14 14 14 14 0F 17 ................
09DB:0520 0F 08 14 14 14 07 14 16 14 14 14 14 14 14 14 14 ................
09DB:0530 14 0D 14 14 14 14 14 14 14 14 14 14 10 0A 0F 0F ................
09DB:0540 0F 08 0A 14 14 06 14 12 0B 0E 14 14 11 14 0C 14 ................
09DB:0550 14 0D 14 14 14 14 14 14 14 00 00 02 02 02 02 02 ................
09DB:0560 02 02 02 01 01 01 01 01 02 02 02 02 02 02 02 02 ................
09DB:0570 02 02 02 02 02 02 02 02 02 02 01 02 02 02 02 03 ................
09DB:0580 02 02 02 02 04 02 02 02 02 02 05 05 05 05 05 05 ................
09DB:0590 05 05 05 05 02 02 02 02 02 02 02 02 02 02 07 0A ................
09DB:05A0 15 0A 0C 09 02 02 0B 02 14 0E 02 02 02 02 02 08 ................
09DB:05B0 02 02 12 02 02 10 02 10 02 02 02 02 02 06 07 0A ................
09DB:05C0 0A 0A 0C 09 02 02 0D 02 11 0E 13 02 02 0F 02 08 ................
09DB:05D0 02 02 12 02 02 02 02 02 02 02 D2 01 D2 01 D9 01 ................
09DB:05E0 3E 0D 43 0D 43 0D 43 0D 00 00 00 00 00 00 00 00 >.C.C.C.........
09DB:05F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
; ...
09DB:06B0 FB 52 08 02 4A 05 00 00 9E 00 1E 00 00 00 76 00 .R..J.........v.
09DB:06C0 6E 00 27 00 00 00 0A 00 0C 00 01 00 01 00 01 00 n.'.............
09DB:06D0 98 25 00 00 00 00 00 00 01 00 00 00 00 00 00 00 .%..............
09DB:06E0 01 00 00 00 00 00 00 00 01 02 00 00 00 21 01 00 .............!..
09DB:06F0 00 00 03 00 00 00 A5 01 00 00 00 04 00 00 00 E2 ................
09DB:0700 01 00 00 00 05 00 00 00 F8 01 00 00 00 06 00 1D ................
09DB:0710 00 FA 01 00 00 18 07 00 1D 00 FF 01 00 00 18 08 ................
09DB:0720 00 1D 00 22 02 00 00 18 09 00 1D 00 45 02 00 00 ..."........E...
09DB:0730 18 0A 00 1C 00 65 02 00 00 18 0B 00 00 00 C5 02 .....e..........
09DB:0740 00 00 00 0C 00 00 00 01 03 00 00 00 0D 00 00 00 ................
09DB:0750 36 03 00 00 00 0E 00 00 00 21 04 00 00 00 0F 00 6........!......
09DB:0760 00 00 6B 04 00 00 00 10 00 00 00 91 04 00 00 00 ..k.............
09DB:0770 11 00 00 00 70 05 00 00 00 12 00 00 00 E3 05 00 ....p...........
09DB:0780 00 00 13 00 00 00 07 06 00 00 00 14 00 00 00 3B ...............;
09DB:0790 06 00 00 00 15 00 00 00 49 06 00 00 00 16 00 00 ........I.......
09DB:07A0 00 A2 06 00 00 00 17 00 00 00 06 07 00 00 00 18 ................
09DB:07B0 00 00 00 DF 07 00 00 00 19 00 00 00 F2 07 00 00 ................
09DB:07C0 00 1A 00 00 00 E7 08 00 00 00 1B 00 00 00 F2 08 ................
09DB:07D0 00 00 00 1C 00 00 00 04 09 00 00 00 1D 00 00 00 ................
09DB:07E0 D6 09 00 00 00 1E 00 00 00 F7 09 00 00 00 1F 00 ................
09DB:07F0 00 00 B3 0A 00 00 00 20 00 00 00 CF 0A 00 00 00 ....... ........
09DB:0800 21 00 00 00 E2 0B 00 00 00 22 00 00 00 28 0C 00 !........"...(..
09DB:0810 00 00 23 00 00 00 53 0C 00 00 00 24 00 00 00 D2 ..#...S....$....
09DB:0820 0C 00 00 00 25 00 00 00 FB 0C 00 00 00 26 00 00 ....%........&..
09DB:0830 00 17 0D 00 00 00 27 00 00 00 5F 0D 00 00 00 28 ......'..._....(
09DB:0840 00 00 00 CD 0D 00 00 00 29 00 1A 00 4B 0E 00 00 ........)...K...
