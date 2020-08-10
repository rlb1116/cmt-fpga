-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 16.0
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2016 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fpmult64_altera_fp_functions_160_py4gazy
-- VHDL created on Tue Mar 26 17:07:38 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

library twentynm;
use twentynm.twentynm_components.twentynm_fp_mac;

entity fpmult64_altera_fp_functions_160_py4gazy is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        b : in std_logic_vector(63 downto 0);  -- float64_m52
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end fpmult64_altera_fp_functions_160_py4gazy;

architecture normal of fpmult64_altera_fp_functions_160_py4gazy is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid10_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid11_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid12_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_x_uid15_fpMulTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_x_uid15_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expXIsMax_uid16_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpMulTest_a : STD_LOGIC_VECTOR (51 downto 0);
    signal fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid29_fpMulTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_y_uid29_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expXIsMax_uid30_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpMulTest_a : STD_LOGIC_VECTOR (51 downto 0);
    signal fracXIsZero_uid31_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid44_fpMulTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid44_fpMulTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid44_fpMulTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid44_fpMulTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal biasInc_uid45_fpMulTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal signR_uid48_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal roundBitDetectionConstant_uid63_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBit_uid65_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid92_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    type topProd_uid107_prod_uid47_fpMulTest_cma_atype is array(0 to 0) of UNSIGNED(26 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_a0 : topProd_uid107_prod_uid47_fpMulTest_cma_atype;
    attribute preserve : boolean;
    attribute preserve of topProd_uid107_prod_uid47_fpMulTest_cma_a0 : signal is true;
    signal topProd_uid107_prod_uid47_fpMulTest_cma_a1 : topProd_uid107_prod_uid47_fpMulTest_cma_atype;
    attribute preserve of topProd_uid107_prod_uid47_fpMulTest_cma_a1 : signal is true;
    type topProd_uid107_prod_uid47_fpMulTest_cma_ctype is array(0 to 0) of UNSIGNED(26 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_c0 : topProd_uid107_prod_uid47_fpMulTest_cma_ctype;
    attribute preserve of topProd_uid107_prod_uid47_fpMulTest_cma_c0 : signal is true;
    signal topProd_uid107_prod_uid47_fpMulTest_cma_c1 : topProd_uid107_prod_uid47_fpMulTest_cma_ctype;
    attribute preserve of topProd_uid107_prod_uid47_fpMulTest_cma_c1 : signal is true;
    type topProd_uid107_prod_uid47_fpMulTest_cma_ptype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_p : topProd_uid107_prod_uid47_fpMulTest_cma_ptype;
    type topProd_uid107_prod_uid47_fpMulTest_cma_utype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_u : topProd_uid107_prod_uid47_fpMulTest_cma_utype;
    type topProd_uid107_prod_uid47_fpMulTest_cma_wtype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_w : topProd_uid107_prod_uid47_fpMulTest_cma_wtype;
    type topProd_uid107_prod_uid47_fpMulTest_cma_xtype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_x : topProd_uid107_prod_uid47_fpMulTest_cma_xtype;
    type topProd_uid107_prod_uid47_fpMulTest_cma_ytype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_y : topProd_uid107_prod_uid47_fpMulTest_cma_ytype;
    type topProd_uid107_prod_uid47_fpMulTest_cma_stype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_s : topProd_uid107_prod_uid47_fpMulTest_cma_stype;
    signal topProd_uid107_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    type sm0_uid128_prod_uid47_fpMulTest_cma_atype is array(0 to 0) of UNSIGNED(26 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_a0 : sm0_uid128_prod_uid47_fpMulTest_cma_atype;
    attribute preserve of sm0_uid128_prod_uid47_fpMulTest_cma_a0 : signal is true;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_a1 : sm0_uid128_prod_uid47_fpMulTest_cma_atype;
    attribute preserve of sm0_uid128_prod_uid47_fpMulTest_cma_a1 : signal is true;
    type sm0_uid128_prod_uid47_fpMulTest_cma_ctype is array(0 to 0) of UNSIGNED(26 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_c0 : sm0_uid128_prod_uid47_fpMulTest_cma_ctype;
    attribute preserve of sm0_uid128_prod_uid47_fpMulTest_cma_c0 : signal is true;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_c1 : sm0_uid128_prod_uid47_fpMulTest_cma_ctype;
    attribute preserve of sm0_uid128_prod_uid47_fpMulTest_cma_c1 : signal is true;
    type sm0_uid128_prod_uid47_fpMulTest_cma_ptype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_p : sm0_uid128_prod_uid47_fpMulTest_cma_ptype;
    type sm0_uid128_prod_uid47_fpMulTest_cma_utype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_u : sm0_uid128_prod_uid47_fpMulTest_cma_utype;
    type sm0_uid128_prod_uid47_fpMulTest_cma_wtype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_w : sm0_uid128_prod_uid47_fpMulTest_cma_wtype;
    type sm0_uid128_prod_uid47_fpMulTest_cma_xtype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_x : sm0_uid128_prod_uid47_fpMulTest_cma_xtype;
    type sm0_uid128_prod_uid47_fpMulTest_cma_ytype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_y : sm0_uid128_prod_uid47_fpMulTest_cma_ytype;
    type sm0_uid128_prod_uid47_fpMulTest_cma_stype is array(0 to 0) of UNSIGNED(53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_s : sm0_uid128_prod_uid47_fpMulTest_cma_stype;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_atype is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0 : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_atype;
    attribute preserve of multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1 : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_atype;
    attribute preserve of multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1 : signal is true;
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ctype is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0 : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ctype;
    attribute preserve of multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1 : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ctype;
    attribute preserve of multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1 : signal is true;
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ptype is array(0 to 1) of UNSIGNED(53 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_p : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ptype;
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_utype is array(0 to 1) of UNSIGNED(54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_u : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_utype;
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_wtype is array(0 to 1) of UNSIGNED(54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_w : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_wtype;
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_xtype is array(0 to 1) of UNSIGNED(54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_x : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_xtype;
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ytype is array(0 to 1) of UNSIGNED(54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_y : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ytype;
    type multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_stype is array(0 to 1) of UNSIGNED(54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s : multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_stype;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (105 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (80 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist11_q : STD_LOGIC_VECTOR (66 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_inputreg_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_outputreg_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_mem_reset0 : std_logic;
    signal redist15_mem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_mem_iq : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_mem_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist15_rdcnt_i : signal is true;
    signal redist15_rdcnt_eq : std_logic;
    attribute preserve of redist15_rdcnt_eq : signal is true;
    signal redist15_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_mem_top_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist15_sticky_ena_q : signal is true;
    signal roundBitAndNormalizationOp_uid68_fpMulTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal expUdf_uid73_fpMulTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid73_fpMulTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid73_fpMulTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid73_fpMulTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid75_fpMulTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid75_fpMulTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid75_fpMulTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist15_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_cmp_a : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpMulTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expX_uid6_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal signX_uid8_fpMulTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal signX_uid8_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid14_fpMulTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal frac_x_uid14_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expY_uid7_fpMulTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expY_uid7_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal signY_uid9_fpMulTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal signY_uid9_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid28_fpMulTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal frac_y_uid28_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid46_fpMulTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid46_fpMulTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid46_fpMulTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_a : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid60_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid60_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_a : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_b : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_o : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_q : STD_LOGIC_VECTOR (67 downto 0);
    signal excRZero_uid80_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_d : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_d : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid101_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid101_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_a : STD_LOGIC_VECTOR (81 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (81 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_o : STD_LOGIC_VECTOR (81 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (81 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal expFracPreRound_uid66_fpMulTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal concExc_uid90_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal add0_uid129_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (107 downto 0);
    signal normalizeBit_uid49_fpMulTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal normalizeBit_uid49_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_in : STD_LOGIC_VECTOR (104 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_in : STD_LOGIC_VECTOR (103 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal stickyRange_uid54_fpMulTest_in : STD_LOGIC_VECTOR (50 downto 0);
    signal stickyRange_uid54_fpMulTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal add1_uid133_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (108 downto 0);
    signal expRPreExc_uid72_fpMulTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPreExc_uid72_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ofracX_uid40_fpMulTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal ofracY_uid43_fpMulTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lrs_uid62_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracRPreExc_uid70_fpMulTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExc_uid70_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExcExt_uid71_fpMulTest_in : STD_LOGIC_VECTOR (67 downto 0);
    signal expRPreExcExt_uid71_fpMulTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal excREnc_uid91_fpMulTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid130_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal lowRangeB_uid130_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal highBBits_uid131_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (107 downto 0);
    signal highBBits_uid131_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (80 downto 0);
    signal extraStickyBit_uid56_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid57_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal osig_uid134_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (107 downto 0);
    signal osig_uid134_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (105 downto 0);
    signal topRangeX_uid105_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal topRangeX_uid105_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomRange_uid114_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal rightBottomX_bottomRange_uid114_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal topRangeY_uid106_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal topRangeY_uid106_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid110_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_bottomRange_uid110_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_a : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid95_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid95_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid100_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid100_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal R_uid103_fpMulTest_q : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- frac_x_uid14_fpMulTest(BITSELECT,13)@0
    frac_x_uid14_fpMulTest_in <= a;
    frac_x_uid14_fpMulTest_b <= frac_x_uid14_fpMulTest_in(51 downto 0);

    -- cstZeroWF_uid11_fpMulTest(CONSTANT,10)
    cstZeroWF_uid11_fpMulTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- fracXIsZero_uid17_fpMulTest(LOGICAL,16)@0 + 1
    fracXIsZero_uid17_fpMulTest_a <= cstZeroWF_uid11_fpMulTest_q;
    fracXIsZero_uid17_fpMulTest_b <= frac_x_uid14_fpMulTest_b;
    fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN fracXIsZero_uid17_fpMulTest_a = fracXIsZero_uid17_fpMulTest_b ELSE "0";
    fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid17_fpMulTest_qi, xout => fracXIsZero_uid17_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist19(DELAY,157)
    redist19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid17_fpMulTest_q, xout => redist19_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllOWE_uid10_fpMulTest(CONSTANT,9)
    cstAllOWE_uid10_fpMulTest_q <= "11111111111";

    -- expX_uid6_fpMulTest(BITSELECT,5)@0
    expX_uid6_fpMulTest_in <= a;
    expX_uid6_fpMulTest_b <= expX_uid6_fpMulTest_in(62 downto 52);

    -- expXIsMax_uid16_fpMulTest(LOGICAL,15)@0 + 1
    expXIsMax_uid16_fpMulTest_a <= expX_uid6_fpMulTest_b;
    expXIsMax_uid16_fpMulTest_b <= cstAllOWE_uid10_fpMulTest_q;
    expXIsMax_uid16_fpMulTest_qi <= "1" WHEN expXIsMax_uid16_fpMulTest_a = expXIsMax_uid16_fpMulTest_b ELSE "0";
    expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_qi, xout => expXIsMax_uid16_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist20(DELAY,158)
    redist20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_q, xout => redist20_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_x_uid19_fpMulTest(LOGICAL,18)@9
    excI_x_uid19_fpMulTest_a <= redist20_q;
    excI_x_uid19_fpMulTest_b <= redist19_q;
    excI_x_uid19_fpMulTest_q <= excI_x_uid19_fpMulTest_a and excI_x_uid19_fpMulTest_b;

    -- cstAllZWE_uid12_fpMulTest(CONSTANT,11)
    cstAllZWE_uid12_fpMulTest_q <= "00000000000";

    -- expY_uid7_fpMulTest(BITSELECT,6)@0
    expY_uid7_fpMulTest_in <= b;
    expY_uid7_fpMulTest_b <= expY_uid7_fpMulTest_in(62 downto 52);

    -- excZ_y_uid29_fpMulTest(LOGICAL,28)@0 + 1
    excZ_y_uid29_fpMulTest_a <= expY_uid7_fpMulTest_b;
    excZ_y_uid29_fpMulTest_b <= cstAllZWE_uid12_fpMulTest_q;
    excZ_y_uid29_fpMulTest_qi <= "1" WHEN excZ_y_uid29_fpMulTest_a = excZ_y_uid29_fpMulTest_b ELSE "0";
    excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_qi, xout => excZ_y_uid29_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist18(DELAY,156)
    redist18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_q, xout => redist18_q, ena => en(0), clk => clk, aclr => areset );

    -- excYZAndExcXI_uid86_fpMulTest(LOGICAL,85)@9
    excYZAndExcXI_uid86_fpMulTest_a <= redist18_q;
    excYZAndExcXI_uid86_fpMulTest_b <= excI_x_uid19_fpMulTest_q;
    excYZAndExcXI_uid86_fpMulTest_q <= excYZAndExcXI_uid86_fpMulTest_a and excYZAndExcXI_uid86_fpMulTest_b;

    -- frac_y_uid28_fpMulTest(BITSELECT,27)@0
    frac_y_uid28_fpMulTest_in <= b;
    frac_y_uid28_fpMulTest_b <= frac_y_uid28_fpMulTest_in(51 downto 0);

    -- fracXIsZero_uid31_fpMulTest(LOGICAL,30)@0 + 1
    fracXIsZero_uid31_fpMulTest_a <= cstZeroWF_uid11_fpMulTest_q;
    fracXIsZero_uid31_fpMulTest_b <= frac_y_uid28_fpMulTest_b;
    fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN fracXIsZero_uid31_fpMulTest_a = fracXIsZero_uid31_fpMulTest_b ELSE "0";
    fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpMulTest_qi, xout => fracXIsZero_uid31_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist16(DELAY,154)
    redist16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpMulTest_q, xout => redist16_q, ena => en(0), clk => clk, aclr => areset );

    -- expXIsMax_uid30_fpMulTest(LOGICAL,29)@0 + 1
    expXIsMax_uid30_fpMulTest_a <= expY_uid7_fpMulTest_b;
    expXIsMax_uid30_fpMulTest_b <= cstAllOWE_uid10_fpMulTest_q;
    expXIsMax_uid30_fpMulTest_qi <= "1" WHEN expXIsMax_uid30_fpMulTest_a = expXIsMax_uid30_fpMulTest_b ELSE "0";
    expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_qi, xout => expXIsMax_uid30_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist17(DELAY,155)
    redist17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_q, xout => redist17_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_y_uid33_fpMulTest(LOGICAL,32)@9
    excI_y_uid33_fpMulTest_a <= redist17_q;
    excI_y_uid33_fpMulTest_b <= redist16_q;
    excI_y_uid33_fpMulTest_q <= excI_y_uid33_fpMulTest_a and excI_y_uid33_fpMulTest_b;

    -- excZ_x_uid15_fpMulTest(LOGICAL,14)@0 + 1
    excZ_x_uid15_fpMulTest_a <= expX_uid6_fpMulTest_b;
    excZ_x_uid15_fpMulTest_b <= cstAllZWE_uid12_fpMulTest_q;
    excZ_x_uid15_fpMulTest_qi <= "1" WHEN excZ_x_uid15_fpMulTest_a = excZ_x_uid15_fpMulTest_b ELSE "0";
    excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_qi, xout => excZ_x_uid15_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist21(DELAY,159)
    redist21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_q, xout => redist21_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZAndExcYI_uid87_fpMulTest(LOGICAL,86)@9
    excXZAndExcYI_uid87_fpMulTest_a <= redist21_q;
    excXZAndExcYI_uid87_fpMulTest_b <= excI_y_uid33_fpMulTest_q;
    excXZAndExcYI_uid87_fpMulTest_q <= excXZAndExcYI_uid87_fpMulTest_a and excXZAndExcYI_uid87_fpMulTest_b;

    -- ZeroTimesInf_uid88_fpMulTest(LOGICAL,87)@9
    ZeroTimesInf_uid88_fpMulTest_a <= excXZAndExcYI_uid87_fpMulTest_q;
    ZeroTimesInf_uid88_fpMulTest_b <= excYZAndExcXI_uid86_fpMulTest_q;
    ZeroTimesInf_uid88_fpMulTest_q <= ZeroTimesInf_uid88_fpMulTest_a or ZeroTimesInf_uid88_fpMulTest_b;

    -- fracXIsNotZero_uid32_fpMulTest(LOGICAL,31)@9
    fracXIsNotZero_uid32_fpMulTest_a <= redist16_q;
    fracXIsNotZero_uid32_fpMulTest_q <= not (fracXIsNotZero_uid32_fpMulTest_a);

    -- excN_y_uid34_fpMulTest(LOGICAL,33)@9
    excN_y_uid34_fpMulTest_a <= redist17_q;
    excN_y_uid34_fpMulTest_b <= fracXIsNotZero_uid32_fpMulTest_q;
    excN_y_uid34_fpMulTest_q <= excN_y_uid34_fpMulTest_a and excN_y_uid34_fpMulTest_b;

    -- fracXIsNotZero_uid18_fpMulTest(LOGICAL,17)@9
    fracXIsNotZero_uid18_fpMulTest_a <= redist19_q;
    fracXIsNotZero_uid18_fpMulTest_q <= not (fracXIsNotZero_uid18_fpMulTest_a);

    -- excN_x_uid20_fpMulTest(LOGICAL,19)@9
    excN_x_uid20_fpMulTest_a <= redist20_q;
    excN_x_uid20_fpMulTest_b <= fracXIsNotZero_uid18_fpMulTest_q;
    excN_x_uid20_fpMulTest_q <= excN_x_uid20_fpMulTest_a and excN_x_uid20_fpMulTest_b;

    -- excRNaN_uid89_fpMulTest(LOGICAL,88)@9 + 1
    excRNaN_uid89_fpMulTest_a <= excN_x_uid20_fpMulTest_q;
    excRNaN_uid89_fpMulTest_b <= excN_y_uid34_fpMulTest_q;
    excRNaN_uid89_fpMulTest_c <= ZeroTimesInf_uid88_fpMulTest_q;
    excRNaN_uid89_fpMulTest_qi <= excRNaN_uid89_fpMulTest_a or excRNaN_uid89_fpMulTest_b or excRNaN_uid89_fpMulTest_c;
    excRNaN_uid89_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid89_fpMulTest_qi, xout => excRNaN_uid89_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- invExcRNaN_uid101_fpMulTest(LOGICAL,100)@10
    invExcRNaN_uid101_fpMulTest_a <= excRNaN_uid89_fpMulTest_q;
    invExcRNaN_uid101_fpMulTest_q <= not (invExcRNaN_uid101_fpMulTest_a);

    -- signY_uid9_fpMulTest(BITSELECT,8)@0
    signY_uid9_fpMulTest_in <= STD_LOGIC_VECTOR(b);
    signY_uid9_fpMulTest_b <= STD_LOGIC_VECTOR(signY_uid9_fpMulTest_in(63 downto 63));

    -- signX_uid8_fpMulTest(BITSELECT,7)@0
    signX_uid8_fpMulTest_in <= STD_LOGIC_VECTOR(a);
    signX_uid8_fpMulTest_b <= STD_LOGIC_VECTOR(signX_uid8_fpMulTest_in(63 downto 63));

    -- signR_uid48_fpMulTest(LOGICAL,47)@0 + 1
    signR_uid48_fpMulTest_a <= signX_uid8_fpMulTest_b;
    signR_uid48_fpMulTest_b <= signY_uid9_fpMulTest_b;
    signR_uid48_fpMulTest_qi <= signR_uid48_fpMulTest_a xor signR_uid48_fpMulTest_b;
    signR_uid48_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_qi, xout => signR_uid48_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist14(DELAY,152)
    redist14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_q, xout => redist14_q, ena => en(0), clk => clk, aclr => areset );

    -- xIn(GPIN,3)@0

    -- signRPostExc_uid102_fpMulTest(LOGICAL,101)@10
    signRPostExc_uid102_fpMulTest_a <= redist14_q;
    signRPostExc_uid102_fpMulTest_b <= invExcRNaN_uid101_fpMulTest_q;
    signRPostExc_uid102_fpMulTest_q <= signRPostExc_uid102_fpMulTest_a and signRPostExc_uid102_fpMulTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- ofracY_uid43_fpMulTest(BITJOIN,42)@0
    ofracY_uid43_fpMulTest_q <= VCC_q & frac_y_uid28_fpMulTest_b;

    -- topRangeY_uid106_prod_uid47_fpMulTest(BITSELECT,105)@0
    topRangeY_uid106_prod_uid47_fpMulTest_in <= ofracY_uid43_fpMulTest_q;
    topRangeY_uid106_prod_uid47_fpMulTest_b <= topRangeY_uid106_prod_uid47_fpMulTest_in(52 downto 26);

    -- redist6(DELAY,144)
    redist6 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => topRangeY_uid106_prod_uid47_fpMulTest_b, xout => redist6_q, ena => en(0), clk => clk, aclr => areset );

    -- ofracX_uid40_fpMulTest(BITJOIN,39)@0
    ofracX_uid40_fpMulTest_q <= VCC_q & frac_x_uid14_fpMulTest_b;

    -- topRangeX_uid105_prod_uid47_fpMulTest(BITSELECT,104)@0
    topRangeX_uid105_prod_uid47_fpMulTest_in <= ofracX_uid40_fpMulTest_q;
    topRangeX_uid105_prod_uid47_fpMulTest_b <= topRangeX_uid105_prod_uid47_fpMulTest_in(52 downto 26);

    -- redist7(DELAY,145)
    redist7 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => topRangeX_uid105_prod_uid47_fpMulTest_b, xout => redist7_q, ena => en(0), clk => clk, aclr => areset );

    -- topProd_uid107_prod_uid47_fpMulTest_cma(CHAINMULTADD,135)@1 + 3
    topProd_uid107_prod_uid47_fpMulTest_cma_p(0) <= topProd_uid107_prod_uid47_fpMulTest_cma_a1(0) * topProd_uid107_prod_uid47_fpMulTest_cma_c1(0);
    topProd_uid107_prod_uid47_fpMulTest_cma_u(0) <= RESIZE(topProd_uid107_prod_uid47_fpMulTest_cma_p(0),54);
    topProd_uid107_prod_uid47_fpMulTest_cma_w(0) <= topProd_uid107_prod_uid47_fpMulTest_cma_u(0);
    topProd_uid107_prod_uid47_fpMulTest_cma_x(0) <= topProd_uid107_prod_uid47_fpMulTest_cma_w(0);
    topProd_uid107_prod_uid47_fpMulTest_cma_y(0) <= topProd_uid107_prod_uid47_fpMulTest_cma_x(0);
    topProd_uid107_prod_uid47_fpMulTest_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid107_prod_uid47_fpMulTest_cma_a0 <= (others => (others => '0'));
            topProd_uid107_prod_uid47_fpMulTest_cma_c0 <= (others => (others => '0'));
            topProd_uid107_prod_uid47_fpMulTest_cma_a1 <= (others => (others => '0'));
            topProd_uid107_prod_uid47_fpMulTest_cma_c1 <= (others => (others => '0'));
            topProd_uid107_prod_uid47_fpMulTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid107_prod_uid47_fpMulTest_cma_a0(0) <= RESIZE(UNSIGNED(redist7_q),27);
                topProd_uid107_prod_uid47_fpMulTest_cma_c0(0) <= RESIZE(UNSIGNED(redist6_q),27);
            END IF;
            IF (en = "1") THEN
                topProd_uid107_prod_uid47_fpMulTest_cma_a1 <= topProd_uid107_prod_uid47_fpMulTest_cma_a0;
                topProd_uid107_prod_uid47_fpMulTest_cma_c1 <= topProd_uid107_prod_uid47_fpMulTest_cma_c0;
            END IF;
            IF (en = "1") THEN
                topProd_uid107_prod_uid47_fpMulTest_cma_s(0) <= topProd_uid107_prod_uid47_fpMulTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    topProd_uid107_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(topProd_uid107_prod_uid47_fpMulTest_cma_s(0)(53 downto 0)), xout => topProd_uid107_prod_uid47_fpMulTest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    topProd_uid107_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(topProd_uid107_prod_uid47_fpMulTest_cma_qq(53 downto 0));

    -- aboveLeftY_bottomRange_uid110_prod_uid47_fpMulTest(BITSELECT,109)@0
    aboveLeftY_bottomRange_uid110_prod_uid47_fpMulTest_in <= ofracY_uid43_fpMulTest_q(25 downto 0);
    aboveLeftY_bottomRange_uid110_prod_uid47_fpMulTest_b <= aboveLeftY_bottomRange_uid110_prod_uid47_fpMulTest_in(25 downto 0);

    -- aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest(BITJOIN,110)@0
    aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q <= aboveLeftY_bottomRange_uid110_prod_uid47_fpMulTest_b & GND_q;

    -- redist5(DELAY,143)
    redist5 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q, xout => redist5_q, ena => en(0), clk => clk, aclr => areset );

    -- rightBottomX_bottomRange_uid114_prod_uid47_fpMulTest(BITSELECT,113)@0
    rightBottomX_bottomRange_uid114_prod_uid47_fpMulTest_in <= ofracX_uid40_fpMulTest_q(25 downto 0);
    rightBottomX_bottomRange_uid114_prod_uid47_fpMulTest_b <= rightBottomX_bottomRange_uid114_prod_uid47_fpMulTest_in(25 downto 0);

    -- redist4(DELAY,142)
    redist4 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightBottomX_bottomRange_uid114_prod_uid47_fpMulTest_b, xout => redist4_q, ena => en(0), clk => clk, aclr => areset );

    -- rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest(BITJOIN,114)@1
    rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q <= redist4_q & GND_q;

    -- sm0_uid128_prod_uid47_fpMulTest_cma(CHAINMULTADD,136)@1 + 3
    sm0_uid128_prod_uid47_fpMulTest_cma_p(0) <= sm0_uid128_prod_uid47_fpMulTest_cma_a1(0) * sm0_uid128_prod_uid47_fpMulTest_cma_c1(0);
    sm0_uid128_prod_uid47_fpMulTest_cma_u(0) <= RESIZE(sm0_uid128_prod_uid47_fpMulTest_cma_p(0),54);
    sm0_uid128_prod_uid47_fpMulTest_cma_w(0) <= sm0_uid128_prod_uid47_fpMulTest_cma_u(0);
    sm0_uid128_prod_uid47_fpMulTest_cma_x(0) <= sm0_uid128_prod_uid47_fpMulTest_cma_w(0);
    sm0_uid128_prod_uid47_fpMulTest_cma_y(0) <= sm0_uid128_prod_uid47_fpMulTest_cma_x(0);
    sm0_uid128_prod_uid47_fpMulTest_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid128_prod_uid47_fpMulTest_cma_a0 <= (others => (others => '0'));
            sm0_uid128_prod_uid47_fpMulTest_cma_c0 <= (others => (others => '0'));
            sm0_uid128_prod_uid47_fpMulTest_cma_a1 <= (others => (others => '0'));
            sm0_uid128_prod_uid47_fpMulTest_cma_c1 <= (others => (others => '0'));
            sm0_uid128_prod_uid47_fpMulTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid128_prod_uid47_fpMulTest_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q),27);
                sm0_uid128_prod_uid47_fpMulTest_cma_c0(0) <= RESIZE(UNSIGNED(redist5_q),27);
            END IF;
            IF (en = "1") THEN
                sm0_uid128_prod_uid47_fpMulTest_cma_a1 <= sm0_uid128_prod_uid47_fpMulTest_cma_a0;
                sm0_uid128_prod_uid47_fpMulTest_cma_c1 <= sm0_uid128_prod_uid47_fpMulTest_cma_c0;
            END IF;
            IF (en = "1") THEN
                sm0_uid128_prod_uid47_fpMulTest_cma_s(0) <= sm0_uid128_prod_uid47_fpMulTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid128_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid128_prod_uid47_fpMulTest_cma_s(0)(53 downto 0)), xout => sm0_uid128_prod_uid47_fpMulTest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    sm0_uid128_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(sm0_uid128_prod_uid47_fpMulTest_cma_qq(53 downto 0));

    -- add0_uid129_prod_uid47_fpMulTest(BITJOIN,128)@4
    add0_uid129_prod_uid47_fpMulTest_q <= topProd_uid107_prod_uid47_fpMulTest_cma_q & sm0_uid128_prod_uid47_fpMulTest_cma_q;

    -- highBBits_uid131_prod_uid47_fpMulTest(BITSELECT,130)@4
    highBBits_uid131_prod_uid47_fpMulTest_in <= add0_uid129_prod_uid47_fpMulTest_q;
    highBBits_uid131_prod_uid47_fpMulTest_b <= highBBits_uid131_prod_uid47_fpMulTest_in(107 downto 27);

    -- redist2(DELAY,140)
    redist2 : dspba_delay
    GENERIC MAP ( width => 81, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highBBits_uid131_prod_uid47_fpMulTest_b, xout => redist2_q, ena => en(0), clk => clk, aclr => areset );

    -- multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma(CHAINMULTADD,137)@0 + 3
    -- in e@1
    -- in g@1
    -- out q@4
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_p(0) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1(0) * multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1(0);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_p(1) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1(1) * multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1(1);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_u(0) <= RESIZE(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_p(0),55);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_u(1) <= RESIZE(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_p(1),55);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_w(0) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_u(0);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_w(1) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_u(1);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_x(0) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_w(0);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_x(1) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_w(1);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_y(0) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s(1) + multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_x(0);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_y(1) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_x(1);
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0 <= (others => (others => '0'));
            multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1 <= (others => (others => '0'));
            multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1 <= (others => (others => '0'));
            multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0(0) <= RESIZE(UNSIGNED(redist6_q),27);
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q),27);
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q),27);
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0(1) <= RESIZE(UNSIGNED(topRangeX_uid105_prod_uid47_fpMulTest_b),27);
            END IF;
            IF (en = "1") THEN
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1 <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0;
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1 <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0;
            END IF;
            IF (en = "1") THEN
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s(0) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_y(0);
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s(1) <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_qq(54 downto 0));

    -- redist0(DELAY,138)
    redist0 : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q, xout => redist0_q, ena => en(0), clk => clk, aclr => areset );

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest(ADD,131)@5
    add1sumAHighB_uid132_prod_uid47_fpMulTest_a <= STD_LOGIC_VECTOR("000000000000000000000000000" & redist0_q);
    add1sumAHighB_uid132_prod_uid47_fpMulTest_b <= STD_LOGIC_VECTOR("0" & redist2_q);
    add1sumAHighB_uid132_prod_uid47_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(add1sumAHighB_uid132_prod_uid47_fpMulTest_a) + UNSIGNED(add1sumAHighB_uid132_prod_uid47_fpMulTest_b));
    add1sumAHighB_uid132_prod_uid47_fpMulTest_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_o(81 downto 0);

    -- lowRangeB_uid130_prod_uid47_fpMulTest(BITSELECT,129)@4
    lowRangeB_uid130_prod_uid47_fpMulTest_in <= add0_uid129_prod_uid47_fpMulTest_q(26 downto 0);
    lowRangeB_uid130_prod_uid47_fpMulTest_b <= lowRangeB_uid130_prod_uid47_fpMulTest_in(26 downto 0);

    -- redist3(DELAY,141)
    redist3 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid130_prod_uid47_fpMulTest_b, xout => redist3_q, ena => en(0), clk => clk, aclr => areset );

    -- add1_uid133_prod_uid47_fpMulTest(BITJOIN,132)@5
    add1_uid133_prod_uid47_fpMulTest_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_q & redist3_q;

    -- osig_uid134_prod_uid47_fpMulTest(BITSELECT,133)@5
    osig_uid134_prod_uid47_fpMulTest_in <= add1_uid133_prod_uid47_fpMulTest_q(107 downto 0);
    osig_uid134_prod_uid47_fpMulTest_b <= osig_uid134_prod_uid47_fpMulTest_in(107 downto 2);

    -- redist1(DELAY,139)
    redist1 : dspba_delay
    GENERIC MAP ( width => 106, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid134_prod_uid47_fpMulTest_b, xout => redist1_q, ena => en(0), clk => clk, aclr => areset );

    -- normalizeBit_uid49_fpMulTest(BITSELECT,48)@6
    normalizeBit_uid49_fpMulTest_in <= STD_LOGIC_VECTOR(redist1_q);
    normalizeBit_uid49_fpMulTest_b <= STD_LOGIC_VECTOR(normalizeBit_uid49_fpMulTest_in(105 downto 105));

    -- redist13(DELAY,151)
    redist13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => normalizeBit_uid49_fpMulTest_b, xout => redist13_q, ena => en(0), clk => clk, aclr => areset );

    -- roundBitDetectionConstant_uid63_fpMulTest(CONSTANT,62)
    roundBitDetectionConstant_uid63_fpMulTest_q <= "010";

    -- fracRPostNormHigh_uid51_fpMulTest(BITSELECT,50)@6
    fracRPostNormHigh_uid51_fpMulTest_in <= redist1_q(104 downto 0);
    fracRPostNormHigh_uid51_fpMulTest_b <= fracRPostNormHigh_uid51_fpMulTest_in(104 downto 52);

    -- fracRPostNormLow_uid52_fpMulTest(BITSELECT,51)@6
    fracRPostNormLow_uid52_fpMulTest_in <= redist1_q(103 downto 0);
    fracRPostNormLow_uid52_fpMulTest_b <= fracRPostNormLow_uid52_fpMulTest_in(103 downto 51);

    -- fracRPostNorm_uid53_fpMulTest(MUX,52)@6 + 1
    fracRPostNorm_uid53_fpMulTest_s <= normalizeBit_uid49_fpMulTest_b;
    fracRPostNorm_uid53_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (fracRPostNorm_uid53_fpMulTest_s) IS
                    WHEN "0" => fracRPostNorm_uid53_fpMulTest_q <= fracRPostNormLow_uid52_fpMulTest_b;
                    WHEN "1" => fracRPostNorm_uid53_fpMulTest_q <= fracRPostNormHigh_uid51_fpMulTest_b;
                    WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostNorm1dto0_uid61_fpMulTest(BITSELECT,60)@7
    fracRPostNorm1dto0_uid61_fpMulTest_in <= fracRPostNorm_uid53_fpMulTest_q(1 downto 0);
    fracRPostNorm1dto0_uid61_fpMulTest_b <= fracRPostNorm1dto0_uid61_fpMulTest_in(1 downto 0);

    -- extraStickyBitOfProd_uid55_fpMulTest(BITSELECT,54)@6
    extraStickyBitOfProd_uid55_fpMulTest_in <= STD_LOGIC_VECTOR(redist1_q(51 downto 0));
    extraStickyBitOfProd_uid55_fpMulTest_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid55_fpMulTest_in(51 downto 51));

    -- extraStickyBit_uid56_fpMulTest(MUX,55)@6
    extraStickyBit_uid56_fpMulTest_s <= normalizeBit_uid49_fpMulTest_b;
    extraStickyBit_uid56_fpMulTest_combproc: PROCESS (extraStickyBit_uid56_fpMulTest_s, en, GND_q, extraStickyBitOfProd_uid55_fpMulTest_b)
    BEGIN
        CASE (extraStickyBit_uid56_fpMulTest_s) IS
            WHEN "0" => extraStickyBit_uid56_fpMulTest_q <= GND_q;
            WHEN "1" => extraStickyBit_uid56_fpMulTest_q <= extraStickyBitOfProd_uid55_fpMulTest_b;
            WHEN OTHERS => extraStickyBit_uid56_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid54_fpMulTest(BITSELECT,53)@6
    stickyRange_uid54_fpMulTest_in <= redist1_q(50 downto 0);
    stickyRange_uid54_fpMulTest_b <= stickyRange_uid54_fpMulTest_in(50 downto 0);

    -- stickyExtendedRange_uid57_fpMulTest(BITJOIN,56)@6
    stickyExtendedRange_uid57_fpMulTest_q <= extraStickyBit_uid56_fpMulTest_q & stickyRange_uid54_fpMulTest_b;

    -- redist12(DELAY,150)
    redist12 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyExtendedRange_uid57_fpMulTest_q, xout => redist12_q, ena => en(0), clk => clk, aclr => areset );

    -- stickyRangeComparator_uid59_fpMulTest(LOGICAL,58)@7
    stickyRangeComparator_uid59_fpMulTest_a <= redist12_q;
    stickyRangeComparator_uid59_fpMulTest_b <= cstZeroWF_uid11_fpMulTest_q;
    stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN stickyRangeComparator_uid59_fpMulTest_a = stickyRangeComparator_uid59_fpMulTest_b ELSE "0";

    -- sticky_uid60_fpMulTest(LOGICAL,59)@7
    sticky_uid60_fpMulTest_a <= stickyRangeComparator_uid59_fpMulTest_q;
    sticky_uid60_fpMulTest_q <= not (sticky_uid60_fpMulTest_a);

    -- lrs_uid62_fpMulTest(BITJOIN,61)@7
    lrs_uid62_fpMulTest_q <= fracRPostNorm1dto0_uid61_fpMulTest_b & sticky_uid60_fpMulTest_q;

    -- roundBitDetectionPattern_uid64_fpMulTest(LOGICAL,63)@7
    roundBitDetectionPattern_uid64_fpMulTest_a <= lrs_uid62_fpMulTest_q;
    roundBitDetectionPattern_uid64_fpMulTest_b <= roundBitDetectionConstant_uid63_fpMulTest_q;
    roundBitDetectionPattern_uid64_fpMulTest_q <= "1" WHEN roundBitDetectionPattern_uid64_fpMulTest_a = roundBitDetectionPattern_uid64_fpMulTest_b ELSE "0";

    -- roundBit_uid65_fpMulTest(LOGICAL,64)@7 + 1
    roundBit_uid65_fpMulTest_a <= roundBitDetectionPattern_uid64_fpMulTest_q;
    roundBit_uid65_fpMulTest_qi <= not (roundBit_uid65_fpMulTest_a);
    roundBit_uid65_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => roundBit_uid65_fpMulTest_qi, xout => roundBit_uid65_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- roundBitAndNormalizationOp_uid68_fpMulTest(BITJOIN,67)@8
    roundBitAndNormalizationOp_uid68_fpMulTest_q <= GND_q & redist13_q & cstZeroWF_uid11_fpMulTest_q & roundBit_uid65_fpMulTest_q;

    -- biasInc_uid45_fpMulTest(CONSTANT,44)
    biasInc_uid45_fpMulTest_q <= "0001111111111";

    -- redist15_notEnable(LOGICAL,169)
    redist15_notEnable_a <= STD_LOGIC_VECTOR(en);
    redist15_notEnable_q <= not (redist15_notEnable_a);

    -- redist15_nor(LOGICAL,170)
    redist15_nor_a <= STD_LOGIC_VECTOR(redist15_notEnable_q);
    redist15_nor_b <= STD_LOGIC_VECTOR(redist15_sticky_ena_q);
    redist15_nor_q <= not (redist15_nor_a or redist15_nor_b);

    -- redist15_mem_top(CONSTANT,166)
    redist15_mem_top_q <= "010";

    -- redist15_cmp(LOGICAL,167)
    redist15_cmp_a <= redist15_mem_top_q;
    redist15_cmp_b <= STD_LOGIC_VECTOR("0" & redist15_rdmux_q);
    redist15_cmp_q <= "1" WHEN redist15_cmp_a = redist15_cmp_b ELSE "0";

    -- redist15_cmpReg(REG,168)
    redist15_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist15_cmpReg_q <= STD_LOGIC_VECTOR(redist15_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_sticky_ena(REG,171)
    redist15_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_nor_q = "1") THEN
                redist15_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_enaAnd(LOGICAL,172)
    redist15_enaAnd_a <= STD_LOGIC_VECTOR(redist15_sticky_ena_q);
    redist15_enaAnd_b <= STD_LOGIC_VECTOR(en);
    redist15_enaAnd_q <= redist15_enaAnd_a and redist15_enaAnd_b;

    -- redist15_rdcnt(COUNTER,163)
    -- low=0, high=2, step=1, init=1
    redist15_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_rdcnt_i <= TO_UNSIGNED(1, 2);
            redist15_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist15_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist15_rdcnt_eq <= '1';
                ELSE
                    redist15_rdcnt_eq <= '0';
                END IF;
                IF (redist15_rdcnt_eq = '1') THEN
                    redist15_rdcnt_i <= redist15_rdcnt_i - 2;
                ELSE
                    redist15_rdcnt_i <= redist15_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist15_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_rdcnt_i, 2)));

    -- redist15_rdmux(MUX,164)
    redist15_rdmux_s <= en;
    redist15_rdmux_combproc: PROCESS (redist15_rdmux_s, redist15_wraddr_q, redist15_rdcnt_q)
    BEGIN
        CASE (redist15_rdmux_s) IS
            WHEN "0" => redist15_rdmux_q <= redist15_wraddr_q;
            WHEN "1" => redist15_rdmux_q <= redist15_rdcnt_q;
            WHEN OTHERS => redist15_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expSum_uid44_fpMulTest(ADD,43)@0 + 1
    expSum_uid44_fpMulTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpMulTest_b);
    expSum_uid44_fpMulTest_b <= STD_LOGIC_VECTOR("0" & expY_uid7_fpMulTest_b);
    expSum_uid44_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid44_fpMulTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSum_uid44_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_a) + UNSIGNED(expSum_uid44_fpMulTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSum_uid44_fpMulTest_q <= expSum_uid44_fpMulTest_o(11 downto 0);

    -- redist15_inputreg(DELAY,160)
    redist15_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_q, xout => redist15_inputreg_q, ena => en(0), clk => clk, aclr => areset );

    -- redist15_wraddr(REG,165)
    redist15_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_wraddr_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_wraddr_q <= STD_LOGIC_VECTOR(redist15_rdmux_q);
        END IF;
    END PROCESS;

    -- redist15_mem(DUALMEM,162)
    redist15_mem_ia <= STD_LOGIC_VECTOR(redist15_inputreg_q);
    redist15_mem_aa <= redist15_wraddr_q;
    redist15_mem_ab <= redist15_rdmux_q;
    redist15_mem_reset0 <= areset;
    redist15_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 12,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist15_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist15_mem_reset0,
        clock1 => clk,
        address_a => redist15_mem_aa,
        data_a => redist15_mem_ia,
        wren_a => en(0),
        address_b => redist15_mem_ab,
        q_b => redist15_mem_iq
    );
    redist15_mem_q <= redist15_mem_iq(11 downto 0);

    -- redist15_outputreg(DELAY,161)
    redist15_outputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_mem_q, xout => redist15_outputreg_q, ena => en(0), clk => clk, aclr => areset );

    -- expSumMBias_uid46_fpMulTest(SUB,45)@7
    expSumMBias_uid46_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & redist15_outputreg_q));
    expSumMBias_uid46_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => biasInc_uid45_fpMulTest_q(12)) & biasInc_uid45_fpMulTest_q));
    expSumMBias_uid46_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid46_fpMulTest_a) - SIGNED(expSumMBias_uid46_fpMulTest_b));
    expSumMBias_uid46_fpMulTest_q <= expSumMBias_uid46_fpMulTest_o(13 downto 0);

    -- expFracPreRound_uid66_fpMulTest(BITJOIN,65)@7
    expFracPreRound_uid66_fpMulTest_q <= expSumMBias_uid46_fpMulTest_q & fracRPostNorm_uid53_fpMulTest_q;

    -- redist11(DELAY,149)
    redist11 : dspba_delay
    GENERIC MAP ( width => 67, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracPreRound_uid66_fpMulTest_q, xout => redist11_q, ena => en(0), clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest(ADD,68)@8
    expFracRPostRounding_uid69_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => redist11_q(66)) & redist11_q));
    expFracRPostRounding_uid69_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000000000000" & roundBitAndNormalizationOp_uid68_fpMulTest_q));
    expFracRPostRounding_uid69_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid69_fpMulTest_a) + SIGNED(expFracRPostRounding_uid69_fpMulTest_b));
    expFracRPostRounding_uid69_fpMulTest_q <= expFracRPostRounding_uid69_fpMulTest_o(67 downto 0);

    -- expRPreExcExt_uid71_fpMulTest(BITSELECT,70)@8
    expRPreExcExt_uid71_fpMulTest_in <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_q);
    expRPreExcExt_uid71_fpMulTest_b <= STD_LOGIC_VECTOR(expRPreExcExt_uid71_fpMulTest_in(67 downto 53));

    -- redist9(DELAY,147)
    redist9 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExcExt_uid71_fpMulTest_b, xout => redist9_q, ena => en(0), clk => clk, aclr => areset );

    -- expRPreExc_uid72_fpMulTest(BITSELECT,71)@9
    expRPreExc_uid72_fpMulTest_in <= redist9_q(10 downto 0);
    expRPreExc_uid72_fpMulTest_b <= expRPreExc_uid72_fpMulTest_in(10 downto 0);

    -- redist8(DELAY,146)
    redist8 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid72_fpMulTest_b, xout => redist8_q, ena => en(0), clk => clk, aclr => areset );

    -- expOvf_uid75_fpMulTest(COMPARE,74)@9
    expOvf_uid75_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => redist9_q(14)) & redist9_q));
    expOvf_uid75_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00000" & cstAllOWE_uid10_fpMulTest_q));
    expOvf_uid75_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid75_fpMulTest_a) - SIGNED(expOvf_uid75_fpMulTest_b));
    expOvf_uid75_fpMulTest_n(0) <= not (expOvf_uid75_fpMulTest_o(16));

    -- invExpXIsMax_uid35_fpMulTest(LOGICAL,34)@9
    invExpXIsMax_uid35_fpMulTest_a <= redist17_q;
    invExpXIsMax_uid35_fpMulTest_q <= not (invExpXIsMax_uid35_fpMulTest_a);

    -- InvExpXIsZero_uid36_fpMulTest(LOGICAL,35)@9
    InvExpXIsZero_uid36_fpMulTest_a <= redist18_q;
    InvExpXIsZero_uid36_fpMulTest_q <= not (InvExpXIsZero_uid36_fpMulTest_a);

    -- excR_y_uid37_fpMulTest(LOGICAL,36)@9
    excR_y_uid37_fpMulTest_a <= InvExpXIsZero_uid36_fpMulTest_q;
    excR_y_uid37_fpMulTest_b <= invExpXIsMax_uid35_fpMulTest_q;
    excR_y_uid37_fpMulTest_q <= excR_y_uid37_fpMulTest_a and excR_y_uid37_fpMulTest_b;

    -- invExpXIsMax_uid21_fpMulTest(LOGICAL,20)@9
    invExpXIsMax_uid21_fpMulTest_a <= redist20_q;
    invExpXIsMax_uid21_fpMulTest_q <= not (invExpXIsMax_uid21_fpMulTest_a);

    -- InvExpXIsZero_uid22_fpMulTest(LOGICAL,21)@9
    InvExpXIsZero_uid22_fpMulTest_a <= redist21_q;
    InvExpXIsZero_uid22_fpMulTest_q <= not (InvExpXIsZero_uid22_fpMulTest_a);

    -- excR_x_uid23_fpMulTest(LOGICAL,22)@9
    excR_x_uid23_fpMulTest_a <= InvExpXIsZero_uid22_fpMulTest_q;
    excR_x_uid23_fpMulTest_b <= invExpXIsMax_uid21_fpMulTest_q;
    excR_x_uid23_fpMulTest_q <= excR_x_uid23_fpMulTest_a and excR_x_uid23_fpMulTest_b;

    -- ExcROvfAndInReg_uid84_fpMulTest(LOGICAL,83)@9 + 1
    ExcROvfAndInReg_uid84_fpMulTest_a <= excR_x_uid23_fpMulTest_q;
    ExcROvfAndInReg_uid84_fpMulTest_b <= excR_y_uid37_fpMulTest_q;
    ExcROvfAndInReg_uid84_fpMulTest_c <= expOvf_uid75_fpMulTest_n;
    ExcROvfAndInReg_uid84_fpMulTest_qi <= ExcROvfAndInReg_uid84_fpMulTest_a and ExcROvfAndInReg_uid84_fpMulTest_b and ExcROvfAndInReg_uid84_fpMulTest_c;
    ExcROvfAndInReg_uid84_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ExcROvfAndInReg_uid84_fpMulTest_qi, xout => ExcROvfAndInReg_uid84_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excYRAndExcXI_uid83_fpMulTest(LOGICAL,82)@9 + 1
    excYRAndExcXI_uid83_fpMulTest_a <= excR_y_uid37_fpMulTest_q;
    excYRAndExcXI_uid83_fpMulTest_b <= excI_x_uid19_fpMulTest_q;
    excYRAndExcXI_uid83_fpMulTest_qi <= excYRAndExcXI_uid83_fpMulTest_a and excYRAndExcXI_uid83_fpMulTest_b;
    excYRAndExcXI_uid83_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYRAndExcXI_uid83_fpMulTest_qi, xout => excYRAndExcXI_uid83_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excXRAndExcYI_uid82_fpMulTest(LOGICAL,81)@9 + 1
    excXRAndExcYI_uid82_fpMulTest_a <= excR_x_uid23_fpMulTest_q;
    excXRAndExcYI_uid82_fpMulTest_b <= excI_y_uid33_fpMulTest_q;
    excXRAndExcYI_uid82_fpMulTest_qi <= excXRAndExcYI_uid82_fpMulTest_a and excXRAndExcYI_uid82_fpMulTest_b;
    excXRAndExcYI_uid82_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXRAndExcYI_uid82_fpMulTest_qi, xout => excXRAndExcYI_uid82_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excXIAndExcYI_uid81_fpMulTest(LOGICAL,80)@9 + 1
    excXIAndExcYI_uid81_fpMulTest_a <= excI_x_uid19_fpMulTest_q;
    excXIAndExcYI_uid81_fpMulTest_b <= excI_y_uid33_fpMulTest_q;
    excXIAndExcYI_uid81_fpMulTest_qi <= excXIAndExcYI_uid81_fpMulTest_a and excXIAndExcYI_uid81_fpMulTest_b;
    excXIAndExcYI_uid81_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXIAndExcYI_uid81_fpMulTest_qi, xout => excXIAndExcYI_uid81_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excRInf_uid85_fpMulTest(LOGICAL,84)@10
    excRInf_uid85_fpMulTest_a <= excXIAndExcYI_uid81_fpMulTest_q;
    excRInf_uid85_fpMulTest_b <= excXRAndExcYI_uid82_fpMulTest_q;
    excRInf_uid85_fpMulTest_c <= excYRAndExcXI_uid83_fpMulTest_q;
    excRInf_uid85_fpMulTest_d <= ExcROvfAndInReg_uid84_fpMulTest_q;
    excRInf_uid85_fpMulTest_q <= excRInf_uid85_fpMulTest_a or excRInf_uid85_fpMulTest_b or excRInf_uid85_fpMulTest_c or excRInf_uid85_fpMulTest_d;

    -- expUdf_uid73_fpMulTest(COMPARE,72)@9
    expUdf_uid73_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000000000000000" & GND_q));
    expUdf_uid73_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => redist9_q(14)) & redist9_q));
    expUdf_uid73_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid73_fpMulTest_a) - SIGNED(expUdf_uid73_fpMulTest_b));
    expUdf_uid73_fpMulTest_n(0) <= not (expUdf_uid73_fpMulTest_o(16));

    -- excZC3_uid79_fpMulTest(LOGICAL,78)@9 + 1
    excZC3_uid79_fpMulTest_a <= excR_x_uid23_fpMulTest_q;
    excZC3_uid79_fpMulTest_b <= excR_y_uid37_fpMulTest_q;
    excZC3_uid79_fpMulTest_c <= expUdf_uid73_fpMulTest_n;
    excZC3_uid79_fpMulTest_qi <= excZC3_uid79_fpMulTest_a and excZC3_uid79_fpMulTest_b and excZC3_uid79_fpMulTest_c;
    excZC3_uid79_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZC3_uid79_fpMulTest_qi, xout => excZC3_uid79_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excYZAndExcXR_uid78_fpMulTest(LOGICAL,77)@9 + 1
    excYZAndExcXR_uid78_fpMulTest_a <= redist18_q;
    excYZAndExcXR_uid78_fpMulTest_b <= excR_x_uid23_fpMulTest_q;
    excYZAndExcXR_uid78_fpMulTest_qi <= excYZAndExcXR_uid78_fpMulTest_a and excYZAndExcXR_uid78_fpMulTest_b;
    excYZAndExcXR_uid78_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXR_uid78_fpMulTest_qi, xout => excYZAndExcXR_uid78_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZAndExcYR_uid77_fpMulTest(LOGICAL,76)@9 + 1
    excXZAndExcYR_uid77_fpMulTest_a <= redist21_q;
    excXZAndExcYR_uid77_fpMulTest_b <= excR_y_uid37_fpMulTest_q;
    excXZAndExcYR_uid77_fpMulTest_qi <= excXZAndExcYR_uid77_fpMulTest_a and excXZAndExcYR_uid77_fpMulTest_b;
    excXZAndExcYR_uid77_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYR_uid77_fpMulTest_qi, xout => excXZAndExcYR_uid77_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZAndExcYZ_uid76_fpMulTest(LOGICAL,75)@9 + 1
    excXZAndExcYZ_uid76_fpMulTest_a <= redist21_q;
    excXZAndExcYZ_uid76_fpMulTest_b <= redist18_q;
    excXZAndExcYZ_uid76_fpMulTest_qi <= excXZAndExcYZ_uid76_fpMulTest_a and excXZAndExcYZ_uid76_fpMulTest_b;
    excXZAndExcYZ_uid76_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYZ_uid76_fpMulTest_qi, xout => excXZAndExcYZ_uid76_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excRZero_uid80_fpMulTest(LOGICAL,79)@10
    excRZero_uid80_fpMulTest_a <= excXZAndExcYZ_uid76_fpMulTest_q;
    excRZero_uid80_fpMulTest_b <= excXZAndExcYR_uid77_fpMulTest_q;
    excRZero_uid80_fpMulTest_c <= excYZAndExcXR_uid78_fpMulTest_q;
    excRZero_uid80_fpMulTest_d <= excZC3_uid79_fpMulTest_q;
    excRZero_uid80_fpMulTest_q <= excRZero_uid80_fpMulTest_a or excRZero_uid80_fpMulTest_b or excRZero_uid80_fpMulTest_c or excRZero_uid80_fpMulTest_d;

    -- concExc_uid90_fpMulTest(BITJOIN,89)@10
    concExc_uid90_fpMulTest_q <= excRNaN_uid89_fpMulTest_q & excRInf_uid85_fpMulTest_q & excRZero_uid80_fpMulTest_q;

    -- excREnc_uid91_fpMulTest(LOOKUP,90)@10
    excREnc_uid91_fpMulTest_combproc: PROCESS (concExc_uid90_fpMulTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid90_fpMulTest_q) IS
            WHEN "000" => excREnc_uid91_fpMulTest_q <= "01";
            WHEN "001" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "010" => excREnc_uid91_fpMulTest_q <= "10";
            WHEN "011" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "100" => excREnc_uid91_fpMulTest_q <= "11";
            WHEN "101" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "110" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "111" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid91_fpMulTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid100_fpMulTest(MUX,99)@10
    expRPostExc_uid100_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    expRPostExc_uid100_fpMulTest_combproc: PROCESS (expRPostExc_uid100_fpMulTest_s, en, cstAllZWE_uid12_fpMulTest_q, redist8_q, cstAllOWE_uid10_fpMulTest_q)
    BEGIN
        CASE (expRPostExc_uid100_fpMulTest_s) IS
            WHEN "00" => expRPostExc_uid100_fpMulTest_q <= cstAllZWE_uid12_fpMulTest_q;
            WHEN "01" => expRPostExc_uid100_fpMulTest_q <= redist8_q;
            WHEN "10" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN "11" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN OTHERS => expRPostExc_uid100_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid92_fpMulTest(CONSTANT,91)
    oneFracRPostExc2_uid92_fpMulTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPreExc_uid70_fpMulTest(BITSELECT,69)@8
    fracRPreExc_uid70_fpMulTest_in <= expFracRPostRounding_uid69_fpMulTest_q(52 downto 0);
    fracRPreExc_uid70_fpMulTest_b <= fracRPreExc_uid70_fpMulTest_in(52 downto 1);

    -- redist10(DELAY,148)
    redist10 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid70_fpMulTest_b, xout => redist10_q, ena => en(0), clk => clk, aclr => areset );

    -- fracRPostExc_uid95_fpMulTest(MUX,94)@10
    fracRPostExc_uid95_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    fracRPostExc_uid95_fpMulTest_combproc: PROCESS (fracRPostExc_uid95_fpMulTest_s, en, cstZeroWF_uid11_fpMulTest_q, redist10_q, oneFracRPostExc2_uid92_fpMulTest_q)
    BEGIN
        CASE (fracRPostExc_uid95_fpMulTest_s) IS
            WHEN "00" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "01" => fracRPostExc_uid95_fpMulTest_q <= redist10_q;
            WHEN "10" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "11" => fracRPostExc_uid95_fpMulTest_q <= oneFracRPostExc2_uid92_fpMulTest_q;
            WHEN OTHERS => fracRPostExc_uid95_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid103_fpMulTest(BITJOIN,102)@10
    R_uid103_fpMulTest_q <= signRPostExc_uid102_fpMulTest_q & expRPostExc_uid100_fpMulTest_q & fracRPostExc_uid95_fpMulTest_q;

    -- xOut(GPOUT,4)@10
    q <= R_uid103_fpMulTest_q;

END normal;
