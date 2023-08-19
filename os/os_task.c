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
#include "os.h"
#include "os_cfg.h"
#include "os_task.h"
#include "os_task_cfg.h"
#include "os_ipc.h"

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

/************************************************************************   
* Function:     Os_ActivateTask
* Input:        uint16_t TaskID
* Output:       None
* Author:       F.Ficili
* Description:  Activate a task based on the ID.
************************************************************************/
void Os_ActivateTask (uint16_t TaskID)
{
  /* Task idx */
  uint16_t TaskIdx = 0u;

  /* Scroll the task table */  
  for (TaskIdx = 0u; TaskIdx < TaskNumber; TaskIdx++)
  {
    if (Tasks[TaskIdx].TaskID == TaskID)
    {
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Timestamp - %d - ", Os_TickCounter);      
      printf("Task %d Activated \r\n", Tasks[TaskIdx].TaskID);
#endif                    
      /* Put the task in ready state */
      Tasks[TaskIdx].State = READY;
      break;
    }
  }
}

/************************************************************************   
* Function:     Os_TerminateTask
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Terminate the task. The function terminates the currently active
*               task, so has to be called by the running task itself. 
************************************************************************/
void Os_TerminateTask (void)
{
  /* Put the task in IDLE state */
  Tasks[ActiveTaskIndex].State = IDLE;
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Timestamp - %d - ", Os_TickCounter);  
      printf("Task %d Terminated \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif     
}

/************************************************************************   
* Function:     Os_Yield
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  This function is used by a running task to yield control
*               back to the scheduler. In this way a running task can co-operatively 
*               ask for pre-emption. This version allow only HiPrio task to preempt.
************************************************************************/
void Os_Yield (void)
{
  uint16_t YeldingTaskIdx = 0;
  
  /* Save the currently active task index (it will be changed by the dispatcher) */
  YeldingTaskIdx = ActiveTaskIndex;  
  /* Put the task in YIELD state */
  Tasks[YeldingTaskIdx].State = YIELD; 
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Timestamp - %d - ", Os_TickCounter);  
  printf("Task %d Yelding \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif     
  /* Dispatch tasks */
  Os_DispatchOnYeld(Tasks[YeldingTaskIdx].Priority);
  /* Put back the Active task index to the pre-yeld status */
  ActiveTaskIndex = YeldingTaskIdx;
  /* Put the task back in RUNNING state */
  Tasks[ActiveTaskIndex].State = RUNNING; 
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Timestamp - %d - ", Os_TickCounter);  
  printf("Task %d Resuming from Yield \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif     
}

/************************************************************************   
* Function:     Os_GetTaskID
* Input:        None
* Output:       uint16_t* TaskID
* Author:       F.Ficili
* Description:  Get the ID of the running task.
************************************************************************/
void Os_GetTaskID (uint16_t* TaskID)
{
  /* Return the current Task ID */
  *TaskID = Tasks[ActiveTaskIndex].TaskID;
}

/************************************************************************   
* Function:     Os_GetTaskPriority
* Input:        None
* Output:       uint16_t* Priority
* Author:       F.Ficili
* Description:  Get the Priority of the running task.
************************************************************************/
void Os_GetTaskPriority (uint16_t* Priority)
{
  /* Return the current Task ID */
  *Priority = Tasks[ActiveTaskIndex].Priority;
}