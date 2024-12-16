################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../os_cfg/os_alarms_cfg.c \
../os_cfg/os_sched_tbl_cfg.c \
../os_cfg/os_task_cfg.c 

OBJS += \
./os_cfg/os_alarms_cfg.o \
./os_cfg/os_sched_tbl_cfg.o \
./os_cfg/os_task_cfg.o 

C_DEPS += \
./os_cfg/os_alarms_cfg.d \
./os_cfg/os_sched_tbl_cfg.d \
./os_cfg/os_task_cfg.d 


# Each subdirectory must supply rules for building sources it contributes
os_cfg/%.o os_cfg/%.su os_cfg/%.cyclo: ../os_cfg/%.c os_cfg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../../../os -I../os_cfg -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-os_cfg

clean-os_cfg:
	-$(RM) ./os_cfg/os_alarms_cfg.cyclo ./os_cfg/os_alarms_cfg.d ./os_cfg/os_alarms_cfg.o ./os_cfg/os_alarms_cfg.su ./os_cfg/os_sched_tbl_cfg.cyclo ./os_cfg/os_sched_tbl_cfg.d ./os_cfg/os_sched_tbl_cfg.o ./os_cfg/os_sched_tbl_cfg.su ./os_cfg/os_task_cfg.cyclo ./os_cfg/os_task_cfg.d ./os_cfg/os_task_cfg.o ./os_cfg/os_task_cfg.su

.PHONY: clean-os_cfg

