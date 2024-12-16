# CHAOS - Cooperative Hardware Agnostic OS

## Introduction
The idea behind **CHAOS** is to have a **very simple RTOS** that can be used with basically **any exisitng MCU**. This level of **HW compatibility** is achieved at the cost of having **no preemption capability** on the OS, and thus no need of manipulating the PC and SP as well as saving any CPU register (so basically making a **context switch**, that normally require assebly code and is consequently HW dependent). At the same time, the OS should still provide other RTOS services, including:

- Cooperative scheduling capability
- Highest Priority First scheduling policy
- State model for Tasks
- Schedule tables for periodic Task scheduling
- Inter-Task communication
- Virtual Timing
- Alarms

A bulding block view of the OS is depicted in Fig.1.

![image](https://github.com/ffich/CHAOS/assets/59200746/d0c19695-94ce-4739-b5a8-22973461fb22)

*Fig. 1 - OS Structure*

## Inspiration
Main inspiration sources for **CHAOS** are:

- **LWSF** (https://github.com/ffich/LWSF) starting point for the kernel and the implementation of some other features
- **AUTOSAR OS** (https://www.autosar.org/fileadmin/standards/R22-11/CP/AUTOSAR_SWS_OS.pdf) for the general structure and the configuration model.

Obviously **CHAOS** is **NOT** an AUTOSAR compliant OS, and many features are not implemented.

## Main Characteristics
The main characteristics of **CHAOS** are described in the below sections:
- Scheduling Policy
- Task Model
- Configuration Model
- Integration

## The Scheduling Policy
**CHAOS** implements an **higher priority first** scheduling policy. This means that each task is given a priority value and the OS will always **run the task** with the **highest priorty value that is ready to run**. All the other tasks will be run after, in decreasing priority order. Task can be made ready to run either programmatically (calling the Os_ActivateTask API) or at pre-defined point in time via other OS objects (e.g., using ScheduleTables or Alarms).
This ensure that the developers can determine quite accurately which will be the next task that will be run, basing on the priority order. Nevertheless, since there is **no pre-emption**, is an user responsibility to cooperatively release the control within tasks if there is something more urgent to execute (**Yield**). **CHAOS** handles a **task ready queue** to keep track of all the task that are ready to run and a **task control block (TBC)** which holds all the other tasks information (like priority, ID, etc..).

## The Task Model
**CHAOS** implements a **4-state task model**. Each task can exists in one of the following states:

- **IDLE**: the task is inactive, as nobody (another task, an ISR or a schedule event) has requested the task to be activated.
- **READY**: the task is ready to run, and will be launched at the next dispatch event if is the higher priorty task in the ready queue.
- **RUNNING**: the task is currently running, and, since CHAOS is non-preemptive, could not be interrupted. Nevertheless, the task can cooperatively release the processor resource, if it wants, issuing a yield.
- **YIELD**: the task has released the control to the scheduler, that will then check if there is an higher priority task ready to run. If this is the case, the scheduler will launch the higher priorty task and the yielding task will be resumed at the end of the execution.

The image below illustrate the task state machine:

![image](https://github.com/ffich/CHAOS/assets/59200746/d1c98f89-bda3-40ea-9ec2-616a8c2a789a)

*Fig. 2 - The Task State Machine*

## The Configuration Model
The **CHAOS** configuration model is made by general an specific configuration sets:

- **General OS Configuration**: this includes all the OS general configuration options (e.g. the OS tick, the User Hooks to call, the level og logging, etc.)

- **OS Objects Configuration**: this section includes all the specific OS objects configuration, like the Tasks, Schedule Tables, Alarms, etc..

## OS integration
Integration of **CHAOS** is straightforward. In order to run, the user needs at least to call the following two OS API:

- **OS_Start()**: to be called in the program main function after the system basic initialization.
- **OS_Tick()**: to be called inside a periodic timer interrupt (Typically a core tick timer or something similar).

Additional APIs are optional and they may be needed to have a better defined OS lifecycle, error handling via User Hooks and other additional features.

## Getting Started
The best way to get started to make some **CHAOS** is to look at the [examples](https://github.com/ffich/CHAOS/tree/main/examples) section. Normally all the basic feature of an OS can be showed using LEDs and printf, so basically any evaluation board that has this characteristics is good enough for the job. I've used a [Microchip Curiosity 2.0 Pic32 MZ EF](https://www.microchip.com/en-us/development-tool/dm320209) evalution board and [MPLAB X IDE](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide) + [MPLAB Harmony V3](https://www.microchip.com/en-us/tools-resources/configure/mplab-harmony) code generator, but everything is easily portable to other platform, following the examples guides. 

![image](https://github.com/ffich/CHAOS/assets/59200746/33cdfd6b-bde9-4cc2-b57a-0d35b5831352)

*Fig. 3 - Microchip Curiosity 2.0 Pic32 MZ EF evalution board*

## Example List
Now you can unkork a beer yourself and start making some **CHAOS**.

[**World born out of CHAOS...**](https://github.com/ffich/CHAOS/tree/main/examples/10_HelloWorld): Very simple example that blinks two LEDs at different rate. It demonstrates how to create a basic CHAOS configuration with 2 tasks and a schedule table with 2 scheduling events.

**Cooperative CHAOS**: Example on the usage of cooperative scheduling (yield option) to yield execution control to higher priority tasks.

**Lifecycle of CHAOS**: Example on the CHAOS Lifecycle management.

**Timing CHAOS**: Example on usage of CHAOS virtual timing features.

**In the event of CHAOS**: Example on usage of events.

**Queueing CHAOS**: Example on usage of queues.

**Hooking on CHAOS**: Example on usage of User Hooks.

**Messing with Chaos**: Error Handling in CHAOS.

## Porting
I'm currently working on porting the Hello World example on some common architecture, like Microchip PIC18, PIC24, STM STM32, ExpressIf ESP8266/ESP32, NXP S32K, Infineon Tricore, etc...

Port List:

| Device family   | Board             | Conf./Build Environment                  | Status      |
|-----------------|-------------------|------------------------------------------|--------------
| STM32F1         | Blue Pill         | STM32 Cube MX                            | Completed   |
| STM32L0         | Nucleo-32         | STM32 Cube MX                            | Planned     |
| MCXA156         | FRDM              | MCUxpresso                               | Planned     |
| S32K1           | S32K144 EVB       | S32 Studio                               | Planned     |
| RP2040          | Raspberry Pico    | Eclipse + Extension                      | Planned     |
| ESP32           | Node MCU          | Eclipse + Extension                      | Planned     |
