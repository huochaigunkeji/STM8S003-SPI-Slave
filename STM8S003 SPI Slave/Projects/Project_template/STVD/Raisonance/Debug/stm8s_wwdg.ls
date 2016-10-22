   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  53                     ; 47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  53                     ; 48 {
  55                     	switch	.text
  56  0000               _WWDG_Init:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62                     ; 50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  64  0001 9f            	ld	a,xl
  65  0002 a180          	cp	a,#128
  66  0004 2403          	jruge	L6
  67  0006 4f            	clr	a
  68  0007 2010          	jra	L01
  69  0009               L6:
  70  0009 ae0032        	ldw	x,#50
  71  000c 89            	pushw	x
  72  000d ae0000        	ldw	x,#0
  73  0010 89            	pushw	x
  74  0011 ae0000        	ldw	x,#L33
  75  0014 cd0000        	call	_assert_failed
  77  0017 5b04          	addw	sp,#4
  78  0019               L01:
  79                     ; 52     WWDG->WR = WWDG_WR_RESET_VALUE;
  81  0019 357f50d2      	mov	20690,#127
  82                     ; 53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  84  001d 7b01          	ld	a,(OFST+1,sp)
  85  001f aac0          	or	a,#192
  86  0021 c750d1        	ld	20689,a
  87                     ; 54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  89  0024 7b02          	ld	a,(OFST+2,sp)
  90  0026 aa40          	or	a,#64
  91  0028 a47f          	and	a,#127
  92  002a c750d2        	ld	20690,a
  93                     ; 55 }
  96  002d 85            	popw	x
  97  002e 81            	ret
 132                     ; 63 void WWDG_SetCounter(uint8_t Counter)
 132                     ; 64 {
 133                     	switch	.text
 134  002f               _WWDG_SetCounter:
 136  002f 88            	push	a
 137       00000000      OFST:	set	0
 140                     ; 67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 142  0030 a180          	cp	a,#128
 143  0032 2403          	jruge	L41
 144  0034 4f            	clr	a
 145  0035 2010          	jra	L61
 146  0037               L41:
 147  0037 ae0043        	ldw	x,#67
 148  003a 89            	pushw	x
 149  003b ae0000        	ldw	x,#0
 150  003e 89            	pushw	x
 151  003f ae0000        	ldw	x,#L33
 152  0042 cd0000        	call	_assert_failed
 154  0045 5b04          	addw	sp,#4
 155  0047               L61:
 156                     ; 71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 158  0047 7b01          	ld	a,(OFST+1,sp)
 159  0049 a47f          	and	a,#127
 160  004b c750d1        	ld	20689,a
 161                     ; 73 }
 164  004e 84            	pop	a
 165  004f 81            	ret
 188                     ; 82 uint8_t WWDG_GetCounter(void)
 188                     ; 83 {
 189                     	switch	.text
 190  0050               _WWDG_GetCounter:
 194                     ; 84     return(WWDG->CR);
 196  0050 c650d1        	ld	a,20689
 199  0053 81            	ret
 222                     ; 92 void WWDG_SWReset(void)
 222                     ; 93 {
 223                     	switch	.text
 224  0054               _WWDG_SWReset:
 228                     ; 94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 230  0054 358050d1      	mov	20689,#128
 231                     ; 95 }
 234  0058 81            	ret
 270                     ; 104 void WWDG_SetWindowValue(uint8_t WindowValue)
 270                     ; 105 {
 271                     	switch	.text
 272  0059               _WWDG_SetWindowValue:
 274  0059 88            	push	a
 275       00000000      OFST:	set	0
 278                     ; 107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 280  005a a180          	cp	a,#128
 281  005c 2403          	jruge	L62
 282  005e 4f            	clr	a
 283  005f 2010          	jra	L03
 284  0061               L62:
 285  0061 ae006b        	ldw	x,#107
 286  0064 89            	pushw	x
 287  0065 ae0000        	ldw	x,#0
 288  0068 89            	pushw	x
 289  0069 ae0000        	ldw	x,#L33
 290  006c cd0000        	call	_assert_failed
 292  006f 5b04          	addw	sp,#4
 293  0071               L03:
 294                     ; 109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 296  0071 7b01          	ld	a,(OFST+1,sp)
 297  0073 aa40          	or	a,#64
 298  0075 a47f          	and	a,#127
 299  0077 c750d2        	ld	20690,a
 300                     ; 110 }
 303  007a 84            	pop	a
 304  007b 81            	ret
 317                     	xdef	_WWDG_SetWindowValue
 318                     	xdef	_WWDG_SWReset
 319                     	xdef	_WWDG_GetCounter
 320                     	xdef	_WWDG_SetCounter
 321                     	xdef	_WWDG_Init
 322                     	xref	_assert_failed
 323                     .const:	section	.text
 324  0000               L33:
 325  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 326  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 327  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 328  0036 5f777764672e  	dc.b	"_wwdg.c",0
 348                     	end
