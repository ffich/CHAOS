################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
"../Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.c" 

COMPILED_SRCS += \
"Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.src" 

C_DEPS += \
"./Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.d" 

OBJS += \
"Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.o" 


# Each subdirectory must supply rules for building sources it contributes
"Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.src":"../Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.c" "Libraries/Service/CpuGeneric/SysSe/General/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fC:/Users/franc/AURIX-v1.10.6-workspace/STM_Interrupt_1_KIT_TC375_LK/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.o":"Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.src" "Libraries/Service/CpuGeneric/SysSe/General/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"

clean: clean-Libraries-2f-Service-2f-CpuGeneric-2f-SysSe-2f-General

clean-Libraries-2f-Service-2f-CpuGeneric-2f-SysSe-2f-General:
	-$(RM) ./Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.d ./Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.o ./Libraries/Service/CpuGeneric/SysSe/General/Ifx_GlobalResources.src

.PHONY: clean-Libraries-2f-Service-2f-CpuGeneric-2f-SysSe-2f-General

