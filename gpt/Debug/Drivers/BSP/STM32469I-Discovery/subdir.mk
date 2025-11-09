################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery.c \
../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_eeprom.c \
../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_lcd.c \
../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_qspi.c \
../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_sdram.c \
../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_ts.c 

OBJS += \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery.o \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_eeprom.o \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_lcd.o \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_qspi.o \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_sdram.o \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_ts.o 

C_DEPS += \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery.d \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_eeprom.d \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_lcd.d \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_qspi.d \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_sdram.d \
./Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_ts.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32469I-Discovery/stm32469i_discovery.o: ../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F469xx -DDEBUG -c -I../Core/Inc -I../USB_HOST/App -I../FATFS/App -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Include -I../FATFS/Target -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FatFs/src -I../Drivers/BSP/Components -I../Drivers/BSP/STM32469I-Discovery -I../Utilities/Fonts -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32469I-Discovery/stm32469i_discovery.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_eeprom.o: ../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_eeprom.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F469xx -DDEBUG -c -I../Core/Inc -I../USB_HOST/App -I../FATFS/App -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Include -I../FATFS/Target -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FatFs/src -I../Drivers/BSP/Components -I../Drivers/BSP/STM32469I-Discovery -I../Utilities/Fonts -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_eeprom.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_lcd.o: ../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_lcd.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F469xx -DDEBUG -c -I../Core/Inc -I../USB_HOST/App -I../FATFS/App -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Include -I../FATFS/Target -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FatFs/src -I../Drivers/BSP/Components -I../Drivers/BSP/STM32469I-Discovery -I../Utilities/Fonts -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_lcd.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_qspi.o: ../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_qspi.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F469xx -DDEBUG -c -I../Core/Inc -I../USB_HOST/App -I../FATFS/App -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Include -I../FATFS/Target -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FatFs/src -I../Drivers/BSP/Components -I../Drivers/BSP/STM32469I-Discovery -I../Utilities/Fonts -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_qspi.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_sdram.o: ../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_sdram.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F469xx -DDEBUG -c -I../Core/Inc -I../USB_HOST/App -I../FATFS/App -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Include -I../FATFS/Target -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FatFs/src -I../Drivers/BSP/Components -I../Drivers/BSP/STM32469I-Discovery -I../Utilities/Fonts -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_sdram.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_ts.o: ../Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_ts.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F469xx -DDEBUG -c -I../Core/Inc -I../USB_HOST/App -I../FATFS/App -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Include -I../FATFS/Target -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FatFs/src -I../Drivers/BSP/Components -I../Drivers/BSP/STM32469I-Discovery -I../Utilities/Fonts -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32469I-Discovery/stm32469i_discovery_ts.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

