/************************************************************************
*                               OS IPC                       
*************************************************************************
* FileName:         os_ipc.h                                                                                
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

#ifndef OS_IPC_H
#define OS_IPC_H

/************************************************************************
* Includes
************************************************************************/
#include "common.h"

/************************************************************************
* EXPORTED Defines
************************************************************************/
#define QUEUE_STS_FULL                                          0u 
#define QUEUE_STS_OK                                            1u
        
#define QUEUE_EMPTY                                             0u 
#define QUEUE_EVT_PRESENT                                       1u

#define NO_EVT_FLAG                                             0u 
#define EVT_FLAG                                                1u

/************************************************************************
* EXPORTED Typedef
************************************************************************/
/* Event Status */
typedef enum EventStatusEnum
{
   EVENT_IDLE        = 0,
   EVENT_RECEIVED    = 1,
   EVENT_SENT        = 2,
   EVENT_NOT_SENT    = 3,
} EventStatusType;

/* Event Structure */
typedef struct EventStructure
{
   EventStatusType EventStatus;
} EventType;

/* Evt queue control structure */
typedef struct 
{
   uint16_t QueueSize;
   uint8_t* QueuePtr; 
   uint8_t ElemSize;
   uint16_t QueueFrontIdx;
   uint16_t QueueRearIdx;
   uint16_t QueueItemCount;
} QueueCtrlStrType;

/************************************************************************
* EXPORTED Variables
************************************************************************/


/************************************************************************
* EXPORTED Functions
************************************************************************/
/* Generate events */
EventStatusType Os_GenerateEvt (EventType *Event);
/* Receive events */
EventStatusType Os_ReceiveEvt (EventType *Event);
/* Init an event queue */
void Os_InitEvtQueue (QueueCtrlStrType* QueueCfg, uint16_t QueueSize, uint8_t ElemSize, void* QueuePtr);
/* Empty check */
uint8_t Os_IsEvtQueueEmpty (QueueCtrlStrType* QueueCfg);
/* Full check */
uint8_t Os_IsEvtQueueFull (QueueCtrlStrType* QueueCfg);
/* Get item count */
uint16_t Os_GetQueueItemCount (QueueCtrlStrType* QueueCfg);
/* Insert event */
uint8_t Os_QueueInsert (QueueCtrlStrType* QueueCfg, void* DataElemIn);
/* Extract event */
uint8_t Os_QueueExtract (QueueCtrlStrType* QueueCfg, void* DataElemOut);
/* Extract an element from the FIFO queue and shift all the elements */
uint8_t Os_QueueExtractAndShift (QueueCtrlStrType* QueueCfg, void* DataElemOut);

#endif /* OS_IPC_H */