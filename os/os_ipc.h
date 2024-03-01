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


/************************************************************************
* EXPORTED Typedef
************************************************************************/
/* Event Status */
typedef enum 
{
   EVENT_IDLE           = 0,
   EVENT_RECEIVED       = 1,
   EVENT_SENT           = 2,
   EVENT_NOT_SENT       = 3,
} Os_EventStatusType;

/* Event Structure */
typedef struct 
{
   Os_EventStatusType EventStatus;
} EventType;

/* Queue extraction return type */
typedef enum 
{
   QUEUE_NOT_EMPTY_OR_FULL = 0,
   QUEUE_IS_EMPTY          = 1,
   QUEUE_IS_FULL           = 2,           
} Os_QueueStsType;

/* Queue insertion return type */
typedef enum 
{
   QUEUE_FULL           = 0,
   QUEUE_NOT_FULL       = 1,
} Os_QueueFullStsType;

/* Queue extraction return type */
typedef enum 
{
   QUEUE_EMPTY          = 0,
   QUEUE_NOT_EMPTY      = 1,
} Os_QueueEmptyStsType;

/* Queue control structure */
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
Os_EventStatusType Os_GenerateEvt (EventType *Event);
/* Receive events */
Os_EventStatusType Os_ReceiveEvt (EventType *Event);
/* Init an event queue */
Os_VoidReturnType Os_InitEvtQueue (QueueCtrlStrType* QueueCfg, uint16_t QueueSize, uint8_t ElemSize, volatile void* QueuePtr);
/* Empty check */
Os_QueueStsType Os_IsEvtQueueEmpty (QueueCtrlStrType* QueueCfg);
/* Full check */
Os_QueueStsType Os_IsEvtQueueFull (QueueCtrlStrType* QueueCfg);
/* Get item count */
Os_VoidReturnType Os_GetQueueItemCount (QueueCtrlStrType* QueueCfg, uint16_t* QueueItems);
/* Insert event */
Os_QueueFullStsType Os_QueueInsert (QueueCtrlStrType* QueueCfg, void* DataElemIn);
/* Extract event */
Os_QueueEmptyStsType Os_QueueExtract (QueueCtrlStrType* QueueCfg, void* DataElemOut);
/* Extract an element from the FIFO queue and shift all the elements */
Os_QueueEmptyStsType Os_QueueExtractAndShift (QueueCtrlStrType* QueueCfg, void* DataElemOut);

#endif /* OS_IPC_H */