# CHAOS Requirements
World begun out of **CHAOS**, but during my engineering career I learned that, to make a succesful design, you need to have some mandatory things in the pot:

- Clear requirements
- Methodology
- Order

Plus, this is a public repository, and you clean house when you have guests coming in, don't you?

So, we are at the point that we need methodology and requirements to make some **CHAOS**... funny, right?

# General Description
CHAOS (Cooperative Hardware Agnostic Operative System) is a cooperative RTOS (Real-Time Operating System) suitable to be used in simple embedded system such as:

- IO Controllers
- IoT devices
- Interface Board
- Home automatuion systems
- etc...

The main characteristics are simpliciy of implementation and easy integration on different HW platform without need for porting.

The following section list all the OS requirements:

Conventions:

- **Bold**: the requirement is implemented.
- *Italic*: the requirement has been accepted and is in implementation phase.
- None: the requirement is proposed.
- ~~Strikeout~~: the requirement is currently rejected, but for some reasons we decided to keep it in the list (hystorical reasons, or maybe we are not so sure...).

# Kernel Requirements
The following section lists all the **kernel** requirements.

**[REQ_KER_010]** - The OS shall provide a deterministic **Higher Priority First** scheduling implementation.

**[REQ_KER_011]** - The OS shall provide an Os_Start() API.

**[REQ_KER_020]** - The OK kernel shall provide a method for incrementing all the needed OS counters at a defined and configurable rate (os tick at e.g. 1ms).

**[REQ_KER_021]** - The OS shall provide an Os_Tick() API.

**[REQ_KER_030]** - The OS shall provide the possibility to select between different sorting algorithms to determine the higher priority task to dispatch.

**[REQ_KER_040]** - The OS shall provide and API that shut the OS down. Once the OS is shut down, it shall optionally call the shutdown hook and then terminate the OS esecution.
The termination behaviour of the OS must be configurable and the following two possibilities must be implemented:
- The OS calls the Os_Shutdown() function, that stops the execution in a while(1) loop, or...
- The OS returns from Os_Start() and let the processor continue to execute in its own main() function.

**[REQ_KER_050]** - The OS shall provide and API that returns OS version.

# Task Requirements
The following section lists all the **task** requirements.

**[REQ_TSK_010]** - The OS shall implement the following **state machine concept** for all tasks:

![image](https://github.com/ffich/CHAOS/assets/59200746/b7b247b4-a6ea-47db-8b5b-581690bc1cb9)

A task starts in **IDLE** state. In this state the Scheduler will not select the task for dispatching. A task can be moved in **READY** state by means of an activation (ActivateTask API).
When the task is in **READY** state, at the next dispatching round it will be executed and moved into **RUNNING** state by the Scheduler if it is the higher priority task that is ready to run.
A task is put back into **IDLE** state when it's terminated (TerminateTask or ChainTask APIs). A task can't be forcibly interrupted by the Scheduler, but it can voluntarily relase control to it by means of a specific Yield API. In this case the Scheudler taks over and execute any higher priority task that is ready to run (cooperative scheduling). During this period, the task is put into the **YIELD** state by the Scheduler. Once there are no higher priority task to be executed, the control is given back to the yielding task, that is put back into the **RUNNING** state.

*[REQ_TSK_011]* - Before to make any task state transition the OS shall check that the transition is valid. If the transition is not correct, the OS should issue an appropriate error from the API that requested the specific transition.

**[REQ_TSK_020]** - The OS shall provide a task table definition, that contains:

- The ID of the task. This must be an arbitrary 16-bit number, but each ID must be unique for each task.
- The task function name. This must a void - void C function. A #define TASK(x) macro must be provided for tasks declaration:

```
TASK(MyTask_1)
{
  /* Task body */
  
}
```
- The state of the task, that by default must be IDLE.
- The Prioroty of the task. This must be a 16-bit integer and prioroty are considered in decreasing order (to the higher the number, the higher the task priority).

**[REQ_TSK_030]** - The OS shall provide an Os_ActivateTask API. The task activation is made by means of the task ID.

**[REQ_TSK_031]** - If the ID passed for activating or chaining a task is not a valid ID, the API should return an appropriate error code.

**[REQ_TSK_040]** - The OS shall provide an Os_TerminateTask API. This API doesn't have any function parameter.

**[REQ_TSK_050]** - The OS shall provide an Os_ChainTask API. This API terminates the current running task and activate the task that corresponds to the ID passed as parameter.

**[REQ_TSK_060]** - The OS shall provide an Os_Yield API. This API doesn't have any function parameter.

**[REQ_TSK_070]** - The OS shall provide an Os_GetTaskID API. This API provide the currently running task ID.

**[REQ_TSK_080]** - The OS shall provide an Os_GetTaskPriority API. This API provide the currently running task Priority.

**[REQ_TSK_090]** - The OS shall provide a means to allow tasks to be autostarted once the OS is launched.

**[REQ_TSK_100]** - The OS shall provide an Os_ActivateTaskAndYield() API. This API activate a specific task and consequently Yield. It's useful to launch an high priority task with a single API.


# Schedule Table Requirements
The following section lists all the **schedule table** requirements.

**[REQ_STBL_010]** - The OS shall provide a mechanims to schedule tasks using schedule tables.

**[REQ_STBL_020]** - A schedule table shall contains the following entries:

*ID*: this is the ID of the task to be activated at the firing of the scheduling event.

*Counter*: the initial value of the schedule table counter associated to the scheduling event (by default 0).

*Timeout*: the timing value at which the scheduling event will activate the task.

**[REQ_STBL_030]** - The OS shall provide an Os_UpdateSchedTable API that sequentially parse the table and activate the tasks at each specific timeout.

**[REQ_STBL_040]** - The OS shall process the Task schedule table inside the Os_Tick() function.

**[REQ_STBL_050]** - The OS shall provide the possibility to have more than a single schedule table.

**[REQ_STBL_060]** - The OS shall provide the possibility to start and stop each schedule table.

**[REQ_STBL_061]** - The OS shall provide an **Os_StartScheduleTable()** API. This API takes the Schedule table ID as input parameter.

**[REQ_STBL_062]** - The OS shall provide an **Os_StopScheduleTable()** API. This API takes the Schedule table ID as input parameter.

# IPC Requirements
The following section lists all the **ipc** requirements.

**[REQ_IPC_010]** - The OS shall provide an API to send single events between tasks.

**[REQ_IPC_020]** - The OS shall provide an API to receive single events between tasks.

**[REQ_IPC_030]** - The OS shall provide an API to enqueue a message in a FIFO queue.

**[REQ_IPC_030]** - The OS shall provide an API to extract a message from a FIFO queue.

# Virtual Timing Requirements
The following section lists all the **virtual timing** requirements.

**[REQ_VTM_010]** - The OS shall provide virtual timing features.

**[REQ_VTM_020]** - The OS shall provide a type definition for SW timer variables (**SwTimerType**).

**[REQ_VTM_030]** - The OS shall provide an **Os_StartTimer** API.

**[REQ_VTM_040]** - The OS shall provide an **Os_StopTimer** API.

**[REQ_VTM_050]** - The OS shall provide an **Os_GetTimerStatus** API.

**[REQ_VTM_060]** - The OS shall provide an **Os_GetElapsedTime** API.

**[REQ_VTM_070]** - The OS shall provide an **Os_GetRemainingTime** API.

# Alarms Requirements
The following section lists all the **alarms** requirements.

[REQ_ALRM_010] - The OS shall provide a mechanims to implement alarms.

[REQ_ALRM_020] - Each Alarm must have the following properties associated:
- ID: unique identifier of an alarm within the system.
- Timeout: the time after which the alarm fires (expires).
- Action: the action to do once the alarm fires/expires.
- Type: the alarm type (one-shot or continous).

[REQ_ALRM_030] - Once a alarm fires, it can make one of the following 3 actions (configurable at runtime for each alarm):
- Activate a Task (the Task ID must be provided).
- Send an Event (the Event pointer must be provided).
- Call an user callback (the user callback function pointer must be provided).

[REQ_ALRM_040] - Alarms can be of two different types:
- One-shot: once the alarm fires it't not automatically re-armed.
- Continous: the alarm is re-armed after each fire.

# Logging Requirements
The following section lists all the **os logging** requirements.

*[REQ_LOG_010]* - The OS shall provide a 'terminal' feature (OS logging) that allow to log the status of the various tasks, schedule table, events, queue, etc...

*[REQ_LOG_020]* -  The OS logging feature must be configurable (as much as possible).

# Error Handling Requirements
The following section lists all the **os error handling** requirements.

**[REQ_ERR_010]** - The OS should have a **Os_ApiReturnType** (**Os_ErrorType** for the **ErrorHook**) type for providing returns value for the various OS APIs.

**[REQ_ERR_020]** - General return values (0-10):
- E_OS_OK: the API returned without any error.

**[REQ_ERR_030]** - **Kernel** return values (11-30):
- E_OS_WRONG_START_CONDITION: the Os_Start() API has been called while the OS is already started.
- E_OS_WRONG_STOP_CONDITION: The Os_Shutdown() API has been called while the OS is stopped.

**[REQ_ERR_040]** - **Task** related error codes (31-50):
- E_OS_WRONG_TASK_ID: this error should be issued when a wrong task ID is passed to the ActivateTask API.
- E_OS_WRONG_STATE_TRANSITION: this error is issued when a wrong task state transition is issued (e.g. trying to activate a RUNNING or YIELD Task).
- E_OS_WRONG_TASK_PTR: a task ready to be dispatched is a null pointer.- 
  
**[REQ_ERR_050]** - **Schedule Table** related error codes (51-70):
- E_OS_WRONG_SCH_TBL_ID: this error should be issued when a wrong Scheule Table ID is passed to the StartScheduleTable or StopScheduleTable API.
- E_OS_WRONG_SCH_TBL_STATE_TRANSITION: a wrong schedule table state transition is issued (e.g. trying to activate a RUNNING Schedule Table).
- E_OS_WRONG_SCH_TBL_PTR: a referenced schedule table is a null pointer.

[REQ_ERR_060] - **IPC** related error codes (71-80):

**[REQ_ERR_070]** - **Virtual Timing** related error codes (81-90):
- E_OS_WRONG_VT_PTR: a wrong virtual timer pointer is passed to a VT API.
- E_OS_WRONG_TMOUT_VALUE: a wrong timeout value is passed to Os_StartTimer API.

[REQ_ERR_080] - **Alarms** related error codes (91-100):

# User Hooks
The following section lists all the **user hooks** requirements.

*[REQ_HOOK_010]* - All the hooks described in this section must be provided by the user, and the OS is only responsible for calling them in the right place. 

**[REQ_HOOK_020]** - The OS shall provide a **StartupHook** API. It must be configurable if this API will be used (i.e. called by the OS) or not. 
Signature of the API: void User_StartupHook (void);

**[REQ_HOOK_030]** - The OS shall provide a **ShutdownHook** API. It must be configurable if this API will be used (i.e. called by the OS) or not.
Signature of the API: void User_ShutdownHook (void);

**[REQ_HOOK_040]** - The OS shall provide a **PreTaskHook** API. It must be configurable if this API will be used (i.e. called by the OS) or not.
Signature of the API: void User_PreTaskHook (uint_16 TaskID); The passed parameter is the ID of the Task that is about to run.

**[REQ_HOOK_050]** - The OS shall provide a **PostTaskHook** API. It must be configurable if this API will be used (i.e. called by the OS) or not.
Signature of the API: void User_PostTaskHook (uint_16 TaskID); The passed parameter is the ID of the Task that just ran.

*[REQ_HOOK_060]* - The OS shall provide a **ErrorHook** API. It must be configurable if this API will be used (i.e. called by the OS) or not. 
Signature of the API: void User_ErrorHook (Os_ApiErrorType ErrorCode); The parameter is the specific error code triggered by the OS.

# Additional Requirements
The following section lists all the **additional** requirements.

*[REQ_ADD_010]* - The OS shall provide 3 sets of files:
- OS Kernel/core files: all the OS fixed code implementation.
- OS Configuration templates: the OS configuration files, in form of user templates.
- OS User Integration templates: the User integratio files (e.g. Hooks), in form of user templates.

