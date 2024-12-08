/************************************************************************
*                              USER TASKS                        
*************************************************************************
* FileName:         user_tasks.h                                                                             
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
* F.Ficili     27/08/23    1.0          First release.                 
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "os.h"
#include "definitions.h"                // SYS function prototypes
#include "os_task.h"
#include "os_task_cfg.h"

/************************************************************************
* User Tasks
************************************************************************/
/* Task function */
TASK(MyTask_1)
{
  printf("I'm Task 1\r\n);
  /* Task Termination */
  Os_TerminateTask();
}