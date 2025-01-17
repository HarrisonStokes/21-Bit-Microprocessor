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
 
**Known Issues**:
Icarus Verilog allows coding structures that are not allowed by other compilers.
1. Iverilog allows for multiple ``always`` blocks, while VLOG does not allow for this.
2. The dumpfile and dumpvars in the testbenches are needed for simulator and waveform, but not needed for other softwares.

## Objectives

## Architecture

## Assembly

## Tutorial

## Improvements:

## Conclusion:

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
> **Connect on [LinkedIn](https://linkedin.com/in/username](https://www.linkedin.com/in/harrison-stokes/))**

