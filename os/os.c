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
#include "os_timers.h"
#include "os_task.h"

/************************************************************************
* Defines
************************************************************************/
/* Forever define for main while loop */
#define FOREVER                                                     1u

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

/* 
 * The following function implements the sorting algorithm that decide which task run first.
 * This is a crucial part of the Scheduler and the OS, and thus the first chosen algorithm (Insertion Sort) may not be optimal.
 * Then the idea is to postpone the problematic of choose the optimal algorithm and provide option  for changing them at compile time.
 */

#if (SORT_ALGORITHM == INSERTION_SORT)
#warning "The chosen sorting algorithm is INSERTION_SORT"
/************************************************************************   
* Function:     SortTaskTable
* Input:        TbcType Tbc[]
* Output:       None
* Author:       F.Ficili
* Description:  Function used to sort the task table basing on priority.
*               Algorithm version: Insertion Sort. 
************************************************************************/
void SortTaskTable(TbcType Tbc[])
{
  int16_t i,j;
  uint16_t Priority;
  TbcType TbcBackup;
  
  /* Start sorting algorithm */
  for (i = 1; i < TaskNumber; i++) 
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
* Function:     SortTaskTable
* Input:        TbcType Tbc[]
* Output:       None
* Author:       F.Ficili
* Description:  Function used to sort the task table basing on priority.
*               Algorithm version: Merge Sort. 
************************************************************************/
void SortTaskTable(TbcType Tbc[])
{
  /* To be implemented */
}
#endif

/************************************************************************   
* Function:     UpdateSchFlag
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Update the schedule flag.
************************************************************************/
void UpdateSchFlag (void)
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

/************************************************************************   
* Function:     UpdateOsCounters
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Function used to increment Os-related counters.
************************************************************************/
void UpdateOsCounters (void)
{
  /* Increment Os tick counter, this counter wraps after 4.294.967.296 counts */
  Os_TickCounter++;
}

/************************************************************************   
* Function:     OsDispatch
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Dispatch a task.
************************************************************************/
void OsDispatch (void)
{  
/* REQ_HOOK_010 REQ_HOOK_040 */  
/* Optionally call the pre-task hook */  
#if (ENABLE_PRE_TASK_HOOK == STD_TRUE)
  User_PreTaskHook(Tasks[ActiveTaskIndex].TaskID);
#endif  
  
  /* Run the task */
  Tasks[ActiveTaskIndex].Task();
  
/* REQ_HOOK_010 REQ_HOOK_050 */ 
/* Optionally call the post-task hook */   
#if (ENABLE_POST_TASK_HOOK == STD_TRUE)
  User_PostTaskHook(Tasks[ActiveTaskIndex].TaskID);
#endif  
}

/************************************************************************   
* Function:     SetOsState
* Input:        OsStateType State
* Output:       None
* Author:       F.Ficili
* Description:  This function set the OS State.
************************************************************************/
void SetOsState (OsStateType State)
{ 
  /* Set OS State */
  OsState = State;
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
  /* Task table sorting, if requested at startup */  
#if (SORT_OPTION == SORT_INIT_ONLY)
  /* Sort task table */
  SortTaskTable(Tasks);
#endif        
  
  /* Put OS in RUNNING State */
  SetOsState(OS_RUNNING);
  
/* REQ_HOOK_010 REQ_HOOK_020 */   
/* Optionally call the Startup Hook */  
#if (ENABLE_STARTUP_HOOK == STD_TRUE)
  User_StartupHook();
#endif  
}

/************************************************************************   
* Function:     OsShutdown
* Input:        OsStateType State
* Output:       None
* Author:       F.Ficili
* Description:  Optionally call the ShutdownHook and then stop the OS.
************************************************************************/
void OsShutdown (void)
{  
/* REQ_HOOK_010 REQ_HOOK_030 */
/* Optionally call the Shutdown Hook */  
#if (ENABLE_SHUTDOWN_HOOK == STD_TRUE)
  /* Call Shutdown Hook */
  User_ShutdownHook();
#endif
 
#if (OS_SHUTDOWN_BEHAVIOR == INFINITE_LOOP)
  while(FOREVER);
#endif
} 

/************************************************************************
* GLOBAL Functions
************************************************************************/

/************************************************************************
* Function:     Os_Start
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Start the OS.       
************************************************************************/
void Os_Start (void)
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
    /* If the scheduler timer has expired */
    if (MainSystemTimebaseFlag == CALL_TASK_PHASE)
    {   
#if (SORT_OPTION == SORT_EACH_SCH_CYCLE)      
      /* Sort task table */
      SortTaskTable(Tasks);
#endif              
      /* Dispatch the activated tasks */
      Os_Schedule();
      /* Reset flag */
      MainSystemTimebaseFlag = WAIT_TRIGGER_PHASE;
    }
  }
  
  /* ------------------- SHUTDOWN BLOCK ------------------ */  
  
  /* Call OsShutdown */
  OsShutdown();  
}

/************************************************************************
* Function:     Os_Shutdown
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Shut the OS down. 
************************************************************************/
void Os_Shutdown (void)
{
  /* Put the os in IDLE state */
  SetOsState(OS_IDLE);
}

/************************************************************************   
* Function:     Os_Tick
* Input:        None
* Output:       None
* Author:       F.Ficili
* Description:  Manage the OS base tick. This service must be called inside 
*               the system tick timer interrupt.
************************************************************************/
void Os_Tick (void)
{
  /* Update scheduler flag */
  UpdateSchFlag();
  /* Update Os-related counters */
  UpdateOsCounters();
  /* Update schedule table */
  Os_UpdateSchedTable();  
}

/************************************************************************
* Function:     Os_Schedule
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Dispatch ready tasks.  
************************************************************************/
void Os_Schedule (void)
{
  /* Scroll the task table */  
  for (ActiveTaskIndex = 0u; ActiveTaskIndex < TaskNumber; ActiveTaskIndex++)
  {
    if (Tasks[ActiveTaskIndex].State == READY)
    {
      /* Change task state */
      Tasks[ActiveTaskIndex].State = RUNNING;
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Timestamp - %d - ", Os_TickCounter);
      printf("Task %d Running \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif      
      /* Call dispatcher  */
      OsDispatch();    
    }
  }    
}

/************************************************************************
* Function:     Os_ScheduleOnYeld
* Input:        uint16_t Priority
* Output:       None
* Author:       F.Ficili	
* Description:  Dispatch after a task yield.  
************************************************************************/
void Os_ScheduleOnYeld (uint16_t Priority)
{  
  /* Scroll the task table */  
  for (ActiveTaskIndex = 0u; ActiveTaskIndex < TaskNumber; ActiveTaskIndex++)
  {
    if ((Tasks[ActiveTaskIndex].State == READY) && (Tasks[ActiveTaskIndex].Priority >= Priority))
    {
#ifdef TERMINAL_DEBUG_ENABLED
#ifdef TERMINAL_DEBUG_VERBOSE      
      if (!SomebodyYielded)
      {
        SomebodyYielded++;
        printf("Timestamp - %d - ", Os_TickCounter);  
        printf("Task %d Yelding \r\n", Tasks[YieldingTaskIndex].TaskID);        
      }
#endif 
#endif        
      /* Change task state */
      Tasks[ActiveTaskIndex].State = RUNNING;
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Timestamp - %d - ", Os_TickCounter);      
      printf("Task %d Running \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif          
      /* Call dispatcher  */
      OsDispatch();      
    }
  }  
}

/************************************************************************
* Function:     Os_GetVersion
* Input:        None
* Output:       uint8_t
* Author:       F.Ficili	
* Description:  Shut the OS down. 
************************************************************************/
void Os_GetVersion (uint8_t* Major, uint8_t* Minor, uint8_t* Fix)
{
  /* Return the OS version */
  *Major = OS_VERSION_MAJOR;
  *Minor = OS_VERSION_MINOR;
  *Fix = OS_VERSION_FIX;
}