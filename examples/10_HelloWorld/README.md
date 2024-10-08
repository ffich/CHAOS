# Hello World
This first, very simple, example addresses a common problem of embedded design, described in the below requirement.

*[REQ_1] The system has to blink two LEDs at two different rates, LED_1 every 500ms and LED_2 1000ms.*

A classic bare metal approach for doing this, witout using timers, but only software delays, would result in something like the code below: 

```
main()
{
  /* Infinite loop */
  do
  {
    delay_ms(500);
    LED_1_Toggle();
    delay_ms(500);
    LED_1_Toggle();
    LED_2_Toggle();    
  } while(1)
}
```

Despite it works, this approach result in something not scalable, as if we have the following additional requirement:

*[REQ_2] The system has to blink an additional LED, LED_3, every 1300ms.*

We need to considerably re-design our solution. It would be much easyier to have 3 separate main functions running at 3 different rates, each one dedicated to a single LED.
The separate 'main function' is nothing more than the abstraction of the task concept within an RTOS.

We can do this with **CHAOS**, let's see how.

## STEP 1: Task Configuration
After having imported all the OS files in our project, we need to create the following 7 configuration files:

- os_task_cfg.h
- os_task_cfg.c
- os_sched_tbl_cfg.h
- os_sched_tbl_cfg.c
- os_alarms_cfg.h
- os_alarms_cfg.c
- os_cfg.h

Let's start with **os_task_cfg.c**. Thi file must contains the task table definition, that basically describe each task is present in the system, his ID and priority.
If we want to implement the initial requirement we need two tasks, let's say MyTask_1 and MyTask_2. The priority is not much important here, but let's define that MyTask_2 will have priority 20 and MyTask_1 priority 10 (so MyTask_2 has an higher execution priority of MyTask_1).
Addiotanally you need to specify if you want to autostart some tasks (this is needed if you want to do some task-specific initializations). We don't have this need in this example, we will just add an empty autostart task list. 

The corresponding task table for this configuration would be something like:

```
/************************************************************************
* TASK List
************************************************************************/
extern void MyTask_1 (void);
extern void MyTask_2 (void);

/************************************************************************
* GLOBAL Variables
************************************************************************/
TbcType Tasks[] =
{
  /* -------------------------------------------------------------------- */
  /* ID                    Task              State           Priority     */
  /* -------------------------------------------------------------------- */   
  /* --------------------------------- Tasks ---------------------------- */   
  {MY_TASK_1_ID,           MyTask_1,         IDLE,           10},
  {MY_TASK_2_ID,           MyTask_2,         IDLE,           20},  
  /* -------------------------------------------------------------------- */
};

/* Auto-calculation of task number */
const uint16_t TaskNumber = (uint16_t)(sizeof(Tasks)/sizeof(TbcType));

/* List of auto-started Tasks */
AutoStarTaskType AutoStartedTasks[] =
{
};

/* Auto-calculation of auto-started task number */
const uint16_t AutoStartTaskNumber = (uint16_t)(sizeof(AutoStartedTasks)/sizeof(AutoStarTaskType));  
```

As you can see the task table contains (starting from left):

**ID**: the ID of the task. This can be an arbitrary 16-bit number. The only constraints is that each ID must be unique for each task, and the OS doesn't do any check for this, so the user has to ensure to use unique IDs for each task.

**Task**: this is the task function name. In CHAOS a task is a void - void C function, and the OS provide a conveninent TASK(x) macro for task declaration, so you can declare tasks like:

```
TASK(MyTask_1)
{
  /* Task body */
  
}
```

**State**: initial state for the task (by default IDLE).

**Priority**: priority of execution for the task. Priority are evaluated in increasing order, so the higher the number, the higher the task priority.

The last line is only needed for automatically calculate the number of tasks (it's needed by the OS Kernel).

The file **os_task_cfg.h** is only needed to export the ID (MY_TASK_1_ID and MY_TASK_2_ID) and make them visible to other files. It's needed by the OS again, but also to the user, as the task ID is how the task is identified in the various OS API (so for example, if the user has to call the Os_ActivateTask, it needs the Task ID of the task to be activated).

We'll also put in this file the extern decalrations for TaskNumber and AutoStartTaskNumber variables.

```
/************************************************************************
* EXPORTED Defines
************************************************************************/
/* Task IDs */
#define MY_TASK_1_ID                                              1u
#define MY_TASK_2_ID                                              2u

/* Auto-calculation of task number */
extern const uint16_t TaskNumber; 

/* Auto-calculation of auto-started task number */
extern const uint16_t AutoStartTaskNumber;
```

## STEP 2: Schedule Table Configuration
Now we have our task table, but our tasks would not run if we don't define some events that let them run. The simplest way of doing this, is to define a schedule table, that links the tasks ID to timing events. 
A schedule table is nothing more that a table where each line contains the ID of a tasks and a timing value. The OS will calculate the occurrence of time expire for each line and run the corresponding task.

Let's start with the file **os_sched_tbl_cfg.c**. This file will have a table like the one in the example below:

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
  /* ------------------------------------------------ */
};

SchedTblListType SchedTableList[SCH_TBL_NUMB] =
{
  /* ----------------------------- Sched. Table List ------------------------------ */   
  /* ------------------------------------------------------------------------------ */
  /* SchTblID         SchEvtNumb                SchTblState         SchTblPtr       */
  /* ------------------------------------------------------------------------------ */     
  {SCHED_TBL_ID,   SCHED_EVT_NUMBER,  SCH_TBL_ACTIVE,     SchedTable},  
  /* ------------------------------------------------------------------------------ */
};  
```

As you can see this table contains (starting from left):

**ID**: this is the ID of the task to be activated at the firing of the scheduling event.

**Counter**: initial value of the schedule table counter associated to the scheduling event (by default 0).

**Timeout**: timing value at which the scheduling event will activate the task.

Since CHAOS support multiple Schedule Tables, we have a second table (SchedTableList) containing the list of the system-wide schedules tables (only one entry in this example).

So, per our requirement, we have MyTask_1 scheduled every 500ms (controls LED_1) and MyTask_2 scheduled every 1000ms (controls LED_2).

The file **os_sched_tbl_cfg.h**, simply export the number of scheduling events configured (SCHED_EVT_NUMBER), the ID of our ScheduleTable (SCHED_TBL_ID) and the number of implemented ScheduleTables (SCH_TBL_NUMB).

```
/************************************************************************
* EXPORTED Defines
************************************************************************/
/* ID of the Schedute Table */
#define SCHED_TBL_ID                                                 1u

/* NUmber of scheduling events */
#define SCHED_EVT_NUMBER                                             2u

/* Number of Schedule table */
#define SCH_TBL_NUMB                                                 1u
```

## STEP 3: OS Alarms
In this step you are supposed to configure the OS alarms, but we don't have alarms in this project so we simply need to copy/paste the empty alarms templates (you can find them in the repository template folder).

## STEP 4: OS General configuration
Finally we have to create the file **os_cfg.h**. This file contains some general OS configuration. For this example you can copy the following sample:

```
/************************************************************************
* EXPORTED Defines
************************************************************************/

/* Uncomment this define to enable TERMINAL_DEBUG_ENABLED debug (only if printf redirect to UART) */
#define TERMINAL_DEBUG_ENABLED

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

/* Schedule every tick or continously */
#define SCHEDULE_AT_TICK                                 STD_FALSE

/* -- OS TASK READY QUEUE OPTIONS -------------------------------------------- */
/* Max number of tasks that can reside in the ready queue */
#define MAX_READY_TASKS                                  10u

/* Task table sorting algorithm */
#define INSERTION_SORT                                   0
#define MERGE_SORT                                       1
#define SORT_ALGORITHM                                   INSERTION_SORT

/* Sorting option */
#define SORT_INIT_ONLY                                   0
#define SORT_EACH_SCH_CYCLE                              1
#define SORT_OPTION                                      SORT_INIT_ONLY

/* -- USER HOOKS OPTIONS ----------------------------------------------------- */
/* Set STD_TRUE to enable and STD_FALSE to disable Hooks */

/* Enable/disable StartupHook() */
#define ENABLE_STARTUP_HOOK                              STD_FALSE
/* Enable/disable ShutdownHook() */
#define ENABLE_SHUTDOWN_HOOK                             STD_TRUE
/* Enable/disable PreTaskHook() */
#define ENABLE_PRE_TASK_HOOK                             STD_FALSE
/* Enable/disable PostTaskHook() */
#define ENABLE_POST_TASK_HOOK                            STD_FALSE
/* Enable/disable ErrorHook() */
#define ENABLE_ERROR_HOOK                                STD_FALSE

/* -- SHUTDOWN BEHAVIOR OPTIONS ---------------------------------------------- */
/* Define the OS shutdown behavior */

#define INFINITE_LOOP                                    0
#define CONTINUE_MAIN_EXECUTION                          1
#define OS_SHUTDOWN_BEHAVIOR                             INFINITE_LOOP
```

The most important defines in this configuration file are: 

**SCHED_TIMER_FREQ_HZ**: CHAOS needs a timer interrupt to work. The ISR associated to this timer interrupt will call the OS API Os_Tick(), which has in charge the correct increment of all OS counters.
In order to calculate proper timing, the OS needs to know the calling rate of this API. In this case we will call the API inside a 1ms timer interrupt (we will use the PIC32 MZ core timer), so the parameter value is 1000 (Hz).

**DESIRED_SCHED_PERIOD_MS**: this is the value at wich we want the scheduler to operate, so it is the timing value of the OS tick. Normally I'm comfortable with timing in ms, so putting 1 the scheduler will run at 1ms rate.

## STEP 4: Task implementation and OS Integration
Now we can move to our main file, integrate the OS and implement our tasks.

The OS integration is intuitive, we need to simply call two functions:

**Os_Tick**: as told, inside a timer ISR firing at 1ms rate (as per out configuration).

**Os_Start**: in our main function, after any basic initialization we need to do (in this case IO and core timer). This function call never returns, so pay attention to not make any important call after.

Here is an example for PIC32 (I've used a PIC32 Curiosity 2.0 and MPLAB X + Harmony for low-level code generation:

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
    
    /* Register the timer callback */
    CORETIMER_CallbackSet ( MyCoreTimerCallback, (uintptr_t) NULL );
    /* Start core timer */
    CORETIMER_Start();

    /* Start OS */
    Os_Start();
    
    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}
```

Done this, the last thing we need to do is write the code of our tasks, and in CHAOS this is pretty simple. Here is the code for blinking the tow LEDs of [REQ_1]:

```
/* MyTask_1 function */
TASK(MyTask_1)
{
  /* Toggle LED */
  LED_RED_Toggle();

  /* Task Termination */
  Os_TerminateTask();
}

/* MyTask_2 function */
TASK(MyTask_2)
{  
  /* Toggle LED */
  LED_GREEN_Toggle();
  
  /* Task Termination */  
  Os_TerminateTask();  
}
```

## Test
Since we have activated the debug terminal, if we configure the UART and re-direct the printf calls to that peripheral, we can see what's actually happening under the hood:

![image](https://github.com/ffich/CHAOS/assets/59200746/52786d32-c780-41c0-8a92-074ee271dc43)

If we make the OS log less verbose (by commenting the option TERMINAL_DEBUG_ENABLED) and we add some logging in the task itself we can see easily the final effect of our design:

```
/* MyTask_1 function */
TASK(MyTask_1)
{  
  printf("\r\nTimestamp - %d - ", Os_TickCounter);      
  printf("LED_1 Toggle \r\n");  
  /* Toggle LED */
  LED_RED_Toggle();

  /* Task Termination */
  Os_TerminateTask();
}

/* MyTask_2 function */
TASK(MyTask_2)
{  
  printf("\r\nTimestamp - %d - ", Os_TickCounter);      
  printf("LED_2 Toggle \r\n");   
  /* Toggle LED */
  LED_GREEN_Toggle();
  
  /* Task Termination */  
  Os_TerminateTask();  
}
```

![image](https://github.com/ffich/CHAOS/assets/59200746/24cd452e-ba48-4600-b7fa-9fa105a3e6ba)

We can also see how MyTask_2 (controlling LED_2) is always executyed first (it has higher priority) in the scheduling cycle that happens at 1s multiples. The 2ms delay on the execution of MyTask_1 is determied by the execution time of MyTask_2 (not much for the LED toggling but for UART transmission at the rate of 115200 baud).

## Closing the circle
To close the circle we can implement [REQ_2] and see how easy we can do this without any modification to the existing code (please note we only updated the relevant part of the configuration).

First update **os_task_cfg.h** and **os_task_cfg.c** as below:

*os_task_cfg.c*

```
/************************************************************************
* TASK List
************************************************************************/
extern void MyTask_1 (void);
extern void MyTask_2 (void);
extern void MyTask_3 (void);

/************************************************************************
* GLOBAL Variables
************************************************************************/
TbcType Tasks[] =
{
  /* -------------------------------------------------------------------- */
  /* ID                    Task              State           Priority     */
  /* -------------------------------------------------------------------- */   
  /* --------------------------------- Tasks ---------------------------- */   
  {MY_TASK_1_ID,           MyTask_1,         IDLE,           10},
  {MY_TASK_2_ID,           MyTask_2,         IDLE,           20},  
  {MY_TASK_3_ID,           MyTask_3,         IDLE,           30},   
  /* -------------------------------------------------------------------- */
};

/* Auto-calculation of task number */
const uint16_t TaskNumber = (uint16_t)(sizeof(Tasks)/sizeof(TbcType)); 
```

*os_task_cfg.h*

```
/************************************************************************
* EXPORTED Defines
************************************************************************/
/* Task IDs */
#define MY_TASK_1_ID                                              1u
#define MY_TASK_2_ID                                              2u
#define MY_TASK_3_ID                                              3u
```

Then update **os_sched_tbl_cfg.c** and **os_sched_tbl_cfg.h** adding a new scheduling event at 1300ms:

*os_sched_tbl_cfg.c*

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
  {MY_TASK_3_ID,     COUNTER_INIT,    1300},   
  /* ------------------------------------------------ */
};
```

*os_sched_tbl_cfg.h*

```
/************************************************************************
* EXPORTED Defines
************************************************************************/
/* ID of the Schedule Table */
#define SCHED_TBL_ID                                                 1u

/* Number of scheduling events */
#define SCHED_EVT_NUMBER                                             3u

/* Number of Schedule table */
#define SCH_TBL_NUMB                                                 1uu
```

And, finally, add MyTask_3 implementation in main.c:

```
/* MyTask_3 function */
TASK(MyTask_3)
{  
  printf("\r\nTimestamp - %d - ", Os_TickCounter);      
  printf("LED_3 Toggle \r\n");   
  /* Toggle LED */
  LED_BLUE_Toggle();
  
  /* Task Termination */  
  Os_TerminateTask();  
}
```

Logging as before, we can see how we implemented the requirement as requested:

![image](https://github.com/ffich/CHAOS/assets/59200746/1a3d7c4b-bd61-4ffd-8b09-7603d2a6db3d)

