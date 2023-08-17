/************************************************************************
*                               OS Schedule Table                         
*************************************************************************
* FileName:         os_sched_tbl.h                                                                           
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

#ifndef OS_SCHED_TBL_H
#define OS_SCHED_TBL_H

/************************************************************************
* Includes
************************************************************************/
#include "common.h"

/************************************************************************
* Defines
************************************************************************/
/* Counter init value */
#define COUNTER_INIT                                                 0u

/************************************************************************
* Typedef
************************************************************************/

/* Schedule Table Type */
typedef struct 
{
   uint16_t TaskID;
   uint16_t Counter;
   const uint16_t TimeoutMs;
} SchedTblType;

/************************************************************************
* EXPORTED Functions
************************************************************************/
void Os_UpdateSchedTable (void);

#endif /* OS_SCHED_TBL_H */