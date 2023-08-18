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
FINAL_IMAGE=${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/coretimer/plib_coretimer.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../../../../../os/os.c ../../../../../os/os_ipc.c ../../../../../os/os_sched_tbl.c ../../../../../os/os_task.c ../../../../../os/os_timers.c ../src/os_cfg/os_sched_tbl_cfg.c ../src/os_cfg/os_task_cfg.c ../src/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1098369709/os.o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ${OBJECTDIR}/_ext/1098369709/os_task.o ${OBJECTDIR}/_ext/1098369709/os_timers.o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ${OBJECTDIR}/_ext/1360937237/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/1098369709/os.o.d ${OBJECTDIR}/_ext/1098369709/os_ipc.o.d ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d ${OBJECTDIR}/_ext/1098369709/os_task.o.d ${OBJECTDIR}/_ext/1098369709/os_timers.o.d ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1098369709/os.o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ${OBJECTDIR}/_ext/1098369709/os_task.o ${OBJECTDIR}/_ext/1098369709/os_timers.o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ${OBJECTDIR}/_ext/1360937237/main.o

# Source Files
SOURCEFILES=../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/coretimer/plib_coretimer.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../../../../../os/os.c ../../../../../os/os_ipc.c ../../../../../os/os_sched_tbl.c ../../../../../os/os_task.c ../../../../../os/os_timers.c ../src/os_cfg/os_sched_tbl_cfg.c ../src/os_cfg/os_task_cfg.c ../src/main.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/b7f14020be703bb7c65206d80e26a4a8d8c689f9 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1249264884/plib_coretimer.o: ../src/config/default/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default/80663f0a0d7ab1e670176f4ae1be433805638e15 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1249264884" 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ../src/config/default/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/2d1a782fd949dd1b39266ce02fef86c9c935e0f3 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/12542e7062bdc8cf60129dbae31e137443e32afb .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/786f2b8099e11e90009552862f33807a57b4fc2 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/acd56418963f04cfab7b592241bfbc8f9ba2029a .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/fb65509bc54bbf844575db536bb9152cf9615a72 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/c9589cd0028a41d8da36806258c5eb6db2dc1abf .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/4e9f804b1f805dca2d6579ab13f4b96b02833853 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os.o: ../../../../../os/os.c  .generated_files/flags/default/c3fdc2bdc0448752cd67bca68716be2501bd8ad5 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os.o.d" -o ${OBJECTDIR}/_ext/1098369709/os.o ../../../../../os/os.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_ipc.o: ../../../../../os/os_ipc.c  .generated_files/flags/default/7dcb5e4bf8cd760743791ff60f5e303942468a32 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_ipc.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ../../../../../os/os_ipc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o: ../../../../../os/os_sched_tbl.c  .generated_files/flags/default/5b76c874126bb21bd28bbb1fe71dfcb05e4cde57 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ../../../../../os/os_sched_tbl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_task.o: ../../../../../os/os_task.c  .generated_files/flags/default/f8df149453bea2a147cc32ba8807c1a08b601922 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_task.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_task.o ../../../../../os/os_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_timers.o: ../../../../../os/os_timers.c  .generated_files/flags/default/1f487949d7e343862cecef159923f7bbbbaf9a0f .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_timers.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_timers.o ../../../../../os/os_timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o: ../src/os_cfg/os_sched_tbl_cfg.c  .generated_files/flags/default/6d0d2c8555861bafbdef18ba72240d930c4b5971 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ../src/os_cfg/os_sched_tbl_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/47228477/os_task_cfg.o: ../src/os_cfg/os_task_cfg.c  .generated_files/flags/default/c7bbb95756e5ed5bcd0121a62dacb99ba548a23f .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ../src/os_cfg/os_task_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/722309bcbe5b207050b754686463b7a8aef6b5a .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/7ad90c75b14df4a1e2da2768093b7898e0310e97 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1249264884/plib_coretimer.o: ../src/config/default/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default/3f8faa7cd3670f6fddd97e2f518ac9ed6e3f2a8a .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1249264884" 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1249264884/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1249264884/plib_coretimer.o ../src/config/default/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/25b5728fcc420c765c947caf959a072a6764deb2 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/6251fca336765cfd5a05fee118dcdd3315f49b46 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/fa66b15d3bf780684c05eeca0a914da735b72b78 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/b057bd0ac6f4d334c1b1fa5d94fb05f916b7487d .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/284fab7bf8c144dde382cd1d2daf6b76c3b51e52 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/cba51f39ef7bfc152abf45eb80b7e2b2f4e813d3 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/c983f90f511958940ceb61bc1dc38237a4bdfc0f .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os.o: ../../../../../os/os.c  .generated_files/flags/default/6a625730792ef7bf3e44e1ba178af573f3a28d4f .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os.o.d" -o ${OBJECTDIR}/_ext/1098369709/os.o ../../../../../os/os.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_ipc.o: ../../../../../os/os_ipc.c  .generated_files/flags/default/b6829283ebea88dea72d3353da4f65fe3e73b2a4 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_ipc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_ipc.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_ipc.o ../../../../../os/os_ipc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o: ../../../../../os/os_sched_tbl.c  .generated_files/flags/default/1f292eb6547b14d7eb6a7834919039e6ae987b4c .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_sched_tbl.o ../../../../../os/os_sched_tbl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_task.o: ../../../../../os/os_task.c  .generated_files/flags/default/68f61a873f4843a0f328c7684f1e740ce64cb8ab .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_task.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_task.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_task.o ../../../../../os/os_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1098369709/os_timers.o: ../../../../../os/os_timers.c  .generated_files/flags/default/22bd4c8c19424a16d87c856b1044c9902d0fc1b5 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1098369709" 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1098369709/os_timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1098369709/os_timers.o.d" -o ${OBJECTDIR}/_ext/1098369709/os_timers.o ../../../../../os/os_timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o: ../src/os_cfg/os_sched_tbl_cfg.c  .generated_files/flags/default/99527ce1056a073439b02b1ee33e7bcb1422d5d3 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_sched_tbl_cfg.o ../src/os_cfg/os_sched_tbl_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/47228477/os_task_cfg.o: ../src/os_cfg/os_task_cfg.c  .generated_files/flags/default/dbc71d6cd69bd9abbaa7acff5ee7e5890ad5b10 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/47228477" 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d 
	@${RM} ${OBJECTDIR}/_ext/47228477/os_task_cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47228477/os_task_cfg.o.d" -o ${OBJECTDIR}/_ext/47228477/os_task_cfg.o ../src/os_cfg/os_task_cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/d6d30bf63d125106b7fc82b60a1c46da3cf6a2b6 .generated_files/flags/default/15a8dbaca108527e5c87e88688b4189e9e4b7338
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -I"../src" -I"../src/config/default" -I"../../../../../os" -I"../src/os_cfg" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/CooperativeSched.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
