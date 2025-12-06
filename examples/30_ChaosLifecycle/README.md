# Os Lifecycle

This example demonstrates how the **CHAOS lifecycle** works by showing how to start the operating system, run tasks for a limited amount of time, and then shut everything down cleanly using a one-shot alarm.

The goal is to provide a minimal but complete demonstration of:

- How CHAOS tasks run under normal scheduling.
- How alarms interact with the OS lifecycle.
- How to perform a **graceful system shutdown** using `OS_Shutdown()`.
- How to build systems that run for a predefined time window and then stop deterministically.

---

### Overview

At startup, CHAOS initializes its scheduler and begins executing a group of example tasks. These tasks run normally, cycling under the cooperative/preemptive scheduling rules defined by the OS configuration.

In parallel, the example configures a **single-shot alarm** that is programmed to fire after **10 seconds**. This alarm is registered with the CHAOS alarm subsystem and tied to a callback function.

When the alarm expires, the callback is executed, and its purpose is simple:  
**Request the OS to shut down.**

This is done through `OS_Shutdown()`, which transitions CHAOS into its shutdown sequence and stops all tasks and OS activity in a clean and deterministic way.

---

### What This Example Shows

#### ✔ How to run tasks for a limited time

Tasks operate normally for the first 10 seconds. They continue to be scheduled, run, and yield according to CHAOS rules. This demonstrates the standard lifecycle of tasks in the operating system.

#### ✔ How alarms integrate with the scheduler

The alarm system runs independently of tasks and will always trigger after its timeout, regardless of what the tasks are doing. This allows alarms to act as lifecycle events or time-based control points.

#### ✔ How to shut the OS down cleanly

When the alarm callback calls `OS_Shutdown()`, CHAOS:

- Cancels future scheduling rounds  
- Stops all active tasks  
- Ends the OS lifecycle gracefully  

No infinite loops, no forced hardware reset, no undefined behavior — the OS intentionally stops.

This is particularly useful for:

- Timed demos  
- Benchmarks and profiling runs  
- Energy-saving modes  
- Controlled “run-for-N-seconds” applications  

---

### What You Will Observe When Running

- Tasks start running immediately and print/log/output their activity.  
- At approximately the 10-second mark, the alarm fires.  
- CHAOS shuts down, and task activity ceases.  
- The example ends cleanly without any manual intervention.

---

### Why This Matters

`30_ChaosLifecycle` is a key example because it teaches how to control the **start → run → shutdown** phases of an embedded OS. Many systems need predictable run durations or must stop automatically based on time or events.

By combining CHAOS tasks with a scheduled alarm and the `OS_Shutdown()` mechanism, this example demonstrates how to design deterministic lifecycles without relying on hardware resets or unsafe termination.

It is the foundation for building:

- Timed state machines  
- Power-cycle applications  
- Batch-processing nodes  
- Automated test fixtures  
- Any embedded system needing controlled execution time  

---

### Summary

This example ties together:

- **Tasks**  
- **Alarms**  
- **Lifecycle management**  
- **Graceful OS shutdown**

to provide a compact demonstration of how CHAOS handles the full lifetime of an embedded application.

