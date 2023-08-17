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
* Function Prototypes
************************************************************************/

/************************************************************************
* Function Implementations
************************************************************************/

/* 
 * The following function implemts the sorting algorithm that decide which task run first.
 * This is a crucial part of the Scheduler and the OS, and thus the first chosen algorithm (Insertion Sort) may not be optimal.
 * Then the idea is to postpone the problematic of choose the optimal algorithm and provide option  for changing them at compile time.
 */

#if (SORT_ALGORITHM == INSERTION_SORT)
#warning "The chosen sorting algorithm is INSERTION_SORT"
/************************************************************************   
* Function:     Os_SortTaskTable
* Input:        TbcType Tbc[]
* Output:       None
* Author:       F.Ficili
* Description:  Function used to sort the task table basing on priority.
*               Algorithm version: Insertion Sort. 
************************************************************************/
void Os_SortTaskTable(TbcType Tbc[])
{
  int16_t i,j;
  uint16_t Priority;
  TbcType TbcBackup;
  

  for (i = 1; i < TASK_NUMBER; i++) 
  {
    Priority = Tbc[i].Priority;
    j = i - 1;

    /* Move elements of Tbc[0..i-1], that are greater than Priority, to one position ahead
      of their current position */
    while (j >= 0 && Tbc[j].Priority < Priority) 
    {
      TbcBackup = Tbc[j + 1];
      Tbc[j + 1] = Tbc[j];
      /* Restore Task backup */
      Tbc[j] = TbcBackup;         
      j = j - 1;
    }

    /* Update priority */
    Tbc[j + 1].Priority = Priority;
  }
}
#elif (SORT_ALGORITHM == MERGE_SORT)
#warning "The chosen sorting algorithm is MERGE_SORT"
/************************************************************************   
* Function:     Os_SortTaskTable
* Input:        TbcType Tbc[]
* Output:       None
* Author:       F.Ficili
* Description:  Function used to sort the task table basing on priority.
*               Algorithm version: Merge Sort. 
************************************************************************/
void Os_SortTaskTable(TbcType Tbc[])
{
  /* To be implemented */
}
#endif

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
  for (TaskIdx = 0u; TaskIdx < TASK_NUMBER; TaskIdx++)
  {
    if (Tasks[TaskIdx].TaskID == TaskID)
    {
#ifdef TERMINAL_DEBUG_ENABLED
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
  printf("Task %d Yelding \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif     
  /* Dispatch tasks */
  Os_DispatchOnYeld(Tasks[YeldingTaskIdx].Priority);
  /* Put back the Active task index to the pre-yeld status */
  ActiveTaskIndex = YeldingTaskIdx;
  /* Put the task back in RUNNING state */
  Tasks[ActiveTaskIndex].State = RUNNING; 
#ifdef TERMINAL_DEBUG_ENABLED
  printf("Task %d Resuming from Yield \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif     
}

/************************************************************************   
* Function:     Os_YieldAllTasks
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  This function is used by a running task to yield control
*               back to the scheduler. In this way a running task can co-operatively 
*               ask for pre-emption. This version allow all tasks to preempt.
************************************************************************/

/* Still buggy and probably impossible to implement in this way */

void Os_YieldAllTasks (void)
{
  uint16_t YeldingTaskIdx = 0;
  
  /* We Yield only if we are not already yielding */
  if (Tasks[ActiveTaskIndex].State != YIELD)
  {
    /* Save the currently active task index (it will be changed by the dispatcher) */
    YeldingTaskIdx = ActiveTaskIndex;  
    /* Put the task in YIELD state */
    Tasks[YeldingTaskIdx].State = YIELD;    
#ifdef TERMINAL_DEBUG_ENABLED
    printf("Task %d Yelding \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif    
    /* Dispatch tasks */
    Os_Dispatch();
    /* Put back the Active task index to the pre-yeld status */
    ActiveTaskIndex = YeldingTaskIdx;
    /* Put the task back in RUNNING state */
  Tasks[ActiveTaskIndex].State = RUNNING;  
#ifdef TERMINAL_DEBUG_ENABLED
    printf("Task %d Yelding \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif    
  }
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