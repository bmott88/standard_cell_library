# standard_cell_library

Collection of standard schematics, layouts, and scripts for circuit design using the SKY130 PDK

SCHEMATICS:\
    inv.sch\
    tgate_2t.sch\
    tgate_6t.sch\
    ringOsc.sch\

LAYOUT:\
    inv.mag\
    tgate_2t.mag\
    tgate_6t.mag\

SCRIPTS:
    cornerSim.sh (Runs process corners tt/ss/sf/fs/ff)\
    monteCarlo.sh (Runs monte-carlo sims using tt_mm corner)\
    run_lvs_extract.sh (Extracts LVS netlist from .mag layout)\
    run_rcx.sh (Extracted RC extracted netlist from .mag layout)\
    netgen_lvs.sh (Runs netgen easier, may not work if layout and schematic cell name different)\
