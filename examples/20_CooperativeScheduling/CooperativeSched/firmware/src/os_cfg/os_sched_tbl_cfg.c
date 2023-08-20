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
#include "os_task_cfg.h"
#include "os_sched_tbl_cfg.h"

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
/* Schedule Table structure initialization */
SchedTblType SchedTable[SCHED_EVT_NUMBER] =
{
  /* ------------------------------------------------ */
  /* TaskID          Counter          Timeout  */
  /* ------------------------------------------------ */   
  /* ----------------- Sched. Table ----------------- */   
  {MY_TASK_1_ID,     COUNTER_INIT,    PERIOD_500_MS}, 
  {MY_TASK_2_ID,     COUNTER_INIT,    PERIOD_1000_MS},   
  {MY_TASK_3_ID,     COUNTER_INIT,    PERIOD_10000_MS}, 
  {MY_TASK_4_ID,     COUNTER_INIT,    PERIOD_2000_MS}, 
  /* ------------------------------------------------ */
};

/************************************************************************
* LOCAL Functions
************************************************************************/


/************************************************************************
* GLOBAL Functions
************************************************************************/

