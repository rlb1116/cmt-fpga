-- kernel input loader

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_loader is
	generic (
		width			: positive := 64;
		N				: positive := 25);
	port (
		clk			: in	std_logic;
		a_rst			: in	std_logic;
		kernel_data	: in	std_logic_vector(width-1 downto 0);
		kernel_ld	: in	std_logic;
		ram_data		: out std_logic_vector(width-1 downto 0);
		valid_ram	: out std_logic_vector(N-1 downto 0)
	);
end entity input_loader;

architecture str of input_loader is
	signal path_num : std_logic_vector(5-1 downto 0);	-- current mac path to load next kernel input 
	signal load_depth : std_logic_vector(5-1 downto 0);	-- how many kernel inputs have been loaded in each path
	signal inc_depth, inc_path : std_logic;
	signal valid_s : std_logic_vector(N-1 downto 0);	

begin 

	PATH_COUNT : entity work.counter 
		generic map (width => 5, max => N-1)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_path,
			clr		=> a_rst,
			count		=> path_num
		);
	
	DEPTH_COUNT : entity work.counter 
		generic map (width => 5, max => N-1)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> kernel_ld,
			clr		=> a_rst,
			count		=> load_depth
		);
	
	process (kernel_ld, path_num, load_depth) 
	begin
		valid_s <= (others => '0');
		inc_path <= '0'; 
		if (kernel_ld = '1') then
			valid_s(to_integer(unsigned(path_num))) <= '1';
			if (to_integer(unsigned(load_depth)) = N-1) then
				inc_path <= '1';
			end if;
		end if;
	end process;
	
	process (clk, a_rst)
	begin
		if (a_rst = '1') then
			ram_data <= (others => '0');
			valid_ram <= (others => '0'); 
		elsif (clk'event and clk = '1') then 
			ram_data <= kernel_data;
			valid_ram <= valid_s;
		end if;
	end process;


end architecture str;











