################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os.c \
D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_alarms.c \
D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_ipc.c \
D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_sched_tbl.c \
D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_task.c \
D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_timers.c 

OBJS += \
./os/os.o \
./os/os_alarms.o \
./os/os_ipc.o \
./os/os_sched_tbl.o \
./os/os_task.o \
./os/os_timers.o 

C_DEPS += \
./os/os.d \
./os/os_alarms.d \
./os/os_ipc.d \
./os/os_sched_tbl.d \
./os/os_task.d \
./os/os_timers.d 


# Each subdirectory must supply rules for building sources it contributes
os/os.o: D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os.c os/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../../../os -I../os_cfg -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
os/os_alarms.o: D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_alarms.c os/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../../../os -I../os_cfg -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
os/os_ipc.o: D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_ipc.c os/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../../../os -I../os_cfg -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
os/os_sched_tbl.o: D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_sched_tbl.c os/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../../../os -I../os_cfg -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
os/os_task.o: D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_task.c os/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../../../os -I../os_cfg -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
os/os_timers.o: D:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/os/os_timers.c os/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../../../os -I../os_cfg -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-os

clean-os:
	-$(RM) ./os/os.cyclo ./os/os.d ./os/os.o ./os/os.su ./os/os_alarms.cyclo ./os/os_alarms.d ./os/os_alarms.o ./os/os_alarms.su ./os/os_ipc.cyclo ./os/os_ipc.d ./os/os_ipc.o ./os/os_ipc.su ./os/os_sched_tbl.cyclo ./os/os_sched_tbl.d ./os/os_sched_tbl.o ./os/os_sched_tbl.su ./os/os_task.cyclo ./os/os_task.d ./os/os_task.o ./os/os_task.su ./os/os_timers.cyclo ./os/os_timers.d ./os/os_timers.o ./os/os_timers.su

.PHONY: clean-os

