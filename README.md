# System-Verilog-Codes
A growing collection of digital logic circuits, RTL designs, and testbenches implemented in SystemVerilog. Built as a hands-on practice library for hardware design and verification.


### SystemVerilog RTL Design Collection

#### Overview
This repository is an actively growing library of Register-Transfer Level (RTL) hardware designs written in SystemVerilog. It serves as a personal sandbox and practice space for exploring digital logic concepts, ranging from foundational building blocks to more complex, pipelined architectures.

Every module is paired with a dedicated SystemVerilog testbench to verify functional correctness, pipeline timing, and edge cases.

#### Repository Categories (Growing)
As I continue to practice and build new hardware, designs are categorized into the following areas:

#### 1. Arithmetic & Combinational Logic
* **Current:** 64-bit pipelined ALUs, 32-bit pipelined multipliers.
* **Future Additions:** Adders, subtractors, multiplexer trees, comparators, etc.

#### 2. Sequential Logic & Registers
* **Current:** T/D Flip-Flops, Universal Shift Registers, SISO/SIPO/PISO/PIPO registers.
* **Future Additions:** Latches, FIFOs, RAM/ROM memory models.

#### 3. Counters & Clocks
* **Current:** Sync/Async Up-Down counters, BCD, Mod-N, Ring, Johnson, and Clock Dividers.
* **Future Additions:** PWM generators, real-time clocks (RTC).

#### 4. State Machines & Interfaces (Coming Soon)
* Finite State Machines (FSMs) like Mealy/Moore sequence detectors.
* Communication protocols (UART, SPI, I2C).

#### Simulation & Testing Notes
Reliable verification is a core focus of this repository. Testbenches are designed using:
* **Negative-edge stimulus injection** (`@(negedge clk)`) to prevent setup and hold timing violations.
* **Format-aware monitoring** (`$monitor` with proper decimal/hex widths) for clean console output.
* **Waveform Generation:** VCD dumping blocks (`$dumpfile`, `$dumpvars`) are included by default.

**Supported Tools:**
The code here is standard SystemVerilog and can be simulated in any major EDA tool, including ModelSim, Questa, Vivado, or EDA Playground.
