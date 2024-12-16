/************************************************************************
*                               OS Task                         
*************************************************************************
* FileName:         os_task.c                                                                                
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

/************************************************************************
* Includes
************************************************************************/
#include "os_task.h"
#include "os_cfg.h"
#include "os_task_cfg.h"

/************************************************************************
* Defines
************************************************************************/


/************************************************************************
* Typedefs
************************************************************************/


/************************************************************************
* LOCAL Variables
************************************************************************/


/************************************************************************
* GLOBAL Variables
************************************************************************/


/************************************************************************
* LOCAL Functions
************************************************************************/


/************************************************************************
* GLOBAL Functions
************************************************************************/

/* REQ_TSK_030 */
/************************************************************************   
* Function:     Os_ActivateTask
* Input:        uint16_t TaskID
* Output:       None
* Author:       F.Ficili
* Description:  Activate a task based on the ID.
************************************************************************/
Os_ApiReturnType Os_ActivateTask (uint16_t TaskID)
{
  /* Locals */
  Os_ApiReturnType OpRes;  
  uint16_t TaskIdx = 0u;
  bool Found = false;
  TaskReadyQueueType Task;  

  /* Scroll the task table */  
  for (TaskIdx = 0u; TaskIdx < TaskNumber; TaskIdx++)
  {
    if (Tasks[TaskIdx].TaskID == TaskID)
    {
      /* Set found flag and break */
      Found = true;      
      /* Transition check */
      if (Tasks[TaskIdx].State == IDLE)
      {        
        /* Put the task in ready state */
        Tasks[TaskIdx].State = READY;        
        /* Insert the task in the queue */
        Task.TaskID = TaskID;
        Task.Priority = Tasks[TaskIdx].Priority;
        Os_QueueInsert(&TaskReadyQueueCtrl, &Task);
        /* Sort the queue by priority */ 
        Os_SortReadyQueue(TaskReadyQueue); 
        /* OK */
        OpRes = E_OS_OK;            
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Task %d Activated \r\n", Tasks[TaskIdx].TaskID);
#endif             
      }
      else
      {
        /* Wrong state transition, to be activated a task must be in IDLE state */
        OpRes = E_OS_WRONG_TASK_STATE_TRANSITION;
        /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif           
#ifdef TERMINAL_DEBUG_ENABLED
          printf("Timestamp - %d - ", Os_TickCounter);      
          printf("Task %d Not Activated, wrong state transition \r\n", Tasks[TaskIdx].TaskID);
#endif            
      }
      break;
    }
  }
  
  /* If we didn't find the task */
  if (Found == false)
  {
    /* Wrong ID */
    OpRes = E_OS_WRONG_TASK_ID;
    /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
    User_ErrorHook(OpRes);
#endif        
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Task %d Not Found \r\n", TaskID);
#endif        
  }
  
  /* Return operation result */
  return OpRes;
}

/* REQ_TSK_040 */
/************************************************************************   
* Function:     Os_TerminateTask
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Terminate the task. The function terminates the currently active
*               task, so has to be called by the running task itself. 
************************************************************************/
Os_ApiReturnType Os_TerminateTask (void)
{
  /* Locals */
  Os_ApiReturnType OpRes;  
  
  /* Check task state */
  if (Tasks[ActiveTaskIndex].State == RUNNING)
  {
    /* Put the task in IDLE state */
    Tasks[ActiveTaskIndex].State = IDLE;
    /* OK */
    OpRes = E_OS_OK;
  #ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);  
        printf("Task %d Terminated \r\n", Tasks[ActiveTaskIndex].TaskID);
  #endif    
  }
  else
  {
    /* Wrong state transition, can't terminate a non-running task */
    OpRes = E_OS_WRONG_TASK_STATE_TRANSITION;
    /* Optionally call ErrorHook */    
#if (ENABLE_ERROR_HOOK == STD_TRUE)
    User_ErrorHook(OpRes);
#endif      
  }
    
  /* Return operation result */
  return OpRes;   
}

/* REQ_TSK_050 */
/************************************************************************   
* Function:     Os_ChainTask
* Input:        uint16_t TaskID
* Output:       None
* Author:       F.Ficili
* Description:  Terminate the currently running task and activate a new one.
************************************************************************/
Os_ApiReturnType Os_ChainTask (uint16_t TaskID)
{
  /* Locals */
  Os_ApiReturnType OpRes;    
  
  /* Terminate the currently running task */
  OpRes = Os_TerminateTask();
  /* Check Operation result */  
  if (OpRes == E_OS_OK)
  {
    /* Activate the new task */    
    OpRes = Os_ActivateTask(TaskID);
    /* Check Operation result */     
    if (OpRes == E_OS_OK)
    {
      /* OK */
      OpRes = E_OS_OK;
    }
  }

  /* Return operation result */
  return OpRes;     
}

/* REQ_TSK_060 */
/************************************************************************   
* Function:     Os_Yield
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  This function is used by a running task to yield control
*               back to the scheduler. In this way a running task can co-operatively 
*               ask for pre-emption. This version allow only HiPrio task to preempt.
************************************************************************/
Os_ApiReturnType Os_Yield (void)
{
  /* Locals */
  Os_ApiReturnType OpRes;   
  uint16_t YeldingTaskIdx = 0;
  
  /* Save the currently active task index (it will be changed by the dispatcher) */
  YeldingTaskIdx = ActiveTaskIndex;  
  /* Save the currently yielding task index on a global variable */
  YieldingTaskIndex = YeldingTaskIdx;  
  /* Check task state */
  if (Tasks[YeldingTaskIdx].State == RUNNING)
  {
    /* Put the task in YIELD state */
    Tasks[YeldingTaskIdx].State = YIELD; 
    /* Dispatch tasks */
    Os_Schedule();
    /* Put back the Active task index to the pre-yeld status */
    ActiveTaskIndex = YeldingTaskIdx;
    /* Put the task back in RUNNING state */
    Tasks[ActiveTaskIndex].State = RUNNING;  
    #ifdef TERMINAL_DEBUG_ENABLED
    #ifdef TERMINAL_DEBUG_VERBOSE
      if (SomebodyYielded)
      {      
        SomebodyYielded--;
        printf("Timestamp - %d - ", Os_TickCounter);  
        printf("Task %d Resuming from Yield \r\n", Tasks[ActiveTaskIndex].TaskID);      
      }
    #endif 
    #endif   
    /* OK */
    OpRes = E_OS_OK;    
  }
  else
  {
    /* Wrong state transition, can't yield a non-running task */
    OpRes = E_OS_WRONG_TASK_STATE_TRANSITION;  
#if (ENABLE_ERROR_HOOK == STD_TRUE)
    User_ErrorHook(OpRes);
#endif        
  }
  
  /* Return operation result */
  return OpRes;   
}

/* REQ_TSK_100 */
/************************************************************************   
* Function:     Os_ActivateTaskAndYield
* Input:        uint16_t TaskID
* Output:       None
* Author:       F.Ficili
* Description:  This API activate a specific task and consequently Yield. 
*               It's useful to launch an high priority task with a single API.
************************************************************************/
Os_ApiReturnType Os_ActivateTaskAndYield (uint16_t TaskID)
{
  /* Locals */
  Os_ApiReturnType OpRes;  
  
  /* Activate the new task */
  OpRes = Os_ActivateTask(TaskID); 
  /* Check Operation result */
  if (OpRes == E_OS_OK)
  {
    /* Yield */
    OpRes = Os_Yield();
    /* Check Operation result */
    if (OpRes == E_OS_OK)
    {
      OpRes = E_OS_OK;
    }
  }
  
  /* Return operation result */
  return OpRes;  
}

/* REQ_TSK_070 */
/************************************************************************   
* Function:     Os_GetTaskID
* Input:        None
* Output:       uint16_t* TaskID
* Author:       F.Ficili
* Description:  Get the ID of the running task.
************************************************************************/
Os_ApiReturnType Os_GetTaskID (uint16_t* TaskID)
{
  /* Locals */
  Os_ApiReturnType OpRes;    
  
  /* Return the current Task ID */
  *TaskID = Tasks[ActiveTaskIndex].TaskID;
  /* OK */
  OpRes = E_OS_OK;  
  
  /* Return operation result */
  return OpRes;   
}

/* REQ_TSK_080 */
/************************************************************************   
* Function:     Os_GetTaskPriority
* Input:        None
* Output:       uint16_t* Priority
* Author:       F.Ficili
* Description:  Get the Priority of the running task.
************************************************************************/
Os_ApiReturnType Os_GetTaskPriority (uint16_t* Priority)
{
  /* Locals */
  Os_ApiReturnType OpRes;   
  
  /* Return the current Task ID */
  *Priority = Tasks[ActiveTaskIndex].Priority;
  /* OK */
  OpRes = E_OS_OK;  
  
  /* Return operation result */
  return OpRes;    
}