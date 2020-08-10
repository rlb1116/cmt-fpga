-- Ryan Blanchard, Greg Stitt
-- University of Florida

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
--use work.ccip_pkg.all;

package user_pkg is
	constant C_DATA_WIDTH 	: positive := 64;		-- double precision floating point 
	constant C_ELEMENT_SIZE : positive := 8;		-- range of 5-25
	constant C_KERNEL_SIZE 	: positive := C_ELEMENT_SIZE*C_ELEMENT_SIZE;
	constant C_TERNIX_SIZE 	: positive := C_ELEMENT_SIZE*C_ELEMENT_SIZE*C_ELEMENT_SIZE;
	constant C_ROOTN			: positive := 5;		-- bits needed to iterate Element size
	constant C_ADDR_WIDTH	: positive := 3*C_ROOTN;
	constant C_MEM_SIZE		: positive := 32768;	-- mem overhead to store 3D ternix = 2^(3*C_ROOTN) 
	subtype C_DATA_WIDTH_RANGE is natural range C_DATA_WIDTH-1 downto 0;


    -- memory-map addresses
    --constant RA_GO            : std_logic_vector(mmio_addr_range) := X"0000";
    --constant RA_KERNEL_DATA   : std_logic_vector(mmio_addr_range) := X"0001";
    --constant RA_DONE          : std_logic_vector(mmio_addr_range) := X"0002";
    --constant RA_KERNEL_LOADED : std_logic_vector(mmio_addr_range) := X"0003";
end package;

package body user_pkg is

end package body;
