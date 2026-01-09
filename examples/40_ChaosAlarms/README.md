# Alarms

This example demonstrates how to use **CHAOS alarms** to trigger tasks at specific time intervals.  
It showcases how periodic alarms can be used to build time-driven behavior without relying on manual polling or blocking delays.

In this example, two independent alarms are configured to blink two LEDs at different rates:

- **Alarm A**: fires every **500 ms**, activating a task that toggles LED A.  
- **Alarm B**: fires every **1000 ms**, activating a task that toggles LED B.

Each alarm is periodic, meaning it automatically reschedules itself after firing.  
When an alarm expires, it simply **marks its associated task as ready**, allowing the CHAOS scheduler to run it during the next scheduling cycle.

---

### What this example demonstrates

#### 1. Using alarms to schedule tasks periodically  
CHAOS alarms let you set up recurring timing events without cluttering your task code with timing logic.  
Each alarm effectively becomes a **timer-driven trigger** for a task.

#### 2. Decoupling timing from workload  
The LED tasks themselves do not handle timers or delays —  
they just perform their action (toggle LED) when scheduled.  
All timing behavior is controlled by the alarms.

#### 3. Multiple timers running concurrently  
The example illustrates how CHAOS can manage **multiple alarms at different frequencies** without conflict:

- One LED blinks twice as fast as the other.  
- Both alarms continue to run independently and reliably.

#### 4. Event-driven architecture  
Instead of looping with delays, the system reacts to **events** (alarm expirations), keeping the architecture responsive and clean.

---

### What you’ll observe when running it

- LED A toggles every **500 ms**, giving a fast blink.  
- LED B toggles every **1000 ms**, giving a slower blink.  
- Both LEDs blink continuously and smoothly, driven entirely by alarms.  
- No task blocks or waits; CHAOS handles timing and scheduling.

---

### Why this matters

This example is a foundation for building **time-driven embedded systems** with CHAOS:

- Periodic sensor sampling  
- Heartbeat indicators  
- Motor control loops  
- Communications polling  
- Scheduled maintenance tasks  

It highlights how CHAOS alarms can be used to create predictable, precise, and modular timing behavior with minimal overhead.

---

### Summary

`40_ChaosAlarms` teaches you how to:

- Configure multiple alarms  
- Trigger tasks at independent periodic rates  
- Build clean, non-blocking timing logic  
- Combine alarms and tasks into a simple, readable, event-driven system

This pattern forms the basis of many real-time embedded applications.
