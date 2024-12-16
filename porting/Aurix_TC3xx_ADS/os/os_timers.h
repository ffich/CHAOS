/************************************************************************
*                               OS SW Timers                       
*************************************************************************
* FileName:         os_timers.h                                                                              
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

#ifndef OS_TIMERS_H
#define OS_TIMERS_H

/************************************************************************
* Includes
************************************************************************/
#include "common.h"

/************************************************************************
* EXPORTED Defines
************************************************************************/
/* Max count define */
#define MAX_SW_TIMER_COUNT                                  0xFFFFFFFF
/* Init disabled macro */
#define SW_TIMER_INIT_DIS     \
{                             \
   STD_FALSE,                 \
   SW_TMR_EXPIRED,            \
   0,                         \
   0,                         \
}
/* Init en macro */
#define SW_TIMER_INIT_EN      \
{                             \
   STD_TRUE,                  \
   SW_TMR_EXPIRED,            \
   0,                         \
   0,                         \
}

/************************************************************************
* EXPORTED Typedef
************************************************************************/
/* Sw timer Status type */
typedef enum _SwTimerStatusType
{
   SW_TMR_NOT_EXPIRED   = 0,
   SW_TMR_EXPIRED       = 1,
   SW_TMR_DISABLED      = 2,           
} SwTimerStatusType;


/* Sw timer type */
typedef struct _SwTimerType
{
   uint8_t Enabled;
   SwTimerStatusType Status;
   uint32_t StartTime;
   uint32_t TargetTime;
} SwTimerType;

/************************************************************************
* EXPORTED Variables
************************************************************************/
/* Os tick global counter */
extern uint32_t Os_TickCounter;

/************************************************************************
* EXPORTED Functions
************************************************************************/
/* Start a software timer */
void Os_StartTimer (SwTimerType *Timer, uint32_t Timeout);
/* Start a software timer */
void Os_StopTimer (SwTimerType *Timer);
/* Check if the software timer status */
SwTimerStatusType Os_GetTimerStatus (SwTimerType *Timer);
/* Get the elapsed time since the sw timer started */
uint32_t Os_GetElapsedTime (SwTimerType *Timer);
/* Get the remaining time before a sw timer expires */
uint32_t Os_GetRemainingTime (SwTimerType *Timer);

#endif	/* OS_TIMERS_H */

