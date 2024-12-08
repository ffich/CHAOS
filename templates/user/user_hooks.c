/************************************************************************
*                              USER HOOKS                        
*************************************************************************
* FileName:         user_hooks.h                                                                             
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
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "os.h"

/************************************************************************
* User Hooks
************************************************************************/
#if (ENABLE_STARTUP_HOOK == STD_TRUE)
void User_StartupHook (void)
{
  printf("I'm the Startup Hook\r\n");
}
#endif

#if (ENABLE_SHUTDOWN_HOOK == STD_TRUE)
void User_ShutdownHook (void)
{
  printf("I'm the Shutdown Hook\r\n");
}
#endif

#if (ENABLE_PRE_TASK_HOOK == STD_TRUE)
void User_PreTaskHook (uint16_t TaskID)
{
  printf("I'm the Pre-Task Hook triggered BEFORE the task %d\r\n", TaskID);
}
#endif

#if (ENABLE_POST_TASK_HOOK == STD_TRUE)
void User_PostTaskHook (uint16_t TaskID)
{
  printf("I'm the Post-Task Hook triggered AFTER the task %d\r\n", TaskID);
}
#endif

#if (ENABLE_ERROR_HOOK == STD_TRUE)
void User_ErrorHook (Os_ApiErrorType ErrorCode)
{
  printf("I'm the Error Hook triggered for the error %d\r\n", ErrorCode);
}
#endif