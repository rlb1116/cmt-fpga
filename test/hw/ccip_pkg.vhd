-- Greg Stitt
-- University of Florida

library ieee;
use ieee.std_logic_1164.all;

package ccip_pkg is

    constant C_ADDR_WIDTH : positive := 42;
    subtype addr_range is natural range C_ADDR_WIDTH-1 downto 0;
    
    -- Cache line parameters
    constant C_CL_WIDTH : positive := 512;
    constant C_CL_BYTES : positive := C_CL_WIDTH / 8;
    subtype cl_range is natural range C_CL_WIDTH-1 downto 0;

    -- Memory-mapped IO parameters 
    constant C_MMIO_DATA_WIDTH : positive := 64; 
    constant C_MMIO_ADDR_WIDTH : positive := 16;
    subtype mmio_data_range is natural range C_MMIO_DATA_WIDTH-1 downto 0;
    subtype mmio_addr_range is natural range C_MMIO_ADDR_WIDTH-1 downto 0;

    constant MMIO_RESERVED_ADDR : positive := 16#000F#;

    constant C0_SL : std_logic := '0';
    
end ccip_pkg;
