##  Project 2 — Topic 7: Design and Simulation of 4-bit Processor
## Description
* Designed and simulated a simple 4-bit processor with a custom instruction set architecture (ISA).
* Implemented 8 instructions: ADD, SUB, AND, OR, NOT, XOR, LOAD, and STORE.
* Integrated core processor components including:
-> Arithmetic Logic Unit (ALU)
-> Register File
-> Control Unit
-> Data Memory
* Verified processor functionality using behavioral simulation and waveform analysis.
  ###  Tools Used
- Vivado 2024.2 — Behavioral simulation and waveform analysis
- EDA Playground — Initial functional verification
 ## Instruction Set
Opcode	Instruction	
000	     ADD	       
001	     SUB	       
010	     AND	       
011	     OR	         
100	     NOT	       
101	     XOR	       
110	    LOAD	       
111	    STORE	     

## Simulation Results
Time(ns)	Instruction	Result
10	        ADD	       7
20	        SUB	       2
30	        AND	       3
40	        OR	       3
50	        NOT        12
60	        XOR	       13
70	        LOAD	     9
80	        STORE	     3


## Conclusion
Successfully implemented and verified a simple 4-bit processor supporting arithmetic, logical, and memory operations using Verilog HDL in Vivado.
