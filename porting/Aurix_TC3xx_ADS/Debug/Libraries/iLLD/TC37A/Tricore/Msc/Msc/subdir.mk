################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
"../Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.c" 

COMPILED_SRCS += \
"Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.src" 

C_DEPS += \
"./Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.d" 

OBJS += \
"Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.o" 


# Each subdirectory must supply rules for building sources it contributes
"Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.src":"../Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.c" "Libraries/iLLD/TC37A/Tricore/Msc/Msc/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fC:/Users/franc/AURIX-v1.10.6-workspace/STM_Interrupt_1_KIT_TC375_LK/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.o":"Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.src" "Libraries/iLLD/TC37A/Tricore/Msc/Msc/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"

clean: clean-Libraries-2f-iLLD-2f-TC37A-2f-Tricore-2f-Msc-2f-Msc

clean-Libraries-2f-iLLD-2f-TC37A-2f-Tricore-2f-Msc-2f-Msc:
	-$(RM) ./Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.d ./Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.o ./Libraries/iLLD/TC37A/Tricore/Msc/Msc/IfxMsc_Msc.src

.PHONY: clean-Libraries-2f-iLLD-2f-TC37A-2f-Tricore-2f-Msc-2f-Msc
