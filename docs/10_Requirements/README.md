# CHAOS Requirements
We are at the point that we need requirements for making some CHAOS...

# General Description
CHAOS (Cooperative Hardware Agnostic Operative System) is a cooperative RTOS (Real-Time Operating System) suitable to be used in simple embedded system such as:

- IO Controllers
- IoT devices
- Interface Board
- Home automatuion systems
- etc...

The main characteristics are simpliciy of implementation and easy integration on different HW platform without need for porting.

# Kernel Requirements
The following section lists all the **kernel** requirements.

**[REQ_KER_010]** - The OS shall provide a deterministi High Priority First scheduling implementation.

**[REQ_KER_011]** - For the above purpose the OS shall provide an Os_Start() API.

**[REQ_KER_020]** - The OK kernel shall provied a method for incrementing all the needed OS counters at a defined and configurable rate (os tick at e.g. 1ms).

**[REQ_KER_021]** - For the above purpose the OS shall provide an Os_Tick() API.

**[REQ_KER_030]** - The OS should provide the possibility to select between different sorting algorithms to determine the higher priority task to dispatch.

# Task Requirements
The following section lists all the **task** requirements.

**[REQ_TSK_010]** - The OS shall implement the following state machine concept for all tasks:

![image](https://github.com/ffich/CHAOS/assets/59200746/b7b247b4-a6ea-47db-8b5b-581690bc1cb9)

A task starts in **IDLE** state. In this state the Scheduler will not select the task for dispatching. A task can be moved in **READY** state by means of an activation (ActivateTask API).
When the task it's ready, at the next dispatching round it will be executed and moved into **RUNNING** state by the Scheduler if it is the higher priority task that is ready to run.
A task is put back into **IDLE** state when it's terminated (TerminateTask or ChainTask APIs). A task can't be forcibly interrupted by the Scheduler, but it can voluntarily relase control to it by means of a specific Yield API. In this case the Scheudler taks over and execute any higher priority task that is ready to run (cooperative scheduling). During this period, the task is put into the **YIELD** state by the Scheduler. Once there are no higher priority task to be executed, the control is given back to the yielding task, that is put back into the **RUNNING** state.

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

**[REQ_TSK_040]** - The OS shall provide an Os_TerminateTask API. This API doesn't have any function parameter.

**[REQ_TSK_050]** - The OS shall provide an Os_ChainTask API. This API terminates the current running task and activate the task that corresponds to the ID passed as parameter.

**[REQ_TSK_060]** - The OS shall provide an Os_Yield API. This API doesn't have any function parameter.

**[REQ_TSK_070]** - The OS shall provide an Os_GetTaskID API. This API provide the currently running task ID.

**[REQ_TSK_080]** - The OS shall provide an Os_GetTaskPriority API. This API provide the currently running task Priority.

# Schedule Table Requirements
The following section lists all the **schedule table** requirements.

**[REQ_STBL_010]** - 


# IPC Requirements
The following section lists all the **ipc** requirements.

**[REQ_IPC_010]** - 

# Virtual Timing Requirements
The following section lists all the **virtual timing** requirements.

**[REQ_VTM_010]** - 

# Logging Requirements
The following section lists all the **os logging** requirements.

**[REQ_LOG_010]** - 

# Error Handling Requirements
The following section lists all the **os error handling** requirements.

**[REQ_ERR_010]** - 

# Additional Requirements
The following section lists all the **additional** requirements.

**[REQ_ADD_010]** - 
