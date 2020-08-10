-- N-pipe MAC output collector
-- collect N inputs to 1 output stream

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mac_collector is
	generic (
		width			: 		positive := 64;
		N				:		positive := 25);
	port (
		clk			: in 	std_logic;
		a_rst			: in  std_logic;
		data_in		: in 	std_logic_vector(N*width-1 downto 0);
		valid_in		: in	std_logic_vector(N-1 downto 0);
		data_out		: out std_logic_vector(width-1 downto 0);
		valid_out	: out std_logic
	);
end entity mac_collector;

architecture str of mac_collector is
	signal held_data : std_logic_vector(N*width-1 downto 0);				-- output from N 64-bit hold registers
	signal data_shift_mux_in : std_logic_vector(N*width-1 downto 0);	-- data shift into muxes
	signal data_shift_mux_out : std_logic_vector(N*width-1 downto 0);	-- mux output direct input to N 64-bit shift registers
	signal held_valid : std_logic_vector(N-1 downto 0);					-- valid signals of N hold registers 
	signal vld_shift_mux_in : std_logic_vector(N-1 downto 0);			-- valid signals into muxes 
	signal vld_shift_mux_out : std_logic_vector(N-1 downto 0);			-- valid signals mux out to reg in 
	signal rd_regs : std_logic_vector(N-1 downto 0);						-- signal --> hold registers to clear valid bits 
	signal mux_load : std_logic;													-- 1 to load, 0 to shift 
	
	constant ALL_ONES : std_logic_vector(N-1 downto 0) := (others => '1');
begin

	GEN_REGS : for I in 0 to N-1 generate
		HOLD_DATA : entity work.hold_reg 
			generic map (width => width)
			port map (
				clk	=> clk,
				a_rst	=> a_rst,
				D		=> data_in((I+1)*width-1 downto I*width),
				en		=> valid_in(I),
				rd		=> rd_regs(I),
				Q		=> held_data((I+1)*width-1 downto I*width),
				valid => held_valid(I)
			);
		
		MUX_DATA : entity work.mux21
			generic map (width => width)
			port map (
				a			=> data_shift_mux_in((I+1)*width-1 downto I*width),
				b			=> held_data((I+1)*width-1 downto I*width),
				sel		=> mux_load,
				output	=> data_shift_mux_out((I+1)*width-1 downto I*width)
			);
		
		MUX_VLD : entity work.mux21_1b
			port map (
				a			=> vld_shift_mux_in(I),
				b			=> held_valid(I),
				sel		=> mux_load,
				output	=> vld_shift_mux_out(I)
			);
		
		LAST_SHIFT : if (I = 0) generate
			DATA_REG_0 : entity work.reg
				generic map (width => width)
				port map (
					clk	=> clk,
					a_rst	=> a_rst,
					D		=> data_shift_mux_out((I+1)*width-1 downto I*width),
					Q		=> data_out
				);
			
			VLD_REG_0 : entity work.reg1
				port map (
					clk	=> clk,
					a_rst	=> a_rst,
					D		=> vld_shift_mux_out(I),
					Q		=> valid_out
				);
		end generate;
		
		UPPER_SHIFT : if (I > 0) generate 
			DATA_REG : entity work.reg
				generic map (width => width)
				port map (
					clk	=> clk,
					a_rst	=> a_rst,
					D		=> data_shift_mux_out((I+1)*width-1 downto I*width),
					Q		=> data_shift_mux_in(I*width-1 downto (I-1)*width)
				);
			
			VLD_REG : entity work.reg1
				port map (
					clk	=> clk,
					a_rst	=> a_rst,
					D		=> vld_shift_mux_out(I),
					Q		=> vld_shift_mux_in(I-1)
				);
		end generate;
	end generate GEN_REGS;
	
	-- 0 input for 1st mux in shift reg pipe 
	data_shift_mux_in(N*width-1 downto (N-1)*width) <= (others => '0');
	vld_shift_mux_in(N-1) <= '0';
	
	process (held_valid, vld_shift_mux_in)
	-- control transferring data into the shift registers 
	begin
		if ((held_valid = ALL_ONES)) then -- and (vld_shift_mux_in(0) = '1')
			mux_load <= '1';
			rd_regs <= (others => '1');
		else 
			mux_load <= '0';
			rd_regs <= (others => '0');
		end if;
	end process;
	
end architecture str;













