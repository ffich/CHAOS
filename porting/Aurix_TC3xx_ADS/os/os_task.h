/************************************************************************
*                                OS Task                         
*************************************************************************
* FileName:         os_task.h                                                                              
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

#ifndef OS_TASK_H
#define OS_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "common.h"
#include "os.h"
#include "os_task_cfg.h"

/************************************************************************
* EXPORTED Defines
************************************************************************/


/************************************************************************
* EXPORTED Macros
************************************************************************/


/************************************************************************
* EXPORTED Typedef
************************************************************************/
/* REQ_TSK_010 */
/* Task state type */
typedef enum 
{
   /* In this state the Scheduler will not select the task for dispatching */
   IDLE     = 0,
   /* A task can be moved in **READY** state by means of an activation (ActivateTask API) */        
   READY    = 1,
   /* When the task is in **READY** state, at the next dispatching round it will be executed and 
    * moved into **RUNNING** state by the Scheduler if it is the higher priority task that is ready to run 
    * A task is put back into **IDLE** state when it's terminated (TerminateTask or ChainTask APIs). */        
   RUNNING  = 2,
   /* A task can't be forcibly interrupted by the Scheduler, but it can voluntarily release control to it 
    * by means of a specific Yield API. In this case the Scheudler takes over and execute any higher priority 
    * task that is ready to run (cooperative scheduling). During this period, the task is put into the **YIELD** 
    * state by the Scheduler. Once there are no higher priority task to be executed, the control is given back 
    * to the yielding task, that is put back into the **RUNNING** state */
   YIELD    = 3        
} TaskStateType;

/* REQ_TSK_020 */
/* Task control block type */
typedef struct 
{
   uint16_t TaskID;        /* The task ID */   
   void (*Task) (void);    /* The task function pointer */   
   TaskStateType State;    /* The task state */
   uint16_t Priority;      /* The task execution priority */
} TbcType;

typedef uint16_t AutoStarTaskType;
/************************************************************************
* EXPORTED Variables
************************************************************************/
/* Task Table */
extern TbcType Tasks[];

/* Auto-start task table */
extern AutoStarTaskType AutoStartedTasks[];

/************************************************************************
* EXPORTED Functions
************************************************************************/
/* Activate a task based on its ID */
Os_ApiReturnType Os_ActivateTask (uint16_t TaskID);
/* Terminate the current running task */
Os_ApiReturnType Os_TerminateTask (void);
/* Terminate the currently running task and activate a new one */
Os_ApiReturnType Os_ChainTask (uint16_t TaskID);
/* Yield to higher priority tasks */
Os_ApiReturnType Os_Yield (void);
/* This API activate a specific task and consequently Yield */
Os_ApiReturnType Os_ActivateTaskAndYield (uint16_t TaskID);
/* Get the ID of the running task */
Os_ApiReturnType Os_GetTaskID (uint16_t* TaskID);
/* Get the Priority of the running task */
Os_ApiReturnType Os_GetTaskPriority (uint16_t* Priority);

#endif /* OS_TASK_H */