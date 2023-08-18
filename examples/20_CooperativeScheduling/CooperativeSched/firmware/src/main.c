/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

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

#define T2_YIELD
#define T3_YIELD

#define delay_ms(x) CORETIMER_DelayMs(x)

#ifndef T1_ENDLESS_LOOP
/* Task function */
TASK(MyTask_1)
{
  /* Toggle LED */
  LED_RED_Toggle();

  /* Task Termination */
  Os_TerminateTask();
}
#endif

/* Task function */
TASK(MyTask_2)
{  
  /* Activate task 3 */
  Os_ActivateTask(MY_TASK_3_ID);
  /* Yield control to the scheduler, allowing preemption */  
#ifdef T2_YIELD  
  Os_Yield(); 
#endif
  /* Toggle LED */
  LED_GREEN_Toggle();  
  
  /* Task Termination */  
  Os_TerminateTask();  
}

/* Task function */
TASK(MyTask_3)
{
  /* Activate task 4 */
  Os_ActivateTask(MY_TASK_4_ID);
  /* Yield control to the scheduler, allowing preemption */
#ifdef T3_YIELD    
  Os_Yield(); 
#endif  
  
  /* Toggle LED */
  LED_YELLOW_Toggle();
  
  /* Busy wait */
  delay_ms(100);
  
  /* Task Termination */
  Os_TerminateTask();
}
  
#ifndef T4_ENDLESS_LOOP
/* Task function */
TASK(MyTask_4)
{
  /* Toggle LED */
  LED_BLUE_Toggle();
  
  /* Busy wait */
  delay_ms(100);  
  
  /* Task Termination */  
  Os_TerminateTask();  
}
#endif

/*******************************************************************************
 End of File
*/

