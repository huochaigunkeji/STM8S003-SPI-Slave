   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	bsct
   5  0000               _CCR1_Val:
   6  0000 03e8          	dc.w	1000
  41                     ; 8 void CLK_Config(void)
  41                     ; 9 {
  43                     	switch	.text
  44  0000               _CLK_Config:
  48                     ; 10   CLK_HSECmd(ENABLE);//外部时钟开  
  50  0000 a601          	ld	a,#1
  51  0002 cd0000        	call	_CLK_HSECmd
  53                     ; 11   CLK_LSICmd(ENABLE);//使能内部低频RC  
  55  0005 a601          	ld	a,#1
  56  0007 cd0000        	call	_CLK_LSICmd
  58                     ; 12   CLK_HSICmd(ENABLE);//使能内部高频RC   
  60  000a a601          	ld	a,#1
  61  000c cd0000        	call	_CLK_HSICmd
  63                     ; 13   CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);//内部高速RC振荡时钟分频  
  65  000f 4f            	clr	a
  66  0010 cd0000        	call	_CLK_SYSCLKConfig
  68                     ; 14   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);//CPU核心时钟分频     
  70  0013 a680          	ld	a,#128
  71  0015 cd0000        	call	_CLK_SYSCLKConfig
  73                     ; 15   CLK_ClockSwitchCmd(ENABLE); //切换使能  
  75  0018 a601          	ld	a,#1
  76  001a cd0000        	call	_CLK_ClockSwitchCmd
  78                     ; 16   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO ,CLK_SOURCE_HSE,DISABLE,CLK_CURRENTCLOCKSTATE_DISABLE);//切换配置  
  80  001d 4b00          	push	#0
  81  001f 4b00          	push	#0
  82  0021 ae00b4        	ldw	x,#180
  83  0024 a601          	ld	a,#1
  84  0026 95            	ld	xh,a
  85  0027 cd0000        	call	_CLK_ClockSwitchConfig
  87  002a 85            	popw	x
  88                     ; 17 }
  91  002b 81            	ret
 120                     ; 18 void TIM2_PWM(void)
 120                     ; 19 {
 121                     	switch	.text
 122  002c               _TIM2_PWM:
 126                     ; 21   TIM2_TimeBaseInit(TIM2_PRESCALER_16, 1000);  //PWM16分频，设定占空比   占空比=CCR1_Val/1000
 128  002c ae03e8        	ldw	x,#1000
 129  002f 89            	pushw	x
 130  0030 a604          	ld	a,#4
 131  0032 cd0000        	call	_TIM2_TimeBaseInit
 133  0035 85            	popw	x
 134                     ; 22   TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR1_Val, TIM2_OCPOLARITY_HIGH);//PWM模式可设置PWM一周期的时钟数,并调可节占空比  
 136  0036 4b00          	push	#0
 137  0038 be00          	ldw	x,_CCR1_Val
 138  003a 89            	pushw	x
 139  003b ae0011        	ldw	x,#17
 140  003e a660          	ld	a,#96
 141  0040 95            	ld	xh,a
 142  0041 cd0000        	call	_TIM2_OC3Init
 144  0044 5b03          	addw	sp,#3
 145                     ; 23   TIM2_OC3PreloadConfig(ENABLE);     
 147  0046 a601          	ld	a,#1
 148  0048 cd0000        	call	_TIM2_OC3PreloadConfig
 150                     ; 24   TIM2_ARRPreloadConfig(ENABLE);  
 152  004b a601          	ld	a,#1
 153  004d cd0000        	call	_TIM2_ARRPreloadConfig
 155                     ; 25   TIM2_Cmd(ENABLE);
 157  0050 a601          	ld	a,#1
 158  0052 cd0000        	call	_TIM2_Cmd
 160                     ; 26 }
 163  0055 81            	ret
 189                     ; 28 int main()
 189                     ; 29 {
 190                     	switch	.text
 191  0056               _main:
 195                     ; 33   TIM2_PWM();
 197  0056 add4          	call	_TIM2_PWM
 199                     ; 36   GPIO_DeInit(GPIOB);
 201  0058 ae5005        	ldw	x,#20485
 202  005b cd0000        	call	_GPIO_DeInit
 204                     ; 37   GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 206  005e 4be0          	push	#224
 207  0060 4b20          	push	#32
 208  0062 ae5005        	ldw	x,#20485
 209  0065 cd0000        	call	_GPIO_Init
 211  0068 85            	popw	x
 212  0069               L14:
 214  0069 20fe          	jra	L14
 249                     ; 55 void assert_failed(u8* file, u32 line)
 249                     ; 56 { 
 250                     	switch	.text
 251  006b               _assert_failed:
 255  006b               L36:
 256  006b 20fe          	jra	L36
 280                     	xdef	_main
 281                     	xdef	_TIM2_PWM
 282                     	xdef	_CLK_Config
 283                     	xdef	_CCR1_Val
 284                     	xdef	_assert_failed
 285                     	xref	_TIM2_OC3PreloadConfig
 286                     	xref	_TIM2_ARRPreloadConfig
 287                     	xref	_TIM2_Cmd
 288                     	xref	_TIM2_OC3Init
 289                     	xref	_TIM2_TimeBaseInit
 290                     	xref	_GPIO_Init
 291                     	xref	_GPIO_DeInit
 292                     	xref	_CLK_SYSCLKConfig
 293                     	xref	_CLK_ClockSwitchConfig
 294                     	xref	_CLK_ClockSwitchCmd
 295                     	xref	_CLK_LSICmd
 296                     	xref	_CLK_HSICmd
 297                     	xref	_CLK_HSECmd
 316                     	end
