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
#include "os.h"
#include "os_sched_tbl_cfg.h"

/************************************************************************
* EXPORTED Defines
************************************************************************/


/************************************************************************
* EXPORTED Macros
************************************************************************/


/************************************************************************
* EXPORTED Typedef
************************************************************************/

/* Schedule table state type */
typedef enum
{
   SCH_TBL_IDLE = 0,
   SCH_TBL_ACTIVE = 1   
} ScheduleTableStateType;

/* Schedule Table Type */
typedef struct 
{
   uint16_t TaskID;
   uint16_t Counter;
   const uint32_t TimeoutMs;
} SchedTblType;

/* Schedule table list type */
typedef struct
{
   uint16_t SchedTblID;
   uint16_t SchEvtNumber;
   ScheduleTableStateType ScheduleTableState;
   SchedTblType * SchedTblElem;
} SchedTblListType;

/************************************************************************
* EXPORTED Variables
************************************************************************/
/* Sched. Table List */
extern SchedTblListType SchedTableList[SCH_TBL_NUMB];

/************************************************************************
* EXPORTED Functions
************************************************************************/
/* Service used by the OS to run the schedule tables */
Os_ApiReturnType Os_UpdateSchedTable (void);
/* Start a schedule table by ID */
Os_ApiReturnType Os_StartSchedTable (uint16_t ID);
/* Stop a schedule table by ID */
Os_ApiReturnType Os_StopSchedTable (uint16_t ID);

#endif /* OS_SCHED_TBL_H */