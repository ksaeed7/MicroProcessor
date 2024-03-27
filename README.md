# Microcomputer VHDL Project

## Project Description

This project simulates a simple microcomputer system using VHDL, reminiscent of early microcomputers but utilizing contemporary design tools. The system architecture comprises essential components such as registers, ALU, control unit, memory, and a multiplier, all seamlessly integrated to function as a cohesive unit.

## Components

- **Registers**: The design includes Accumulator A, Accumulator B (for multiplication shifts with A), Memory Data Register (MDR), Program Counter (PC), and the Instruction Register (IR), all 8-bits wide.
- **ALU (Arithmetic Logic Unit)**: Handles basic arithmetic operations (add and subtract) and manages overflow, carry, and zero flags. It's implemented behaviorally in VHDL for flexibility.
- **Control Unit**: Orchestrates operations across the microcomputer via a state machine, with states including Fetch, Decode, Execute, and Store, mirroring a MultiCycle Processor approach.
- **Memory**:
  - **RAM (Random Access Memory)**: A 256x8-bit memory for instruction and data storage, implemented with write and read capabilities.
  - **ROM (Read-Only Memory)**: Used for storing instructions, designed to be only readable to simulate an Instruction Memory.
- **Multiplier**: Utilizes a state machine with a counter to manage multiplication through shifting and addition, showcasing the use of VHDL for arithmetic operations.
- **Data Bus**: Ensures component communication and data transfer, implemented to address data hazards and signal overlaps efficiently.

## Design Highlights

- The **Control Unit** and **Multiplier** are designed as separate state machines to minimize state counts and optimize operation efficiency.
- **Memory** components, **RAM** and **ROM**, are crucial for storing and executing instructions, with RAM allowing read-write operations and ROM dedicated to read-only operations.
- **Data Bus** architecture is designed to mitigate data hazards and manage signal overlaps, facilitating smooth data flow across components.

## Implementation and Testing

- VHDL is used for the full implementation, from component-level design to the integration of the microcomputer system.
- Each component is tested with VHDL test benches to verify functionality and ensure reliability of operations, from basic arithmetic to complex instruction execution.
- The project demonstrates the microcomputer's capability to execute a sequence of instructions, including load, add, subtract, and multiply operations.

## Usage

1. **Setup**: Ensure a VHDL simulation environment is ready (e.g., GHDL or ModelSim).
2. **Compilation**: Compile VHDL files starting with basic components up to the microcomputer architecture.
3. **Simulation**: Run provided test benches to simulate various functionalities of the microcomputer.
4. **Evaluation**: Analyze simulation outputs to understand component interactions and instruction execution processes.

## Technical Notes

- The **ALU**'s behavioral implementation in VHDL highlights the versatility of VHDL in simulating complex logic operations.
- The design and implementation of the **Control Unit** as a state machine emphasize the sequential nature of instruction processing in microcomputers.

Utilized Xilinx ISE to compile and upload to Artix7 board.

This README provides a technical overview and usage guide for the Microcomputer VHDL Project. For detailed analysis and specific operational logic, refer to the VHDL source files and test benches.


