/**
 * @brief  This is the code that gets called when the processor receives an 
 *         unexpected interrupt. This simply enters an infinite loop, preserving
 *         the system state for examination by a debugger.
 * @param  None
 * @retval None
*/
.section .text.reset,"ax",%progbits
    .type   Default_Handler, %function
Default_Handler:
loop:
    b loop
.size  Default_Handler, .-Default_Handler

/******************************************************************************
*
* The minimal vector table for a Cortex M. Note that the proper constructs
* must be placed on this to ensure that it ends up at physical address
* 0x0000.0000.
* 
*******************************************************************************/
.section .isr_vector,"a",%progbits
    .type   isr_vector, %object

isr_vector:
    .word   _estack
    .word   reset
        
    .word   ExceptionHandler_NMI
    .word   ExceptionHandler_HardFault
    .word   ExceptionHandler_MemManage
    .word   ExceptionHandler_BusFault
    .word   ExceptionHandler_UsageFault
    .word   0
    .word   0
    .word   0
    .word   0
    .word   ExceptionHandler_SvCall
    .word   ExceptionHandler_DebugMonitor
    .word   0
    .word   ExceptionHandler_PendSV
    .word   ExceptionHandler_SysTick
    
    /* External Interrupts */
    .word   InterruptHandler_WWDG                   /* Window WatchDog              */                                        
    .word   InterruptHandler_PVD_AVD                /* PVD/AVD through EXTI Line detection */                        
    .word   InterruptHandler_TAMP_STAMP             /* Tamper and TimeStamps through the EXTI line */            
    .word   InterruptHandler_RTC_WKUP               /* RTC Wakeup through the EXTI line */                      
    .word   InterruptHandler_FLASH                  /* FLASH                        */                                          
    .word   InterruptHandler_RCC                    /* RCC                          */                                            
    .word   InterruptHandler_EXTI0                  /* EXTI Line0                   */                        
    .word   InterruptHandler_EXTI1                  /* EXTI Line1                   */                          
    .word   InterruptHandler_EXTI2                  /* EXTI Line2                   */                          
    .word   InterruptHandler_EXTI3                  /* EXTI Line3                   */                          
    .word   InterruptHandler_EXTI4                  /* EXTI Line4                   */                          
    .word   InterruptHandler_DMA1_Stream0           /* DMA1 Stream 0                */                  
    .word   InterruptHandler_DMA1_Stream1           /* DMA1 Stream 1                */                   
    .word   InterruptHandler_DMA1_Stream2           /* DMA1 Stream 2                */                   
    .word   InterruptHandler_DMA1_Stream3           /* DMA1 Stream 3                */                   
    .word   InterruptHandler_DMA1_Stream4           /* DMA1 Stream 4                */                   
    .word   InterruptHandler_DMA1_Stream5           /* DMA1 Stream 5                */                   
    .word   InterruptHandler_DMA1_Stream6           /* DMA1 Stream 6                */                   
    .word   InterruptHandler_ADC                    /* ADC1, ADC2 and ADC3s         */                   
    .word   InterruptHandler_FDCAN1_IT0             /* FDCAN1 interrupt line 0      */                    
    .word   InterruptHandler_FDCAN2_IT0             /* FDCAN2 interrupt line 0      */                    
    .word   InterruptHandler_FDCAN1_IT1             /* FDCAN1 interrupt line 1      */                    
    .word   InterruptHandler_FDCAN2_IT1             /* FDCAN2 interrupt line 1      */                    
    .word   InterruptHandler_EXTI9_5                /* External Line[9:5]s          */                          
    .word   InterruptHandler_TIM1_BRK               /* TIM1 Break interrupt         */         
    .word   InterruptHandler_TIM1_UP                /* TIM1 Update interrupt        */         
    .word   InterruptHandler_TIM1_TRG_COM           /* TIM1 Trigger and Commutation interrupt */
    .word   InterruptHandler_TIM1_CC                /* TIM1 Capture Compare         */                          
    .word   InterruptHandler_TIM2                   /* TIM2                         */                   
    .word   InterruptHandler_TIM3                   /* TIM3                         */                   
    .word   InterruptHandler_TIM4                   /* TIM4                         */                   
    .word   InterruptHandler_I2C1_EV                /* I2C1 Event                   */                          
    .word   InterruptHandler_I2C1_ER                /* I2C1 Error                   */                          
    .word   InterruptHandler_I2C2_EV                /* I2C2 Event                   */                          
    .word   InterruptHandler_I2C2_ER                /* I2C2 Error                   */                            
    .word   InterruptHandler_SPI1                   /* SPI1                         */                   
    .word   InterruptHandler_SPI2                   /* SPI2                         */                   
    .word   InterruptHandler_USART1                 /* USART1                       */                   
    .word   InterruptHandler_USART2                 /* USART2                       */                   
    .word   InterruptHandler_USART3                 /* USART3                       */                   
    .word   InterruptHandler_EXTI15_10              /* External Line[15:10]s        */                          
    .word   InterruptHandler_RTC_Alarm              /* RTC Alarm (A and B) through EXTI Line */                 
    .word   0                                       /* Reserved                     */                       
    .word   InterruptHandler_TIM8_BRK_TIM12         /* TIM8 Break and TIM12         */         
    .word   InterruptHandler_TIM8_UP_TIM13          /* TIM8 Update and TIM13        */         
    .word   InterruptHandler_TIM8_TRG_COM_TIM14     /* TIM8 Trigger and Commutation and TIM14 */
    .word   InterruptHandler_TIM8_CC                /* TIM8 Capture Compare         */                          
    .word   InterruptHandler_DMA1_Stream7           /* DMA1 Stream7                 */                          
    .word   InterruptHandler_FMC                    /* FMC                          */                   
    .word   InterruptHandler_SDMMC1                 /* SDMMC1                       */                   
    .word   InterruptHandler_TIM5                   /* TIM5                         */                   
    .word   InterruptHandler_SPI3                   /* SPI3                         */                   
    .word   InterruptHandler_UART4                  /* UART4                        */                   
    .word   InterruptHandler_UART5                  /* UART5                        */                   
    .word   InterruptHandler_TIM6_DAC               /* TIM6 and DAC1&2 underrun errors */                   
    .word   InterruptHandler_TIM7                   /* TIM7                         */
    .word   InterruptHandler_DMA2_Stream0           /* DMA2 Stream 0                */                   
    .word   InterruptHandler_DMA2_Stream1           /* DMA2 Stream 1                */                   
    .word   InterruptHandler_DMA2_Stream2           /* DMA2 Stream 2                */                   
    .word   InterruptHandler_DMA2_Stream3           /* DMA2 Stream 3                */                   
    .word   InterruptHandler_DMA2_Stream4           /* DMA2 Stream 4                */                   
    .word   InterruptHandler_ETH                    /* Ethernet                     */                   
    .word   InterruptHandler_ETH_WKUP               /* Ethernet Wakeup through EXTI line */                     
    .word   InterruptHandler_FDCAN_CAL              /* FDCAN calibration unit interrupt*/                                               
    .word   0                                       /* Reserved                     */                          
    .word   0                                       /* Reserved                     */                       
    .word   0                                       /* Reserved                     */                           
    .word   0                                       /* Reserved                     */                  
    .word   InterruptHandler_DMA2_Stream5           /* DMA2 Stream 5                */                   
    .word   InterruptHandler_DMA2_Stream6           /* DMA2 Stream 6                */                   
    .word   InterruptHandler_DMA2_Stream7           /* DMA2 Stream 7                */                   
    .word   InterruptHandler_USART6                 /* USART6                       */                    
    .word   InterruptHandler_I2C3_EV                /* I2C3 event                   */                          
    .word   InterruptHandler_I2C3_ER                /* I2C3 error                   */                          
    .word   InterruptHandler_OTG_HS_EP1_OUT         /* USB OTG HS End Point 1 Out   */                   
    .word   InterruptHandler_OTG_HS_EP1_IN          /* USB OTG HS End Point 1 In    */                   
    .word   InterruptHandler_OTG_HS_WKUP            /* USB OTG HS Wakeup through EXTI */                         
    .word   InterruptHandler_OTG_HS                 /* USB OTG HS                   */                   
    .word   InterruptHandler_DCMI                   /* DCMI                         */                   
    .word   0                                       /* Reserved                     */                   
    .word   InterruptHandler_RNG                    /* Rng                          */
    .word   InterruptHandler_FPU                    /* FPU                          */
    .word   InterruptHandler_UART7                  /* UART7                        */      
    .word   InterruptHandler_UART8                  /* UART8                        */
    .word   InterruptHandler_SPI4                   /* SPI4                         */
    .word   InterruptHandler_SPI5                   /* SPI5                         */
    .word   InterruptHandler_SPI6                   /* SPI6                         */
    .word   InterruptHandler_SAI1                   /* SAI1                         */
    .word   InterruptHandler_LTDC                   /* LTDC                         */
    .word   InterruptHandler_LTDC_ER                /* LTDC error                   */
    .word   InterruptHandler_DMA2D                  /* DMA2D                        */
    .word   InterruptHandler_SAI2                   /* SAI2                         */
    .word   InterruptHandler_QUADSPI                /* QUADSPI                      */
    .word   InterruptHandler_LPTIM1                 /* LPTIM1                       */
    .word   InterruptHandler_CEC                    /* HDMI_CEC                     */
    .word   InterruptHandler_I2C4_EV                /* I2C4 Event                   */
    .word   InterruptHandler_I2C4_ER                /* I2C4 Error                   */
    .word   InterruptHandler_SPDIF_RX               /* SPDIF_RX                     */ 
    .word   InterruptHandler_OTG_FS_EP1_OUT         /* USB OTG FS End Point 1 Out   */   
    .word   InterruptHandler_OTG_FS_EP1_IN          /* USB OTG FS End Point 1 In    */   
    .word   InterruptHandler_OTG_FS_WKUP            /* USB OTG FS Wakeup through EXTI */  
    .word   InterruptHandler_OTG_FS                 /* USB OTG FS                   */
    .word   InterruptHandler_DMAMUX1_OVR            /* DMAMUX1 Overrun interrupt    */  
    .word   InterruptHandler_HRTIM1_Master          /* HRTIM Master Timer global Interrupt */
    .word   InterruptHandler_HRTIM1_TIMA            /* HRTIM Timer A global Interrupt */  
    .word   InterruptHandler_HRTIM1_TIMB            /* HRTIM Timer B global Interrupt */  
    .word   InterruptHandler_HRTIM1_TIMC            /* HRTIM Timer C global Interrupt */  
    .word   InterruptHandler_HRTIM1_TIMD            /* HRTIM Timer D global Interrupt */  
    .word   InterruptHandler_HRTIM1_TIME            /* HRTIM Timer E global Interrupt */  
    .word   InterruptHandler_HRTIM1_FLT             /* HRTIM Fault global Interrupt   */ 
    .word   InterruptHandler_DFSDM1_FLT0            /* DFSDM Filter0 Interrupt        */
    .word   InterruptHandler_DFSDM1_FLT1            /* DFSDM Filter1 Interrupt        */     
    .word   InterruptHandler_DFSDM1_FLT2            /* DFSDM Filter2 Interrupt        */    
    .word   InterruptHandler_DFSDM1_FLT3            /* DFSDM Filter3 Interrupt        */   
    .word   InterruptHandler_SAI3                   /* SAI3 global Interrupt          */   
    .word   InterruptHandler_SWPMI1                 /* Serial Wire Interface 1 global interrupt */
    .word   InterruptHandler_TIM15                  /* TIM15 global Interrupt      */        
    .word   InterruptHandler_TIM16                  /* TIM16 global Interrupt      */      
    .word   InterruptHandler_TIM17                  /* TIM17 global Interrupt      */      
    .word   InterruptHandler_MDIOS_WKUP             /* MDIOS Wakeup  Interrupt     */     
    .word   InterruptHandler_MDIOS                  /* MDIOS global Interrupt      */    
    .word   InterruptHandler_JPEG                   /* JPEG global Interrupt       */    
    .word   InterruptHandler_MDMA                   /* MDMA global Interrupt       */    
    .word   0                                       /* Reserved                    */    
    .word   InterruptHandler_SDMMC2                 /* SDMMC2 global Interrupt     */    
    .word   InterruptHandler_HSEM1                  /* HSEM1 global Interrupt      */    
    .word   0                                       /* Reserved                    */    
    .word   InterruptHandler_ADC3                   /* ADC3 global Interrupt       */    
    .word   InterruptHandler_DMAMUX2_OVR            /* DMAMUX Overrun interrupt    */    
    .word   InterruptHandler_BDMA_Channel0          /* BDMA Channel 0 global Interrupt */
    .word   InterruptHandler_BDMA_Channel1          /* BDMA Channel 1 global Interrupt */ 
    .word   InterruptHandler_BDMA_Channel2          /* BDMA Channel 2 global Interrupt */ 
    .word   InterruptHandler_BDMA_Channel3          /* BDMA Channel 3 global Interrupt */ 
    .word   InterruptHandler_BDMA_Channel4          /* BDMA Channel 4 global Interrupt */ 
    .word   InterruptHandler_BDMA_Channel5          /* BDMA Channel 5 global Interrupt */ 
    .word   InterruptHandler_BDMA_Channel6          /* BDMA Channel 6 global Interrupt */ 
    .word   InterruptHandler_BDMA_Channel7          /* BDMA Channel 7 global Interrupt */ 
    .word   InterruptHandler_COMP1                  /* COMP1 global Interrupt     */          
    .word   InterruptHandler_LPTIM2                 /* LP TIM2 global interrupt   */      
    .word   InterruptHandler_LPTIM3                 /* LP TIM3 global interrupt   */     
    .word   InterruptHandler_LPTIM4                 /* LP TIM4 global interrupt   */     
    .word   InterruptHandler_LPTIM5                 /* LP TIM5 global interrupt   */     
    .word   InterruptHandler_LPUART1                /* LP UART1 interrupt         */     
    .word   0                                       /* Reserved                   */     
    .word   InterruptHandler_CRS                    /* Clock Recovery Global Interrupt */ 
    .word   0                                       /* Reserved                   */     
    .word   InterruptHandler_SAI4                   /* SAI4 global interrupt      */      
    .word   0                                       /* Reserved                   */      
    .word   0                                       /* Reserved                   */      
    .word   InterruptHandler_WAKEUP_PIN             /* Interrupt for all 6 wake-up pins */

/*******************************************************************************
* Provide weak aliases for each Exception handler to the Default_Handler. 
* As they are weak aliases, any function with the same name will override 
* this definition.
*******************************************************************************/
    .weak      ExceptionHandler_NMI
    .thumb_set ExceptionHandler_NMI, Default_Handler
    
    .weak      ExceptionHandler_HardFault
    .thumb_set ExceptionHandler_HardFault, Default_Handler
    
    .weak      ExceptionHandler_MemManage
    .thumb_set ExceptionHandler_MemManage, Default_Handler
    
    .weak      ExceptionHandler_BusFault
    .thumb_set ExceptionHandler_BusFault, Default_Handler
    
    .weak      ExceptionHandler_UsageFault
    .thumb_set ExceptionHandler_UsageFault, Default_Handler
    
    .weak      ExceptionHandler_SvCall
    .thumb_set ExceptionHandler_SvCall, Default_Handler
    
    .weak      ExceptionHandler_DebugMonitor
    .thumb_set ExceptionHandler_DebugMonitor, Default_Handler
    
    .weak      ExceptionHandler_PendSV
    .thumb_set ExceptionHandler_PendSV, Default_Handler
    
    .weak      ExceptionHandler_SysTick
    .thumb_set ExceptionHandler_SysTick, Default_Handler              
    
    .weak      InterruptHandler_WWDG                   
    .thumb_set InterruptHandler_WWDG, Default_Handler      
                
    .weak      InterruptHandler_PVD_AVD      
    .thumb_set InterruptHandler_PVD_AVD, Default_Handler
                
    .weak      InterruptHandler_TAMP_STAMP            
    .thumb_set InterruptHandler_TAMP_STAMP, Default_Handler
            
    .weak      InterruptHandler_RTC_WKUP                  
    .thumb_set InterruptHandler_RTC_WKUP, Default_Handler
            
    .weak      InterruptHandler_FLASH         
    .thumb_set InterruptHandler_FLASH, Default_Handler
                
    .weak      InterruptHandler_RCC      
    .thumb_set InterruptHandler_RCC, Default_Handler
                
    .weak      InterruptHandler_EXTI0         
    .thumb_set InterruptHandler_EXTI0, Default_Handler
                
    .weak      InterruptHandler_EXTI1         
    .thumb_set InterruptHandler_EXTI1, Default_Handler
                    
    .weak      InterruptHandler_EXTI2         
    .thumb_set InterruptHandler_EXTI2, Default_Handler 
                
    .weak      InterruptHandler_EXTI3         
    .thumb_set InterruptHandler_EXTI3, Default_Handler
                        
    .weak      InterruptHandler_EXTI4         
    .thumb_set InterruptHandler_EXTI4, Default_Handler
                
    .weak      InterruptHandler_DMA1_Stream0               
    .thumb_set InterruptHandler_DMA1_Stream0, Default_Handler
        
    .weak      InterruptHandler_DMA1_Stream1               
    .thumb_set InterruptHandler_DMA1_Stream1, Default_Handler
                
    .weak      InterruptHandler_DMA1_Stream2               
    .thumb_set InterruptHandler_DMA1_Stream2, Default_Handler
                
    .weak      InterruptHandler_DMA1_Stream3               
    .thumb_set InterruptHandler_DMA1_Stream3, Default_Handler 
                
    .weak      InterruptHandler_DMA1_Stream4              
    .thumb_set InterruptHandler_DMA1_Stream4, Default_Handler
                
    .weak      InterruptHandler_DMA1_Stream5               
    .thumb_set InterruptHandler_DMA1_Stream5, Default_Handler
                
    .weak      InterruptHandler_DMA1_Stream6               
    .thumb_set InterruptHandler_DMA1_Stream6, Default_Handler
                
    .weak      InterruptHandler_ADC      
    .thumb_set InterruptHandler_ADC, Default_Handler
                
    .weak      InterruptHandler_FDCAN1_IT0   
    .thumb_set InterruptHandler_FDCAN1_IT0, Default_Handler
            
    .weak      InterruptHandler_FDCAN2_IT0                  
    .thumb_set InterruptHandler_FDCAN2_IT0, Default_Handler
                            
    .weak      InterruptHandler_FDCAN1_IT1                  
    .thumb_set InterruptHandler_FDCAN1_IT1, Default_Handler
            
    .weak      InterruptHandler_FDCAN2_IT1                  
    .thumb_set InterruptHandler_FDCAN2_IT1, Default_Handler
            
    .weak      InterruptHandler_EXTI9_5   
    .thumb_set InterruptHandler_EXTI9_5, Default_Handler
            
    .weak      InterruptHandler_TIM1_BRK            
    .thumb_set InterruptHandler_TIM1_BRK, Default_Handler
            
    .weak      InterruptHandler_TIM1_UP            
    .thumb_set InterruptHandler_TIM1_UP, Default_Handler
    
    .weak      InterruptHandler_TIM1_TRG_COM      
    .thumb_set InterruptHandler_TIM1_TRG_COM, Default_Handler
    
    .weak      InterruptHandler_TIM1_CC   
    .thumb_set InterruptHandler_TIM1_CC, Default_Handler
                
    .weak      InterruptHandler_TIM2            
    .thumb_set InterruptHandler_TIM2, Default_Handler
                
    .weak      InterruptHandler_TIM3            
    .thumb_set InterruptHandler_TIM3, Default_Handler
                
    .weak      InterruptHandler_TIM4            
    .thumb_set InterruptHandler_TIM4, Default_Handler
                
    .weak      InterruptHandler_I2C1_EV   
    .thumb_set InterruptHandler_I2C1_EV, Default_Handler
                    
    .weak      InterruptHandler_I2C1_ER   
    .thumb_set InterruptHandler_I2C1_ER, Default_Handler
                    
    .weak      InterruptHandler_I2C2_EV   
    .thumb_set InterruptHandler_I2C2_EV, Default_Handler
                
    .weak      InterruptHandler_I2C2_ER   
    .thumb_set InterruptHandler_I2C2_ER, Default_Handler
                            
    .weak      InterruptHandler_SPI1            
    .thumb_set InterruptHandler_SPI1, Default_Handler
                        
    .weak      InterruptHandler_SPI2            
    .thumb_set InterruptHandler_SPI2, Default_Handler
                
    .weak      InterruptHandler_USART1      
    .thumb_set InterruptHandler_USART1, Default_Handler
                    
    .weak      InterruptHandler_USART2      
    .thumb_set InterruptHandler_USART2, Default_Handler
                    
    .weak      InterruptHandler_USART3      
    .thumb_set InterruptHandler_USART3, Default_Handler
                
    .weak      InterruptHandler_EXTI15_10               
    .thumb_set InterruptHandler_EXTI15_10, Default_Handler
                
    .weak      InterruptHandler_RTC_Alarm               
    .thumb_set InterruptHandler_RTC_Alarm, Default_Handler
            
    .weak      InterruptHandler_TIM8_BRK_TIM12         
    .thumb_set InterruptHandler_TIM8_BRK_TIM12, Default_Handler
        
    .weak      InterruptHandler_TIM8_UP_TIM13            
    .thumb_set InterruptHandler_TIM8_UP_TIM13, Default_Handler
        
    .weak      InterruptHandler_TIM8_TRG_COM_TIM14      
    .thumb_set InterruptHandler_TIM8_TRG_COM_TIM14, Default_Handler
    
    .weak      InterruptHandler_TIM8_CC   
    .thumb_set InterruptHandler_TIM8_CC, Default_Handler
                
    .weak      InterruptHandler_DMA1_Stream7               
    .thumb_set InterruptHandler_DMA1_Stream7, Default_Handler
                    
    .weak      InterruptHandler_FMC            
    .thumb_set InterruptHandler_FMC, Default_Handler
                    
    .weak      InterruptHandler_SDMMC1            
    .thumb_set InterruptHandler_SDMMC1, Default_Handler
                    
    .weak      InterruptHandler_TIM5            
    .thumb_set InterruptHandler_TIM5, Default_Handler
                    
    .weak      InterruptHandler_SPI3            
    .thumb_set InterruptHandler_SPI3, Default_Handler
                    
    .weak      InterruptHandler_UART4         
    .thumb_set InterruptHandler_UART4, Default_Handler
                
    .weak      InterruptHandler_UART5         
    .thumb_set InterruptHandler_UART5, Default_Handler
                
    .weak      InterruptHandler_TIM6_DAC                  
    .thumb_set InterruptHandler_TIM6_DAC, Default_Handler
                
    .weak      InterruptHandler_TIM7            
    .thumb_set InterruptHandler_TIM7, Default_Handler
        
    .weak      InterruptHandler_DMA2_Stream0               
    .thumb_set InterruptHandler_DMA2_Stream0, Default_Handler
                
    .weak      InterruptHandler_DMA2_Stream1               
    .thumb_set InterruptHandler_DMA2_Stream1, Default_Handler
                
    .weak      InterruptHandler_DMA2_Stream2               
    .thumb_set InterruptHandler_DMA2_Stream2, Default_Handler
            
    .weak      InterruptHandler_DMA2_Stream3               
    .thumb_set InterruptHandler_DMA2_Stream3, Default_Handler
            
    .weak      InterruptHandler_DMA2_Stream4               
    .thumb_set InterruptHandler_DMA2_Stream4, Default_Handler
    
    .weak      InterruptHandler_ETH   
    .thumb_set InterruptHandler_ETH, Default_Handler
    
    .weak      InterruptHandler_ETH_WKUP   
    .thumb_set InterruptHandler_ETH_WKUP, Default_Handler
    
    .weak      InterruptHandler_FDCAN_CAL   
    .thumb_set InterruptHandler_FDCAN_CAL, Default_Handler   
                                                                
    .weak      InterruptHandler_DMA2_Stream5               
    .thumb_set InterruptHandler_DMA2_Stream5, Default_Handler
                
    .weak      InterruptHandler_DMA2_Stream6               
    .thumb_set InterruptHandler_DMA2_Stream6, Default_Handler
                
    .weak      InterruptHandler_DMA2_Stream7               
    .thumb_set InterruptHandler_DMA2_Stream7, Default_Handler
                
    .weak      InterruptHandler_USART6      
    .thumb_set InterruptHandler_USART6, Default_Handler
                        
    .weak      InterruptHandler_I2C3_EV   
    .thumb_set InterruptHandler_I2C3_EV, Default_Handler
                        
    .weak      InterruptHandler_I2C3_ER   
    .thumb_set InterruptHandler_I2C3_ER, Default_Handler
                        
    .weak      InterruptHandler_OTG_HS_EP1_OUT         
    .thumb_set InterruptHandler_OTG_HS_EP1_OUT, Default_Handler
                
    .weak      InterruptHandler_OTG_HS_EP1_IN            
    .thumb_set InterruptHandler_OTG_HS_EP1_IN, Default_Handler
                
    .weak      InterruptHandler_OTG_HS_WKUP         
    .thumb_set InterruptHandler_OTG_HS_WKUP, Default_Handler
            
    .weak      InterruptHandler_OTG_HS      
    .thumb_set InterruptHandler_OTG_HS, Default_Handler
                
    .weak      InterruptHandler_DCMI            
    .thumb_set InterruptHandler_DCMI, Default_Handler
    
    .weak      InterruptHandler_RNG            
    .thumb_set InterruptHandler_RNG, Default_Handler   
    
    .weak      InterruptHandler_FPU                  
    .thumb_set InterruptHandler_FPU, Default_Handler
    
    .weak      InterruptHandler_UART7                  
    .thumb_set InterruptHandler_UART7, Default_Handler
    
    .weak      InterruptHandler_UART8                  
    .thumb_set InterruptHandler_UART8, Default_Handler   
    
    .weak      InterruptHandler_SPI4            
    .thumb_set InterruptHandler_SPI4, Default_Handler
    
    .weak      InterruptHandler_SPI5            
    .thumb_set InterruptHandler_SPI5, Default_Handler
    
    .weak      InterruptHandler_SPI6            
    .thumb_set InterruptHandler_SPI6, Default_Handler   
    
    .weak      InterruptHandler_SAI1            
    .thumb_set InterruptHandler_SAI1, Default_Handler
    
    .weak      InterruptHandler_LTDC            
    .thumb_set InterruptHandler_LTDC, Default_Handler
    
    .weak      InterruptHandler_LTDC_ER            
    .thumb_set InterruptHandler_LTDC_ER, Default_Handler
    
    .weak      InterruptHandler_DMA2D            
    .thumb_set InterruptHandler_DMA2D, Default_Handler   
    
    .weak      InterruptHandler_SAI2            
    .thumb_set InterruptHandler_SAI2, Default_Handler
    
    .weak      InterruptHandler_QUADSPI            
    .thumb_set InterruptHandler_QUADSPI, Default_Handler
    
    .weak      InterruptHandler_LPTIM1            
    .thumb_set InterruptHandler_LPTIM1, Default_Handler
    
    .weak      InterruptHandler_CEC            
    .thumb_set InterruptHandler_CEC, Default_Handler
    
    .weak      InterruptHandler_I2C4_EV            
    .thumb_set InterruptHandler_I2C4_EV, Default_Handler 
    
    .weak      InterruptHandler_I2C4_ER            
    .thumb_set InterruptHandler_I2C4_ER, Default_Handler
    
    .weak      InterruptHandler_SPDIF_RX            
    .thumb_set InterruptHandler_SPDIF_RX, Default_Handler
    
    .weak      InterruptHandler_OTG_FS_EP1_OUT            
    .thumb_set InterruptHandler_OTG_FS_EP1_OUT, Default_Handler
    
    .weak      InterruptHandler_OTG_FS_EP1_IN            
    .thumb_set InterruptHandler_OTG_FS_EP1_IN, Default_Handler 
    
    .weak      InterruptHandler_OTG_FS_WKUP            
    .thumb_set InterruptHandler_OTG_FS_WKUP, Default_Handler
    
    .weak      InterruptHandler_OTG_FS            
    .thumb_set InterruptHandler_OTG_FS, Default_Handler
    
    .weak      InterruptHandler_DMAMUX1_OVR            
    .thumb_set InterruptHandler_DMAMUX1_OVR, Default_Handler
    
    .weak      InterruptHandler_HRTIM1_Master            
    .thumb_set InterruptHandler_HRTIM1_Master, Default_Handler
    
    .weak      InterruptHandler_HRTIM1_TIMA            
    .thumb_set InterruptHandler_HRTIM1_TIMA, Default_Handler
    
    .weak      InterruptHandler_HRTIM1_TIMB            
    .thumb_set InterruptHandler_HRTIM1_TIMB, Default_Handler 
    
    .weak      InterruptHandler_HRTIM1_TIMC            
    .thumb_set InterruptHandler_HRTIM1_TIMC, Default_Handler 
    
    .weak      InterruptHandler_HRTIM1_TIMD            
    .thumb_set InterruptHandler_HRTIM1_TIMD, Default_Handler 
    
    .weak      InterruptHandler_HRTIM1_TIME            
    .thumb_set InterruptHandler_HRTIM1_TIME, Default_Handler 
    
    .weak      InterruptHandler_HRTIM1_FLT            
    .thumb_set InterruptHandler_HRTIM1_FLT, Default_Handler
    
    .weak      InterruptHandler_DFSDM1_FLT0            
    .thumb_set InterruptHandler_DFSDM1_FLT0, Default_Handler   
    
    .weak      InterruptHandler_DFSDM1_FLT1            
    .thumb_set InterruptHandler_DFSDM1_FLT1, Default_Handler 
    
    .weak      InterruptHandler_DFSDM1_FLT2            
    .thumb_set InterruptHandler_DFSDM1_FLT2, Default_Handler 
    
    .weak      InterruptHandler_DFSDM1_FLT3            
    .thumb_set InterruptHandler_DFSDM1_FLT3, Default_Handler    
    
    .weak      InterruptHandler_SAI3            
    .thumb_set InterruptHandler_SAI3, Default_Handler
    
    .weak      InterruptHandler_SWPMI1            
    .thumb_set InterruptHandler_SWPMI1, Default_Handler
    
    .weak      InterruptHandler_TIM15            
    .thumb_set InterruptHandler_TIM15, Default_Handler 
    
    .weak      InterruptHandler_TIM16            
    .thumb_set InterruptHandler_TIM16, Default_Handler 
    
    .weak      InterruptHandler_TIM17            
    .thumb_set InterruptHandler_TIM17, Default_Handler 
    
    .weak      InterruptHandler_MDIOS_WKUP            
    .thumb_set InterruptHandler_MDIOS_WKUP, Default_Handler 
    
    .weak      InterruptHandler_MDIOS            
    .thumb_set InterruptHandler_MDIOS, Default_Handler 
    
    .weak      InterruptHandler_JPEG            
    .thumb_set InterruptHandler_JPEG, Default_Handler 
    
    .weak      InterruptHandler_MDMA            
    .thumb_set InterruptHandler_MDMA, Default_Handler 
    
    .weak      InterruptHandler_SDMMC2            
    .thumb_set InterruptHandler_SDMMC2, Default_Handler 
    
    .weak      InterruptHandler_HSEM1            
    .thumb_set InterruptHandler_HSEM1, Default_Handler
    
    .weak      InterruptHandler_ADC3            
    .thumb_set InterruptHandler_ADC3, Default_Handler 
    
    .weak      InterruptHandler_DMAMUX2_OVR            
    .thumb_set InterruptHandler_DMAMUX2_OVR, Default_Handler 
    
    .weak      InterruptHandler_BDMA_Channel0            
    .thumb_set InterruptHandler_BDMA_Channel0, Default_Handler 
    
    .weak      InterruptHandler_BDMA_Channel1            
    .thumb_set InterruptHandler_BDMA_Channel1, Default_Handler 
    
    .weak      InterruptHandler_BDMA_Channel2            
    .thumb_set InterruptHandler_BDMA_Channel2, Default_Handler 
    
    .weak      InterruptHandler_BDMA_Channel3            
    .thumb_set InterruptHandler_BDMA_Channel3, Default_Handler 
    
    .weak      InterruptHandler_BDMA_Channel4            
    .thumb_set InterruptHandler_BDMA_Channel4, Default_Handler 
    
    .weak      InterruptHandler_BDMA_Channel5            
    .thumb_set InterruptHandler_BDMA_Channel5, Default_Handler    
    
    .weak      InterruptHandler_BDMA_Channel6            
    .thumb_set InterruptHandler_BDMA_Channel6, Default_Handler
    
    .weak      InterruptHandler_BDMA_Channel7            
    .thumb_set InterruptHandler_BDMA_Channel7, Default_Handler 
    
    .weak      InterruptHandler_COMP1            
    .thumb_set InterruptHandler_COMP1, Default_Handler 
    
    .weak      InterruptHandler_LPTIM2            
    .thumb_set InterruptHandler_LPTIM2, Default_Handler 
    
    .weak      InterruptHandler_LPTIM3            
    .thumb_set InterruptHandler_LPTIM3, Default_Handler 
    
    .weak      InterruptHandler_LPTIM4            
    .thumb_set InterruptHandler_LPTIM4, Default_Handler 
    
    .weak      InterruptHandler_LPTIM5            
    .thumb_set InterruptHandler_LPTIM5, Default_Handler 
    
    .weak      InterruptHandler_LPUART1            
    .thumb_set InterruptHandler_LPUART1, Default_Handler 
    
    .weak      InterruptHandler_CRS            
    .thumb_set InterruptHandler_CRS, Default_Handler 
    
    .weak      InterruptHandler_SAI4            
    .thumb_set InterruptHandler_SAI4, Default_Handler 
    
    .weak      InterruptHandler_WAKEUP_PIN            
    .thumb_set InterruptHandler_WAKEUP_PIN, Default_Handler 

.size  isr_vector, .-isr_vector
