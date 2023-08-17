/************************************************************************
*                                OS Task Cfg                        
*************************************************************************
* FileName:         os_task_cfg.h                                                                              
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

#ifndef OS_TASK_CFG_H
#define OS_TASK_CFG_H

/************************************************************************
* Includes
************************************************************************/
#include "common.h"
#include "os_task.h"

/************************************************************************
* EXPORTED Defines
************************************************************************/
/* Task number */
#define TASK_NUMBER                                               4u

/* Task IDs */
#define MY_TASK_1_ID                                              1u
#define MY_TASK_2_ID                                              2u
#define MY_TASK_3_ID                                              3u
#define MY_TASK_4_ID                                              4u

/************************************************************************
* EXPORTED Macros
************************************************************************/


/************************************************************************
* EXPORTED Typedef
************************************************************************/


/************************************************************************
* EXPORTED Variables
************************************************************************/
extern TbcType Tasks[TASK_NUMBER];

/************************************************************************
* EXPORTED Functions
************************************************************************/

#endif /* OS_TASK_CFG_H */