-- counter 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is 
	generic (
		width		: positive	:= 5;
		max		: positive	:= 24);
	port (
		clk		: in	std_logic;
		a_rst		: in 	std_logic;
		inc		: in 	std_logic;		-- increment the count; else hold
		clr		: in 	std_logic;		-- synchronous clear
		count		: out std_logic_vector(width-1 downto 0)
	);
end entity counter;

architecture bhv of counter is 
signal count_s : std_logic_vector(width-1 downto 0);
begin
	process(clk, a_rst)
	begin
		if (a_rst = '1') then 
			count_s <= (others => '0');
		elsif (clk'event and clk = '1') then 
			if (clr = '1') then 
				count_s <= (others => '0');
			elsif (inc = '1') then
				if (unsigned(count_s) = max) then
					count_s <= (others => '0');
				else
					count_s <= std_logic_vector(unsigned(count_s) + 1);
				end if;
			end if;
		end if;
	end process;
	
	count <= count_s;
end architecture bhv;



