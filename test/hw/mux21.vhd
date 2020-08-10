-- mux 2 to 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux21 is 
	generic (
		width		:		positive := 64);
	port (
		a			: in	std_logic_vector(width-1 downto 0);
		b			: in	std_logic_vector(width-1 downto 0);
		sel		: in	std_logic;
		output	: out std_logic_vector(width-1 downto 0)
	);
end entity mux21;

architecture bhv of mux21 is
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