/************************************************************************
*                        OS Schedule Table                         
*************************************************************************
* FileName:         os_sched_tbl.c                                                                                
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
#include "os_sched_tbl.h"
#include "os_cfg.h"
#include "os_sched_tbl_cfg.h"
#include "os_task.h"
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

/************************************************************************
* Function:     Os_UpdateSchedTable
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Update the system schedule table.    
************************************************************************/
Os_ApiReturnType Os_UpdateSchedTable (void)
{
  /* Locals */
  Os_ApiReturnType OpRes = E_OS_OK;    
  uint16_t SchTblIdx = 0u;  
  uint16_t SchEvtIdx = 0u;
  
  /* Scroll the schedule table list */  
  for (SchTblIdx = 0u; SchTblIdx < SCH_TBL_NUMB; SchTblIdx++)
  {
    /* If the schedule table has been activated (Configuration or at runtime) */
    if (SchedTableList[SchTblIdx].ScheduleTableState == SCH_TBL_ACTIVE)
    {
      /* Scroll the schedule table */  
      for (SchEvtIdx = 0u; SchEvtIdx < SchedTableList[SchTblIdx].SchEvtNumber; SchEvtIdx++)
      {
        /* Consistency check of pointed element */
        if (SchedTableList[SchTblIdx].SchedTblElem != NULL)
        {
          /* Increment sched. counter for each sched. event */ 
          SchedTableList[SchTblIdx].SchedTblElem[SchEvtIdx].Counter++;
          /* If a schedule event matches... */
          if (SchedTableList[SchTblIdx].SchedTblElem[SchEvtIdx].Counter >= (SchedTableList[SchTblIdx].SchedTblElem[SchEvtIdx].TimeoutMs/SCHED_COUNTER_TH))
          {
#ifdef TERMINAL_DEBUG_ENABLED
            if (SchEvtIdx == 0)
            {
              printf("\r\nTimestamp - %d - ", Os_TickCounter);        
              printf("New Scheduling cycle:\r\n");
            }
#endif      
            /* ... activate the corresponding task */
            Os_ActivateTask(SchedTableList[SchTblIdx].SchedTblElem[SchEvtIdx].TaskID);
            /* Reset counter */
            SchedTableList[SchTblIdx].SchedTblElem[SchEvtIdx].Counter = 0;          
          }    
          /* OK */
          OpRes = E_OS_OK;            
        }
        else
        {
          /* Bad pointer */
          OpRes = E_OS_WRONG_SCH_TBL_PTR;
          /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
          User_ErrorHook(OpRes);
#endif          
        }
      }    
    }
  }  
  
  /* Return operation result */
  return OpRes;    
}

/************************************************************************
* Function:     Os_StartSchedTable
* Input:        None
* Output:       uint16_t ID
* Author:       F.Ficili	
* Description:  Start a ScheduleTable by ID.   
************************************************************************/
Os_ApiReturnType Os_StartSchedTable (uint16_t ID)
{
  /* Locals */
  Os_ApiReturnType OpRes;  
  uint16_t SchTblIdx = 0u;  
  bool Found = false;  
  
  /* Scroll the schedule table list */  
  for (SchTblIdx = 0u; SchTblIdx < SCH_TBL_NUMB; SchTblIdx++)
  {
    /* Find the schedule table by ID */
    if (SchedTableList[SchTblIdx].SchedTblID == ID)
    {
      /* Set found flag and break */
      Found = true;      
      /* Transition check */
      if (SchedTableList[SchTblIdx].ScheduleTableState == SCH_TBL_IDLE)
      {                
        /* Activate Schedule table */
        SchedTableList[SchTblIdx].ScheduleTableState = SCH_TBL_ACTIVE;
        /* OK */
        OpRes = E_OS_OK;
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Schedule Table %d Started \r\n", ID);
#endif          
      }
      else
      {
        /* Wrong state transition, to be activated a schedule table must be in IDLE state */
        OpRes = E_OS_WRONG_SCH_TBL_STATE_TRANSITION;
        /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif           
#ifdef TERMINAL_DEBUG_ENABLED
          printf("Timestamp - %d - ", Os_TickCounter);      
          printf("Schedule Table %d Not Started, wrong state transition \r\n", ID);
#endif       
      }        
      break;
    }   
  } 
  
  /* If we didn't find the schedule table */
  if (Found == false)
  {
    /* Wrong ID */
    OpRes = E_OS_WRONG_SCH_TBL_ID;
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Schedule Table %d Not Found \r\n", ID);
#endif        
  }
  
  /* Return operation result */
  return OpRes;  
}

/************************************************************************
* Function:     Os_StopSchedTable
* Input:        None
* Output:       uint16_t ID
* Author:       F.Ficili	
* Description:  Stop a ScheduleTable by ID.   
************************************************************************/
Os_ApiReturnType Os_StopSchedTable (uint16_t ID)
{
  /* Locals */
  Os_ApiReturnType OpRes;  
  uint16_t SchTblIdx = 0u;  
  bool Found = false;  
  
  /* Scroll the schedule table list */  
  for (SchTblIdx = 0u; SchTblIdx < SCH_TBL_NUMB; SchTblIdx++)
  {
    /* Find the schedule table by ID */
    if (SchedTableList[SchTblIdx].SchedTblID == ID)
    {
      /* Set found flag and break */
      Found = true;      
      /* Transition check */
      if (SchedTableList[SchTblIdx].ScheduleTableState == SCH_TBL_ACTIVE)
      {                
        /* De-Activate Schedule table */
        SchedTableList[SchTblIdx].ScheduleTableState = SCH_TBL_IDLE;
        /* OK */
        OpRes = E_OS_OK;
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Schedule Table %d Started \r\n", ID);
#endif          
      }
      else
      {
        /* Wrong state transition, to be de-activated a schedule table must be in ACTIVE state */
        OpRes = E_OS_WRONG_SCH_TBL_STATE_TRANSITION;
        /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif           
#ifdef TERMINAL_DEBUG_ENABLED
          printf("Timestamp - %d - ", Os_TickCounter);      
          printf("Schedule Table %d Not Started, wrong state transition \r\n", ID);
#endif       
      }        
      break;
    }   
  } 
  
  /* If we didn't find the schedule table */
  if (Found == false)
  {
    /* Wrong ID */
    OpRes = E_OS_WRONG_SCH_TBL_ID;
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Schedule Table %d Not Found \r\n", ID);
#endif        
  }
  
  /* Return operation result */
  return OpRes;  
}
