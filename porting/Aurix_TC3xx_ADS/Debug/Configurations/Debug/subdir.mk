################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
"../Configurations/Debug/sync_on_halt.c" 

COMPILED_SRCS += \
"Configurations/Debug/sync_on_halt.src" 

C_DEPS += \
"./Configurations/Debug/sync_on_halt.d" 

OBJS += \
"Configurations/Debug/sync_on_halt.o" 


# Each subdirectory must supply rules for building sources it contributes
"Configurations/Debug/sync_on_halt.src":"../Configurations/Debug/sync_on_halt.c" "Configurations/Debug/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"Configurations/Debug/sync_on_halt.o":"Configurations/Debug/sync_on_halt.src" "Configurations/Debug/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"

clean: clean-Configurations-2f-Debug

clean-Configurations-2f-Debug:
	-$(RM) ./Configurations/Debug/sync_on_halt.d ./Configurations/Debug/sync_on_halt.o ./Configurations/Debug/sync_on_halt.src

.PHONY: clean-Configurations-2f-Debug

