-- mac_pipe combining mac_datapath and mac_controller

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mac_pipe is 
	generic (
		width			: 		positive := 64;
		N				:		positive := 25);
	port (
		clk			: in 	std_logic;
		a_rst			: in  std_logic;
		load_ram		: in	std_logic;
		ram_data_in	: in	std_logic_vector(width-1 downto 0);
		valid_ram	: in	std_logic;
		mul_data_in	: in	std_logic_vector(width-1 downto 0);
		valid_in		: in	std_logic;
		data_out		: out std_logic_vector(width-1 downto 0);
		valid_out	: out std_logic
	);
end entity mac_pipe;

architecture str of mac_pipe is
signal new_acc_s, acc_en_s, mul_en_s, wren_s : std_logic;
signal address_s : std_logic_vector(5-1 downto 0);

begin

	U_DATAPATH : entity work.mac_datapath
		generic map (width => width)
		port map (
			clk			=> clk,
			a_rst			=> a_rst,
			new_acc		=> new_acc_s,
			acc_en		=> acc_en_s,
			mul_en		=> mul_en_s,
			wren			=> wren_s,
			address		=> address_s,
			ram_data_in	=> ram_data_in,
			mul_data_in	=> mul_data_in,
			data_out		=> data_out
		);
	
	U_CONTROL : entity work.mac_controller
		generic map (N => N)
		port map (
			clk			=> clk,
			a_rst			=> a_rst,
			valid_in		=> valid_in,
			valid_ram	=> valid_ram,
			load_ram		=> load_ram,
			address		=> address_s,
			wren			=> wren_s,
			mul_en		=> mul_en_s,
			acc_en		=> acc_en_s,
			new_acc		=> new_acc_s,
			valid_out	=> valid_out
		);

end architecture str;



