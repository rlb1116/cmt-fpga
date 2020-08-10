-- valid hold register

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hold_reg is
	generic (
		width			: 		positive := 64);
	port (
		clk			: in	std_logic;
		a_rst			: in	std_logic;
		D				: in	std_logic_vector(width-1 downto 0);
		en				: in	std_logic;
		rd				: in 	std_logic;
		Q				: out std_logic_vector(width-1 downto 0);
		valid			: out std_logic
	);
end entity hold_reg;

architecture bhv of hold_reg is
begin
	process (clk, a_rst) 
	begin
		if (a_rst = '1') then
			valid <= '0';
			Q <= (others => '0');
		elsif (clk'event and clk = '1') then
			if (rd = '1') then 
				valid <= '0';
			end if;
			if (en = '1') then
				Q <= D;
				valid <= '1';
			end if;
		end if;
	end process;
end architecture bhv;


