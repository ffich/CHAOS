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
#include "os.h"
#include "common.h"
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
void Os_UpdateSchedTable (void)
{
  /* Sched tbl. index */
  uint16_t SchTblIdx = 0u;  
  /* Sched evt. index */
  uint16_t SchEvtIdx = 0u;
  
  /* Scroll the schedule table list */  
  for (SchTblIdx = 0u; SchTblIdx < SCH_TBL_NUMB; SchTblIdx++)
  {
    /* If the schedule table has been activated */
    if (SchedTableList[SchTblIdx].ScheduleTableState == SCH_TBL_ACTIVE)
    {
      /* Scroll the schedule table */  
      for (SchEvtIdx = 0u; SchEvtIdx < SchedTableList[SchTblIdx].SchEvtNumber; SchEvtIdx++)
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
      }    
    }
  }  
}

/************************************************************************
* Function:     Os_StartSchedTable
* Input:        None
* Output:       uint16_t ID
* Author:       F.Ficili	
* Description:  Start a ScheduleTable by ID.   
************************************************************************/
void Os_StartSchedTable (uint16_t ID)
{
  /* Sched tbl. index */
  uint16_t SchTblIdx = 0u;  
  
  /* Scroll the schedule table list */  
  for (SchTblIdx = 0u; SchTblIdx < SCH_TBL_NUMB; SchTblIdx++)
  {
    /* find the schedule table by ID */
    if (SchedTableList[SchTblIdx].SchedTblID == ID)
    {
      /* Activate Schedule table */
      SchedTableList[SchTblIdx].ScheduleTableState = SCH_TBL_ACTIVE;
      break;
    }   
  }    
}

/************************************************************************
* Function:     Os_StopSchedTable
* Input:        None
* Output:       uint16_t ID
* Author:       F.Ficili	
* Description:  Stop a ScheduleTable by ID.   
************************************************************************/
void Os_StopSchedTable (uint16_t ID)
{
  /* Sched tbl. index */
  uint16_t SchTblIdx = 0u;  
  
  /* Scroll the schedule table list */  
  for (SchTblIdx = 0u; SchTblIdx < SCH_TBL_NUMB; SchTblIdx++)
  {
    /* Find the schedule table by ID */
    if (SchedTableList[SchTblIdx].SchedTblID == ID)
    {
      /* De-activate Schedule table */
      SchedTableList[SchTblIdx].ScheduleTableState = SCH_TBL_IDLE;
      break;
    }   
  }   
}