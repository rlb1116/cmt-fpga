
# (C) 2001-2019 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
# ----------------------------------------
# This script can be used to simulate the following IP:
#     fpacc64
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "mentor.do", run it as:
# #   vsim -c -do mentor.do
# #
# # Source the generated sim script
# source msim_setup.tcl
# # Compile eda/sim_lib contents first
# dev_com
# # Override the top-level name (so that elab is useful)
# set TOP_LEVEL_NAME top
# # Compile the standalone IP.
# com
# # Compile the user top-level
# vlog -sv ../../top.sv
# # Elaborate the design.
# elab
# # Run the simulation
# run -a
# # Report success to the shell
# exit -code 0
# # End of template
# ----------------------------------------
# If fpacc64 is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation <quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 16.0 211 linux 2019.03.26.19:18:38
#C:\intelFPGA_pro\16.1\quartus\eda\sim_lib

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "fpacc64"
}

set QSYS_SIMDIR "."

set QUARTUS_INSTALL_DIR "/intelFPGA_pro/16.1/quartus"

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib               ./libraries/altera/       
  vmap       altera        ./libraries/altera/       
  ensure_lib               ./libraries/lpm/          
  vmap       lpm           ./libraries/lpm/          
  ensure_lib               ./libraries/sgate/        
  vmap       sgate         ./libraries/sgate/        
  ensure_lib               ./libraries/altera_mf/    
  vmap       altera_mf     ./libraries/altera_mf/    
  ensure_lib               ./libraries/altera_lnsim/ 
  vmap       altera_lnsim  ./libraries/altera_lnsim/ 
  ensure_lib               ./libraries/twentynm/     
  vmap       twentynm      ./libraries/twentynm/     
  ensure_lib               ./libraries/twentynm_hssi/
  vmap       twentynm_hssi ./libraries/twentynm_hssi/
  ensure_lib               ./libraries/twentynm_hip/ 
  vmap       twentynm_hip  ./libraries/twentynm_hip/ 
}
ensure_lib                          ./libraries/altera_fp_acc_custom_160/
vmap       altera_fp_acc_custom_160 ./libraries/altera_fp_acc_custom_160/

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"           -work altera       
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"       -work altera       
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"          -work altera       
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"       -work altera       
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd"    -work altera       
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"               -work altera       
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                         -work lpm          
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                        -work lpm          
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                      -work sgate        
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                           -work sgate        
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"            -work altera_mf    
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                       -work altera_mf    
    eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv"     -work altera_lnsim 
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"         -work altera_lnsim 
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_atoms_ncrypt.v"      -work twentynm     
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.vhd"                  -work twentynm     
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_components.vhd"             -work twentynm     
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_components.vhd"        -work twentynm_hssi
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.vhd"             -work twentynm_hssi
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip 
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_components.vhd"         -work twentynm_hip 
    eval  vcom $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.vhd"              -work twentynm_hip 
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/fpacc64/altera_fp_acc_custom_160/sim/dspba_library_package.vhd"                    -work altera_fp_acc_custom_160
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/fpacc64/altera_fp_acc_custom_160/sim/dspba_library.vhd"                            -work altera_fp_acc_custom_160
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/fpacc64/altera_fp_acc_custom_160/sim/fpacc64_altera_fp_acc_custom_160_bhzzlly.vhd" -work altera_fp_acc_custom_160

  eval  vcom $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/fpmult64/altera_fp_functions_160/sim/fpmult64_altera_fp_functions_160_py4gazy.vhd" -work altera_fp_custom_160
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/ram32x64/ram_1port_160/sim/ram32x64_ram_1port_160_lcifr2i.v"                       -work ram_1port_160  

  #eval  vcom $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/synth/fpacc64.vhd"                                                                                                
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_fp_acc_custom_160 -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_fp_acc_custom_160 -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h
