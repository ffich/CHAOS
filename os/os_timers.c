/************************************************************************
*                               OS SW Timers                       
*************************************************************************
* FileName:         os_timers.c                                                                             
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

/************************************************************************
* Includes
************************************************************************/
#include "common.h"
#include "os_timers.h"

/************************************************************************
* Defines
************************************************************************/


/************************************************************************
* Typedefs
************************************************************************/


/************************************************************************
* LOCAL Variables
************************************************************************/


/************************************************************************
* GLOBAL Variables
************************************************************************/
/* Os tick global counter */
uint32_t Os_TickCounter = 0;

/************************************************************************
* LOCAL Function Prototypes
************************************************************************/


/************************************************************************
* LOCAL Function Implementations
************************************************************************/

/************************************************************************   
* Function:     GetOsTickCounter
* Input:        None
* Output:       uint32_t
* Author:       F.Ficili
* Description:  Return the Os tick counter.
************************************************************************/
uint32_t GetOsTickCounter (void)
{
   /* Return tick counter */
   return Os_TickCounter;
}

/************************************************************************
* Function:     GetElapsedTime
* Input:        uint32_t StartTime
* Output:       uint32_t
* Author:       F.Ficili
* Description:  Get elapsed time from a given start time.
************************************************************************/
uint32_t GetElapsedTime (uint32_t StartTime)
{
   uint32_t CurrentTimestamp;
   uint32_t TimeValue;
   
   /* Get timestamp */
   CurrentTimestamp = GetOsTickCounter();
   
   /* Wraparound control */
   if (CurrentTimestamp >= StartTime)
   {
      TimeValue = (CurrentTimestamp - StartTime);
   }
   else
   {
      TimeValue = (CurrentTimestamp + MAX_SW_TIMER_COUNT) - StartTime;
   }
   
   return TimeValue;
}

/************************************************************************
* GLOBAL Function Implementations
************************************************************************/

/************************************************************************
* Function:     Os_StartTimer
* Input:        SwTimerType *Timer
*               uint32_t Timeout 
* Output:       None
* Author:       F.Ficili
* Description:  Start a software timer.
************************************************************************/
void Os_StartTimer (SwTimerType *Timer, uint32_t Timeout)
{
   /* Mark as not expired */
   Timer->Status = SW_TMR_NOT_EXPIRED;
   /* Get os tick counter value */
   Timer->StartTime = GetOsTickCounter();
   /* Set target time value */
   Timer->TargetTime = Timeout;
   /* Start the timer */
   Timer->Enabled = STD_TRUE;   
}    

/************************************************************************
* Function:     Os_StopTimer
* Input:        SwTimerType *Timer
* Output:       None
* Author:       F.Ficili
* Description:  Stop a software timer.
************************************************************************/
void Os_StopTimer (SwTimerType *Timer)
{
   /* Stop the timer */
   Timer->Enabled = STD_FALSE;      
}  

/************************************************************************
* Function:     Os_GetTimerStatus
* Input:        SwTimerType *Timer
* Output:       SwTimerStatusType
* Author:       F.Ficili
* Description:  Check if the software timer status.
************************************************************************/
SwTimerStatusType Os_GetTimerStatus (SwTimerType *Timer)
{
   /* Check if the timer is enabled */
   if (Timer->Enabled == STD_TRUE)
   {
      /* Check if expired */
      if (GetElapsedTime(Timer->StartTime) >= Timer->TargetTime)
      {
         /* Disable timer */
         Timer->Enabled = STD_FALSE;
         /* Mark as expired */
         Timer->Status = SW_TMR_EXPIRED;
      }
      else
      {
         /* Do nothing */
      }
   }
   else
   {
      /* Mark as disabled on second request after expiration */
      Timer->Status = SW_TMR_DISABLED;
   }
   
   /* Return timer status */
   return Timer->Status;
}  

/************************************************************************
* Function:     Os_GetElapsedTime
* Input:        SwTimerType *Timer
* Output:       uint32_t
* Author:       F.Ficili
* Description:  Get the elapsed time since the sw timer started.
************************************************************************/
uint32_t Os_GetElapsedTime (SwTimerType *Timer)
{
   uint32_t CurrentTimestamp;
   uint32_t TimeValue;
   
   /* Get timestamp */
   CurrentTimestamp = GetOsTickCounter();
   
   /* Wraparound control */
   if (CurrentTimestamp >= Timer->StartTime)
   {
      TimeValue = (CurrentTimestamp - Timer->StartTime);
   }
   else
   {
      TimeValue = (CurrentTimestamp + MAX_SW_TIMER_COUNT) - Timer->StartTime;
   }
   
   return TimeValue;   
}  

/************************************************************************
* Function:     Os_GetRemainingTime
* Input:        SwTimerType *Timer
* Output:       uint32_t
* Author:       F.Ficili
* Description:  Get the remaining time before a sw timer expires.
************************************************************************/
uint32_t Os_GetRemainingTime (SwTimerType *Timer)
{
   uint32_t TimeValue;
   
   /* Check if already reached the target time */
   if (GetElapsedTime(Timer->StartTime) >= Timer->TargetTime)
   {
      /* If yes return 0 */
      TimeValue = 0;
   }
   else
   {
      /* Otherwise calculate the correct value */
      TimeValue = GetElapsedTime(Timer->StartTime) - Timer->TargetTime;
   }
   
   return TimeValue;
}  