################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
"../Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.c" 

COMPILED_SRCS += \
"Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.src" 

C_DEPS += \
"./Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.d" 

OBJS += \
"Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.o" 


# Each subdirectory must supply rules for building sources it contributes
"Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.src":"../Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.c" "Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fC:/Users/franc/AURIX-v1.10.6-workspace/STM_Interrupt_1_KIT_TC375_LK/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.o":"Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.src" "Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"

clean: clean-Libraries-2f-iLLD-2f-TC37A-2f-Tricore-2f-Psi5-2f-Psi5

clean-Libraries-2f-iLLD-2f-TC37A-2f-Tricore-2f-Psi5-2f-Psi5:
	-$(RM) ./Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.d ./Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.o ./Libraries/iLLD/TC37A/Tricore/Psi5/Psi5/IfxPsi5_Psi5.src

.PHONY: clean-Libraries-2f-iLLD-2f-TC37A-2f-Tricore-2f-Psi5-2f-Psi5

