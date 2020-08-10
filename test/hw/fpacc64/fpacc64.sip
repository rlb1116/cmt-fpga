set_global_assignment -entity "fpacc64" -library "lib_fpacc64" -name IP_TOOL_NAME "QsysPrimePro"
set_global_assignment -entity "fpacc64" -library "lib_fpacc64" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "fpacc64" -library "lib_fpacc64" -name IP_TOOL_ENV "QsysPrimePro"
set_global_assignment -library "lib_fpacc64" -name SPD_FILE [file join $::quartus(sip_path) "fpacc64.spd"]
set_global_assignment -library "lib_fpacc64" -name MISC_FILE [file join $::quartus(sip_path) "../fpacc64.qsys"]

set_global_assignment -library "lib_fpacc64" -name MISC_FILE [file join $::quartus(sip_path) "sim/fpacc64.vhd"]
set_global_assignment -library "lib_fpacc64" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_acc_custom_160/sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fpacc64" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_acc_custom_160/sim/dspba_library.vhd"]
set_global_assignment -library "lib_fpacc64" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_acc_custom_160/sim/fpacc64_altera_fp_acc_custom_160_bhzzlly.vhd"]
