/************************************************************************
*                               OS IPC                       
*************************************************************************
* FileName:         os_ipc.c                                                                               
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
#include "os_ipc.h"

/************************************************************************
* Defines
************************************************************************/
/* Empty constant */
#define EMPTY                                                   0u

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
* Function:     Os_GenerateEvt
* Input:        EventType *Event
* Output:       Os_EventStatusType
* Author:       F.Ficili	
* Description:  Generate event.    
************************************************************************/
Os_EventStatusType Os_GenerateEvt (EventType *Event)
{
  /* Event Status */
  Os_EventStatusType EventStatus = EVENT_IDLE;

  /* Send the event */
  Event->EventStatus = EVENT_SENT;
  /* Update event status */
  EventStatus = EVENT_SENT;

  /* Return event status */
  return EventStatus;
}
	
/************************************************************************
* Function:     Os_ReceiveEvt
* Input:        EventType *Event
* Output:       Os_EventStatusType
* Author:       F.Ficili	
* Description:  Receive event.  
************************************************************************/
Os_EventStatusType Os_ReceiveEvt (EventType *Event)
{
  /* Event Status */
  Os_EventStatusType EventStatus = EVENT_IDLE;

  /* Check event status */
  if (Event->EventStatus == EVENT_SENT)
  {
    /* The event is now received */
    Event->EventStatus = EVENT_RECEIVED;
    /* Update event status */
    EventStatus = EVENT_RECEIVED;
  }
  else
  {
    /* Update event status */
    EventStatus = EVENT_IDLE;
  }

  /* Return event status */
  return EventStatus;
}

/************************************************************************
* Function:     Os_InitEvtQueue
* Input:        QueueCtrlStrType* QueueCfg
*               uint16_t QueueSize
*               uint8_t ElemSize
*               EventType* QueuePtr
* Output:       Os_VoidReturnType
* Author:       F.Ficili	 
* Description:  Initialize the event queue. A config structure and an array of the element type must
*               be previously declared. The size of the queue and the size of the single element must
*               be passed over to allow the Os to locally store this informations.  
************************************************************************/
Os_VoidReturnType Os_InitEvtQueue (QueueCtrlStrType* QueueCfg, uint16_t QueueSize, uint8_t ElemSize, volatile void* QueuePtr)
{
  /* Configure the queue structure */
  QueueCfg->QueueSize = QueueSize;
  QueueCfg->ElemSize = ElemSize;
  QueueCfg->QueuePtr = (uint8_t*)QueuePtr;
  QueueCfg->QueueFrontIdx = 0;
  QueueCfg->QueueRearIdx = -(QueueCfg->ElemSize);
  QueueCfg->QueueItemCount = 0;    
}

/************************************************************************
* Function:     Os_IsEvtQueueEmpty
* Input:        QueueCtrlStrType* QueueCfg
* Output:       Os_QueueStsType
* Author:       F.Ficili	 
* Description:  Check if the queue is empty or not. 
************************************************************************/
Os_QueueStsType Os_IsEvtQueueEmpty (QueueCtrlStrType* QueueCfg)
{
  /* Locals */
  uint8_t Ret;

  /* Check if the queue is empty or not */
  if (QueueCfg->QueueItemCount == 0)
  {
    Ret = QUEUE_IS_EMPTY;
  }
  else
  {
    Ret = QUEUE_NOT_EMPTY_OR_FULL;
  }      

  return Ret;
}

/************************************************************************
* Function:     Os_IsEvtQueueFull
* Input:        QueueCtrlStrType* QueueCfg
* Output:       Os_QueueStsType 
* Author:       F.Ficili	 
* Description:  Check if the FIFO queue is full or not. 
************************************************************************/
Os_QueueStsType Os_IsEvtQueueFull (QueueCtrlStrType* QueueCfg)
{
  /* Locals */  
  uint8_t Ret;

  /* Check if the queue is full or not */
  if (QueueCfg->QueueItemCount == QueueCfg->QueueSize)
  {
    Ret = QUEUE_IS_FULL;
  }
  else
  {
    Ret = QUEUE_NOT_EMPTY_OR_FULL;
  }      

  return Ret;
}

/************************************************************************
* Function:     Os_GetQueueCount
* Input:        QueueCtrlStrType* QueueCfg
*               uint16_t* QueueItems 
* Output:       Os_VoidReturnType
* Author:       F.Ficili	 
* Description:  Get the current number of element present in the FIFO queue.
************************************************************************/
Os_VoidReturnType Os_GetQueueItemCount (QueueCtrlStrType* QueueCfg, uint16_t* QueueItems)
{
  /* Provide the number of items in the queue */
  *QueueItems = QueueCfg->QueueItemCount;
}

/************************************************************************
* Function:     Os_QueueInsert
* Input:        QueueCtrlStrType* QueueCfg
*               uint8_t* DataElemIn 
* Output:       Os_QueueFullStsType
* Author:       F.Ficili	 
* Description:  Insert an element in the FIFO queue. If success return QUEUE_NOT_FULL
*               if fails return QUEUE_FULL.  
************************************************************************/
Os_QueueFullStsType Os_QueueInsert (QueueCtrlStrType* QueueCfg, void* DataElemIn)
{
  /* Locals */  
  Os_QueueFullStsType Ret;

  /* If the queue is not full */
  if (!Os_IsEvtQueueFull(QueueCfg))
  {
    /* Wrap if the limit is reached */
    if (QueueCfg->QueueRearIdx == ((QueueCfg->QueueSize*QueueCfg->ElemSize) - QueueCfg->ElemSize))
    {
       QueueCfg->QueueRearIdx = -QueueCfg->ElemSize;
    }
    /* Increment queue rear index */
    QueueCfg->QueueRearIdx += QueueCfg->ElemSize;
    /* Copy the element to insert in the queue */
    memcpy(&(QueueCfg->QueuePtr[QueueCfg->QueueRearIdx]), DataElemIn, QueueCfg->ElemSize);        
    /* Increment number of stored item */
    QueueCfg->QueueItemCount++;
    /* Return OK */
    Ret = QUEUE_NOT_FULL;    
  }
  else
  {
    /* Queue full */
    Ret = QUEUE_FULL;  
  }

  return Ret;
}

/************************************************************************
* Function:     Os_QueueExtract
* Input:        QueueCtrlStrType* QueueCfg
*               uint8_t* DataElemOut 
* Output:       Os_QueueEmptyStsType
* Author:       F.Ficili	 
* Description:  Extract an element from the FIFO queue. If success return QUEUE_NOT_EMPTY
*               if fails return QUEUE_EMPTY.
************************************************************************/
Os_QueueEmptyStsType Os_QueueExtract (QueueCtrlStrType* QueueCfg, void* DataElemOut)
{
  /* Locals */  
  Os_QueueEmptyStsType Ret;

  if (QueueCfg->QueueItemCount > 0)
  {
    /* Extract element */
    memcpy(DataElemOut, &(QueueCfg->QueuePtr[QueueCfg->QueueFrontIdx]), QueueCfg->ElemSize);
    /* Clear element in queue */        
    memset(&(QueueCfg->QueuePtr[QueueCfg->QueueFrontIdx]), EMPTY, QueueCfg->ElemSize);        
    /* Increment front index */        
    QueueCfg->QueueFrontIdx += QueueCfg->ElemSize;        
    /* Wrap */
    if (QueueCfg->QueueFrontIdx >= (QueueCfg->QueueSize*QueueCfg->ElemSize))
    {
       QueueCfg->QueueFrontIdx = 0;
    }
    /* Decrement count */
    QueueCfg->QueueItemCount--;
    /* Return event present */
    Ret = QUEUE_NOT_EMPTY;
  }
  else
  {
    /* Return queue empty */
    Ret = QUEUE_EMPTY;
  }

  return Ret;
}

/************************************************************************
* Function:     Os_QueueExtractAndShift
* Input:        QueueCtrlStrType* QueueCfg
*               uint8_t* DataElemOut 
* Output:       Os_QueueEmptyStsType
* Author:       F.Ficili	 
* Description:  Extract an element from the FIFO queue and shift all the elements.
*               In this way the next element to extract is always positioned in the queue head.
*               This implementation is less efficient than Os_QueueExtract, that works in circular
*               buffer fashion.  
*               If success return QUEUE_NOT_EMPTY if fails return QUEUE_EMPTY.
************************************************************************/
Os_QueueEmptyStsType Os_QueueExtractAndShift (QueueCtrlStrType* QueueCfg, void* DataElemOut)
{
  /* Locals */  
  Os_QueueEmptyStsType Ret;
  uint16_t ElmIdx;
  uint16_t QueueIdx = 0;

  if (QueueCfg->QueueItemCount > 0)
  {
    /* Extract element */
    memcpy(DataElemOut, &(QueueCfg->QueuePtr[QueueCfg->QueueFrontIdx]), QueueCfg->ElemSize);
    /* Shift all remaining elements */       
    for (ElmIdx = 0; ElmIdx < QueueCfg->QueueItemCount; ElmIdx++)
    {
      memcpy(&(QueueCfg->QueuePtr[QueueIdx]), &(QueueCfg->QueuePtr[(QueueIdx + QueueCfg->ElemSize)]), QueueCfg->ElemSize);
      QueueIdx += QueueCfg->ElemSize; 
    }
    /* Decrement count */
    QueueCfg->QueueItemCount--;      
    /* Decrement queue front index */
    QueueCfg->QueueRearIdx -= QueueCfg->ElemSize;            
    /* Return event present */
    Ret = QUEUE_NOT_EMPTY;  
  }
  else
  {
    /* Return queue empty */
    Ret = QUEUE_EMPTY;
  }

  return Ret;
}