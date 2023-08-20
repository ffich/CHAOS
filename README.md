# CHAOS - Cooperative Hardware Agnostic OS

## Introduction
The idea behind **CHAOS** is to have a **very simple RTOS** that can be used with basically **any exisitng MCU**. This level of HW compatibility is achieved at the cost of having **no preemption capability** on the OS, an thus no need of manipulating the PC and SP as well as saving any CPU register (so basically making a **context switch**, that normally require assebly code and is consequently HW dependent). At the same time, the OS should provide many other RTOS services, including:

- Cooperative scheduling capability
- Highest Priority First scheduling policy
- State model for Tasks
- Schedule tables for periodic Task scheduling
- Inter-Task communication
- Virtual Timing

## Main Characteristics
The main characteristich of **CHAOS** are **simplicity** in the implementation and usage and **high portability**.

The main characteristics are described in the below sections:
- Scheduling Policy
- Task Model
- Configuration Model

In order to run, the OS needs two functions to be called:
- **OS_Start()**: to be called in the program main function after the system basic initialization.
- **OS_Tick()**: to be called inside a periodic timer interrupt (Typically a core tick timer or something similar).

## The Scheduling Policy
**CHAOS** implements an higher priority first scheduling policy. This means that each task is given a priority value and the OS will always run the task with the hihgest priorty value that is ready to run. All the other tasks will be run after, in decreasing priority order. This ensure that the developers can determine quite accurately which will be the next task that will be run, basing on the priority order. Nevertheless, since there is no pre-eption, is an user responsibility to cooperatively release the control within tasks if there is something more urgent to execute.

## The Task Model
CHAOS implements a 4-state task model. Each task can exists in one of the following states:

- **IDLE**: the task is inactive, as nobody (another task, an ISR or a schedule event) has requested the task to be activated.
- **READY**: the task is ready to run, and will be launched at the next dispatch event if is the higher priorty task in the schedule list.
- **RUNNING**: the task is currently running, and, since CHAOS is non-preemptive, could not be interrupted. Nevertheless, the task can cooperatively release the processor if it wants issuing a yield.
- **YIELD**: the task has released the control to the scheduler, that will then check if there is an higher priority task to run. If this is the case, the scheduler will launch the higher priorty task and the yielding task will be resumed at the end of the execution of the higher priority task. 

The image below illustrate the task state machine:

![image](https://github.com/ffich/CHAOS/assets/59200746/d1c98f89-bda3-40ea-9ec2-616a8c2a789a)

*Fig. 1 - The Task State Machine*


## The Configuration Model
The CHAOS configuration model is relatively simple. The user need to configure:

- **A Task Table**: which contains the list of the task in the system. Tasks are simple void - void functions (the OS provide a TASK macro for definition). The list has to include also the task priority and the task ID, which is the numerical value used to address a specific task during execution (e.g. for task activation or as a reference on a schedule table).

- **A Scheduling Table**: which determine the periodic behavior of the tasks in the system. Not all the tasks need to have a reference in this table, only the ones that needs periodic execution.

- **General OS Configuration**: this includes the OS tick definition (depending on how fast the timer interrupt that calls the Os_Tick() runs) and other general configuraiton.

## Getting Started
The best way to get started to make some **CHAOS** is to look at the [examples](https://github.com/ffich/CHAOS/tree/main/examples) sections. Normally all the basic feature of an OS can be showed using LEDs and printf, so basically any evaluation board that has this characteristics is good enough for the job. I've used a [Microchip Curiosity 2.0 Pic32 MZ EF](https://www.microchip.com/en-us/development-tool/dm320209) evalution board and [MPLAB X IDE](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide) + [MPLAB Harmony V3](https://www.microchip.com/en-us/tools-resources/configure/mplab-harmony) code generator, but everything is easily portable to other platform, following the examples guides. 

![image](https://github.com/ffich/CHAOS/assets/59200746/33cdfd6b-bde9-4cc2-b57a-0d35b5831352)

*Fig. 2 - Microchip Curiosity 2.0 Pic32 MZ EF evalution board*

