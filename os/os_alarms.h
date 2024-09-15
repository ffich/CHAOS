/************************************************************************
*                               OS Alarms                         
*************************************************************************
* FileName:         os_alarms.h                                                                           
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
* F.Ficili     15/09/24    1.0          First release.                  
************************************************************************/

#ifndef OS_ALARMS_H
#define OS_ALARMS_H

/************************************************************************
* Includes
************************************************************************/
#include "common.h"
#include "os.h"
#include "os_alarms_cfg.h"

/************************************************************************
* EXPORTED Defines
************************************************************************/


/************************************************************************
* EXPORTED Macros
************************************************************************/


/************************************************************************
* EXPORTED Typedef
************************************************************************/
/* Alarm state type */
typedef enum
{
   ALARM_IDLE     = 0,
   ALARM_ACTIVE   = 1   
} AlarmStateType;

/* Alarm action */
typedef enum
{
   ALRM_ACTIVATE_TASK   = 0,
   ALRM_CALLBACK        = 1           
} AlarmActionType;

/* Alarm Type */
typedef enum
{
   ALRM_ONE_SHOT     = 0,
   ALRM_CYCLIC       = 1           
} AlarmFiringType;

/* Alarm Type */
typedef struct 
{   
   AlarmActionType Action;
   uint16_t Counter;
   uint32_t TimeoutMs;
   AlarmFiringType Type;
   uint16_t TaskID;
   void (*Callback) (void);
} AlarmType;

/* Alarm list type */
typedef struct
{
   uint16_t AlarmID;
   AlarmStateType AlarmState;
   AlarmType * AlarmElem;
} AlarmListType;

/************************************************************************
* EXPORTED Variables
************************************************************************/
/* Alarm List */
extern AlarmListType AlarmList[ALARMS_NUMB];

/************************************************************************
* EXPORTED Functions
************************************************************************/
/* Service used by the OS to run the Alarms */
Os_ApiReturnType Os_UpdateAlarms (void);
/* Start an alarm by ID */
Os_ApiReturnType Os_StartAlarm (uint16_t ID);
/* Stop an alarm by ID */
Os_ApiReturnType Os_StopAlarm (uint16_t ID);
/* Set Alarm period by ID */
Os_ApiReturnType Os_SetAlarmPeriod (uint16_t ID, uint32_t TimeoutMs);

#endif /* OS_ALARM_H */