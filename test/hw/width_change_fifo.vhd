-- Greg Stitt
-- Unverisity of Florida

-- Entity: width_change_fifo
-- Descrition: This entity acts as a minimum-sized FIFO that converts a
-- specified input to a specifed output width.

-- LIMITATIONS:
-- Currently, the input_width has to be a multiple of the output_width, or vice_versa.

-- IMPORTANT: The almost_full should only be used if the wr signal isn't
-- externally controlled by the almost_full signal, otherwise there will be a
-- combinational loop. This could be fixed by adding more buffering.
-- TODO: EITHER FIX THIS OR REMOVE THE ALMOST FULL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- Generic Descriptions
-- input_width : The width of the input/write port. This can be any
--               value that is either a multiple of the output_width or
--               vice versa.
-- output_width : The width of the output/read port. This can be any
--               value that is either a multiple of the input_width or
--               vice versa.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Port Descriptions
-- clk : clock
-- rst : reset
-- rd  : read control signal
-- wr : write control signal
-- full : asserted when the fifo is full (can't write any more data)
-- almost_full : asserted when fifo is almost full.
-- empty : asserted when the fifo does not have valid data to read
-- empty_internal : asserted when the fifo internallly has some data, but not
--                  enough for the read port to read (needed when the output
--                  is larger than the input, otherwise = to empty)
-- input : input/write data
-- output : output/read data
------------------------------------------------------------------------------

entity width_change_fifo is
    generic (
        input_width  : positive;
        tag_width    : positive := 1;
        output_width : positive;
        buffer_input : boolean  := false);
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
        data_in        : in  std_logic_vector(input_width-1 downto 0);	--input, output
        data_out       : out std_logic_vector(output_width-1 downto 0)
        );
end width_change_fifo;

architecture STR of width_change_fifo is
begin

    U_SHRINK : if output_width <= input_width generate
        signal empty_s : std_logic;
    begin
        
        U_SHRINK_FIFO : entity work.shrinker_fifo
            generic map (
                input_width  => input_width,
                tag_width    => tag_width,
                output_width => output_width,
                buffer_input => buffer_input)
            port map (
                clk         => clk,
                rst         => rst,
                rd          => rd,
                wr          => wr,
                full        => full,
                almost_full => almost_full,
                empty       => empty_s,
                tag_in      => tag_in,
                tag_out     => tag_out,
                input       => data_in,
                output      => data_out);

        empty          <= empty_s;
        empty_internal <= empty_s;
        
    end generate U_SHRINK;

    U_EXPAND : if output_width > input_width generate

        U_EXPAND_FIFO : entity work. expander_fifo
            generic map (
                input_width  => input_width,
                tag_width    => tag_width,
                output_width => output_width,
                buffer_input => buffer_input)
            port map (
                clk            => clk,
                rst            => rst,
                rd             => rd,
                wr             => wr,
                full           => full,
                almost_full    => almost_full,
                empty          => empty,
                empty_internal => empty_internal,
                tag_in         => tag_in,
                tag_out        => tag_out,
                input          => data_in,
                output         => data_out);

    end generate U_EXPAND;

end STR;
