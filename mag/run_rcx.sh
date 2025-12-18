#!/bin/bash
# Usage: run_rcx.sh <cellname>
# where <cellname> is a magic layout (<cellname>.mag)
PDK_PATH="/opt/pdk/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc"
magic -rcfile "$PDK_PATH" -dnull -noconsole > ${1}_rcx_magic.log << EOF
drc off
locking disable
crashbackups stop
box 0 0 0 0
load $1
select top cell
flatten myflat
load myflat
cellname delete $1
cellname rename myflat $1
select top cell
extract path extfiles
extract unique notopports
extract all
ext2sim labels on
ext2sim -p extfiles
extresist tolerance 10
extresist
ext2spice lvs
ext2spice cthresh 0.1
ext2spice extresist on
ext2spice -p extfiles -o ${1}_rcx.spice
quit -noprompt
EOF
rm -r extfiles
echo "Done!"
exit 0
