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
FINAL_IMAGE=${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/29023035aa0f6e9f99b2b123655064eb172f2820 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1249264884/plib_coretimer.o: ../src/config/default/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default/94176cceefe0e2c9f04df6db72077e225604c640 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1249264884" 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ../src/config/default/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/e66f5ab22a50eec230924324a1a8539880557abc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/7199e9111c5203f81ae4b0cf0ce4eba78cfe844d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/69783af8e2a25560578addfafcbd2262810ce23 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/f3f6479b79376605c9beee8c72f562d4d1323082 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/6a7487c383cda4c1857bc132ef2ff427d83fe44e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/762727bac37f41e178ce212ccf71d3f1e23f88f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/c89ac0f6524aeb45e96f8f5c74534ddefee3a21c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
	
${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o: ../src/os_cfg/os_sched_tbl_cfg.c  .generated_files/flags/default/bf72c157b6c8e6649b545b4fa9dbae0b5583d3d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ../src/os_cfg/os_sched_tbl_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_task_cfg.o: ../src/os_cfg/os_task_cfg.c  .generated_files/flags/default/926489dac30ce3a196dc2107baa4de1b4cb0f086 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ../src/os_cfg/os_task_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o: ../src/os_cfg/os_alarms_cfg.c  .generated_files/flags/default/f0830200791f3472974facc73fab4f6bc27b4918 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o ../src/os_cfg/os_alarms_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/18bcf41684d0f41d86757e5b369fa999247708b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/9c4ffe79dc51fce8ae1e434e6c1a1b8be09e15ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1249264884/plib_coretimer.o: ../src/config/default/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default/310bb0e95e224f43c24fff0fd0eb824f2a940dc2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1249264884" 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ../src/config/default/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/bcb41d7fdcc87d23889943579b0e65f30019a090 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/12dd37d2c2d34f32203e2a54e411a143cf4acd13 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/8eb86ed65bf7dc89a1e75e17730e51d2b9f59664 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/55e7245d9ef49c4f958b9271044db8565515663c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/6ce8819a1bebea35879bda944c18964b22fb10e4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/dd7d9d3cf7509001afa7ff33389d3f03d20b4d28 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/af0aa2d3f19eecd31e3d51fa40d568c55ef0f010 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
	
${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o: ../src/os_cfg/os_sched_tbl_cfg.c  .generated_files/flags/default/a98c7fbf6cba83ed21f000c14b0a3b8c227837ff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ../src/os_cfg/os_sched_tbl_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_task_cfg.o: ../src/os_cfg/os_task_cfg.c  .generated_files/flags/default/e9d5d5ddad9ad7616a54a91468e1bc4230386c3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ../src/os_cfg/os_task_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o: ../src/os_cfg/os_alarms_cfg.c  .generated_files/flags/default/be8ea56d7b6862bd6557e3b28be057f20d82de6b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_alarms_cfg.o ../src/os_cfg/os_alarms_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/3ebb0b8a2081355246c8b59df51e7c995b64cbee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
else
${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Events_Os.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
