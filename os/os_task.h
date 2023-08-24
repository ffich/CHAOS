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
/* Task state type */
typedef enum 
{
   IDLE     = 0,
   READY    = 1,
   RUNNING  = 2,
   YIELD    = 3        
} TaskStateType;

/* Task control block type */
typedef struct 
{
   uint16_t TaskID;        /* The task ID */   
   void (*Task) (void);    /* The task function pointer */   
   TaskStateType State;    /* The task state */
   uint16_t Priority;      /* The task execution priority */   
} TbcType;

/************************************************************************
* EXPORTED Variables
************************************************************************/
extern TbcType Tasks[];

/************************************************************************
* EXPORTED Functions
************************************************************************/
/* Activate a task based on its ID */
void Os_ActivateTask (uint16_t TaskID);
/* Terminate the current running task */
void Os_TerminateTask (void);
/* Terminate the currently running task and activate a new one */
void Os_ChainTask (uint16_t TaskID);
/* Yield to higher priority tasks */
void Os_Yield (void);
/* Get the ID of the running task */
void Os_GetTaskID (uint16_t* TaskID);
/* Get the Priority of the running task */
void Os_GetTaskPriority (uint16_t* Priority);

#endif /* OS_TASK_H */