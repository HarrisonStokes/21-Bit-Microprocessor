#!/bin/bash

# Define module dependencies as associative arrays
declare -A MODULE_DEPENDENCIES=(
    ["CONTROLLER.v"]=""
    ["DATAPATH.v"]="ALU.v IR.v MUX.v PC.v REG.v"
    ["IR.v"]=""
    ["PC.v"]=""
    ["PROCESSOR.v"]="ALU.v CONTROLLER.v DATAPATH.v IR.v MUX.v PC.v RAM.v REG.v"
    ["RAM.v"]=""
    ["REG.v"]=""
)

clean() {
    echo "Cleaning..."
    rm -rf Junk
    mkdir Junk
    echo "Complete"
}

assemble() {
    if [[ -f "$1" ]]; then
        echo "Assembling... $1"
        
		if [[ ! -f "Junk/fixup.out" ]]; then 
        	g++ Assembler/fixup.cc -o Junk/fixup.out
		fi
        ./Junk/fixup.out
		if [[ $? -eq 0 ]]; then 
        	echo "Parameter.v --> Parameter.h complete"
		else 
        	echo "Parameter.v --> Parameter.h failed"
		fi
        
		if [[ ! -f "Junk/assemble.out" ]]; then 
        	g++ Assembler/assemble.cc -o Junk/assemble.out
		fi
        Junk/assemble.out "$1" "${1%.asm}.mac"

        echo "Complete: ${1%.asm}.mac has the machine code"
    else
        echo "Error: Assembly file $1 does not exist"
    fi
}

compile_verilog() {
    module=$1
    dependencies="${MODULE_DEPENDENCIES[$module]}"
    
    if [[ -f "Modules/$module" ]]; then
		echo "Compiling $module with dependencies: "
		echo "     $dependencies..."

        if [[ -z "$dependencies" ]]; then
            iverilog "Modules/$module" -o "Junk/${module%.v}.out"
        else
			iverilog "Modules/$module" $(for dep in $dependencies; do echo "Modules/$dep"; done) -o "Junk/${module%.v}.out"
        fi
		if [[ $? -eq 0 ]]; then 
        	echo "Compilation complete"
		else 
        	echo "Compilation failed"
		fi

    else
        echo "Error: Module $module does not exist"
    fi
}

simulate() {
    testbench=$1
    mac_file=$2
	module="${testbench/_tb/}"
    dependencies="${MODULE_DEPENDENCIES[$module]}"
    
	if [[ $testbench == "PROCESSOR_tb.v" ]]; then
    	read -p "Enter the .mac file that has the machine instructions: " mac_file
    	cp "$mac_file" Testbenches/binary.mac
	fi
    
    if [[ -f "$mac_file" || $testbench != "PROCESSOR_tb.v" ]]; then
		echo "Simulating $testbench with dependencies: "
		echo "     $dependencies..."
        
        if [[ "$testbench" == "RAM_tb.v" ]]; then
            read -p "Enter the data input file for RAM_tb.v: " data_file
            cp "$data_file" Testbenches/data.mac
        fi

        if [[ -z "$dependencies" ]]; then
            iverilog "Testbenches/$testbench" "Modules/$module" -o "Junk/${testbench%.v}.out"
        else
            iverilog "Testbenches/$testbench" "Modules/$module" $(for dep in $dependencies; do echo "Modules/$dep"; done) -o "Junk/${testbench%.v}.out"
        fi
		if [[ $? -eq 0 ]]; then 
        	echo "Compilation complete"
		else 
        	echo "Compilation failed"
		fi

        vvp "Junk/${testbench%.v}.out"
		if [[ $? -eq 0 ]]; then 
        	echo "Simulation complete"
		else 
        	echo "Simulation failed"
		fi

		testbench="${testbench/_tb/}"
        gtkwave "Junk/${testbench%.v}.vcd"
		if [[ $? -eq 0 ]]; then 
        	echo "Waveform complete"
		else 
        	echo "Waveform failed"
		fi
    else
        echo "Error: Machine code file $mac_file does not exist"
    fi
}

display_help() {
    echo "How to Operate"
    echo "-------------"
    echo "Assembler:"
    echo " - Command: ./make.sh assemble FILENAME.asm"
    echo " - Converts .asm file into a .mac file with machine code."
    echo
    echo "Clean:"
    echo " - Clears the junk folder."
    echo
    echo "Verilog Compiler (iverilog):"
    echo " - Command: ./make.sh compile"
    echo " - Prompts for the file name of the module to compile."
    echo
    echo "Verilog Simulator (gtkwave):"
    echo " - Command: ./make.sh simulate"
    echo " - Prompts for the testbench to simulate and input files."
}

if [[ $1 = "clean" ]]; then
    clean

elif [[ $1 = "assemble" ]]; then
    assemble "$2"

elif [[ $1 = "compile" ]]; then
	echo "Available modules: "
	echo "    ${!MODULE_DEPENDENCIES[@]}"
	echo 
    read -p "Enter the name of the module you want to compile: " module
    compile_verilog "$module"

elif [[ $1 = "simulate" ]]; then
	echo "Available testbenches: "
	testbenches=""
	for module in "${!MODULE_DEPENDENCIES[@]}"; do
		testbenches+="${module%.v}_tb.v   "
	done
	echo "     $testbenches"
	echo 
    read -p "Enter the name of the testbench you want to simulate: " testbench
    simulate "$testbench"

else
    display_help
fi

