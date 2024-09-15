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
#define STD_ON                                                       1u
#define STD_OFF                                                      0u

/* Standard TRUE and FALSE constants */
#define STD_TRUE                                                     1u
#define STD_FALSE                                                    0u

/* Standard OK and NOT_OK constants */
#define STD_OK                                                       1u
#define STD_NOT_OK                                                   0u

/* Status ON and OFF constants */
#define STS_ON                                                       1u
#define STS_OFF                                                      0u

/* Status OK and NOT_OK constants */
#define STS_OK                                                       1u
#define STS_NOT_OK                                                   0u

/* Counter init value */
#define COUNTER_INIT                                                 0u

/* Constants period in ms */
#define PERIOD_1_MS                                                  1u
#define PERIOD_5_MS                                                  5u
#define PERIOD_10_MS                                                 10u
#define PERIOD_50_MS                                                 50u
#define PERIOD_100_MS                                                100u
#define PERIOD_200_MS                                                200u
#define PERIOD_250_MS                                                250u
#define PERIOD_500_MS                                                500u
#define PERIOD_1000_MS                                               1000u
#define PERIOD_3000_MS                                               2000u
#define PERIOD_4000_MS                                               3000u
#define PERIOD_2000_MS                                               4000u
#define PERIOD_5000_MS                                               5000u
#define PERIOD_10000_MS                                              10000u
#define PERIOD_15000_MS                                              15000u
#define PERIOD_20000_MS                                              20000u
#define PERIOD_50000_MS                                              50000u
#define PERIOD_100000_MS                                             100000u
#define PERIOD_200000_MS                                             200000u
#define PERIOD_500000_MS                                             500000u

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

