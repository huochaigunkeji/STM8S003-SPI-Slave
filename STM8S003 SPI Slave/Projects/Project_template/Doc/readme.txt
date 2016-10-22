基本配置
1.主时钟8MHz.
2016.9.25
1.添加Timer1 ch3作为PWM输出，调节LED.
发布v2.0.
2016.10.11
1.把LampAdj.c文件中的GPIO_Init( SCR_CONTROL_PORT , SCR_CONTROL_PIN , GPIO_MODE_OUT_PP_LOW_FAST );改为GPIO_Init( SCR_CONTROL_PORT , SCR_CONTROL_PIN , GPIO_MODE_OUT_OD_LOW_FAST );
发布v2.1版本
2016.10.15
1.修改了SpiIrqHandle( )函数，将if( RegAddrFlag == 0 ){...}else里的RegAddrFlag = 0x01;改为了RegAddrFlag = 0x00;，避免了SPI写寄存器失败后，SPI写操作不可恢复的问题。
发布v2.2版本
2016.10.16
1.修改了SpiIrqHandle( )函数,将if( Data & 0x80 == 0x80 )改为了:
  uint8_t temp;  
  temp = Data & 0x80; 
  
  if( temp == 0x80  )修改了由于'=='优先级高于'&'if( Data & 0x80 == 0x80 )始终为真的问题;
2.修改了SpiIrqHandle( )函数，将if( RegAddrFlag == 0 ){...}else里的RegAddrFlag = 0x00;改为了RegAddrFlag = 0x01;
3.修改了SpiIrqHandle( )函数,添加了如下代码:
    else if( RegAddrFlag == 0x01 )
    {
        RegAddrFlag = 0x02;
    }
  实现了SPI读操作。
发布v2.3版本
2016.10.20
1.修改了LedPwm.c文件的LedPwmInit( )函数;
2.修改了LedPwm.c文件的LedPwmSetDuty( )函数;
3.添加设置SPI接受中断和定时器2的更新中断优先级的代码。