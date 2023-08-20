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
    /* Busy wait simulate processing*/
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

/*******************************************************************************
 End of File
*/

