-- mac datapath controller 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.user_pkg.all;

entity mac_controller is
	generic (
		N				: 		positive := 25);
	port (
		clk			: in	std_logic;
		a_rst			: in	std_logic;
		valid_in		: in	std_logic;
		valid_ram	: in	std_logic;
		load_ram		: in	std_logic;
		address		: out std_logic_vector(C_ROOTN-1 downto 0);
		wren			: out std_logic;
		mul_en		: out std_logic;
		acc_en		: out std_logic;
		new_acc		: out std_logic;
		valid_out	: out std_logic
	);
end entity mac_controller;

architecture bhv of mac_controller is 
-- propagate valid signal through ram
signal v_ram_1, v_ram_out : std_logic;	
-- propagate valid signal through multiplier
signal v_mul_1, v_mul_2, v_mul_3, v_mul_4, v_mul_5, v_mul_6, v_mul_7, v_mul_8, v_mul_9, v_mul_out : std_logic;
-- propagate valid signal through accumulator
signal v_acc_1, v_acc_2, v_acc_3, v_acc_4, v_acc_5, v_acc_6, v_acc_7, v_acc_8, v_acc_9, v_acc_10, v_acc_11, v_acc_12, v_acc_13, v_acc_14, v_acc_15, v_acc_out : std_logic; 

signal loading_ram : std_logic;	-- indicate if ram is being loaded (no new calculations)
-- counters for tracking sets of data/operations 
signal count_ram_in, count_acc_in, count_acc_out : std_logic_vector(C_ROOTN-1 downto 0);
signal cnt_ram_inc, cnt_ao_inc, cnt_ram_clr, cnt_ao_clr, cnt_ai_clr : std_logic := '0';

begin

	RAM_COUNTER : entity work.counter
		generic map (width => C_ROOTN, max => N-1)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> cnt_ram_inc,
			clr		=> cnt_ram_clr,
			count		=> count_ram_in
		);
	-- increment counter to loop through ram locations for storing and reading
	cnt_ram_inc <= (valid_ram) or valid_in;
	cnt_ram_clr <= load_ram;
	address <= count_ram_in;
	wren <= valid_ram;	-- can add loading_ram state if need be
	
	ACC_COUNT_IN : entity work.counter
		generic map (width => C_ROOTN, max => N-1)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> v_mul_out,
			clr		=> a_rst,	
			count		=> count_acc_in
		);
	new_acc <= '1' when count_acc_in = "00000" else '0';
	
	ACC_COUNT_OUT : entity work.counter
		generic map (width => C_ROOTN, max => N-1)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> cnt_ao_inc,
			clr		=> a_rst,	
			count		=> count_acc_out
		);
	cnt_ao_inc <= v_acc_out;-- and v_mul_out;	--test
		
	process (count_acc_out, v_acc_out)
	-- set valid_out signal corresponding to when full accumulation finishes
	begin
		if ((v_acc_out = '1') and (unsigned(count_acc_out) = N-1)) then
			valid_out <= '1';
		else
			valid_out <= '0';
		end if;
	end process;

	process (clk, a_rst) 
	-- propagate valid signals all the way through the pipeline to keep track of data
	begin
		if (a_rst = '1') then
			v_ram_1 <= '0';
			v_ram_out <= '0';
			v_mul_1 <= '0';
			v_mul_2 <= '0';
			v_mul_3 <= '0';
			v_mul_4 <= '0';
			v_mul_5 <= '0';
			v_mul_6 <= '0';
			v_mul_7 <= '0';
			v_mul_8 <= '0';
			v_mul_9 <= '0';
			v_mul_out <= '0';
			v_acc_1 <= '0';
			v_acc_2 <= '0';
			v_acc_3 <= '0';
			v_acc_4 <= '0';
			v_acc_5 <= '0';
			v_acc_6 <= '0';
			v_acc_7 <= '0';
			v_acc_8 <= '0';
			v_acc_9 <= '0';
			v_acc_10 <= '0';
			v_acc_11 <= '0';
			v_acc_12 <= '0';
			v_acc_13 <= '0';
			v_acc_14 <= '0';
			v_acc_15 <= '0';
			v_acc_out <= '0';
		elsif (clk'event and clk = '1') then
			if (loading_ram = '1') then 
				v_ram_1 <= '0';	-- don't propagate valid signals while loading ram with data
			else
				v_ram_1 <= valid_in;
			end if;
			v_ram_out <= v_ram_1;
			v_mul_1 <= v_ram_out;
			v_mul_2 <= v_mul_1;
			v_mul_3 <= v_mul_2;
			v_mul_4 <= v_mul_3;
			v_mul_5 <= v_mul_4;
			v_mul_6 <= v_mul_5;
			v_mul_7 <= v_mul_6;
			v_mul_8 <= v_mul_7;
			v_mul_9 <= v_mul_8;
			v_mul_out <= v_mul_9;
			v_acc_1 <= v_mul_out;
			v_acc_2 <= v_acc_1;
			v_acc_3 <= v_acc_2;
			v_acc_4 <= v_acc_3;
			v_acc_5 <= v_acc_4;
			v_acc_6 <= v_acc_5;
			v_acc_7 <= v_acc_6;
			v_acc_8 <= v_acc_7;
			v_acc_9 <= v_acc_8;
			v_acc_10 <= v_acc_9;
			v_acc_11 <= v_acc_10;
			v_acc_12 <= v_acc_11;
			v_acc_13 <= v_acc_12;
			v_acc_14 <= v_acc_13;
			v_acc_15 <= v_acc_14;
			v_acc_out <= v_acc_15;
		end if;
	end process;

	-- enable multiplier or accumulator whenever there is valid data somewhere in its pipeline 
	mul_en <= v_ram_out or v_mul_1 or v_mul_2 or v_mul_3 or v_mul_4 or v_mul_5 or v_mul_6 or v_mul_7 or v_mul_8 or v_mul_9 or v_mul_out; 
	acc_en <= v_mul_out or v_acc_1 or v_acc_2 or v_acc_3 or v_acc_4 or v_acc_5 or v_acc_6 or v_acc_7 or v_acc_8 or v_acc_9 or v_acc_10 or v_acc_11 or v_acc_12 or v_acc_13 or v_acc_14 or v_acc_15 or v_acc_out;



end architecture bhv;


