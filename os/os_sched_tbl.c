/************************************************************************
*                               OS Schedule Table                         
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
* Functions
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
  /* Sched evt. index */
  uint16_t SchEvtIdx = 0u;

  /* Scroll the schedule table */  
  for (SchEvtIdx = 0u; SchEvtIdx < SCHED_EVT_NUMBER; SchEvtIdx++)
  {
    /* Increment sched. counter for each sched. event */ 
    SchedTable[SchEvtIdx].Counter++;
    /* If a schedule event matches... */
    if (SchedTable[SchEvtIdx].Counter >= (SchedTable[SchEvtIdx].TimeoutMs/SCHED_COUNTER_TH))
    {
      /* ... activate the corresponding task */
      Os_ActivateTask(SchedTable[SchEvtIdx].TaskID);
      /* Reset counter */
      SchedTable[SchEvtIdx].Counter = 0;
    }
  }    
}