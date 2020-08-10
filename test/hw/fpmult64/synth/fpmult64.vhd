-- fpmult64.vhd

-- Generated using ACDS version 16.0 211

library IEEE;
library altera_fp_functions_160;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fpmult64 is
	port (
		a      : in  std_logic_vector(63 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		b      : in  std_logic_vector(63 downto 0) := (others => '0'); --      b.b
		clk    : in  std_logic                     := '0';             --    clk.clk
		en     : in  std_logic_vector(0 downto 0)  := (others => '0'); --     en.en
		q      : out std_logic_vector(63 downto 0)                     --      q.q
	);
end entity fpmult64;

architecture rtl of fpmult64 is
	component fpmult64_altera_fp_functions_160_py4gazy is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- en
			a      : in  std_logic_vector(63 downto 0) := (others => 'X'); -- a
			b      : in  std_logic_vector(63 downto 0) := (others => 'X'); -- b
			q      : out std_logic_vector(63 downto 0)                     -- q
		);
	end component fpmult64_altera_fp_functions_160_py4gazy;

	for fp_functions_0 : fpmult64_altera_fp_functions_160_py4gazy
		use entity altera_fp_functions_160.fpmult64_altera_fp_functions_160_py4gazy;
begin

	fp_functions_0 : component fpmult64_altera_fp_functions_160_py4gazy
		port map (
			clk    => clk,    --    clk.clk
			areset => areset, -- areset.reset
			en     => en,     --     en.en
			a      => a,      --      a.a
			b      => b,      --      b.b
			q      => q       --      q.q
		);

end architecture rtl; -- of fpmult64
