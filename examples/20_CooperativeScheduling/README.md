# Cooperative Scheduling
Now let's imagine that our previous requirement:

*[REQ_1] The system has to blink two LEDs at two different rates, LED_1 every 500ms and LED_2 1000ms.*

Represent the two highest priorty tasks in our system and that we have received two additional requirements for lower prioroty task that run processing jobs:

*[REQ_2] The system has to run a lower priority task at 2 seconds rate that makes chunk calculation for a total execution time of 1.5 seconds (at chunks of 50ms, blocking)*
*[REQ_3] The system has to run a lower priority task at 10 seconds rate that makes chunk calculation for a total execution time of 1 seconds (at chunks of 50ms, blocking)*

We need to merge this two additional task in our system and we have the problem that this two tasks have blocking functions that would interferee with the higher priorty ones.

CHAOS has cooperative features (**Os_Yield** API) that allow to solve this probele, let's see how.

Let's proceed as we did with the first exercise.

## STEP 1: Task Configuration
We need to add two tasks to the previous configuration, so the new task table would look like:

```
/************************************************************************
* TASK List
************************************************************************/
extern void MyTask_1 (void);
extern void MyTask_2 (void);
extern void MyTask_3 (void);
extern void MyTask_4 (void);

/************************************************************************
* GLOBAL Variables
************************************************************************/
TbcType Tasks[] =
{
  /* -------------------------------------------------------------------- */
  /* ID                    Task              State           Priority     */
  /* -------------------------------------------------------------------- */   
  /* --------------------------------- Tasks ---------------------------- */   
  {MY_TASK_1_ID,           MyTask_1,         IDLE,           100},
  {MY_TASK_2_ID,           MyTask_2,         IDLE,           110}, 
  {MY_TASK_3_ID,           MyTask_3,         IDLE,           10},  
  {MY_TASK_4_ID,           MyTask_4,         IDLE,           20},     
  /* -------------------------------------------------------------------- */
};

/* Auto-calculation of task number */
const uint16_t TaskNumber = (uint16_t)(sizeof(Tasks)/sizeof(TbcType));
```

We used prioroty **100** and **110** for **MyTask_1** and **MyTask_2** and **10** and **20** for **MyTask_3** and **MyTask_4**.

Remember to add the new IDs on **os_task_cfg.h**:

```
/************************************************************************
* EXPORTED Defines
************************************************************************/
/* Task IDs */
#define MY_TASK_1_ID                                              1u
#define MY_TASK_2_ID                                              2u
#define MY_TASK_3_ID                                              3u
#define MY_TASK_4_ID                                              4u
```

## STEP 2: Schedule Table Configuration
Also the schedule table needs to be updated with the two new events for MyTask_3 and MyTask_3:

```
/************************************************************************
* GLOBAL Variables
************************************************************************/
/* Schedule Table structure initialization */
SchedTblType SchedTable[SCHED_EVT_NUMBER] =
{
  /* ------------------------------------------------ */
  /* TaskID          Counter          Timeout  */
  /* ------------------------------------------------ */   
  /* ----------------- Sched. Table ----------------- */   
  {MY_TASK_1_ID,     COUNTER_INIT,    PERIOD_500_MS}, 
  {MY_TASK_2_ID,     COUNTER_INIT,    PERIOD_1000_MS},   
  {MY_TASK_3_ID,     COUNTER_INIT,    PERIOD_10000_MS}, 
  {MY_TASK_4_ID,     COUNTER_INIT,    PERIOD_2000_MS}, 
  /* ------------------------------------------------ */
};
```

Again, remember to update the number of items on **os_sched_tbl_cfg.h**:

```
/************************************************************************
* EXPORTED Defines
************************************************************************/
/* NUmber of scheduling events */
#define SCHED_EVT_NUMBER                                             4u
```

## STEP 3: OS General configuration
The OS general configuration remains basically the same of the previous example.


## STEP 4: Task implementation
Now we can move to our main file and implement the new tasks. We can simulate the chunk processing with a busy wait function for both tasks:

```
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "os.h"
#include "os_task.h"
#include "os_task_cfg.h"

/* CORE Timer callback */
void MyCoreTimerCallback (uint32_t status, uintptr_t context)
{
  /* OS tick service */
  Os_Tick();
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );   
    
    LED_GREEN_Set();
    LED_RED_Set();
    
    /* Register the timer callback */
    CORETIMER_CallbackSet ( MyCoreTimerCallback, (uintptr_t) NULL );
    /* Start core timer */
    CORETIMER_Start();

    /* Start OS */
    Os_Start();
    
    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}

#define delay_ms(x) CORETIMER_DelayMs(x)

#define T3_YIELD
#define T4_YIELD

/* Task function */
TASK(MyTask_1)
{  
  /* Toggle LED */
  LED_GREEN_Toggle();  
  
  /* Task Termination */  
  Os_TerminateTask();  
}

/* Task function */
TASK(MyTask_2)
{  
  /* Toggle LED */
  LED_RED_Toggle();  
  
  /* Task Termination */  
  Os_TerminateTask();  
}


/* Task function */
TASK(MyTask_3)
{  
  uint16_t i;
  
  /* Set LED */
  LED_BLUE_Clear();  
  
  /* Simulation of processing cycle*/
  for (i = 0; i < 20; i++)
  {
    /* Busy wait simulate processing */
    delay_ms(50);
#ifdef T3_YIELD
    /* Clear LED */
    LED_BLUE_Set();       
    Os_Yield();
    /* Set LED */
    LED_BLUE_Clear();     
#endif   
  }
  
  /* Clear LED */
  LED_BLUE_Set();    
  
  /* Task Termination */  
  Os_TerminateTask();  
}

/* Task function */
TASK(MyTask_4)
{  
  uint16_t i;
  
  /* Set LED */
  LED_YELLOW_Clear();  
  
  /* Simulation of processing cycle*/
  for (i = 0; i < 30; i++)
  {
    /* Busy wait simulate processing*/
    delay_ms(50);
#ifdef T4_YIELD
    Os_Yield();
#endif   
  }
  
  /* Clear LED */
  LED_YELLOW_Set();    
  
  /* Task Termination */  
  Os_TerminateTask();  
}
```

As you can see, Os_Yield() calls have been placed inside the "processing" for loops, so that both MyTask_3 and MyTask_4 will release control to the scheduler diring those cycles and allow the dispatcher to run the higer priority tasks at the defined rate.

Activating the log is possible to see how the lower prioriryt tasks yield control to the higher priority ones, and the system still run as expected:

![image](https://github.com/ffich/CHAOS/assets/59200746/0d769673-3e81-4a97-a45e-e4d4def16c3f)

*MyTask_4 Yield, run and terminate*


