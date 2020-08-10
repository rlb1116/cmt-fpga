	component ram32x64 is
		port (
			data    : in  std_logic_vector(63 downto 0) := (others => 'X'); -- datain
			address : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- address
			wren    : in  std_logic                     := 'X';             -- wren
			clock   : in  std_logic                     := 'X';             -- clk
			q       : out std_logic_vector(63 downto 0)                     -- dataout
		);
	end component ram32x64;

	u0 : component ram32x64
		port map (
			data    => CONNECTED_TO_data,    --  ram_input.datain
			address => CONNECTED_TO_address, --           .address
			wren    => CONNECTED_TO_wren,    --           .wren
			clock   => CONNECTED_TO_clock,   --           .clk
			q       => CONNECTED_TO_q        -- ram_output.dataout
		);

