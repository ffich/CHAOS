/************************************************************************
*                              OS CFG                        
*************************************************************************
* FileName:         os_cfg.h                                                                             
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

#ifndef OS_CFG_H
#define OS_CFG_H

/************************************************************************
* Includes
************************************************************************/


/************************************************************************
* EXPORTED Defines
************************************************************************/

/* Uncomment this define to enable TERMINAL_DEBUG_ENABLED debug (only if printf redirect to UART) */
#define TERMINAL_DEBUG_ENABLED
#define TERMINAL_DEBUG_VERBOSE

/************************************************************************
* Scheduler timing configuration
* ------------------------------
* Set: 
* - SCHED_TIMER_FREQ_HZ          --> In Hertz!!!
* - DESIRED_SCHED_PERIOD_MS      --> In ms!!!
* To obtain the desired scheduler period with the desired timer freq.
************************************************************************/
/* Frequency of scheduler timer */
#define SCHED_TIMER_FREQ_HZ                              ((uint16_t)(1000))
/* Desired scheduler period */
#define DESIRED_SCHED_PERIOD_MS                          ((uint16_t)(1))

/* Task table sorting algorithm */
#define INSERTION_SORT                                   0
#define MERGE_SORT                                       1
#define SORT_ALGORITHM                                   INSERTION_SORT

/* Sorting option */
#define SORT_INIT_ONLY                                   0
#define SORT_EACH_SCH_CYCLE                              1
#define SORT_OPTION                                      SORT_INIT_ONLY

#endif /* OS_CFG_H */