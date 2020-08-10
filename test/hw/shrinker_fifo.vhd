-- Greg Stitt
-- University of Florida

-- This entity acts as a FIFO with a wide input and a narrow output. The output
-- is first-word fall through. Also, works when input and output size is the
-- same.

-- IMPORTANT: The almost_full should only be used with the buffer_input option.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shrinker_fifo is
    generic (
        input_width  : positive;
        tag_width    : positive := 1;
        output_width : positive;
        buffer_input : boolean  := false);
    port (
        clk         : in  std_logic;
        rst         : in  std_logic;
        rd          : in  std_logic;
        wr          : in  std_logic;
        full        : out std_logic;
        almost_full : out std_logic;
        empty       : out std_logic;
        tag_in      : in  std_logic_vector(tag_width-1 downto 0) := (others => '0');
        tag_out     : out std_logic_vector(tag_width-1 downto 0);
        input       : in  std_logic_vector(input_width-1 downto 0);

        output : out std_logic_vector(output_width-1 downto 0)
        );
begin
    assert(output_width <= input_width)
        report "Output width must be <= the input width" severity error;
    assert(input_width mod output_width = 0)
        report "Input width must be a multiple of the output width" severity error;
end shrinker_fifo;

architecture BHV of shrinker_fifo is

    constant RATIO           : integer := input_width/output_width;
    signal data, next_data   : std_logic_vector(input_width-1 downto 0);
    signal count, next_count : integer range 0 to RATIO;
    signal next_empty        : std_logic;
    signal tag_r, next_tag   : std_logic_vector(tag_in'range);

    signal full_internal  : std_logic;
    signal wr_internal    : std_logic;
    signal input_internal : std_logic_vector(input'range);
    signal tag_internal   : std_logic_vector(tag_in'range);
    
begin  -- BHV

    -- Use an extra FIFO to buffer the inputs. This is useful when a registered
    -- full flag is needed but without losing throughput through the read port.
--    BUFFERED_INPUT : if buffer_input generate
--        signal fifo_rd_en   : std_logic;
--        signal fifo_empty   : std_logic;
--        signal fifo_rd_data : std_logic_vector(input_width+tag_width-1 downto 0);
--        signal fifo_wr_data : std_logic_vector(input_width+tag_width-1 downto 0);
--    begin

--        fifo_wr_data <= tag_in & input;

--        U_FIFO : entity work.fifo
--            generic map (
--                width                        => input_width + tag_width,
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
--                input       => fifo_wr_data,
--                output      => fifo_rd_data
--                );

--        input_internal <= fifo_rd_data(input_width-1 downto 0);
--        tag_internal   <= fifo_rd_data(input_width+tag_width-1 downto input_width);

--        fifo_rd_en  <= not fifo_empty and not full_internal;
--        wr_internal <= fifo_rd_en;

--    end generate;
-- don't use buffered input for now

    NO_BUFFER : if not buffer_input generate
        input_internal <= input;
        tag_internal   <= tag_in;
        wr_internal    <= wr;
        full           <= full_internal;
        almost_full    <= 'X';          -- Shouldn't be used without buffer.
    end generate;

    process(clk, rst)
    begin
        if (rst = '1') then
            count <= 0;
            empty <= '1';
            
        elsif (clk'event and clk = '1') then
            count <= next_count;
            data  <= next_data;
            tag_r <= next_tag;

            --tag_out <= next_tag;
            empty <= next_empty;
        end if;
    end process;

    process(rd, wr_internal, count, data, tag_internal, input_internal, tag_r)
        variable count_v : integer range 0 to RATIO;
    begin

        count_v   := count;
        next_data <= data;
        next_tag  <= tag_r;

        if (rd = '1' and count_v > 0) then
            next_data <= std_logic_vector(shift_right(unsigned(data), output_width));
            count_v   := count_v - 1;
        end if;

        -- allows write and read to occur during same cycle, when read empties
        -- out the fifo

        if (wr_internal = '1' and count_v = 0) then
            next_data <= input_internal;
            next_tag  <= tag_internal;
            count_v   := RATIO;
        end if;

        next_empty <= '0';
        if (count_v = 0) then
            next_empty <= '1';
        end if;

        next_count <= count_v;
        
    end process;

    output  <= data(output_width-1 downto 0);
    tag_out <= tag_r;

    -- Unregistered full flag that updates immediately for a valid read. This
    -- provides full read throughput, but can cause clock problems when not used
    -- with the input buffer.
    full_internal <= '0' when count = 0 or (count = 1 and rd = '1') else '1';
    
end BHV;
