# 21-Bit Microprocessor
## Table of Contents:
1. [Purpose](#Purpose)
2. [Dependencies](#Dependencies)
3. [Objectives](#Objectives)
4. [Architecture](#Architecture)
5. [Assembly](#Assembly)
6. [Tutorial](#Tutorial)
7. [Improvements](#Improvements)
8. [Conclusion](#Conclusion)
9. [License](#License)

## Purpose
The purpose of this project was to design and implement a simple microprocessor with a custom instruction set architecture (ISA) as part of a couse final project. Additionally, the project aimed to provide a deeper understanding of microprocessor operations at the hardware level and to improve knowledge of how assemblers function.

## Dependencies
The project utilizes the following technology for Linux:
* GNU Compiler Collection
   * https://gcc.gnu.org/
* Icarus Verilog Compiler
   * https://steveicarus.github.io/iverilog/
* Gtkwave Simulator
   * https://gtkwave.sourceforge.net/

 <ins>If installing on Ubuntu</ins>:</br>
Make sure Ubuntu is up to date.

    sudo apt update && upgrade
To install GNU Compiler Collection (GCC). Used to compile the assemblers source code.
  
    sudo apt install gcc 
To install Icaruse Verilog Compiler (Iverilog). Used to compile Verilog files and run testbenches.
 
    sudo apt install iverilog
To install Gtkwave Simulator. Used to visualize the waveforms and more simulation of testbenches.

    sudo apt install gtkwave

To clone repository run the following command:

    git clone https://github.com/HarrisonStokes/21-Bit-Microprocessor.git

Finally, give permission to make.sh to run as an executable:

    chmod +x make.sh
 
**Known Issues**:
Icarus Verilog allows coding structures that are not allowed by other compilers.
1. Iverilog allows for multiple ``always`` blocks, while VLOG does not allow for this.
2. The dumpfile and dumpvars in the testbenches are needed for simulator and waveform, but not needed for other softwares.

## Objectives
* Develop a project of sufficient difficulty to demonstrate knowledge learned from ECE 176 coursework.
* Must use Verilog to develop project.
* Must successfully work.
* Must be a custom ISA.

## Architecture
The architecture of the microprocessor is straightforward, featuring 8 instructions with an instruction bit width of 21 bits. It also supports 6-bit immediate values through the ``Load_I`` instruction.

### Microprocessor Top Level Connections
![Microprocessor connection overview](https://github.com/HarrisonStokes/21-Bit-Microprocessor/blob/main/Pictures/Block_Diagram.png)

### Module Hierarchy
![Module hierarchu](https://github.com/HarrisonStokes/21-Bit-Microprocessor/blob/main/Pictures/Module_Hierarchy.png)

### State Machine
![State machine](https://github.com/HarrisonStokes/21-Bit-Microprocessor/blob/main/Pictures/State_Diagram.png)

### Instruction Set Architecture
#### Opcodes
![Opcodes](https://github.com/HarrisonStokes/21-Bit-Microprocessor/blob/main/Pictures/Opcodes.png)

#### Instruction Format
![Instruction format](https://github.com/HarrisonStokes/21-Bit-Microprocessor/blob/main/Pictures/Instruction_Format.png)

## Assembly
### Features 
* Case insensitve
* Whitespace insensitive
* Ignores all non-alphanumerical and non-reserved operators

| Keyword | Description |
|---------|-------------|
| ;       | Indicates a comment |
| #       | Indicates an immediate value |
| =       | Indicates a memory address |
| LOAD    | It used to load an immediate value or data from an memory address |
| STORE   | It used to store a register value into a memory address |
| ADD     | Performs addition between two registers |
| SUB     | Performs subtraction between two registers |
| MUL     | Performs multiplication between two registers |
| DONE    | Stops program counter and removes any instructions below it |

| Registers | Purpose |
|-----------|---------|
| R0 - R7   | Eight general purpose registers |
| PC        | Program counter |

### LOAD Instruction
The ``LOAD`` instruction is used to load a register with either an immediate value or data from memory address.

#### Format:
    
    LOAD _DEST_ (#/=) (_IMMD/ADDR_)

#### Examples:
1. Loading an immediate value into a register
   The following demonstrates loading the decimal value ``63`` into register ``R0``:

       LOAD R0 #63
   
2. Loading data from memory address into a register
   The following demonstrates loading data from memory address ``10`` into register ``R0``:
    
       LOAD R0 =10
   
3. Loading the program counter with an instruction memory address
   The following demonstrates loading the program counter with an instruction address of ``9``:

       LOAD PC =9


### Instruction

### Registers


## Tutorial

## Improvements:
* Better memory structure: Enhance the organization and efficient memory access.
* Improve assembler efficiency: Optimize the assembler by using tokenization and added strict syntax.
* Enhanced assembler warning and error handling: Utilize semantic treees.
* Expand ISA capabilites: Introduce new instructions and improve flexibility in the instruction seta architecture.
    * Conditionals and branching.
* Hazard and branch detection unit: Add mechanisms to detect and handle hazards and branches during execution.
* Pipeling; Implement pipelining to improve the throughput and efficiency of the microprocessor.
* Follow a standard bit width: To improve consistency and compatibility with other systems. Also to reduce manufacturing cost.

## Conclusion:
For a first attempt at designing a microprocessor without a formal background in Computer Architecture, this project was successful in achieving its [purpose](#Purpose) and [objectives](#Objectives). 
After completing our Computer Architecture course (ECE 176), I now notice several areas in need of [improvement](#Improvements) in this project. This experience has sparked a deeper interest in computer architecture and system softeare as a whole.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
> **Connect on [LinkedIn](https://linkedin.com/in/username](https://www.linkedin.com/in/harrison-stokes/))**

