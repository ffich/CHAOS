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

/************************************************************************
* EXPORTED Defines
************************************************************************/


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

/************************************************************************
* EXPORTED Functions
************************************************************************/
/* System main scheduler */
void Os_Start (void);
/* Manage the various Scheduler interrupt services */
void Os_Tick (void);
/* Dispatch ready tasks*/
void Os_Dispatch (void);
/* Dipatch after a task yield */
void Os_DispatchOnYeld (uint16_t Priority);

#endif /* OS_H */