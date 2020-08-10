	component fpacc64 is
		port (
			ao     : out std_logic;                                        -- ao
			areset : in  std_logic                     := 'X';             -- reset
			clk    : in  std_logic                     := 'X';             -- clk
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			n      : in  std_logic                     := 'X';             -- n
			r      : out std_logic_vector(63 downto 0);                    -- r
			x      : in  std_logic_vector(63 downto 0) := (others => 'X'); -- x
			xo     : out std_logic;                                        -- xo
			xu     : out std_logic                                         -- xu
		);
	end component fpacc64;

	u0 : component fpacc64
		port map (
			ao     => CONNECTED_TO_ao,     --     ao.ao
			areset => CONNECTED_TO_areset, -- areset.reset
			clk    => CONNECTED_TO_clk,    --    clk.clk
			en     => CONNECTED_TO_en,     --     en.en
			n      => CONNECTED_TO_n,      --      n.n
			r      => CONNECTED_TO_r,      --      r.r
			x      => CONNECTED_TO_x,      --      x.x
			xo     => CONNECTED_TO_xo,     --     xo.xo
			xu     => CONNECTED_TO_xu      --     xu.xu
		);

