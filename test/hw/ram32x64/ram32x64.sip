set_global_assignment -entity "ram32x64" -library "lib_ram32x64" -name IP_TOOL_NAME "QsysPrimePro"
set_global_assignment -entity "ram32x64" -library "lib_ram32x64" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "ram32x64" -library "lib_ram32x64" -name IP_TOOL_ENV "QsysPrimePro"
set_global_assignment -library "lib_ram32x64" -name SPD_FILE [file join $::quartus(sip_path) "ram32x64.spd"]
set_global_assignment -library "lib_ram32x64" -name MISC_FILE [file join $::quartus(sip_path) "../ram32x64.qsys"]

set_global_assignment -library "lib_ram32x64" -name MISC_FILE [file join $::quartus(sip_path) "sim/ram32x64.vhd"]
set_global_assignment -library "lib_ram32x64" -name MISC_FILE [file join $::quartus(sip_path) "ram_1port_160/sim/ram32x64_ram_1port_160_lcifr2i.v"]
