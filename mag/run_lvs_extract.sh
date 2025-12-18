#!/bin/bash
# Usage: run_extract.sh <cellname>
# where <cellname> is a magic layout (<cellname>.mag)
PDK_PATH="/opt/pdk/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc"
magic -rcfile "$PDK_PATH" -dnull -noconsole > ${1}_lvs_magic.log << EOF
drc off
locking disable
crashbackups stop
box 0 0 0 0
load $1
select top cell
extract path extfiles
extract all
ext2spice lvs
ext2spice -p extfiles -o ${1}_lvs.spice
quit -noprompt
EOF
rm -r extfiles
echo "Done!"
exit 0
