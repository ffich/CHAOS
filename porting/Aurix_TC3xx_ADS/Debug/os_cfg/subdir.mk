################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
"../os_cfg/os_alarms_cfg.c" \
"../os_cfg/os_sched_tbl_cfg.c" \
"../os_cfg/os_task_cfg.c" 

COMPILED_SRCS += \
"os_cfg/os_alarms_cfg.src" \
"os_cfg/os_sched_tbl_cfg.src" \
"os_cfg/os_task_cfg.src" 

C_DEPS += \
"./os_cfg/os_alarms_cfg.d" \
"./os_cfg/os_sched_tbl_cfg.d" \
"./os_cfg/os_task_cfg.d" 

OBJS += \
"os_cfg/os_alarms_cfg.o" \
"os_cfg/os_sched_tbl_cfg.o" \
"os_cfg/os_task_cfg.o" 


# Each subdirectory must supply rules for building sources it contributes
"os_cfg/os_alarms_cfg.src":"../os_cfg/os_alarms_cfg.c" "os_cfg/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os_cfg/os_alarms_cfg.o":"os_cfg/os_alarms_cfg.src" "os_cfg/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
"os_cfg/os_sched_tbl_cfg.src":"../os_cfg/os_sched_tbl_cfg.c" "os_cfg/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os_cfg/os_sched_tbl_cfg.o":"os_cfg/os_sched_tbl_cfg.src" "os_cfg/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
"os_cfg/os_task_cfg.src":"../os_cfg/os_task_cfg.c" "os_cfg/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os_cfg/os_task_cfg.o":"os_cfg/os_task_cfg.src" "os_cfg/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"

clean: clean-os_cfg

clean-os_cfg:
	-$(RM) ./os_cfg/os_alarms_cfg.d ./os_cfg/os_alarms_cfg.o ./os_cfg/os_alarms_cfg.src ./os_cfg/os_sched_tbl_cfg.d ./os_cfg/os_sched_tbl_cfg.o ./os_cfg/os_sched_tbl_cfg.src ./os_cfg/os_task_cfg.d ./os_cfg/os_task_cfg.o ./os_cfg/os_task_cfg.src

.PHONY: clean-os_cfg

