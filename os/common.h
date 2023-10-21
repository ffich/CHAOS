/************************************************************************
*                               Common                         
*************************************************************************
* FileName:         common.h                                                                                
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

#ifndef COMMON_H
#define COMMON_H

/************************************************************************
* Includes
************************************************************************/
#include "stddef.h"        /* Includes NULL definition */
#include "stdint.h"        /* Includes uintx_t definition */
#include "stdbool.h"       /* Includes true/false definition */ 
#include "stdlib.h"
#include "stdio.h"
#include "string.h"

/************************************************************************
* Basic Defines
************************************************************************/
/* Standard ON and OFF constants */
#define STD_ON                                           1u
#define STD_OFF                                          0u

/* Standard TRUE and FALSE constants */
#define STD_TRUE                                         1u
#define STD_FALSE                                        0u

/* Standard OK and NOT_OK constants */
#define STD_OK                                           1u
#define STD_NOT_OK                                       0u

/* Status ON and OFF constants */
#define STS_ON                                           1u
#define STS_OFF                                          0u

/* Status OK and NOT_OK constants */
#define STS_OK                                           1u
#define STS_NOT_OK                                       0u

/************************************************************************
* Basic Types
************************************************************************/

/* OS API return type typedef */
typedef uint8_t Os_ApiReturnType;

/* Error Hook return type typedef */
typedef uint8_t Os_ErrorType;

/* Os Void Return Typedef */
typedef void Os_VoidReturnType;

#endif	/* COMMON_H */

