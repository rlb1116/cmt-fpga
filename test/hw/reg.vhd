-- basic N bit register 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg is
	generic (
		width			: 		positive := 64);
	port (
		clk			: in	std_logic;
		a_rst			: in	std_logic;
		D				: in	std_logic_vector(width-1 downto 0);
		Q				: out std_logic_vector(width-1 downto 0)
	);
end entity reg;

architecture bhv of reg is
begin
	process (clk, a_rst) 
	begin
		if (a_rst = '1') then
			Q <= (others => '0');
		elsif (clk'event and clk = '1') then
			Q <= D;
		end if;
	end process;
end architecture bhv;
