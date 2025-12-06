# 20 – CooperativeChaos

This example demonstrates **CHAOS running in fully cooperative mode**.  
Unlike preemptive scheduling, no timer interrupt forces context switches: tasks must **explicitly yield** by returning control to the scheduler.

The goal is to show how cooperative multitasking can be built on top of CHAOS’ **one-shot task model**, enabling multiple logical flows to progress without blocking.

---

## Overview

`20_CooperativeChaos` runs a set of demo tasks that **take turns on the CPU**, each performing a small chunk of work per activation:

- A *fast* task that runs frequently (e.g., blinking or short prints)
- A *slow* task that simulates multi-step work split into tiny cooperative chunks
- Optional utility/heartbeat tasks that show the system remains responsive

Each task:

1. Performs a **short, bounded amount of work**
2. Updates its **internal state** (counters, steps, FSM phases)
3. Returns, allowing the next task to run

This creates the illusion of parallelism while keeping execution deterministic and non-blocking.

---

## Key Concepts Demonstrated

### 1. Cooperative vs Preemptive Scheduling

Most other CHAOS examples use a **timer interrupt** (core timer) to preempt running tasks.  
Here:

- The scheduler is called manually from the main loop
- Tasks **never get interrupted mid-execution**
- Tasks must be written so they **yield often**  
- A blocking task will **freeze the entire system** — by design, to illustrate the cooperative constraint

This example highlights the tradeoff:

| Preemptive | Cooperative |
|------------|-------------|
| Transparent concurrency | Requires disciplined coding |
| Needs timer & context switching | Very simple & deterministic |
| Tasks can block briefly | Blocking breaks everything |

---

### 2. One-Shot Tasks as Building Blocks

CHAOS tasks always run **once per activation**. In cooperative mode, this is used to simulate long-running behavior:

- Each task maintains its own persistent **context/state**
- On each activation it performs **one small step**
- Over many activations, the task completes what would otherwise be a long computation or sequence

This enforces non-blocking design.

---

### 3. Cooperative Time Slicing

Instead of a hardware tick, the system relies on:

- A **top-level loop** repeatedly calling `chaos_schedule()`
- Tasks written so each activation finishes quickly
- State machines or counters used instead of long `while` or `for` loops

This creates a predictable, software-driven rotation between tasks.

---

## What You Will See When Running

On a serial terminal you should observe output such as:

- Frequent messages from the *fast* task  
- Step-by-step progress logs from the *slow* task  
- Heartbeat/status prints proving the system stays alive

If you intentionally add a blocking loop, the output freezes — showing why cooperative systems require disciplined design.

---

## How to Experiment

Try modifying the example:

- Add a new task that performs multi-step work cooperatively  
- Convert a blocking algorithm into a state machine  
- Log activation counts or timestamps to visualize scheduling fairness  
- Add a deliberate blocking delay to understand failure modes

---

## Why This Example Matters

Cooperative scheduling is ideal for small deterministic systems where you want:

- Predictable execution  
- Zero preemption overhead  
- Full control over when tasks yield  

`20_CooperativeChaos` acts as a clean template for:

- Migrating from a single big `while(1)` loop  
- Avoiding blocking code  
- Structuring embedded applications using **explicit state machines**  
- Understanding how CHAOS’ one-shot model enables user-managed concurrency

It’s the bridge between *“everything in one loop”* and a well-structured, RTOS-like architecture — without the complexity of preemptive scheduling.

---
