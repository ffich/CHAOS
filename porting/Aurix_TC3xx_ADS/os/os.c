/************************************************************************
*                               OS Kernel                         
*************************************************************************
* FileName:         os.c                                                                                
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
#include "os_sched_tbl.h"
#include "os_sched_tbl_cfg.h"
#include "os_task.h"
#include "os_alarms.h"
#include "os_alarms_cfg.h"

/************************************************************************
* Defines
************************************************************************/
/* Forever define for main while loop */
#define FOREVER                                                     1u
/* First element of an array/queue */
#define FIRST_ELEM                                                  0u

/************************************************************************
* Typedefs
************************************************************************/
/* State Type for the OS */
typedef enum
{
  OS_IDLE     = 0,
  OS_RUNNING  = 1,
} OsStateType;

/************************************************************************
* LOCAL Variables
************************************************************************/
/* State Variable for the OS */
static OsStateType OsState = OS_IDLE;

/************************************************************************
* GLOBAL Variables
************************************************************************/
/* Main system timebase */
volatile MainSystemTimebaseType MainSystemTimebaseFlag = WAIT_TRIGGER_PHASE;
/* Index of the current active task */
volatile uint16_t ActiveTaskIndex = 0;
/* Index of the current yielding task - 0xFFFF means nobody is currently yielding */
volatile uint16_t YieldingTaskIndex = 0xFFFF;
/* Flag to indicate a yield */
volatile uint8_t SomebodyYielded = 0;
/* Tasks ready queue */
volatile TaskReadyQueueType TaskReadyQueue[MAX_READY_TASKS];
/* Task ready queue control structure */
QueueCtrlStrType TaskReadyQueueCtrl;

/************************************************************************
* IMPORTED USER Hooks
************************************************************************/
#if (ENABLE_STARTUP_HOOK == STD_TRUE)
extern void User_StartupHook (void);
#endif

#if (ENABLE_SHUTDOWN_HOOK == STD_TRUE)
extern void User_ShutdownHook (void);
#endif

#if (ENABLE_PRE_TASK_HOOK == STD_TRUE)
extern void User_PreTaskHook (uint16_t TaskID);
#endif

#if (ENABLE_POST_TASK_HOOK == STD_TRUE)
extern void User_PostTaskHook (uint16_t TaskID);
#endif

/************************************************************************
* LOCAL Functions
************************************************************************/

/************************************************************************   
* Function:     UpdateSchFlag
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Update the schedule flag.
************************************************************************/
Os_VoidReturnType UpdateSchFlag (void)
{
  /* Tick event counter  */
  static volatile uint16_t TickCounter = 0;

  /* Increment local counter */
  TickCounter++;
  /* If the scheduler period has elapsed */
  if (TickCounter >= SCHED_COUNTER_TH)
  {
    /* Reset counter */
    TickCounter = 0;
    /* Main scheduler timebase flag */
    MainSystemTimebaseFlag = CALL_TASK_PHASE;
  }   
}

/* REQ_KER_020 */
/************************************************************************   
* Function:     UpdateOsCounters
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Function used to increment Os-related counters.
************************************************************************/
Os_VoidReturnType UpdateOsCounters (void)
{
  /* Increment Os tick counter, this counter wraps after 4.294.967.296 counts */
  Os_TickCounter++;
}

/************************************************************************   
* Function:     OsDispatch
* Input:        uint16_t TaskIndex
* Output:       None
* Author:       F.Ficili
* Description:  Dispatch a task.
************************************************************************/
Os_VoidReturnType OsDispatch (uint16_t TaskIndex)
{  
/* REQ_HOOK_010 REQ_HOOK_040 */  
/* Optionally call the pre-task hook */  
#if (ENABLE_PRE_TASK_HOOK == STD_TRUE)
  User_PreTaskHook(Tasks[TaskIndex].TaskID);
#endif  
  
  /* Sanity check on Task Pointer */
  if (Tasks[TaskIndex].Task != NULL)
  {
    /* Change task state */
    Tasks[TaskIndex].State = RUNNING;    
    /* Run the task */
    Tasks[TaskIndex].Task();  
  }
  else
  {
#if (ENABLE_ERROR_HOOK == STD_TRUE)
    User_ErrorHook(E_OS_WRONG_TASK_PTR);
#endif     
  }
  
/* REQ_HOOK_010 REQ_HOOK_050 */ 
/* Optionally call the post-task hook */   
#if (ENABLE_POST_TASK_HOOK == STD_TRUE)
  User_PostTaskHook(Tasks[TaskIndex].TaskID);
#endif  
}

/************************************************************************   
* Function:     SetOsState
* Input:        OsStateType State
* Output:       None
* Author:       F.Ficili
* Description:  This function set the OS State.
************************************************************************/
Os_VoidReturnType SetOsState (OsStateType State)
{ 
  /* Set OS State */
  OsState = State;
}

/************************************************************************   
* Function:     ActivateAutoStartedTasks
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Activate all auto-started tasks.
************************************************************************/
Os_VoidReturnType ActivateAutoStartedTasks (void)
{
  uint16_t TaskIndex;
  
  /* Scroll the auto-start task table */  
  for (TaskIndex = 0u; TaskIndex < AutoStartTaskNumber; TaskIndex++)
  {
    /* Activate the task */
    Os_ActivateTask(AutoStartedTasks[TaskIndex]);
  }  
} 

/************************************************************************   
* Function:     OsInit
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  This function makes all the initialization needed by the OS.
************************************************************************/
void OsInit (void)
{  
  /* Init task ready queue */
  Os_InitEvtQueue(&TaskReadyQueueCtrl, MAX_READY_TASKS, sizeof(TaskReadyQueueType), TaskReadyQueue);
    
  /* Activate auto-started tasks */
  ActivateAutoStartedTasks();
  
  /* Check that the OS is in the right initial state */
  if (OsState == OS_IDLE)
  {
    /* Put OS in RUNNING State */
    SetOsState(OS_RUNNING);  
  }
  else
  {
#if (ENABLE_ERROR_HOOK == STD_TRUE)
    User_ErrorHook(E_OS_WRONG_START_CONDITION);
#endif       
  }

/* REQ_HOOK_010 REQ_HOOK_020 */   
/* Optionally call the Startup Hook */  
#if (ENABLE_STARTUP_HOOK == STD_TRUE)
  User_StartupHook();
#endif  
}

#if (OS_SHUTDOWN_BEHAVIOR == CONTINUE_MAIN_EXECUTION)
/************************************************************************   
* Function:     OsShutdown
* Input:        OsStateType State
* Output:       None
* Author:       F.Ficili
* Description:  Optionally call the ShutdownHook and then stop the OS.
************************************************************************/
Os_VoidReturnType OsShutdown (void)
{  
  /* REQ_HOOK_010 REQ_HOOK_030 */
  /* Optionally call the Shutdown Hook */  
#if (ENABLE_SHUTDOWN_HOOK == STD_TRUE)
  /* Call Shutdown Hook */
  User_ShutdownHook();
#endif
  /* REQ_KER_040 */  
  /* If the shutdown behavior is set to CONTINUE_MAIN_EXECUTION this function 
   * call return to Os_Start that will complete the execution and return control to main().
  */ 
} 
#endif

/************************************************************************
* Function:     OsSchedule
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Extract and run ready tasks from the queue.  
************************************************************************/
Os_VoidReturnType OsSchedule (void)
{
  TaskReadyQueueType Task;     
  
  /* If the ready queue is not empty */
  if (!Os_IsEvtQueueEmpty(&TaskReadyQueueCtrl))
  {
    /* Extract tasks from the ready queue */
    if (Os_QueueExtractAndShift(&TaskReadyQueueCtrl, &Task))
    {
      /* Scroll the task table */  
      for (ActiveTaskIndex = 0u; ActiveTaskIndex < TaskNumber; ActiveTaskIndex++)
      {
        /* If the task ID matches */
        if (Tasks[ActiveTaskIndex].TaskID == Task.TaskID)
        {
          /* Call dispatcher  */
          OsDispatch(ActiveTaskIndex);   
        }
      }
    }  
  }
}

/************************************************************************
* GLOBAL Functions
************************************************************************/

/* REQ_KER_011 */
/************************************************************************
* Function:     Os_Start
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Start the OS.       
************************************************************************/
Os_VoidReturnType Os_Start (void)
{   
  /* OS Lifecycle: 
   * - Init
   * - Running
   * - Shutdown 
   */
  
  /* --------------------- INIT BLOCK --------------------- */
  
  /* Here all the OS initialization take place */
  OsInit();
  
  /* -------------------- RUNNING BLOCK ------------------- */
  
  /* Infinite loop */
  while (OsState == OS_RUNNING)
  {
#if (SCHEDULE_AT_TICK == STD_TRUE)    
    /* If the scheduler timer has expired */
    if (MainSystemTimebaseFlag == CALL_TASK_PHASE)
#endif      
    {           
      /* Dispatch the activated tasks */
      OsSchedule();
      /* Reset flag */
      MainSystemTimebaseFlag = WAIT_TRIGGER_PHASE;
    }
  }
  
#if (OS_SHUTDOWN_BEHAVIOR == CONTINUE_MAIN_EXECUTION)  
  /* ------------------- SHUTDOWN BLOCK ------------------ */  
  
  /* Call OsShutdown */
  OsShutdown();  
#endif  
}

/************************************************************************
* Function:     Os_Schedule
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Schedule when a task yield. This schedule happens in the calling
*               context of the yielding task.  
************************************************************************/
Os_VoidReturnType Os_Schedule (void)
{  
  /* Locals */
  TaskReadyQueueType Task;    
  
  /* If the ready queue is not empty */
  if (!Os_IsEvtQueueEmpty(&TaskReadyQueueCtrl))
  {
    /* If the next ready to go task has an higher priority than the current active one, we yield, otherwise no. 
     * The ready queue is sorted by priority, so we are sure that the next ready to go is the current system-wide
     * higher priority task ready to run.
     */
    if (TaskReadyQueue[FIRST_ELEM].Priority > Tasks[ActiveTaskIndex].Priority)
    {
      /* Extract the task from the ready queue */
      if (Os_QueueExtractAndShift(&TaskReadyQueueCtrl, &Task))
      {
        /* Scroll the task table until we find the task */  
        for (ActiveTaskIndex = 0u; ActiveTaskIndex < TaskNumber; ActiveTaskIndex++)
        {
          /* If the task ID matches */
          if (Tasks[ActiveTaskIndex].TaskID == Task.TaskID)
          {
            /* Call dispatcher  */
            OsDispatch(ActiveTaskIndex);   
          }
        }
      }      
    }
  }  
}

/************************************************************************
* Function:     Os_Shutdown
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Shut the OS down. 
************************************************************************/
Os_ApiReturnType Os_Shutdown (void)
{
  /* Locals */
  Os_ApiReturnType OpRes; 
  
#if (OS_SHUTDOWN_BEHAVIOR == IMMEDIATE_INFINITE_LOOP)
  /* REQ_HOOK_010 REQ_HOOK_030 */
  /* Optionally call the Shutdown Hook */  
#if (ENABLE_SHUTDOWN_HOOK == STD_TRUE)
  /* Call Shutdown Hook */
  User_ShutdownHook();
#endif
  /* REQ_KER_040 */  
  /* If the shutdown behavior is set to INFINITE_LOOP we stop here, otherwise 
  * we led the OS complete the current scheduling cycle and after that return control to main().
  */ 
#if (OS_SHUTDOWN_BEHAVIOR == INFINITE_LOOP)
  while(FOREVER);
#endif  
#elif (OS_SHUTDOWN_BEHAVIOR == CONTINUE_MAIN_EXECUTION)  
  
  /* Check if the OS is in the right state */
  if (OsState == OS_RUNNING)
  {  
    /* Put the os in IDLE state */
    SetOsState(OS_IDLE);
  }
  else
  {
    /* Wrong OS stop condition */
    OpRes = E_OS_WRONG_STOP_CONDITION;
#if (ENABLE_ERROR_HOOK == STD_TRUE)
    User_ErrorHook(OpRes);
#endif       
  }
#endif  
  /* Return operation result */
  return OpRes; 
}

/* REQ_KER_021 */
/************************************************************************   
* Function:     Os_Tick
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Manage the OS base tick. This service must be called inside 
*               the system tick timer interrupt.
************************************************************************/
Os_VoidReturnType Os_Tick (void)
{
  /* Update scheduler flag */
  UpdateSchFlag();
  /* Update Os-related counters */
  UpdateOsCounters();
  /* Update schedule table */
  Os_UpdateSchedTable();  
  /* Update system alarms */
  Os_UpdateAlarms();
}

/* REQ_KER_010 REQ_KER_030 */
/* 
 * The following function implements the sorting algorithm that decide which task run first.
 * This is a crucial part of the Scheduler and the OS, and thus the first chosen algorithm (Insertion Sort) may not be optimal.
 * Then the idea is to postpone the problematic of choose the optimal algorithm and provide option  for changing them at compile time.
 */

#if (SORT_ALGORITHM == INSERTION_SORT)
/************************************************************************   
* Function:     Os_SortReadyQueue
* Input:        TaskReadyQueueType Trq[]
* Output:       None
* Author:       F.Ficili
* Description:  Function used to sort the task ready queue basing on priority.
*               Algorithm version: Insertion Sort. 
************************************************************************/
Os_VoidReturnType Os_SortReadyQueue (volatile TaskReadyQueueType Trq[])
{
  int16_t i,j;
  uint16_t Priority;
  TaskReadyQueueType TrqBackup;
  uint16_t QueueItemsCount;
  
  /* Get the number of elements in the queue */
  Os_GetQueueItemCount(&TaskReadyQueueCtrl, &QueueItemsCount);
  
  /* Start sorting algorithm */
  for (i = 1; i < QueueItemsCount; i++) 
  {
    Priority = Trq[i].Priority;
    j = i - 1;

    /* Move elements of Trq[0..i-1], that are greater than Priority, to one position ahead
      of their current position */
    while (j >= 0 && Trq[j].Priority < Priority) 
    {
      TrqBackup = Trq[j + 1];
      Trq[j + 1] = Trq[j];
      /* Restore Task backup */
      Trq[j] = TrqBackup;         
      j = j - 1;
    }

    /* Update priority */
    Trq[j + 1].Priority = Priority;
  }
}
#elif (SORT_ALGORITHM == MERGE_SORT)
/************************************************************************   
* Function:     Os_SortReadyQueue
* Input:        TaskReadyQueueType Trq[]
* Output:       None
* Author:       F.Ficili
* Description:  Function used to sort the task table basing on priority.
*               Algorithm version: Merge Sort. 
************************************************************************/
void Os_SortReadyQueue (TaskReadyQueueType Trq[])
{
  /* To be implemented */
}
#endif

/* REQ_KER_050 */
/************************************************************************
* Function:     Os_GetVersion
* Input:        None
* Output:       uint8_t* Major --> OS Version Major 
*               uint8_t* Minor --> OS Version Minor 
*               uint8_t* Fix --> OS Version Fix   
* Author:       F.Ficili	
* Description:  Return the OS Version Major, Minor and Fix.
************************************************************************/
Os_ApiReturnType Os_GetVersion (uint8_t* Major, uint8_t* Minor, uint8_t* Fix)
{
  /* Locals */
  Os_ApiReturnType OpRes;    
  
  /* Return the OS version */
  *Major = OS_VERSION_MAJOR;
  *Minor = OS_VERSION_MINOR;
  *Fix = OS_VERSION_FIX;
  
  /* OK */
  OpRes = E_OS_OK;    
  
  /* Return operation result */
  return OpRes;  
}
