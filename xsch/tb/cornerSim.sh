#!/bin/bash

DATE=$(date +%s)

#Spice netlist to be simulated
NETLIST=$1
BASENAME="${NETLIST%.*}"

#Check input
if [ -z "$NETLIST" ]; then
    echo "Usage: $0 <.sch or .spice file>"
    exit 1
fi

#Create copy of spice netlist from ~/.xschem/simulations/ directory
echo "Copying spice netlist from ~/.xschem/simulations/"
cp ~/.xschem/simulations/${BASENAME}.spice .

#Check if netlist successfully copied
if [ -f "${BASENAME}.spice" ]; then
	echo "Netlist successfully copied into current directory"
else
	echo "Netlist not found/unsuccessfully copied into current directory"
	exit
fi

#Prompt user input for what process corner to use
echo "Select what process corner(s) you would like to simulate: (tt, ss, ff, sf, fs, all):"
read CORNER
echo ""

if [[ ! "$CORNER" =~ ^(tt|ss|ff|sf|fs|all)$ ]]; then
    echo "Invalid corner: $CORNER"
    exit 1
fi

#Create the .csv and .log files to put the sim data into
LOG="${BASENAME}_${DATE}.log"

#Create master CSV if all corners used
if [ "$CORNER" == "all" ]; then
	MASTER_CSV="${BASENAME}_all_${DATE}.csv"
fi

#Make function to fix the syntax of the outputted CSV file (from "x y1 x y2" columns into "x y1 y2" for gnuplot graphing)
clean_csv() {
    local input_csv=$1
    local output_csv=$2
    awk '{printf "%s", $1; for(i=2; i<=NF; i+=2) printf " %s", $i; print ""}' "$input_csv" > "$output_csv"
}

#Make function to change corner in a temporary netlist, as well as write the data to a csv file
corner_simulate() {
        #Local variables
	local CORNER_NAME=$1
	local CSV="${BASENAME}_${CORNER_NAME}_${DATE}.csv"
        local CLEANED_CSV="${BASENAME}_${CORNER_NAME}_clean.csv"

	#Make temp netlist based on the corner you are running and copy the original into it
	local TEMPNETLIST="${BASENAME}_${CORNER_NAME}.spice"
	cp "${BASENAME}.spice" "${BASENAME}_${CORNER_NAME}.spice"

	echo "Simulating corner: ${CORNER_NAME}"

	#Edit netlist to simulate the selected corner
        sed -i "s|^\([[:space:]]*\.lib[[:space:]]\+[^[:space:]]\+[[:space:]]\+\)[^[:space:]]\+|\1${CORNER_NAME}|" "$TEMPNETLIST"
        sed -i "s|^\([[:space:]]*wrdata[[:space:]]\+\)[^[:space:]]\+|\1${CSV}|" "$TEMPNETLIST"

        #Run ngspice using the temp netlist and place any data into 
	ngspice -b "$TEMPNETLIST" >> "$LOG"

        #Convert csv into nice format for plotting
	clean_csv "$CSV" "$CLEANED_CSV"

	#Append the csv data for each run into a master csv file if "all" corner is used
	if [ "$CORNER" == "all" ]; then
		awk -v corner="$CORNER_NAME" 'NR==1 {next} {print $0, corner}' "$CLEANED_CSV" >> "$MASTER_CSV"
		echo "" >> "$MASTER_CSV"
                echo "" >> "$MASTER_CSV"
                echo "" >> "$MASTER_CSV"
		rm "$CSV" "$CLEANED_CSV"
	else
		mv "$CLEANED_CSV" "$CSV"	
	fi

	#Remove the temporary spice netlist created
	rm ${TEMPNETLIST}
}


#Use the "corner_simulate" function to simulate the selected corner(s)
if [ "$CORNER" = "all" ]; then
	for C in tt ss ff sf fs; do
		corner_simulate "$C"
	done
	else
		corner_simulate "$CORNER"
fi

echo ""

#Check if the simulation actually outputed the CSV data
if [ "$CORNER" = "all" ]; then
    if [ -f "$MASTER_CSV" ]; then
	echo "CSV successfully created:"
    else
        echo "CSV creation failed"
        exit 1
    fi
else
    FINAL_CSV="${BASENAME}_${CORNER}_${DATE}.csv"
    if [ -f "$FINAL_CSV" ]; then
        echo "CSV successfully created"
    else
        echo "CSV creation failed"
        exit 1
    fi
fi

#Organize the data created by this script
mkdir -p "cornerSim_${BASENAME}_${CORNER}_data"
mkdir -p "cornerSim_${BASENAME}_${CORNER}_data/log"
mv ${LOG} "cornerSim_${BASENAME}_${CORNER}_data/log"
mv "${BASENAME}.spice" "cornerSim_${BASENAME}_${CORNER}_data"
if [ -f "$MASTER_CSV" ]; then
	mv ${MASTER_CSV} "cornerSim_${BASENAME}_${CORNER}_data"
else
	mv ${FINAL_CSV} "cornerSim_${BASENAME}_${CORNER}_data"
fi

# Tell user where output data has been placed
echo "Output files placed in 'cornerSim_${BASENAME}_${CORNER}_data'"
