# MiniRisc – 32-bit RISC-V Processor in Verilog

## Overview

MiniRisc is a simplified 32-bit RISC-V processor designed and implemented in Verilog HDL. The project was developed to understand processor architecture, RTL design, verification, and synthesis using open-source EDA tools.

The processor follows a modular design approach, with separate RTL modules for instruction decoding, control generation, arithmetic operations, register storage, and memory access.

## Features

### Supported Instructions

#### R-Type

* ADD
* SUB
* AND
* OR
* XOR
* SLT

#### I-Type

* ADDI

#### Memory Instructions

* LW (Load Word)
* SW (Store Word)

## Processor Architecture

The processor consists of the following modules:

### Program Counter (PC)

Maintains the address of the current instruction.

### Instruction Decoder

Extracts:

* Opcode
* Destination Register (rd)
* Source Registers (rs1, rs2)
* Function fields (funct3, funct7)
* Immediate values

### Control Unit

Generates control signals such as:

* RegWrite
* ALUSrc
* ALUCtrl
* MemRead
* MemWrite
* MemToReg

### Register File

* 32 General Purpose Registers
* Two read ports
* One write port
* x0 hardwired to zero

### Arithmetic Logic Unit (ALU)

Supports:

* Addition
* Subtraction
* AND
* OR
* XOR
* Set Less Than (SLT)

### Data Memory

Supports:

* Word Load (LW)
* Word Store (SW)

## Datapath

Instruction
→ Decoder
→ Control Unit
→ Register File
→ ALU
→ Data Memory
→ Write Back
→ Register File

## Example Program

```assembly
addi x1, x0, 100
addi x3, x0, 30
sw   x3, 0(x1)
lw   x4, 0(x1)
```

Expected Result:

```text
x1 = 100
x3 = 30
x4 = 30
```

## Verification

Simulation was performed using:

* Icarus Verilog
* GTKWave

Example simulation output:

```text
x1 = 100
x3 = 30
x4 = 30
```

## Synthesis

RTL was synthesized using Yosys.

Example synthesis flow:

```bash
yosys cpu.ys
```

Generated outputs:

* cpu_netlist.v
* alu_netlist.v

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Yosys
* Visual Studio Code

## Project Structure

```text
MiniRisc/
│
├── rtl/
│   ├── rtl_pc.v
│   ├── rtl_decoder.v
│   ├── control.v
│   ├── regfile.v
│   ├── rtl_alu.v
│   ├── dmem.v
│   └── cpu_top.v
│
├── tb/
│   └── tb_top.v
│
├── riscyosys/
│   ├── alu.ys
│   ├── cpu.ys
│   ├── alu_netlist.v
│   └── cpu_netlist.v
│
└── README.md
```

## Learning Outcomes

* RTL Design using Verilog HDL
* RISC-V Instruction Encoding
* Datapath and Control Design
* Register File Implementation
* Memory Interfacing
* Functional Verification
* Logic Synthesis using Yosys
* Introduction to ASIC Design Flow

## Future Enhancements

* Branch Instructions (BEQ, BNE)
* Jump Instructions (JAL, JALR)
* Instruction Memory Integration
* Pipeline Architecture
* Hazard Detection and Forwarding
* FPGA Implementation
* Physical Design using OpenROAD

## Author

Greeshma Potlapalli

Electronics and Communication Engineering Student

Interested in Digital VLSI Design, Computer Architecture, RTL Design, and ASIC Design Flows.
