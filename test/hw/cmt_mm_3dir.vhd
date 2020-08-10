-- Matrix multiply for CMT-bone-be in 3 directions
-- Ryan Blanchard

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.user_pkg.all;

entity cmt_mm_3dir is
	generic (
		width 		: positive := 64;
		N			: positive := 25
	);
	port (
		clk		: in	std_logic;
		a_rst		: in	std_logic;
		go		: in	std_logic;
		data_in		: in	std_logic_vector(width-1 downto 0);
		d_in_vld 	: in	std_logic;
		kernel_in	: in	std_logic_vector(width-1 downto 0);
		k_in_vld 	: in	std_logic;		
		stall		: in	std_logic;
		data_out	: out 	std_logic_vector(width-1 downto 0);
		d_out_vld 	: out 	std_logic;
		done		: out 	std_logic
	);
end entity cmt_mm_3dir;

architecture str of cmt_mm_3dir is
signal data_mm_in, data_mm_out : std_logic_vector(width-1 downto 0);
signal vld_mm_in, vld_mm_out: std_logic;

begin
	
	U_MAT_MULT : entity work.cmt_mat_mult 
		generic map (
			width 			=> width,
			N			=> N)
		port map (
			clk			=> clk,
			a_rst			=> a_rst,
			kernel_data		=> kernel_in,
			kernel_vld		=> k_in_vld,
			data_in			=> data_mm_in,
			data_in_vld		=> vld_mm_in,
			data_out		=> data_mm_out,
			data_out_vld		=> vld_mm_out
		);
		
	U_REORDER : entity work.mac_reorder_mem
		generic map (
			width 			=> width,
			N			=> N)
		port map (
			clk			=> clk,
			a_rst			=> a_rst,
			go			=> go,
			data_in			=> data_in,     -- data_in
			d_in_vld		=> d_in_vld,
			pipe_in			=> data_mm_in,    
			p_in_vld		=> vld_mm_in,
			pipe_out		=> data_mm_out,
			p_out_vld		=> vld_mm_out,
			stall			=> stall,
			data_out		=> data_out,
			d_out_vld		=> d_out_vld,
			done			=> done
		);

end architecture str;



