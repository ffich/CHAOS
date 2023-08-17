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
#include "os_cfg.h"
#include "os_task.h"
#include "os_task_cfg.h"

/************************************************************************
* Defines
************************************************************************/
/* Forever define for main while loop */
#define FOREVER                                          ((uint8_t)(1))

/************************************************************************
* Typedefs
************************************************************************/


/************************************************************************
* LOCAL Variables
************************************************************************/


/************************************************************************
* GLOBAL Variables
************************************************************************/
/* Main system timebase */
volatile MainSystemTimebaseType MainSystemTimebaseFlag = WAIT_TRIGGER_PHASE;
/* Index of the current active task */
volatile uint16_t ActiveTaskIndex = 0;

/************************************************************************
* LOCAL Function Prototypes
************************************************************************/


/************************************************************************
* LOCAL Function Implementations
************************************************************************/

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
* GLOBAL Function Implementations
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
  /* Init block. Here all the OS initialization take place */
  
#if (SORT_OPTION == SORT_INIT_ONLY)
  /* Sort task table */
  Os_SortTaskTable(Tasks);
#endif  
  
  /* Infinite loop */
  do
  {
    /* If the scheduler timer has expired */
    if (MainSystemTimebaseFlag == CALL_TASK_PHASE)
    {   
#if (SORT_OPTION == SORT_EACH_SCH_CYCLE)      
      /* Sort task table */
      Os_SortTaskTable(Tasks);
#endif        
      
      /* Dispatch the activated tasks */
      Os_Dispatch();
      /* Reset flag */
      MainSystemTimebaseFlag = WAIT_TRIGGER_PHASE;
    }
  } while (FOREVER);
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
* Function:     Os_Dispatch
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Dispatch ready tasks.  
************************************************************************/
void Os_Dispatch (void)
{
  /* Scroll the task table */  
  for (ActiveTaskIndex = 0u; ActiveTaskIndex < TASK_NUMBER; ActiveTaskIndex++)
  {
    if (Tasks[ActiveTaskIndex].State == READY)
    {
      /* Change task state */
      Tasks[ActiveTaskIndex].State = RUNNING;
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Task %d Running \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif      
      /* Run the task */
      Tasks[ActiveTaskIndex].Task();    
    }
  }    
}

/************************************************************************
* Function:     Os_DispatchOnYeld
* Input:        uint16_t Priority
* Output:       None
* Author:       F.Ficili	
* Description:  Dispatch after a task yield.  
************************************************************************/
void Os_DispatchOnYeld (uint16_t Priority)
{
  /* Scroll the task table */  
  for (ActiveTaskIndex = 0u; ActiveTaskIndex < TASK_NUMBER; ActiveTaskIndex++)
  {
    if ((Tasks[ActiveTaskIndex].State == READY) && (Tasks[ActiveTaskIndex].Priority >= Priority))
    {
      /* Change task state */
      Tasks[ActiveTaskIndex].State = RUNNING;
#ifdef TERMINAL_DEBUG_ENABLED
      printf("Task %d Running \r\n", Tasks[ActiveTaskIndex].TaskID);
#endif          
      /* Run the task */
      Tasks[ActiveTaskIndex].Task();
    }
  }    
}