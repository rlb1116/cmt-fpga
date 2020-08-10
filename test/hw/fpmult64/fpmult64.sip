set_global_assignment -entity "fpmult64" -library "lib_fpmult64" -name IP_TOOL_NAME "QsysPrimePro"
set_global_assignment -entity "fpmult64" -library "lib_fpmult64" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "fpmult64" -library "lib_fpmult64" -name IP_TOOL_ENV "QsysPrimePro"
set_global_assignment -library "lib_fpmult64" -name SPD_FILE [file join $::quartus(sip_path) "fpmult64.spd"]
set_global_assignment -library "lib_fpmult64" -name MISC_FILE [file join $::quartus(sip_path) "../fpmult64.qsys"]

set_global_assignment -library "lib_fpmult64" -name MISC_FILE [file join $::quartus(sip_path) "sim/fpmult64.vhd"]
set_global_assignment -library "lib_fpmult64" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_160/sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fpmult64" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_160/sim/dspba_library.vhd"]
set_global_assignment -library "lib_fpmult64" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_160/sim/fpmult64_altera_fp_functions_160_py4gazy.vhd"]
