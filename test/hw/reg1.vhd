-- basic 1 bit register 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg1 is
	port (
		clk			: in	std_logic;
		a_rst			: in	std_logic;
		D				: in	std_logic;
		Q				: out std_logic
	);
end entity reg1;

architecture bhv of reg1 is
begin
	process (clk, a_rst) 
	begin
		if (a_rst = '1') then
			Q <= '0';
		elsif (clk'event and clk = '1') then
			Q <= D;
		end if;
	end process;
end architecture bhv;
