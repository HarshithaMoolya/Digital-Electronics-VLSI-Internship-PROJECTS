# Project 2 — Topic 7: Design and Simulation of 4-bit Processor

## Description

Designed and implemented a simple 4-bit Processor using Verilog HDL with a custom Instruction Set Architecture (ISA). The processor supports the following eight instructions:

- ADD
- SUB
- AND
- OR
- NOT
- XOR
- LOAD
- STORE

### Processor Modules
- Arithmetic Logic Unit (ALU)
- Register File
- Control Unit
- Data Memory

## Results

The processor was successfully verified through behavioral simulation in Vivado.

| Instruction | Result |
|------------|--------|
| ADD | 7 |
| SUB | 2 |
| AND | 3 |
| OR | 3 |
| NOT | 12 |
| XOR | 13 |
| LOAD | 9 |
| STORE | 3 |

- Behavioral simulation completed successfully.
- Waveform outputs verified using Vivado Simulator.

## Tools Used

- Verilog HDL (RTL Design)
- Vivado 2024.2 (Simulation and Waveform Analysis)

## Conclusion

Successfully designed, implemented, and verified a 4-bit Processor capable of performing arithmetic, logical, and memory operations using Verilog HDL. Functional simulation confirmed the correct execution of all supported instructions.
