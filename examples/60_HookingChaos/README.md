# Hooks

This example demonstrates how to use the **CHAOS hook system** to observe and instrument the OS lifecycle.  
Hooks are user-defined callbacks that CHAOS automatically invokes at key execution points, allowing you to monitor, log, or customize system behavior without modifying the kernel itself.

`60_HookingChaos` shows all major hooks in action by printing simple debug messages whenever each hook is triggered.

---

### What this example demonstrates

- How CHAOS invokes **startup hooks** before any tasks begin running.
- How **pre-task** and **post-task** hooks wrap the execution of every scheduled task.
- How a **shutdown hook** is executed when `OS_Shutdown()` is called.
- How hooks provide a non-intrusive way to track what the OS is doing internally.

The example is intentionally minimal: tasks themselves do almost nothing.  
The goal is to clearly show **when** each hook fires and in **what order**.

---

### Hooks used in this example

#### **Startup Hook**
Triggered once during initialization, before CHAOS begins task scheduling.  
Useful for:
- Logging system start conditions  
- Initializing diagnostics  
- Printing banners or system metadata  

#### **Pre-Task Hook**
Called *immediately before* each task is executed.  
Can be used to:
- Trace task activity  
- Measure execution timing  
- Perform instrumentation or profiling  

#### **Post-Task Hook**
Called *right after* each task returns control to the OS.  
Useful for:
- Tracking CPU usage  
- Debugging task behavior  
- Verifying task execution order  

#### **Shutdown Hook**
Executed when `OS_Shutdown()` is triggered.  
Allows:
- Final cleanup  
- Printing shutdown information  
- Recording diagnostics  

---

### What you will see when running it

With the example loaded, the system prints messages such as:

- “Startup hook triggered”
- “Pre-task hook: Task X”
- “Post-task hook: Task X”
- “Shutdown hook triggered”

This gives you a clear timeline of how CHAOS manages the system lifecycle.

---

### Why this example matters

Hooks are one of the simplest and most powerful introspection tools in CHAOS.  
They allow you to:

- Debug task scheduling behavior  
- Record performance metrics  
- Add tracing without modifying tasks or OS internals  
- Better understand the flow of execution inside CHAOS  

This example provides a compact template for integrating hook-based diagnostics in your own system.

