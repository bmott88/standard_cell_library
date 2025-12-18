#!/bin/bash
#Sript to make running netgen lvs easier

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <extracted_netlist.spice> <original_netlist.spice>"
    exit 1
fi

LVS_SPICE=$1
SCH_SPICE=$2

CELL="${SCH_SPICE%.spice}"

PDK_PATH="/opt/pdk/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl"

netgen -batch lvs "${LVS_SPICE} ${CELL}" "${SCH_SPICE} ${CELL}" ${PDK_PATH}

echo "Done!"
