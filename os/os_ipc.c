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
* Output:       EventStatusType
* Author:       F.Ficili	
* Description:  Generate event.    
************************************************************************/
EventStatusType Os_GenerateEvt (EventType *Event)
{
   /* Event Status */
   EventStatusType EventStatus = EVENT_IDLE;

   /* Send the event */
   Event->EventStatus = EVENT_SENT;
   /* Update event status */
   EventStatus = EVENT_SENT;

   /* Return event status */
   return(EventStatus);
}
	
/************************************************************************
* Function:     Os_ReceiveEvt
* Input:        EventType *Event
* Output:       EventStatusType
* Author:       F.Ficili	
* Description:  Receive event.  
************************************************************************/
EventStatusType Os_ReceiveEvt (EventType *Event)
{
   /* Event Status */
   EventStatusType EventStatus = EVENT_IDLE;

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
   return(EventStatus);
}

/************************************************************************
* Function:     Os_InitEvtQueue
* Input:        QueueCtrlStrType* QueueCfg
*               uint16_t QueueSize
*               uint8_t ElemSize
*               EventType* QueuePtr
* Output:       None
* Author:       F.Ficili	 
* Description:  Initialize the event queue. A config structure and an array of the element type must
*               be previously declared. The size of the queue and the size of the single element must
*               be passed over to allow the Os to locally store this informations.  
************************************************************************/
void Os_InitEvtQueue (QueueCtrlStrType* QueueCfg, uint16_t QueueSize, uint8_t ElemSize, void* QueuePtr)
{
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
* Output:       uint8_t --> STD_TRUE, the queue is empty
*                       --> STD_FALSE, the queue is not empty 
* Author:       F.Ficili	 
* Description:  Check if the queue is empty or not. 
************************************************************************/
uint8_t Os_IsEvtQueueEmpty (QueueCtrlStrType* QueueCfg)
{
   uint8_t Ret;

   /* Check if the queue is empty or not */
   if (QueueCfg->QueueItemCount == 0)
   {
      Ret = STD_TRUE;
   }
   else
   {
      Ret = STD_FALSE;
   }      

   return Ret;
}

/************************************************************************
* Function:     Os_IsEvtQueueFull
* Input:        QueueCtrlStrType* QueueCfg
* Output:       uint8_t --> STD_TRUE, the queue is full
*                       --> STD_FALSE, the queue is not full 
* Author:       F.Ficili	 
* Description:  Check if the FIFO queue is full or not. 
************************************************************************/
uint8_t Os_IsEvtQueueFull (QueueCtrlStrType* QueueCfg)
{
   uint8_t Ret;

   /* Check if the queue is full or not */
   if (QueueCfg->QueueItemCount == QueueCfg->QueueSize)
   {
      Ret = STD_TRUE;
   }
   else
   {
      Ret = STD_FALSE;
   }      

   return Ret;
}

/************************************************************************
* Function:     Os_GetQueueCount
* Input:        QueueCtrlStrType* QueueCfg
* Output:       uint16_t --> Number of item in the queue
* Author:       F.Ficili	 
* Description:  Get the current number of element present in the FIFO queue.
************************************************************************/
uint16_t Os_GetQueueItemCount (QueueCtrlStrType* QueueCfg)
{
   return QueueCfg->QueueItemCount;
}

/************************************************************************
* Function:     Os_QueueInsert
* Input:        QueueCtrlStrType* QueueCfg
*               uint8_t* DataElemIn 
* Output:       uint8_t
* Author:       F.Ficili	 
* Description:  Insert an element in the FIFO queue. If success return QUEUE_OP_OK
*               if fails return QUEUE_E_FULL.  
************************************************************************/
uint8_t Os_QueueInsert (QueueCtrlStrType* QueueCfg, void* DataElemIn)
{
   uint8_t Ret;

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
      Ret = QUEUE_STS_OK;    
   }
   else
   {
      /* Queue full */
      Ret = QUEUE_STS_FULL;  
   }

   return Ret;
}

/************************************************************************
* Function:     Os_QueueExtract
* Input:        QueueCtrlStrType* QueueCfg
*               uint8_t* DataElemOut 
* Output:       EventType
* Author:       F.Ficili	 
* Description:  Extract an element from the FIFO queue.
************************************************************************/
uint8_t Os_QueueExtract (QueueCtrlStrType* QueueCfg, void* DataElemOut)
{
   uint8_t Ret;

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
      Ret = QUEUE_EVT_PRESENT;
   }
   else
   {
      /* Return queue empty */
      Ret = QUEUE_EMPTY;
   }

   return Ret;
}