   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  68                     ; 42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  68                     ; 43 {
  70                     	switch	.text
  71  0000               _IWDG_WriteAccessCmd:
  73  0000 88            	push	a
  74       00000000      OFST:	set	0
  77                     ; 45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  79  0001 a155          	cp	a,#85
  80  0003 2703          	jreq	L01
  81  0005 4d            	tnz	a
  82  0006 2603          	jrne	L6
  83  0008               L01:
  84  0008 4f            	clr	a
  85  0009 2010          	jra	L21
  86  000b               L6:
  87  000b ae002d        	ldw	x,#45
  88  000e 89            	pushw	x
  89  000f ae0000        	ldw	x,#0
  90  0012 89            	pushw	x
  91  0013 ae0000        	ldw	x,#L73
  92  0016 cd0000        	call	_assert_failed
  94  0019 5b04          	addw	sp,#4
  95  001b               L21:
  96                     ; 47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  98  001b 7b01          	ld	a,(OFST+1,sp)
  99  001d c750e0        	ld	20704,a
 100                     ; 48 }
 103  0020 84            	pop	a
 104  0021 81            	ret
 195                     ; 57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 195                     ; 58 {
 196                     	switch	.text
 197  0022               _IWDG_SetPrescaler:
 199  0022 88            	push	a
 200       00000000      OFST:	set	0
 203                     ; 60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 205  0023 4d            	tnz	a
 206  0024 2718          	jreq	L02
 207  0026 a101          	cp	a,#1
 208  0028 2714          	jreq	L02
 209  002a a102          	cp	a,#2
 210  002c 2710          	jreq	L02
 211  002e a103          	cp	a,#3
 212  0030 270c          	jreq	L02
 213  0032 a104          	cp	a,#4
 214  0034 2708          	jreq	L02
 215  0036 a105          	cp	a,#5
 216  0038 2704          	jreq	L02
 217  003a a106          	cp	a,#6
 218  003c 2603          	jrne	L61
 219  003e               L02:
 220  003e 4f            	clr	a
 221  003f 2010          	jra	L22
 222  0041               L61:
 223  0041 ae003c        	ldw	x,#60
 224  0044 89            	pushw	x
 225  0045 ae0000        	ldw	x,#0
 226  0048 89            	pushw	x
 227  0049 ae0000        	ldw	x,#L73
 228  004c cd0000        	call	_assert_failed
 230  004f 5b04          	addw	sp,#4
 231  0051               L22:
 232                     ; 62     IWDG->PR = (uint8_t)IWDG_Prescaler;
 234  0051 7b01          	ld	a,(OFST+1,sp)
 235  0053 c750e1        	ld	20705,a
 236                     ; 63 }
 239  0056 84            	pop	a
 240  0057 81            	ret
 274                     ; 72 void IWDG_SetReload(uint8_t IWDG_Reload)
 274                     ; 73 {
 275                     	switch	.text
 276  0058               _IWDG_SetReload:
 280                     ; 74     IWDG->RLR = IWDG_Reload;
 282  0058 c750e2        	ld	20706,a
 283                     ; 75 }
 286  005b 81            	ret
 309                     ; 83 void IWDG_ReloadCounter(void)
 309                     ; 84 {
 310                     	switch	.text
 311  005c               _IWDG_ReloadCounter:
 315                     ; 85     IWDG->KR = IWDG_KEY_REFRESH;
 317  005c 35aa50e0      	mov	20704,#170
 318                     ; 86 }
 321  0060 81            	ret
 344                     ; 93 void IWDG_Enable(void)
 344                     ; 94 {
 345                     	switch	.text
 346  0061               _IWDG_Enable:
 350                     ; 95     IWDG->KR = IWDG_KEY_ENABLE;
 352  0061 35cc50e0      	mov	20704,#204
 353                     ; 96 }
 356  0065 81            	ret
 369                     	xdef	_IWDG_Enable
 370                     	xdef	_IWDG_ReloadCounter
 371                     	xdef	_IWDG_SetReload
 372                     	xdef	_IWDG_SetPrescaler
 373                     	xdef	_IWDG_WriteAccessCmd
 374                     	xref	_assert_failed
 375                     .const:	section	.text
 376  0000               L73:
 377  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 378  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 379  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 380  0036 5f697764672e  	dc.b	"_iwdg.c",0
 400                     	end
