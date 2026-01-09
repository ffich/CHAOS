#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/coretimer/plib_coretimer.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../../../../../os/os.c ../../../../../os/os_ipc.c ../../../../../os/os_sched_tbl.c ../../../../../os/os_task.c ../../../../../os/os_timers.c ../../../../../os/os_alarms.c ../src/os_cfg/os_sched_tbl_cfg.c ../src/os_cfg/os_task_cfg.c ../src/os_cfg/os_alarms_cfg.c ../src/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1098369709/os.o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ${OBJECTDIR}/_ext/1098369709/os_task.o ${OBJECTDIR}/_ext/1098369709/os_timers.o ${OBJECTDIR}/_ext/1098369709/os_alarms.o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o ${OBJECTDIR}/_ext/1360937237/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/1098369709/os.o.d ${OBJECTDIR}/_ext/1098369709/os_ipc.o.d ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d ${OBJECTDIR}/_ext/1098369709/os_task.o.d ${OBJECTDIR}/_ext/1098369709/os_timers.o.d ${OBJECTDIR}/_ext/1098369709/os_alarms.o.d ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1098369709/os.o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ${OBJECTDIR}/_ext/1098369709/os_task.o ${OBJECTDIR}/_ext/1098369709/os_timers.o ${OBJECTDIR}/_ext/1098369709/os_alarms.o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o ${OBJECTDIR}/_ext/1360937237/main.o

# Source Files
SOURCEFILES=../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/coretimer/plib_coretimer.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../../../../../os/os.c ../../../../../os/os_ipc.c ../../../../../os/os_sched_tbl.c ../../../../../os/os_task.c ../../../../../os/os_timers.c ../../../../../os/os_alarms.c ../src/os_cfg/os_sched_tbl_cfg.c ../src/os_cfg/os_task_cfg.c ../src/os_cfg/os_alarms_cfg.c ../src/main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM144
MP_LINKER_FILE_OPTION=,--script="..\src\config\default\p32MZ2048EFM144.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/adec7396e390a721fb663006912c3257519fe821 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1249264884/plib_coretimer.o: ../src/config/default/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default/8fa35ab65a4e14fb5850ef45ab468803fd8b2d55 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1249264884" 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ../src/config/default/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/5a301a987cffb77bc75b1ce42c92472e326d24ef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/34a1ba6e65b81f7a9b05917445dbdae8a1206650 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/95b3b6915b5826ba419f56c62ff3ae9bf62d2938 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/6b8ed4aaa1f7e8ef7e3ddf2bf6d2783789337977 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/3ddf294eb0a8c5622554bada4ec548de779fbc89 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/9f6b2844b0b325c7c07bdd888927886f42b17185 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/95bf898092b20b51a8924f71f9a724a11d16b12f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os.o: ../../../../../os/os.c  .generated_files/flags/default/1b75b222e339b6f2c2a35e5ce40e043364cf429f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os.o.d" -o ${OBJECTDIR}/_ext/1098369709/os.o ../../../../../os/os.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_ipc.o: ../../../../../os/os_ipc.c  .generated_files/flags/default/733a6d1325fa001a22f52849364d27946d878791 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_ipc.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ../../../../../os/os_ipc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o: ../../../../../os/os_sched_tbl.c  .generated_files/flags/default/b91dc2e55c366f8762b343a84cddb18064ddc5b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ../../../../../os/os_sched_tbl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_task.o: ../../../../../os/os_task.c  .generated_files/flags/default/da244b57f9dc32d0cc000a432ade58763b1ac5d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_task.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_task.o ../../../../../os/os_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_timers.o: ../../../../../os/os_timers.c  .generated_files/flags/default/eb500c8d8ac5f788da57ef0e75eb8463a3e399ef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_timers.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_timers.o ../../../../../os/os_timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_alarms.o: ../../../../../os/os_alarms.c  .generated_files/flags/default/7e866e64c3331a906ee3c9aef6e4ea3829229c2d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_alarms.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_alarms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_alarms.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_alarms.o ../../../../../os/os_alarms.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o: ../src/os_cfg/os_sched_tbl_cfg.c  .generated_files/flags/default/626d878e2c51969184121d85e44a7519301ed94e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ../src/os_cfg/os_sched_tbl_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_task_cfg.o: ../src/os_cfg/os_task_cfg.c  .generated_files/flags/default/535c379ac1d7463e38c8ee128ed6d695d285f505 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ../src/os_cfg/os_task_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o: ../src/os_cfg/os_alarms_cfg.c  .generated_files/flags/default/a666c3e03b68bfcd3e27ca0953444362dce1afb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o ../src/os_cfg/os_alarms_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/47126042d372d094c6356778185dfcee4b413369 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/3477583803680c69f5218395aa262983f4c61dbd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1249264884/plib_coretimer.o: ../src/config/default/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default/7d8f1b8df1cc2b594489c0b594188972f05fb56e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1249264884" 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ../src/config/default/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/d3e358d78d996bc9ae714f30e8d51a0e47b9d7c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/e6ac481b53e85122020941807440dfdf2c6b3aff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/24697e51f2162bae7e8d5e9f047ee7beeda61f10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/d35f28c38566a9817e8319b0c4ca584ae907de28 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/84e1fcd25aa5302c653879968e74c083a2161dd1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/3bd3e72079388dea921139c6348e7806d16d473b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/4a672079c32a0bac00a8dfc3aef2a3ebf8e35fa3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os.o: ../../../../../os/os.c  .generated_files/flags/default/270cb2be55b11ac87b74526c66c6d6b962b3a058 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os.o.d" -o ${OBJECTDIR}/_ext/1098369709/os.o ../../../../../os/os.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_ipc.o: ../../../../../os/os_ipc.c  .generated_files/flags/default/940f9fc67e64853b8ad3361e7e408efbd7cd55bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_ipc.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ../../../../../os/os_ipc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o: ../../../../../os/os_sched_tbl.c  .generated_files/flags/default/4ee84847fd290d5e919e6505799da69d789a2015 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ../../../../../os/os_sched_tbl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_task.o: ../../../../../os/os_task.c  .generated_files/flags/default/ca87ff3512ec64f7cb1e10c15a94ee2237bafdd1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_task.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_task.o ../../../../../os/os_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_timers.o: ../../../../../os/os_timers.c  .generated_files/flags/default/d582c9e1f318d06d17b4975193b2240d9a713cce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_timers.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_timers.o ../../../../../os/os_timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1098369709/os_alarms.o: ../../../../../os/os_alarms.c  .generated_files/flags/default/3e207891604a254a89b7a9f033f28e72439c2e99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_alarms.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_alarms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_alarms.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_alarms.o ../../../../../os/os_alarms.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o: ../src/os_cfg/os_sched_tbl_cfg.c  .generated_files/flags/default/8f54039ed41c19b37af62fcc87fdda80c33a7418 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ../src/os_cfg/os_sched_tbl_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_task_cfg.o: ../src/os_cfg/os_task_cfg.c  .generated_files/flags/default/70deaf9ea12bfb9e9a505a95a9da818a38e69304 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ../src/os_cfg/os_task_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o: ../src/os_cfg/os_alarms_cfg.c  .generated_files/flags/default/88b304503678eac292222844688b06bb487f96f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o ../src/os_cfg/os_alarms_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/7179785f3d8c5ca5f752f90bcbe5042892417ed1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
else
${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Hooks_Os.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
