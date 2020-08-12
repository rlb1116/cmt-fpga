-- Greg Stitt
-- University of Florida

-- This entity acts as a FIFO with a narrow input and a wide output. The output
-- is first-word fall through.

-- IMPORTANT: The almost_full should only be used if the wr signal isn't
-- externally controlled by the almost_full signal, otherwise there will be a
-- combinational loop. This could be fixed by adding more buffering.

-- NOTE: ALMOST FULL NOT TESTED. TAG NOT IMPLEMENTED.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity expander_fifo is
    generic (
        input_width  : positive;
        tag_width    : positive := 1;
        output_width : positive;
        buffer_input : boolean := false);
    port (
        clk            : in  std_logic;
        rst            : in  std_logic;
        rd             : in  std_logic;
        wr             : in  std_logic;
        full           : out std_logic;
        almost_full    : out std_logic;
        empty          : out std_logic;
        empty_internal : out std_logic;
        tag_in         : in  std_logic_vector(tag_width-1 downto 0) := (others => '0');
        tag_out        : out std_logic_vector(tag_width-1 downto 0);
        input          : in  std_logic_vector(input_width-1 downto 0);
        output         : out std_logic_vector(output_width-1 downto 0)
        );
begin
    assert(output_width > input_width)
        report "Output width must be larger the input width" severity error;
    assert(output_width mod input_width = 0)
        report "Output width must be a multiple of the input width" severity error;
end expander_fifo;

architecture BHV of expander_fifo is

    constant RATIO : integer := output_width / input_width;

    type FIFO_ARRAY is array (0 to RATIO-1) of std_logic_vector(input_width-1 downto 0);
    signal data, next_data   : FIFO_ARRAY;
    signal count, next_count : integer range 0 to RATIO;

    signal next_empty          : std_logic;
    signal next_empty_internal : std_logic;
    signal full_internal       : std_logic;
    signal wr_internal         : std_logic;
    signal input_internal      : std_logic_vector(input'range);
    
begin

    -- Use an extra FIFO to buffer the inputs. This is useful when a registered
    -- full flag is needed but without losing throughput through the read port.
--    BUFFERED_INPUT : if buffer_input generate
--        signal fifo_rd_en   : std_logic;
--        signal fifo_empty   : std_logic;
--        signal fifo_rd_data : std_logic_vector(input_width-1 downto 0);
--    begin

--        U_FIFO : entity work.fifo
--            generic map (
--                width                        => input_width,
--                depth                        => 2,
--                almost_full_count            => 1,
--                same_cycle_output            => true,
--                use_lookahead_for_same_cycle => false,
--                use_bram                     => false
--                )
--            port map (
--                clk         => clk,
--                rst         => rst,
--                rd          => fifo_rd_en,
--                wr          => wr,
--                empty       => fifo_empty,
--                full        => full,
--                almost_full => almost_full,
--                count       => open,
--                space       => open,
--                input       => input,
--                output      => fifo_rd_data
--                );

--        input_internal <= fifo_rd_data(input_width-1 downto 0);
--        fifo_rd_en     <= not fifo_empty and not full_internal;
--        wr_internal    <= fifo_rd_en;

--    end generate;
-- don't use buffered input for now

    NO_BUFFER : if not buffer_input generate
        input_internal <= input;
        wr_internal    <= wr;
        full           <= full_internal;
        almost_full    <= 'X';          -- Shouldn't be used without buffer.
    end generate;


    process(clk, rst)
    begin
        if (rst = '1') then
            count          <= 0;
            empty          <= '1';
            empty_internal <= '1';
        elsif (clk'event and clk = '1') then
            count          <= next_count;
            data           <= next_data;
            empty          <= next_empty;
            empty_internal <= next_empty_internal;
        end if;
    end process;

    process(rd, wr_internal, input_internal, count, data)
        variable count_v : integer range 0 to RATIO;
    begin

        count_v   := count;
        next_data <= data;

        if (rd = '1' and count_v = RATIO) then
            count_v := 0;
        end if;

        if (wr_internal = '1' and count_v < RATIO) then

            --next_data(0) <= input_internal;

            --for i in 0 to RATIO-2 loop
            --    next_data(i+1) <= data(i);
            ----next_tag(i+1)  <= tag(i);
            --end loop;  -- i

            -- Load data directly into correct location rather than successively shifting
            -- This allows for partial CL to maintain correct data order w/o padding
            next_data(RATIO-count_v-1) <= input_internal;

            count_v := count_v + 1;
        end if;

        next_empty <= '0';
        if (count_v < RATIO) then
            next_empty <= '1';
        end if;

        next_empty_internal <= '1';
        if (count_v > 0) then
            next_empty_internal <= '0';
        end if;

        next_count <= count_v;
        
    end process;

    tag_out <= (others => '0');

    U_OUTPUT : for i in 0 to RATIO-1 generate
        output((RATIO-i)*input_width-1 downto (RATIO-1-i)*input_width) <= data(i);
    end generate U_OUTPUT;

    --empty          <= '1' when count < RATIO else '0';
    --empty_internal <= '0' when count > 0     else '1';

    -- and rd='0' prevents 1 cycle stall whenever the fifo is full and a read is
    -- being performed
    full_internal <= '1' when count = RATIO and rd = '0' else '0';
end BHV;
