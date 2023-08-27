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

/************************************************************************
* EXPORTED Defines
************************************************************************/
/* OS Version */
#define OS_VERSION_MAJOR                                          1
#define OS_VERSION_MINOR                                          0
#define OS_VERSION_FIX                                            0

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
void Os_Start (void);
/* Shut the OS down */
void Os_Shutdown (void);
/* Manage the various Scheduler interrupt services */
void Os_Tick (void);
/* Dispatch ready tasks*/
void Os_Schedule (void);
/* Dipatch after a task yield */
void Os_ScheduleOnYeld (uint16_t Priority);
/* Get the OS Major, Minor and Fix version */
void Os_GetVersion (uint8_t* Major, uint8_t* Minor, uint8_t* Fix);

#endif /* OS_H */