-- N pipe Multiply-Accumulate (MAC) 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cmt_mat_mult is
	generic (
		width 			:		positive := 64;
		N					:		positive := 25);
	port (
		clk				: in	std_logic;
		a_rst				: in	std_logic;
		kernel_data		: in 	std_logic_vector(width-1 downto 0);
		kernel_vld		: in	std_logic;
		data_in			: in	std_logic_vector(width-1 downto 0);
		data_in_vld		: in	std_logic;
		data_out			: out std_logic_vector(width-1 downto 0);
		data_out_vld	: out std_logic
	);
end entity cmt_mat_mult;

architecture str of cmt_mat_mult is 
	signal kernel_load2pipe : std_logic_vector(width-1 downto 0);
	signal vld_load2pipe : std_logic_vector(N-1 downto 0);
	signal data_pipe2coll : std_logic_vector(N*width-1 downto 0);
	signal vld_pipe2coll : std_logic_vector(N-1 downto 0);
	signal data_in_d : std_logic_vector(width-1 downto 0);
	signal data_in_vld_d : std_logic;
begin

	U_LOADER : entity work.input_loader 
		generic map (width => width, N => N)
		port map (
			clk			=> clk,
			a_rst			=> a_rst,
			kernel_data	=> kernel_data,
			kernel_ld	=> kernel_vld,
			ram_data		=> kernel_load2pipe,
			valid_ram	=> vld_load2pipe
		);
		
	GEN_PIPES : for I in 0 to N-1 generate
		U_MAC : entity work.mac_pipe 
			generic map (width => width, N => N)
			port map (
				clk			=> clk,
				a_rst			=> a_rst,
				load_ram		=> a_rst,
				ram_data_in	=> kernel_load2pipe,
				valid_ram	=> vld_load2pipe(I),
				mul_data_in	=> data_in_d,
				valid_in		=> data_in_vld_d,
				data_out		=> data_pipe2coll((I+1)*width-1 downto I*width),
				valid_out	=> vld_pipe2coll(I)
			);
	end generate; 
	
	U_COLLECT : entity work.mac_collector 
		generic map (width => width, N => N)
		port map (
			clk			=> clk,
			a_rst			=> a_rst,
			data_in		=> data_pipe2coll,
			valid_in		=> vld_pipe2coll,
			data_out		=> data_out,
			valid_out	=> data_out_vld
		);

	process(clk, a_rst)
	-- Delay data_in and "_vld 1 cycle to match delay of input_loader 
	begin
		if (a_rst = '1') then
			data_in_d <= (others => '0');
			data_in_vld_d <= '0';
		elsif (clk'event and clk = '1') then
			data_in_vld_d <= data_in_vld;
			data_in_d <= data_in;
		end if;

	end process;

end architecture str;


