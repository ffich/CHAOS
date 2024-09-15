/************************************************************************
*                                OS                         
*************************************************************************
* FileName:         os.h                                                                              
* Author:           F.Ficili                                            
*                                                                       
* Software License Agreement:                                           
*                                                                       
* THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,     
* WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED     
* TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A           
* PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE AUTHOR SHALL NOT,      
* IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR            
* CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.                     
*                                                                       
* --------------------------------------------------------------------- 
* File History:                                                                                    
* --------------------------------------------------------------------- 
* Author       Date        Version      Comment                         
* ---------------------------------------------------------------------	
* F.Ficili     15/08/23    1.0          First release.                         
************************************************************************/

#ifndef OS_H
#define OS_H

/************************************************************************
* Includes
************************************************************************/
#include "common.h"
#include "os_timers.h"
#include "os_cfg.h"
#include "os_ipc.h"

/************************************************************************
* EXPORTED Defines
************************************************************************/
/* OS Version */
#define OS_VERSION_MAJOR                                          1
#define OS_VERSION_MINOR                                          0
#define OS_VERSION_FIX                                            0

/* -- Return Values for Os_ApiReturnType and Os_ApiErrorType -- */

/* -- General -- */
/* REQ_ERR_020 */
/* Positive return value */
#define E_OS_OK                                                   1u

/* -- Kernel -- */
/* REQ_ERR_030 */
/* The Os_Start() API has been called while the OS is already started */
#define E_OS_WRONG_START_CONDITION                                11u

/* The Os_Shutdown() API has been called while the OS is already started */
#define E_OS_WRONG_STOP_CONDITION                                 12u

/* -- Task -- */
/* REQ_ERR_040 */
/* Wrong task ID is passed to the ActivateTask API */
#define E_OS_WRONG_TASK_ID                                        31u

/* A wrong task state transition is issued (e.g. trying to activate a RUNNING or YIELD Task) */
#define E_OS_WRONG_TASK_STATE_TRANSITION                          32u

/* A task ready to be dispatched is a null pointer */
#define E_OS_WRONG_TASK_PTR                                       33u

/* -- Schedule Table -- */
/* REQ_ERR_050 */
/* A wrong Schedule Table ID is passed to the StartScheduleTable or StopScheduleTable API */
#define E_OS_WRONG_SCH_TBL_ID                                     51u

/* A wrong schedule table state transition is issued (e.g. trying to activate a RUNNING Schedule Table) */
#define E_OS_WRONG_SCH_TBL_STATE_TRANSITION                       52u

/* A referenced schedule table is a null pointer */
#define E_OS_WRONG_SCH_TBL_PTR                                    53u

/* -- IPC -- */
/* REQ_ERR_060 */


/* -- VT -- */
/* REQ_ERR_060 */
/* A wrong virtual timer pointer is passed to a VT API */
#define E_OS_WRONG_VT_PTR                                         81u

/* A wrong timeout value is passed to Os_StartTimer API */
#define E_OS_WRONG_TMOUT_VALUE                                    82u

/* -- Alarms -- */
/* REQ_ERR_080 */
/* A referenced alarm is a null pointer */
#define E_OS_WRONG_ALARM_PTR                                      91u

/* A wrong Alarm callback (null pointer) has been passed to the alarm processing function */
#define E_OS_WRONG_ALARM_CBK                                      92u

/* A wrong alarm state transition is issued (e.g. trying to activate a RUNNING Alarm) */
#define E_OS_WRONG_ALARM_STATE_TRANSITION                         93u

/* A wrong Alarm ID is passed to the StartAlarm or StopAlarm API */
#define E_OS_WRONG_ALARM_ID                                       94u

/************************************************************************
* EXPORTED Macros
************************************************************************/
/* Task macro definition */
#define TASK(x)                                          void x (void)
/* Scheduler counter threshold define */
#define SCHED_COUNTER_TH                                 ((SCHED_TIMER_FREQ_HZ*DESIRED_SCHED_PERIOD_MS)/1000)

/************************************************************************
* EXPORTED Typedef
************************************************************************/
/* Main system timebase flag type */
typedef enum MainSystemTimebaseEnum
{
   CALL_TASK_PHASE      = 0,
   WAIT_TRIGGER_PHASE   = 1,
} MainSystemTimebaseType;

/* Task ready queue typedef */
typedef struct
{
   uint16_t TaskID;        /* The task ID */   
   uint16_t Priority;      /* The task execution priority */   
} TaskReadyQueueType;

/************************************************************************
* EXPORTED Variables
************************************************************************/
/* Main system timebase flag */
extern volatile MainSystemTimebaseType MainSystemTimebaseFlag;
/* Index of the current active task */
extern volatile uint16_t ActiveTaskIndex;
/* Index of the current yielding task */
extern volatile uint16_t YieldingTaskIndex;
/* Flag to indicate a yield */
extern volatile uint8_t SomebodyYielded;
/* Tasks ready queue */
extern volatile TaskReadyQueueType TaskReadyQueue[MAX_READY_TASKS];
/* Task ready queue control structure */
extern QueueCtrlStrType TaskReadyQueueCtrl;

/************************************************************************
* EXPORTED USER Hooks
************************************************************************/
#if (ENABLE_ERROR_HOOK == STD_TRUE)
extern void User_ErrorHook (Os_ApiErrorType ErrorCode);
#endif

/************************************************************************
* EXPORTED Functions
************************************************************************/
/* Start the OS */
Os_VoidReturnType Os_Start (void);
/* Shut the OS down */
Os_ApiReturnType Os_Shutdown (void);
/* Manage the various Scheduler interrupt services */
Os_VoidReturnType Os_Tick (void);
/* Dispatch after a task yield */
Os_VoidReturnType Os_Schedule (void);
/* Sort the task ready queue */
Os_VoidReturnType Os_SortReadyQueue (volatile TaskReadyQueueType Trq[]);
/* Get the OS Major, Minor and Fix version */
Os_ApiReturnType Os_GetVersion (uint8_t* Major, uint8_t* Minor, uint8_t* Fix);

#endif /* OS_H */