-- mux 2 to 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux21_1b is 
	port (
		a			: in	std_logic;
		b			: in	std_logic;
		sel		: in	std_logic;
		output	: out std_logic
	);
end entity mux21_1b;

architecture bhv of mux21_1b is
begin
	process(a,b,sel)
	begin
		if (sel = '1') then
			output <= b;
		else
			output <= a;
		end if;
	end process;
end architecture bhv;