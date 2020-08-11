-- Multiply accumulate datapath

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.user_pkg.all;

entity mac_datapath is 
	generic (
		width			:		positive := 64);
	port (
		clk			: in 	std_logic;
		a_rst			: in 	std_logic;
		new_acc		: in 	std_logic;
		acc_en		: in	std_logic;
		mul_en		: in  std_logic;
		wren			: in 	std_logic;
		address		: in 	std_logic_vector(C_ROOTN-1 downto 0);
		ram_data_in	: in	std_logic_vector(width-1 downto 0);
		mul_data_in	: in	std_logic_vector(width-1 downto 0);
		data_out		: out std_logic_vector(width-1 downto 0)
	);
end entity mac_datapath;

architecture str of mac_datapath is

	component fpmult64 is
		port (
			a      : in  std_logic_vector(63 downto 0) := (others => '0'); --      a.a
			areset : in  std_logic                     := '0';             -- areset.reset
			b      : in  std_logic_vector(63 downto 0) := (others => '0'); --      b.b
			clk    : in  std_logic                     := '0';             --    clk.clk
			en     : in  std_logic_vector(0 downto 0)  := (others => '0'); --     en.en
			q      : out std_logic_vector(63 downto 0)                     --      q.q
		);
	end component fpmult64;
	
	component fpacc64 is
		port (
			ao     : out std_logic;                                        --     ao.ao
			areset : in  std_logic                     := '0';             -- areset.reset
			clk    : in  std_logic                     := '0';             --    clk.clk
			en     : in  std_logic_vector(0 downto 0)  := (others => '0'); --     en.en
			n      : in  std_logic                     := '0';             --      n.n
			r      : out std_logic_vector(63 downto 0);                    --      r.r
			x      : in  std_logic_vector(63 downto 0) := (others => '0'); --      x.x
			xo     : out std_logic;                                        --     xo.xo
			xu     : out std_logic                                         --     xu.xu
		);
	end component fpacc64;
	
	component ram32x64 is
		port (
			data    : in  std_logic_vector(63 downto 0) := (others => 'X'); -- datain
			address : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- address
			wren    : in  std_logic                     := 'X';             -- wren
			clock   : in  std_logic                     := 'X';             -- clk
			q       : out std_logic_vector(63 downto 0)                     -- dataout
		);
	end component ram32x64;

	signal data_in_d1, data_in_d2 : std_logic_vector(width-1 downto 0);	-- 2 cycle delay to sync with RAM reads 
	signal data_ram2mult : std_logic_vector(width-1 downto 0);	-- data from RAM output to multiplier input
	signal data_mult2acc : std_logic_vector(width-1 downto 0);	-- data from multiplier output to accumulator input 
	signal ao_s, xo_s, xu_s : std_logic;	-- error flags from out of range accumulation
	signal acc_en_s, mul_en_s : std_logic_vector(0 downto 0);	-- convert IP signals to std_logic
begin

	U_RAM : component ram32x64
		port map(
			data 		=> ram_data_in,
			address	=> address,
			wren		=> wren,
			clock		=> clk,
			q			=> data_ram2mult
		);
	
	U_MULT : component fpmult64 
		port map (
			a			=> data_in_d2,
			areset	=> a_rst,
			b			=> data_ram2mult,
			clk		=> clk,
			en			=> mul_en_s,
			q			=> data_mult2acc
		);
		
	U_ACC : component fpacc64
		port map (
			ao			=> ao_s,
			areset	=> a_rst,
			clk		=> clk,
			en			=> acc_en_s,
			n			=> new_acc,
			r			=> data_out,
			x			=> data_mult2acc,
			xo			=> xo_s,
			xu			=> xu_s
		);
	
	-- assign 1 bit std_logic_vector signals to std_logic
	acc_en_s(0) <= acc_en;
	mul_en_s(0) <= mul_en;
	
	process(clk, a_rst)
	-- this process creates the 2-cycle delay registers for input data to the multiplier
	-- this delay accounts for the read latency of the RAM's internally registered i/o
	begin
		if (a_rst = '1') then
			data_in_d1 <= (others => '0');
			data_in_d2 <= (others => '0');
		elsif (clk'event and clk = '1') then
			data_in_d1 <= mul_data_in;
			data_in_d2 <= data_in_d1; 
		end if;
	end process;

end architecture str; 












