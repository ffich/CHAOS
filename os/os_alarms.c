/************************************************************************
*                        OS Alarms                        
*************************************************************************
* FileName:         os_alarms.c                                                                                
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

/************************************************************************
* Includes
************************************************************************/
#include "os_alarms.h"
#include "os_cfg.h"
#include "os_alarms_cfg.h"
#include "os_task.h"
#include "os_task_cfg.h"

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


/************************************************************************
* LOCAL Functions
************************************************************************/


/************************************************************************
* GLOBAL Functions
************************************************************************/

/************************************************************************
* Function:     Os_UpdateAlarms
* Input:        None
* Output:       None
* Author:       F.Ficili	
* Description:  Update the system alarms.    
************************************************************************/
Os_ApiReturnType Os_UpdateAlarms (void)
{
  /* Locals */
  Os_ApiReturnType OpRes = E_OS_OK;    
  uint16_t AlarmIdx = 0u;  
  
  /* Scroll the alarms list */  
  for (AlarmIdx = 0u; AlarmIdx < ALARMS_NUMB; AlarmIdx++)
  {
    /* If the alarm has been activated (Configuration or at runtime) */
    if (AlarmList[AlarmIdx].AlarmState == ALARM_ACTIVE)
    {
      /* Consistency check of pointed element */
      if (AlarmList[AlarmIdx].AlarmElem != NULL)
      {
        /* Increment counter for each alarm */ 
        AlarmList[AlarmIdx].AlarmElem->Counter++;
        /* If the alarm event matches... */
        if (AlarmList[AlarmIdx].AlarmElem->Counter >= (AlarmList[AlarmIdx].AlarmElem->TimeoutMs/SCHED_COUNTER_TH))
        {
#ifdef TERMINAL_DEBUG_ENABLED
          if (AlarmIdx == 0)
          {
            printf("\r\nTimestamp - %d - ", Os_TickCounter);        
            printf("New Alarm firing:\r\n");
          }
#endif      
          /* ... do the corresponding alarm action */            
          if (AlarmList[AlarmIdx].AlarmElem->Action == ALRM_ACTIVATE_TASK)
          {
            /* Task activation */
            Os_ActivateTask(AlarmList[AlarmIdx].AlarmElem->TaskID);             
          }
          else if (AlarmList[AlarmIdx].AlarmElem->Action == ALRM_CALLBACK)
          {
            /* Consistency check of pointed element */
            if (AlarmList[AlarmIdx].AlarmElem->Callback != NULL)
            {
              /* Call alarm callback */
              AlarmList[AlarmIdx].AlarmElem->Callback();
            }
            else
            {                                    
              /* Bad callback pointer */
              OpRes = E_OS_WRONG_ALARM_CBK;
              /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
              User_ErrorHook(OpRes);
#endif                          
            }
          }
          else
          {
            /* Default handler for unknown action, do nothing */
          }
          
          /* Check if the alarm is one-shot */
          if (AlarmList[AlarmIdx].AlarmElem->Type == ALRM_ONE_SHOT)
          {
            /* Auto-deactivation of one-shot alarms */
            AlarmList[AlarmIdx].AlarmState = ALARM_IDLE;
          }
          /* Reset counter */
          AlarmList[AlarmIdx].AlarmElem->Counter = 0;           
                  
        }    
        /* OK */
        OpRes = E_OS_OK;            
      }
      else
      {
        /* Bad pointer */
        OpRes = E_OS_WRONG_ALARM_PTR;
        /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif          
      }
    }    
  }  
  
  /* Return operation result */
  return OpRes;    
}

/************************************************************************
* Function:     Os_StartAlarm
* Input:        None
* Output:       uint16_t ID
* Author:       F.Ficili	
* Description:  Start an alarm by ID.   
************************************************************************/
Os_ApiReturnType Os_StartAlarm (uint16_t ID)
{
  /* Locals */
  Os_ApiReturnType OpRes;  
  uint16_t AlarmIdx = 0u;  
  bool Found = false;  
  
  /* Scroll the alarm list */  
  for (AlarmIdx = 0u; AlarmIdx < ALARMS_NUMB; AlarmIdx++)
  {
    /* Find the alarm by ID */
    if (AlarmList[AlarmIdx].AlarmID == ID)
    {
      /* Set found flag and break */
      Found = true;      
      /* Transition check */
      if (AlarmList[AlarmIdx].AlarmState == ALARM_IDLE)
      {                
        /* Activate alarm */
        AlarmList[AlarmIdx].AlarmState = ALARM_ACTIVE;
        /* OK */
        OpRes = E_OS_OK;
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Alarm %d Started \r\n", ID);
#endif          
      }
      else
      {
        /* Wrong state transition, to be activated an alarm must be in IDLE state */
        OpRes = E_OS_WRONG_ALARM_STATE_TRANSITION;
        /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif           
#ifdef TERMINAL_DEBUG_ENABLED
          printf("Timestamp - %d - ", Os_TickCounter);      
          printf("Alarm %d Not Started, wrong state transition \r\n", ID);
#endif       
      }        
      break;
    }   
  } 
  
  /* If we didn't find the alarm */
  if (Found == false)
  {
    /* Wrong ID */
    OpRes = E_OS_WRONG_ALARM_ID;
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif           
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Schedule Table %d Not Found \r\n", ID);
#endif        
  }
  
  /* Return operation result */
  return OpRes;  
}

/************************************************************************
* Function:     Os_StopAlarm
* Input:        None
* Output:       uint16_t ID
* Author:       F.Ficili	
* Description:  Stop an alarm by ID.   
************************************************************************/
Os_ApiReturnType Os_StopAlarm (uint16_t ID)
{
  /* Locals */
  Os_ApiReturnType OpRes;  
  uint16_t AlarmIdx = 0u;  
  bool Found = false;  
  
  /* Scroll the alarm list */  
  for (AlarmIdx = 0u; AlarmIdx < ALARMS_NUMB; AlarmIdx++)
  {
    /* Find the alarm by ID */
    if (AlarmList[AlarmIdx].AlarmID == ID)
    {
      /* Set found flag and break */
      Found = true;      
      /* Transition check */
      if (AlarmList[AlarmIdx].AlarmState == ALARM_ACTIVE)
      {                
        /* De-ctivate alarm */
        AlarmList[AlarmIdx].AlarmState = ALARM_IDLE;
        /* OK */
        OpRes = E_OS_OK;
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Alarm %d Stopped \r\n", ID);
#endif          
      }
      else
      {
        /* Wrong state transition, to be de-activated an alarm must be in ACTIVE state */
        OpRes = E_OS_WRONG_ALARM_STATE_TRANSITION;
        /* Optionally call ErrorHook */
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif           
#ifdef TERMINAL_DEBUG_ENABLED
          printf("Timestamp - %d - ", Os_TickCounter);      
          printf("Alarm %d Not Started, wrong state transition \r\n", ID);
#endif       
      }        
      break;
    }   
  } 
  
  /* If we didn't find the alarm */
  if (Found == false)
  {
    /* Wrong ID */
    OpRes = E_OS_WRONG_ALARM_ID;
#if (ENABLE_ERROR_HOOK == STD_TRUE)
        User_ErrorHook(OpRes);
#endif           
#ifdef TERMINAL_DEBUG_ENABLED
        printf("Timestamp - %d - ", Os_TickCounter);      
        printf("Schedule Table %d Not Found \r\n", ID);
#endif        
  }
  
  /* Return operation result */
  return OpRes;  
}
