/************************************************************************
*                              OS SCH TBL CFG                        
*************************************************************************
* FileName:         os_sch_tbl_cfg.h                                                                             
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

#ifndef OS_SCH_TBL_CFG_H
#define OS_SCH_TBL_CFG_H

/************************************************************************
* Includes
************************************************************************/
#include "os_sched_tbl.h"

/************************************************************************
* Timing Defines
************************************************************************/
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
#define PERIOD_2000_MS                                               2000u
#define PERIOD_5000_MS                                               5000u

/************************************************************************
* Exported Defines
************************************************************************/
/* NUmber of scheduling events */
#define SCHED_EVT_NUMBER                                             2u

/************************************************************************
* Global Variables
************************************************************************/
/* Sched. Table */
extern SchedTblType SchedTable[SCHED_EVT_NUMBER];

#endif /* OS_SCH_TBL_CFG_H */

