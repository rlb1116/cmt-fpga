
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

# ACDS 16.0 211 linux 2019.03.28.20:50:04
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script can be used to simulate the following IP:
#     ram32x64
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "aldec.do", run it as:
# #   vsim -c -do aldec.do
# #
# # Source the generated sim script
# source rivierapro_setup.tcl
# # Compile eda/sim_lib contents first
# dev_com
# # Override the top-level name (so that elab is useful)
# set TOP_LEVEL_NAME top
# # Compile the standalone IP.
# com
# # Compile the user top-level
# vlog -sv2k5 ../../top.sv
# # Elaborate the design.
# elab
# # Run the simulation
# run
# # Report success to the shell
# exit -code 0
# # End of template
# ----------------------------------------
# If ram32x64 is one of several IP cores in your
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

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "ram32x64"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "/tools/Intel/quartus/16.0.0.211/quartus/"
}

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

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                   ./libraries/altera_ver       
vmap       altera_ver        ./libraries/altera_ver       
ensure_lib                   ./libraries/lpm_ver          
vmap       lpm_ver           ./libraries/lpm_ver          
ensure_lib                   ./libraries/sgate_ver        
vmap       sgate_ver         ./libraries/sgate_ver        
ensure_lib                   ./libraries/altera_mf_ver    
vmap       altera_mf_ver     ./libraries/altera_mf_ver    
ensure_lib                   ./libraries/altera_lnsim_ver 
vmap       altera_lnsim_ver  ./libraries/altera_lnsim_ver 
ensure_lib                   ./libraries/twentynm_ver     
vmap       twentynm_ver      ./libraries/twentynm_ver     
ensure_lib                   ./libraries/twentynm_hssi_ver
vmap       twentynm_hssi_ver ./libraries/twentynm_hssi_ver
ensure_lib                   ./libraries/twentynm_hip_ver 
vmap       twentynm_hip_ver  ./libraries/twentynm_hip_ver 
ensure_lib                   ./libraries/altera           
vmap       altera            ./libraries/altera           
ensure_lib                   ./libraries/lpm              
vmap       lpm               ./libraries/lpm              
ensure_lib                   ./libraries/sgate            
vmap       sgate             ./libraries/sgate            
ensure_lib                   ./libraries/altera_mf        
vmap       altera_mf         ./libraries/altera_mf        
ensure_lib                   ./libraries/altera_lnsim     
vmap       altera_lnsim      ./libraries/altera_lnsim     
ensure_lib                   ./libraries/twentynm         
vmap       twentynm          ./libraries/twentynm         
ensure_lib                   ./libraries/twentynm_hssi    
vmap       twentynm_hssi     ./libraries/twentynm_hssi    
ensure_lib                   ./libraries/twentynm_hip     
vmap       twentynm_hip      ./libraries/twentynm_hip     
ensure_lib               ./libraries/ram_1port_160
vmap       ram_1port_160 ./libraries/ram_1port_160

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                -work altera_ver       
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                         -work lpm_ver          
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                            -work sgate_ver        
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                        -work altera_mf_ver    
  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                    -work altera_lnsim_ver 
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.v"                   -work twentynm_ver     
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/twentynm_atoms_ncrypt.v"      -work twentynm_ver     
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi_ver
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.v"              -work twentynm_hssi_ver
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip_ver 
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.v"               -work twentynm_hip_ver 
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"          -work altera           
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"      -work altera           
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"         -work altera           
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"      -work altera           
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd"   -work altera           
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"              -work altera           
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                        -work lpm              
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                       -work lpm              
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                     -work sgate            
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                          -work sgate            
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"           -work altera_mf        
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                      -work altera_mf        
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"        -work altera_lnsim     
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.vhd"                 -work twentynm         
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_components.vhd"            -work twentynm         
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_components.vhd"       -work twentynm_hssi    
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.vhd"            -work twentynm_hssi    
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_components.vhd"        -work twentynm_hip     
  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.vhd"             -work twentynm_hip     
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../ram_1port_160/sim/ram32x64_ram_1port_160_lcifr2i.v" -work ram_1port_160
  eval  vcom $USER_DEFINED_COMPILE_OPTIONS       "$QSYS_SIMDIR/ram32x64.vhd"                                                             
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L ram_1port_160 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L ram_1port_160 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
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
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
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
