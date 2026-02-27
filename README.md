# EdgeMAC-8
## Pipelined 8-bit Multiply-Accumulate (MAC) Unit in Verilog

---

## Overview

EdgeMAC-8 is a modular 2-stage pipelined 8-bit Multiply-Accumulate (MAC) unit designed using Verilog HDL.

The MAC operation performed is:

Result = (A × B) + Previous_Result

This architecture is widely used in:
- Digital Signal Processing (DSP)
- FIR and IIR filters
- Neural network accelerators
- AI edge devices
- Embedded compute systems

The project focuses on clean RTL design, modular hierarchy, and verification-ready structure.

---

## Design Objectives

- Implement an 8-bit MAC unit in Verilog
- Introduce 2-stage pipelining
- Add overflow detection logic
- Include enable and clear control signals
- Maintain modular and scalable architecture

---

## Architecture Description

The design consists of three main modules:

1. Multiplier (Combinational Logic)
   - Multiplies two 8-bit unsigned inputs
   - Produces a 16-bit output

2. Pipeline Register (Sequential Logic)
   - Stores multiplier output
   - Creates stage separation
   - Improves timing structure

3. Accumulator (Sequential Logic)
   - Adds pipelined product to previous accumulated value
   - Controlled by enable and clear signals
   - Detects overflow using carry-out logic

---

## Conceptual Block Diagram

        A (8-bit) ----\
                         >--- Multiplier --- Pipeline Reg --- Accumulator ---> Result (16-bit)
        B (8-bit) ----/

Control Signals:
- clk
- rst
- enable
- clear

---

## Module Breakdown

multiplier.v
- Implements 8-bit multiplication
- Pure combinational logic

pipeline_reg.v
- Clocked register
- Stores multiplier output

accumulator.v
- Adds incoming data to stored value
- Includes overflow detection
- Supports clear and enable control

mac_top.v
- Integrates all modules

testbench.v
- Generates clock
- Applies input stimulus
- Verifies control and accumulation behavior

---

## Overflow Detection

Overflow is detected using carry-out during accumulation:

{overflow, acc_out} <= acc_out + data_in;

If carry-out occurs:
- overflow = 1
- Indicates the accumulated value exceeded 16-bit range

---

## Control Signals

clk      : System clock  
rst      : Asynchronous reset  
enable   : Enables accumulation  
clear    : Resets accumulator to zero  
overflow : Indicates overflow condition  

---

## Pipeline Concept

The design uses a 2-stage pipeline:

Stage 1: Multiplication  
Stage 2: Accumulation  

Benefits:
- Reduced critical path
- Improved scalability
- Suitable for FPGA or ASIC synthesis

---

## Applications

This MAC unit can be extended for:

- FIR filter implementation
- Convolution operations
- Neural network inference engines
- DSP accelerators
- Custom AI hardware blocks

---

## Future Improvements

- Signed multiplication support
- Saturation arithmetic
- Clock gating for low-power design
- Parameterized bit width
- FPGA synthesis and timing analysis
- Integration into a RISC-V datapath

---

## Tools (Intended)

- Verilog HDL
- ModelSim / Icarus Verilog
- Vivado / Quartus for FPGA implementation

---

## Learning Outcomes

- Understanding pipelined datapath design
- Modular RTL development
- Overflow detection logic
- Control signal integration
- Verification-oriented design thinking

---

## Conclusion

EdgeMAC-8 demonstrates a clean and scalable RTL implementation of a pipelined 8-bit MAC unit. The project highlights fundamental digital design concepts including pipelining, sequential logic, overflow detection, and system-level integration.

This design serves as a foundational building block for advanced DSP and AI hardware systems.
