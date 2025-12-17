#!/bin/bash
set -e

#Spice netlist to be simulated
NETLIST=$1
BASENAME="${NETLIST%.*}"
CORNER_NAME="tt_mm"

#Check input
if [ -z "$NETLIST" ]; then
    echo "Usage: $0 <.sch or .spice file>"
    exit 1
fi

#Create copy of spice netlist from ~/.xschem/simulations/ directory
echo "Copying spice netlist from ~/.xschem/simulations/"
cp "$HOME/.xschem/simulations/$BASENAME.spice" .

#Check if netlist successfully copied
if [ -f "$BASENAME.spice" ]; then
	echo "$BASENAME.spice successfully copied into current directory"
else
	echo "$BASENAME.spice not found/unsuccessfully copied into current directory"
	exit 1
fi

#Prompt user for number of monte carlo runs
read -p "Enter number of monte-carlo runs to perform: " RUNS
if ! [[ "$RUNS" =~ ^[0-9]+$ ]] || [ "$RUNS" -le 0 ]; then
    echo "Error: Runs must be a positive integer"
    exit 1
fi

echo "Number of available system cores: $(nproc)"
read -p "Enter number of cores used for simulation: " MAX_JOBS
echo "Starting ${RUNS} monte-carlo runs using ${MAX_JOBS} cores"

#Create csv and log output files
TIMESTAMP=$(date +%s)
MASTER_CSV="${BASENAME}_mc_${TIMESTAMP}.csv"
LOG="${BASENAME}_mc_${TIMESTAMP}.log"

#Make function to fix the syntax of the outputted CSV file (from "x y1 x y2" columns into "x y1 y2" for gnuplot graphing)
clean_csv() {
    local input_csv=$1
    local output_csv=$2
    awk '{printf "%s", $1; for(i=2; i<=NF; i+=2) printf " %s", $i; print ""}' "$input_csv" > "$output_csv"
}

#Make function to change the corner in a temporary netlist, as well as write the data to a csv file
mc_simulate() {
	local RUN_ID=$1
	local CSV="$BASENAME_temp_${RUN_ID}.csv"

	#Make temp netlist and copy original into it
	local TEMPNETLIST="${BASENAME}_temp_${RUN_ID}.spice"
	cp "${BASENAME}.spice" "${BASENAME}_temp_${RUN_ID}.spice"

	#Edit netlist to simulate the selected corner
        sed -i "s|^\([[:space:]]*\.lib[[:space:]]\+[^[:space:]]\+[[:space:]]\+\)[^[:space:]]\+|\1${CORNER_NAME}|" "$TEMPNETLIST"
        sed -i "s|^\([[:space:]]*wrdata[[:space:]]\+\)[^[:space:]]\+|\1${CSV}|" "$TEMPNETLIST"
        
        echo "Evaluating Run: ${RUN_ID}"

        #Run ngspice in batch mode using the temp netlist and place any data into log file
	ngspice -b "$TEMPNETLIST" >> "${RUN_ID}_temp.log"

	CLEANED_CSV="${BASENAME}_clean_${RUN_ID}.csv"
        clean_csv "$CSV" "$CLEANED_CSV"

	#Remove the temp spice netlist
	rm "$TEMPNETLIST" "$CSV"
}

#Use the function created to run sims in parallel
for I in $(seq 1 ${RUNS})
do
    mc_simulate "$I" &

    while [ "$(jobs -r | wc -l)" -ge "$MAX_JOBS" ]; do
        sleep 0.5
    done
done

wait  # ensure all simulations finish
echo "All simulations completed."

#Merge all the log files
for I in $(seq 1 ${RUNS})
do
	cat "${I}_temp.log" >> "$LOG"
	echo "" >> "$LOG"
done
rm *_temp.log

#Merge all the run files into one CSV
cp "${BASENAME}_clean_1.csv" "$MASTER_CSV"
echo "" >> "$MASTER_CSV"
for I in $(seq 2 ${RUNS})
do
	printf "\n\n" >> "$MASTER_CSV"
	cat "${BASENAME}_clean_${I}.csv" >> "$MASTER_CSV"
done

rm -f ${BASENAME}_clean_*.csv



#Check if simulation data actually outputed the CSV data
if [ -f "$MASTER_CSV" ]; then
	echo "CSV successfully created"
else
	echo "CSV failed to be created"
	exit 1
fi

#Organize the data created by this script
mkdir -p "monteCarlo_${BASENAME}_data"
mkdir -p monteCarlo_${BASENAME}_data/log
mv "$MASTER_CSV" "${BASENAME}.spice" "monteCarlo_${BASENAME}_data"
mv "$LOG" monteCarlo_${BASENAME}_data/log
echo "monteCarlo.sh output files placed in 'monteCarlo_${BASENAME}_data'"

	
