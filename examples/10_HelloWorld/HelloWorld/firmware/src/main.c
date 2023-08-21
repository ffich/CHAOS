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

/*******************************************************************************
 End of File
*/

