################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
"../os/os.c" \
"../os/os_alarms.c" \
"../os/os_ipc.c" \
"../os/os_sched_tbl.c" \
"../os/os_task.c" \
"../os/os_timers.c" 

COMPILED_SRCS += \
"os/os.src" \
"os/os_alarms.src" \
"os/os_ipc.src" \
"os/os_sched_tbl.src" \
"os/os_task.src" \
"os/os_timers.src" 

C_DEPS += \
"./os/os.d" \
"./os/os_alarms.d" \
"./os/os_ipc.d" \
"./os/os_sched_tbl.d" \
"./os/os_task.d" \
"./os/os_timers.d" 

OBJS += \
"os/os.o" \
"os/os_alarms.o" \
"os/os_ipc.o" \
"os/os_sched_tbl.o" \
"os/os_task.o" \
"os/os_timers.o" 


# Each subdirectory must supply rules for building sources it contributes
"os/os.src":"../os/os.c" "os/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os/os.o":"os/os.src" "os/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
"os/os_alarms.src":"../os/os_alarms.c" "os/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os/os_alarms.o":"os/os_alarms.src" "os/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
"os/os_ipc.src":"../os/os_ipc.c" "os/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os/os_ipc.o":"os/os_ipc.src" "os/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
"os/os_sched_tbl.src":"../os/os_sched_tbl.c" "os/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os/os_sched_tbl.o":"os/os_sched_tbl.src" "os/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
"os/os_task.src":"../os/os_task.c" "os/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os/os_task.o":"os/os_task.src" "os/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"
"os/os_timers.src":"../os/os_timers.c" "os/subdir.mk"
	cctc -cs --dep-file="$*.d" --misrac-version=2004 -D__CPU__=tc37x "-fD:/60_Repositories/10_Public/PR202301_CHAOS/CHAOS/porting/Aurix_TC3xx_ADS/Debug/TASKING_C_C___Compiler-Include_paths__-I_.opt" --iso=99 --c++14 --language=+volatile --exceptions --anachronisms --fp-model=3 -O0 --tradeoff=4 --compact-max-size=200 -g -Wc-w544 -Wc-w557 -Ctc37x -Y0 -N0 -Z0 -o "$@" "$<"
"os/os_timers.o":"os/os_timers.src" "os/subdir.mk"
	astc -Og -Os --no-warnings= --error-limit=42 -o  "$@" "$<"

clean: clean-os

clean-os:
	-$(RM) ./os/os.d ./os/os.o ./os/os.src ./os/os_alarms.d ./os/os_alarms.o ./os/os_alarms.src ./os/os_ipc.d ./os/os_ipc.o ./os/os_ipc.src ./os/os_sched_tbl.d ./os/os_sched_tbl.o ./os/os_sched_tbl.src ./os/os_task.d ./os/os_task.o ./os/os_task.src ./os/os_timers.d ./os/os_timers.o ./os/os_timers.src

.PHONY: clean-os

