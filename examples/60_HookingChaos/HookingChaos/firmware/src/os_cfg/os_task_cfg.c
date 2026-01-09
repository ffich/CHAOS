/************************************************************************
*                               OS Task Cfg                         
*************************************************************************
* FileName:         os_task_cfg.c                                                                                
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
#include "os_task_cfg.h"

/************************************************************************
* Typedefs
************************************************************************/


/************************************************************************
* LOCAL Variables
************************************************************************/


/************************************************************************
* TASK List
************************************************************************/
extern void MyTask_1 (void);
extern void MyTask_2 (void);

/************************************************************************
* GLOBAL Variables
************************************************************************/
TbcType Tasks[] =
{
  /* -------------------------------------------------------------------- */
  /* ID                    Task              State           Priority     */
  /* -------------------------------------------------------------------- */   
  /* --------------------------------- Tasks ---------------------------- */   
  {MY_TASK_1_ID,           MyTask_1,         IDLE,           10},
  {MY_TASK_2_ID,           MyTask_2,         IDLE,           20},    
  /* -------------------------------------------------------------------- */
};

/* Auto-calculation of task number */
const uint16_t TaskNumber = (uint16_t)(sizeof(Tasks)/sizeof(TbcType));  

/* List of auto-started Tasks */
AutoStarTaskType AutoStartedTasks[] =
{
};

/* Auto-calculation of auto-started task number */
const uint16_t AutoStartTaskNumber = (uint16_t)(sizeof(AutoStartedTasks)/sizeof(AutoStarTaskType));  

/************************************************************************
* LOCAL Functions
************************************************************************/


/************************************************************************
* GLOBAL Functions
************************************************************************/
