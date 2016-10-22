   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 107                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 107                     ; 49 {
 109                     	switch	.text
 110  0000               _RST_GetFlagStatus:
 112  0000 88            	push	a
 113       00000000      OFST:	set	0
 116                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 118  0001 a110          	cp	a,#16
 119  0003 2710          	jreq	L01
 120  0005 a108          	cp	a,#8
 121  0007 270c          	jreq	L01
 122  0009 a104          	cp	a,#4
 123  000b 2708          	jreq	L01
 124  000d a102          	cp	a,#2
 125  000f 2704          	jreq	L01
 126  0011 a101          	cp	a,#1
 127  0013 2603          	jrne	L6
 128  0015               L01:
 129  0015 4f            	clr	a
 130  0016 2010          	jra	L21
 131  0018               L6:
 132  0018 ae0033        	ldw	x,#51
 133  001b 89            	pushw	x
 134  001c ae0000        	ldw	x,#0
 135  001f 89            	pushw	x
 136  0020 ae0000        	ldw	x,#L55
 137  0023 cd0000        	call	_assert_failed
 139  0026 5b04          	addw	sp,#4
 140  0028               L21:
 141                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 143  0028 c650b3        	ld	a,20659
 144  002b 1401          	and	a,(OFST+1,sp)
 147  002d 5b01          	addw	sp,#1
 148  002f 81            	ret
 184                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 184                     ; 65 {
 185                     	switch	.text
 186  0030               _RST_ClearFlag:
 188  0030 88            	push	a
 189       00000000      OFST:	set	0
 192                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 194  0031 a110          	cp	a,#16
 195  0033 2710          	jreq	L02
 196  0035 a108          	cp	a,#8
 197  0037 270c          	jreq	L02
 198  0039 a104          	cp	a,#4
 199  003b 2708          	jreq	L02
 200  003d a102          	cp	a,#2
 201  003f 2704          	jreq	L02
 202  0041 a101          	cp	a,#1
 203  0043 2603          	jrne	L61
 204  0045               L02:
 205  0045 4f            	clr	a
 206  0046 2010          	jra	L22
 207  0048               L61:
 208  0048 ae0043        	ldw	x,#67
 209  004b 89            	pushw	x
 210  004c ae0000        	ldw	x,#0
 211  004f 89            	pushw	x
 212  0050 ae0000        	ldw	x,#L55
 213  0053 cd0000        	call	_assert_failed
 215  0056 5b04          	addw	sp,#4
 216  0058               L22:
 217                     ; 69     RST->SR = (uint8_t)RST_Flag;
 219  0058 7b01          	ld	a,(OFST+1,sp)
 220  005a c750b3        	ld	20659,a
 221                     ; 70 }
 224  005d 84            	pop	a
 225  005e 81            	ret
 238                     	xdef	_RST_ClearFlag
 239                     	xdef	_RST_GetFlagStatus
 240                     	xref	_assert_failed
 241                     .const:	section	.text
 242  0000               L55:
 243  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 244  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 245  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 246  0036 5f7273742e63  	dc.b	"_rst.c",0
 266                     	end
