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

-- VHDL created from fpacc64_altera_fp_acc_custom_160_bhzzlly
-- VHDL created on Tue Mar 26 19:18:36 2019


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

entity fpacc64_altera_fp_acc_custom_160_bhzzlly is
    port (
        x : in std_logic_vector(63 downto 0);  -- float64_m52
        n : in std_logic_vector(0 downto 0);  -- ufix1
        en : in std_logic_vector(0 downto 0);  -- ufix1
        r : out std_logic_vector(63 downto 0);  -- float64_m52
        xo : out std_logic_vector(0 downto 0);  -- ufix1
        xu : out std_logic_vector(0 downto 0);  -- ufix1
        ao : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end fpacc64_altera_fp_acc_custom_160_bhzzlly;

architecture normal of fpacc64_altera_fp_acc_custom_160_bhzzlly is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expLTLSBA_uid11_fpAccTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expGTMaxMSBX_uid13_fpAccTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rShiftConstant_uid15_fpAccTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftValue_uid16_fpAccTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal rightShiftValue_uid16_fpAccTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rightShiftValue_uid16_fpAccTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal rightShiftValue_uid16_fpAccTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal padConst_uid17_fpAccTest_q : STD_LOGIC_VECTOR (85 downto 0);
    signal onesComplementExtendedFrac_uid22_fpAccTest_a : STD_LOGIC_VECTOR (86 downto 0);
    signal onesComplementExtendedFrac_uid22_fpAccTest_b : STD_LOGIC_VECTOR (86 downto 0);
    signal onesComplementExtendedFrac_uid22_fpAccTest_qi : STD_LOGIC_VECTOR (86 downto 0);
    signal onesComplementExtendedFrac_uid22_fpAccTest_q : STD_LOGIC_VECTOR (86 downto 0);
    signal accumulator_uid24_fpAccTest_a : STD_LOGIC_VECTOR (96 downto 0);
    signal accumulator_uid24_fpAccTest_b : STD_LOGIC_VECTOR (96 downto 0);
    signal accumulator_uid24_fpAccTest_i : STD_LOGIC_VECTOR (96 downto 0);
    signal accumulator_uid24_fpAccTest_o : STD_LOGIC_VECTOR (96 downto 0);
    signal accumulator_uid24_fpAccTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal accumulator_uid24_fpAccTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal accumulator_uid24_fpAccTest_q : STD_LOGIC_VECTOR (94 downto 0);
    signal accOnesComplement_uid34_fpAccTest_a : STD_LOGIC_VECTOR (92 downto 0);
    signal accOnesComplement_uid34_fpAccTest_b : STD_LOGIC_VECTOR (92 downto 0);
    signal accOnesComplement_uid34_fpAccTest_qi : STD_LOGIC_VECTOR (92 downto 0);
    signal accOnesComplement_uid34_fpAccTest_q : STD_LOGIC_VECTOR (92 downto 0);
    signal accValuePositive_uid35_fpAccTest_a : STD_LOGIC_VECTOR (93 downto 0);
    signal accValuePositive_uid35_fpAccTest_b : STD_LOGIC_VECTOR (93 downto 0);
    signal accValuePositive_uid35_fpAccTest_o : STD_LOGIC_VECTOR (93 downto 0);
    signal accValuePositive_uid35_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal ShiftedOutComparator_uid38_fpAccTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal accResOutOfExpRange_uid39_fpAccTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal accResOutOfExpRange_uid39_fpAccTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal accResOutOfExpRange_uid39_fpAccTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal accResOutOfExpRange_uid39_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRBias_uid41_fpAccTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal zeroExponent_uid42_fpAccTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal oRXOverflowFlagFeedback_uid52_fpAccTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oRXOverflowFlagFeedback_uid52_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oRXOverflowFlagFeedback_uid52_fpAccTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oRXOverflowFlagFeedback_uid52_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oRXUnderflowFlagFeedback_uid56_fpAccTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oRXUnderflowFlagFeedback_uid56_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oRXUnderflowFlagFeedback_uid56_fpAccTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oRXUnderflowFlagFeedback_uid56_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal muxAccOverflowFeedbackSignal_uid59_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal muxAccOverflowFeedbackSignal_uid59_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zs_uid64_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal vCount_uid66_zeroCounter_uid37_fpAccTest_a : STD_LOGIC_VECTOR (63 downto 0);
    signal vCount_uid66_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (63 downto 0);
    signal vCount_uid66_zeroCounter_uid37_fpAccTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid66_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid67_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal zs_uid72_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid74_zeroCounter_uid37_fpAccTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid74_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid74_zeroCounter_uid37_fpAccTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid74_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zs_uid78_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid80_zeroCounter_uid37_fpAccTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid80_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid80_zeroCounter_uid37_fpAccTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid80_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zs_uid84_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid86_zeroCounter_uid37_fpAccTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid86_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid86_zeroCounter_uid37_fpAccTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid86_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zs_uid90_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid96_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal wIntCst_uid109_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx2Pad128_uid115_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (127 downto 0);
    signal rightShiftStage0Idx3_uid117_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage1Idx3Pad48_uid127_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage2Idx3Pad12_uid138_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage3Idx3Pad3_uid149_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal leftShiftStage0Idx3_uid164_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage1Idx3Pad24_uid173_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage2Idx3Pad6_uid184_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist16_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist27_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist32_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_inputreg_q : STD_LOGIC_VECTOR (93 downto 0);
    signal redist26_outputreg_q : STD_LOGIC_VECTOR (93 downto 0);
    signal redist26_mem_reset0 : std_logic;
    signal redist26_mem_ia : STD_LOGIC_VECTOR (93 downto 0);
    signal redist26_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_mem_iq : STD_LOGIC_VECTOR (93 downto 0);
    signal redist26_mem_q : STD_LOGIC_VECTOR (93 downto 0);
    signal redist26_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist26_rdcnt_i : signal is true;
    signal redist26_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist26_sticky_ena_q : signal is true;
    signal muxXOverflowFeedbackSignal_uid51_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal muxXOverflowFeedbackSignal_uid51_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal muxXUnderflowFeedbackSignal_uid55_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal muxXUnderflowFeedbackSignal_uid55_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid10_fpAccTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist26_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_rdmux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpAccTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expX_uid6_fpAccTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracX_uid7_fpAccTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal fracX_uid7_fpAccTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal signX_uid8_fpAccTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal signX_uid8_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpLT_expX_expLTLSBA_uid12_fpAccTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal cmpLT_expX_expLTLSBA_uid12_fpAccTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal cmpLT_expX_expLTLSBA_uid12_fpAccTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal cmpLT_expX_expLTLSBA_uid12_fpAccTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal resExpSub_uid43_fpAccTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal resExpSub_uid43_fpAccTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal resExpSub_uid43_fpAccTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal resExpSub_uid43_fpAccTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal finalExpUpdated_uid45_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal finalExpUpdated_uid45_fpAccTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal vStagei_uid77_zeroCounter_uid37_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid77_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid83_zeroCounter_uid37_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid83_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid89_zeroCounter_uid37_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid89_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid98_zeroCounter_uid37_fpAccTest_a : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid98_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid98_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid101_zeroCounter_uid37_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid101_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal r_uid154_alignmentShifter_uid17_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid154_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStageSel7Dto6_uid118_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStageSel7Dto6_uid118_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid129_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto4_uid129_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid140_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStageSel3Dto2_uid140_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel1Dto0_uid151_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel1Dto0_uid151_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightPaddedIn_uid18_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal os_uid25_fpAccTest_q : STD_LOGIC_VECTOR (95 downto 0);
    signal posAccWoLeadingZeroBit_uid36_fpAccTest_in : STD_LOGIC_VECTOR (91 downto 0);
    signal posAccWoLeadingZeroBit_uid36_fpAccTest_b : STD_LOGIC_VECTOR (91 downto 0);
    signal cStage_uid69_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage1Idx1Rng16_uid120_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage1Idx1Rng16_uid120_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (122 downto 0);
    signal rightShiftStage1Idx2Rng32_uid123_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage1Idx2Rng32_uid123_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx3Rng48_uid126_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage1Idx3Rng48_uid126_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (90 downto 0);
    signal rightShiftStage1Idx3_uid128_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage2Idx1Rng4_uid131_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage2Idx1Rng4_uid131_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (134 downto 0);
    signal rightShiftStage2Idx2Rng8_uid134_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage2Idx2Rng8_uid134_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (130 downto 0);
    signal rightShiftStage2Idx3Rng12_uid137_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage2Idx3Rng12_uid137_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (126 downto 0);
    signal rightShiftStage2Idx3_uid139_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage3Idx1Rng1_uid142_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage3Idx1Rng1_uid142_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (137 downto 0);
    signal rightShiftStage3Idx2Rng2_uid145_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage3Idx2Rng2_uid145_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (136 downto 0);
    signal rightShiftStage3Idx3Rng3_uid148_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage3Idx3Rng3_uid148_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (135 downto 0);
    signal rightShiftStage3Idx3_uid150_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal leftShiftStage1Idx1Rng8_uid168_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (85 downto 0);
    signal leftShiftStage1Idx1Rng8_uid168_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (85 downto 0);
    signal leftShiftStage1Idx2Rng16_uid171_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (77 downto 0);
    signal leftShiftStage1Idx2Rng16_uid171_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (77 downto 0);
    signal leftShiftStage1Idx3Rng24_uid174_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (69 downto 0);
    signal leftShiftStage1Idx3Rng24_uid174_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (69 downto 0);
    signal leftShiftStage1Idx3_uid175_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage2Idx1Rng2_uid179_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (91 downto 0);
    signal leftShiftStage2Idx1Rng2_uid179_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (91 downto 0);
    signal leftShiftStage2Idx2Rng4_uid182_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (89 downto 0);
    signal leftShiftStage2Idx2Rng4_uid182_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (89 downto 0);
    signal leftShiftStage2Idx3Rng6_uid185_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (87 downto 0);
    signal leftShiftStage2Idx3Rng6_uid185_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (87 downto 0);
    signal leftShiftStage2Idx3_uid186_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStageSel4Dto3_uid176_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStageSel4Dto3_uid176_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel2Dto1_uid187_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel2Dto1_uid187_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto0_uid192_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStageSel0Dto0_uid192_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid71_zeroCounter_uid37_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid71_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0Idx1Rng32_uid159_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (61 downto 0);
    signal leftShiftStage0Idx1Rng32_uid159_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (61 downto 0);
    signal leftShiftStage0Idx2Rng64_uid162_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx2Rng64_uid162_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal finalExponent_uid44_fpAccTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal finalExponent_uid44_fpAccTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rVStage_uid79_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid79_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vStage_uid81_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal vStage_uid81_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid85_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid85_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vStage_uid87_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal vStage_uid87_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid91_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid91_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid93_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid93_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid103_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid103_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedFracUpper_uid20_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal shiftedFracUpper_uid20_fpAccTest_b : STD_LOGIC_VECTOR (85 downto 0);
    signal rightShiftStage0Idx1Rng64_uid111_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage0Idx1Rng64_uid111_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (74 downto 0);
    signal rightShiftStage0Idx2Rng128_uid114_alignmentShifter_uid17_fpAccTest_in : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage0Idx2Rng128_uid114_alignmentShifter_uid17_fpAccTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal osr_uid26_fpAccTest_in : STD_LOGIC_VECTOR (94 downto 0);
    signal osr_uid26_fpAccTest_b : STD_LOGIC_VECTOR (94 downto 0);
    signal rVStage_uid65_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (91 downto 0);
    signal rVStage_uid65_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (63 downto 0);
    signal vStage_uid68_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal vStage_uid68_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx1_uid122_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage1Idx2_uid125_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage2Idx1_uid133_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage2Idx2_uid136_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage3Idx1_uid144_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage3Idx2_uid147_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal leftShiftStage1Idx1_uid169_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage1Idx2_uid172_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage2Idx1_uid180_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage2Idx2_uid183_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal rVStage_uid73_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal rVStage_uid73_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vStage_uid75_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal vStage_uid75_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1_uid160_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage0Idx2_uid163_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal vCount_uid92_zeroCounter_uid37_fpAccTest_a : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid92_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid92_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid95_zeroCounter_uid37_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid95_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid104_zeroCounter_uid37_fpAccTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid104_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid104_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal extendedAlignedShiftedFrac_uid21_fpAccTest_q : STD_LOGIC_VECTOR (86 downto 0);
    signal rightShiftStage0Idx1_uid113_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal rightShiftStage0Idx2_uid116_alignmentShifter_uid17_fpAccTest_q : STD_LOGIC_VECTOR (138 downto 0);
    signal sum_uid27_fpAccTest_in : STD_LOGIC_VECTOR (93 downto 0);
    signal sum_uid27_fpAccTest_b : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStage3Idx1Rng1_uid190_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (92 downto 0);
    signal leftShiftStage3Idx1Rng1_uid190_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (92 downto 0);
    signal rVStage_uid97_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid97_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal vStage_uid99_zeroCounter_uid37_fpAccTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal vStage_uid99_zeroCounter_uid37_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal r_uid105_zeroCounter_uid37_fpAccTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal accumulatorSign_uid29_fpAccTest_in : STD_LOGIC_VECTOR (92 downto 0);
    signal accumulatorSign_uid29_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal accOverflowBitMSB_uid30_fpAccTest_in : STD_LOGIC_VECTOR (93 downto 0);
    signal accOverflowBitMSB_uid30_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal accValidRange_uid33_fpAccTest_in : STD_LOGIC_VECTOR (92 downto 0);
    signal accValidRange_uid33_fpAccTest_b : STD_LOGIC_VECTOR (92 downto 0);
    signal leftShiftStage3Idx1_uid191_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal leftShiftStageSel6Dto5_uid165_normalizationShifter_uid40_fpAccTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStageSel6Dto5_uid165_normalizationShifter_uid40_fpAccTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal accOverflow_uid32_fpAccTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal accOverflow_uid32_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal accOverflow_uid32_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_q : STD_LOGIC_VECTOR (93 downto 0);
    signal oRAccOverflowFlagFeedback_uid60_fpAccTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oRAccOverflowFlagFeedback_uid60_fpAccTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oRAccOverflowFlagFeedback_uid60_fpAccTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracR_uid46_fpAccTest_in : STD_LOGIC_VECTOR (90 downto 0);
    signal fracR_uid46_fpAccTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal R_uid47_fpAccTest_q : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- xIn(GPIN,3)@0

    -- signX_uid8_fpAccTest(BITSELECT,7)@0
    signX_uid8_fpAccTest_in <= STD_LOGIC_VECTOR(x);
    signX_uid8_fpAccTest_b <= STD_LOGIC_VECTOR(signX_uid8_fpAccTest_in(63 downto 63));

    -- redist29(DELAY,223)
    redist29 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid8_fpAccTest_b, xout => redist29_q, ena => en(0), clk => clk, aclr => areset );

    -- redist30(DELAY,224)
    redist30 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist29_q, xout => redist30_q, ena => en(0), clk => clk, aclr => areset );

    -- redist32(DELAY,226)
    redist32 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => n, xout => redist32_q, ena => en(0), clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- rightShiftStage0Idx3_uid117_alignmentShifter_uid17_fpAccTest(CONSTANT,116)
    rightShiftStage0Idx3_uid117_alignmentShifter_uid17_fpAccTest_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage3Idx3Pad3_uid149_alignmentShifter_uid17_fpAccTest(CONSTANT,148)
    rightShiftStage3Idx3Pad3_uid149_alignmentShifter_uid17_fpAccTest_q <= "000";

    -- rightShiftStage3Idx3Rng3_uid148_alignmentShifter_uid17_fpAccTest(BITSELECT,147)@4
    rightShiftStage3Idx3Rng3_uid148_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage3Idx3Rng3_uid148_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage3Idx3Rng3_uid148_alignmentShifter_uid17_fpAccTest_in(138 downto 3);

    -- rightShiftStage3Idx3_uid150_alignmentShifter_uid17_fpAccTest(BITJOIN,149)@4
    rightShiftStage3Idx3_uid150_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage3Idx3Pad3_uid149_alignmentShifter_uid17_fpAccTest_q & rightShiftStage3Idx3Rng3_uid148_alignmentShifter_uid17_fpAccTest_b;

    -- zs_uid96_zeroCounter_uid37_fpAccTest(CONSTANT,95)
    zs_uid96_zeroCounter_uid37_fpAccTest_q <= "00";

    -- rightShiftStage3Idx2Rng2_uid145_alignmentShifter_uid17_fpAccTest(BITSELECT,144)@4
    rightShiftStage3Idx2Rng2_uid145_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage3Idx2Rng2_uid145_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage3Idx2Rng2_uid145_alignmentShifter_uid17_fpAccTest_in(138 downto 2);

    -- rightShiftStage3Idx2_uid147_alignmentShifter_uid17_fpAccTest(BITJOIN,146)@4
    rightShiftStage3Idx2_uid147_alignmentShifter_uid17_fpAccTest_q <= zs_uid96_zeroCounter_uid37_fpAccTest_q & rightShiftStage3Idx2Rng2_uid145_alignmentShifter_uid17_fpAccTest_b;

    -- rightShiftStage3Idx1Rng1_uid142_alignmentShifter_uid17_fpAccTest(BITSELECT,141)@4
    rightShiftStage3Idx1Rng1_uid142_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage3Idx1Rng1_uid142_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage3Idx1Rng1_uid142_alignmentShifter_uid17_fpAccTest_in(138 downto 1);

    -- rightShiftStage3Idx1_uid144_alignmentShifter_uid17_fpAccTest(BITJOIN,143)@4
    rightShiftStage3Idx1_uid144_alignmentShifter_uid17_fpAccTest_q <= GND_q & rightShiftStage3Idx1Rng1_uid142_alignmentShifter_uid17_fpAccTest_b;

    -- rightShiftStage2Idx3Pad12_uid138_alignmentShifter_uid17_fpAccTest(CONSTANT,137)
    rightShiftStage2Idx3Pad12_uid138_alignmentShifter_uid17_fpAccTest_q <= "000000000000";

    -- rightShiftStage2Idx3Rng12_uid137_alignmentShifter_uid17_fpAccTest(BITSELECT,136)@3
    rightShiftStage2Idx3Rng12_uid137_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage2Idx3Rng12_uid137_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage2Idx3Rng12_uid137_alignmentShifter_uid17_fpAccTest_in(138 downto 12);

    -- rightShiftStage2Idx3_uid139_alignmentShifter_uid17_fpAccTest(BITJOIN,138)@3
    rightShiftStage2Idx3_uid139_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage2Idx3Pad12_uid138_alignmentShifter_uid17_fpAccTest_q & rightShiftStage2Idx3Rng12_uid137_alignmentShifter_uid17_fpAccTest_b;

    -- zs_uid84_zeroCounter_uid37_fpAccTest(CONSTANT,83)
    zs_uid84_zeroCounter_uid37_fpAccTest_q <= "00000000";

    -- rightShiftStage2Idx2Rng8_uid134_alignmentShifter_uid17_fpAccTest(BITSELECT,133)@3
    rightShiftStage2Idx2Rng8_uid134_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage2Idx2Rng8_uid134_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage2Idx2Rng8_uid134_alignmentShifter_uid17_fpAccTest_in(138 downto 8);

    -- rightShiftStage2Idx2_uid136_alignmentShifter_uid17_fpAccTest(BITJOIN,135)@3
    rightShiftStage2Idx2_uid136_alignmentShifter_uid17_fpAccTest_q <= zs_uid84_zeroCounter_uid37_fpAccTest_q & rightShiftStage2Idx2Rng8_uid134_alignmentShifter_uid17_fpAccTest_b;

    -- zs_uid90_zeroCounter_uid37_fpAccTest(CONSTANT,89)
    zs_uid90_zeroCounter_uid37_fpAccTest_q <= "0000";

    -- rightShiftStage2Idx1Rng4_uid131_alignmentShifter_uid17_fpAccTest(BITSELECT,130)@3
    rightShiftStage2Idx1Rng4_uid131_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage2Idx1Rng4_uid131_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage2Idx1Rng4_uid131_alignmentShifter_uid17_fpAccTest_in(138 downto 4);

    -- rightShiftStage2Idx1_uid133_alignmentShifter_uid17_fpAccTest(BITJOIN,132)@3
    rightShiftStage2Idx1_uid133_alignmentShifter_uid17_fpAccTest_q <= zs_uid90_zeroCounter_uid37_fpAccTest_q & rightShiftStage2Idx1Rng4_uid131_alignmentShifter_uid17_fpAccTest_b;

    -- rightShiftStage1Idx3Pad48_uid127_alignmentShifter_uid17_fpAccTest(CONSTANT,126)
    rightShiftStage1Idx3Pad48_uid127_alignmentShifter_uid17_fpAccTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage1Idx3Rng48_uid126_alignmentShifter_uid17_fpAccTest(BITSELECT,125)@2
    rightShiftStage1Idx3Rng48_uid126_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage1Idx3Rng48_uid126_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage1Idx3Rng48_uid126_alignmentShifter_uid17_fpAccTest_in(138 downto 48);

    -- rightShiftStage1Idx3_uid128_alignmentShifter_uid17_fpAccTest(BITJOIN,127)@2
    rightShiftStage1Idx3_uid128_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage1Idx3Pad48_uid127_alignmentShifter_uid17_fpAccTest_q & rightShiftStage1Idx3Rng48_uid126_alignmentShifter_uid17_fpAccTest_b;

    -- zs_uid72_zeroCounter_uid37_fpAccTest(CONSTANT,71)
    zs_uid72_zeroCounter_uid37_fpAccTest_q <= "00000000000000000000000000000000";

    -- rightShiftStage1Idx2Rng32_uid123_alignmentShifter_uid17_fpAccTest(BITSELECT,122)@2
    rightShiftStage1Idx2Rng32_uid123_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage1Idx2Rng32_uid123_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage1Idx2Rng32_uid123_alignmentShifter_uid17_fpAccTest_in(138 downto 32);

    -- rightShiftStage1Idx2_uid125_alignmentShifter_uid17_fpAccTest(BITJOIN,124)@2
    rightShiftStage1Idx2_uid125_alignmentShifter_uid17_fpAccTest_q <= zs_uid72_zeroCounter_uid37_fpAccTest_q & rightShiftStage1Idx2Rng32_uid123_alignmentShifter_uid17_fpAccTest_b;

    -- zs_uid78_zeroCounter_uid37_fpAccTest(CONSTANT,77)
    zs_uid78_zeroCounter_uid37_fpAccTest_q <= "0000000000000000";

    -- rightShiftStage1Idx1Rng16_uid120_alignmentShifter_uid17_fpAccTest(BITSELECT,119)@2
    rightShiftStage1Idx1Rng16_uid120_alignmentShifter_uid17_fpAccTest_in <= rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q;
    rightShiftStage1Idx1Rng16_uid120_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage1Idx1Rng16_uid120_alignmentShifter_uid17_fpAccTest_in(138 downto 16);

    -- rightShiftStage1Idx1_uid122_alignmentShifter_uid17_fpAccTest(BITJOIN,121)@2
    rightShiftStage1Idx1_uid122_alignmentShifter_uid17_fpAccTest_q <= zs_uid78_zeroCounter_uid37_fpAccTest_q & rightShiftStage1Idx1Rng16_uid120_alignmentShifter_uid17_fpAccTest_b;

    -- rightShiftStage0Idx2Pad128_uid115_alignmentShifter_uid17_fpAccTest(CONSTANT,114)
    rightShiftStage0Idx2Pad128_uid115_alignmentShifter_uid17_fpAccTest_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng128_uid114_alignmentShifter_uid17_fpAccTest(BITSELECT,113)@1
    rightShiftStage0Idx2Rng128_uid114_alignmentShifter_uid17_fpAccTest_in <= rightPaddedIn_uid18_fpAccTest_q;
    rightShiftStage0Idx2Rng128_uid114_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage0Idx2Rng128_uid114_alignmentShifter_uid17_fpAccTest_in(138 downto 128);

    -- rightShiftStage0Idx2_uid116_alignmentShifter_uid17_fpAccTest(BITJOIN,115)@1
    rightShiftStage0Idx2_uid116_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage0Idx2Pad128_uid115_alignmentShifter_uid17_fpAccTest_q & rightShiftStage0Idx2Rng128_uid114_alignmentShifter_uid17_fpAccTest_b;

    -- zs_uid64_zeroCounter_uid37_fpAccTest(CONSTANT,63)
    zs_uid64_zeroCounter_uid37_fpAccTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx1Rng64_uid111_alignmentShifter_uid17_fpAccTest(BITSELECT,110)@1
    rightShiftStage0Idx1Rng64_uid111_alignmentShifter_uid17_fpAccTest_in <= rightPaddedIn_uid18_fpAccTest_q;
    rightShiftStage0Idx1Rng64_uid111_alignmentShifter_uid17_fpAccTest_b <= rightShiftStage0Idx1Rng64_uid111_alignmentShifter_uid17_fpAccTest_in(138 downto 64);

    -- rightShiftStage0Idx1_uid113_alignmentShifter_uid17_fpAccTest(BITJOIN,112)@1
    rightShiftStage0Idx1_uid113_alignmentShifter_uid17_fpAccTest_q <= zs_uid64_zeroCounter_uid37_fpAccTest_q & rightShiftStage0Idx1Rng64_uid111_alignmentShifter_uid17_fpAccTest_b;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- fracX_uid7_fpAccTest(BITSELECT,6)@0
    fracX_uid7_fpAccTest_in <= x;
    fracX_uid7_fpAccTest_b <= fracX_uid7_fpAccTest_in(51 downto 0);

    -- redist31(DELAY,225)
    redist31 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracX_uid7_fpAccTest_b, xout => redist31_q, ena => en(0), clk => clk, aclr => areset );

    -- oFracX_uid10_fpAccTest(BITJOIN,9)@1
    oFracX_uid10_fpAccTest_q <= VCC_q & redist31_q;

    -- padConst_uid17_fpAccTest(CONSTANT,16)
    padConst_uid17_fpAccTest_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightPaddedIn_uid18_fpAccTest(BITJOIN,17)@1
    rightPaddedIn_uid18_fpAccTest_q <= oFracX_uid10_fpAccTest_q & padConst_uid17_fpAccTest_q;

    -- expX_uid6_fpAccTest(BITSELECT,5)@0
    expX_uid6_fpAccTest_in <= x;
    expX_uid6_fpAccTest_b <= expX_uid6_fpAccTest_in(62 downto 52);

    -- rShiftConstant_uid15_fpAccTest(CONSTANT,14)
    rShiftConstant_uid15_fpAccTest_q <= "010000100001";

    -- rightShiftValue_uid16_fpAccTest(SUB,15)@0 + 1
    rightShiftValue_uid16_fpAccTest_a <= STD_LOGIC_VECTOR("0" & rShiftConstant_uid15_fpAccTest_q);
    rightShiftValue_uid16_fpAccTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpAccTest_b);
    rightShiftValue_uid16_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftValue_uid16_fpAccTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                rightShiftValue_uid16_fpAccTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rightShiftValue_uid16_fpAccTest_a) - UNSIGNED(rightShiftValue_uid16_fpAccTest_b));
            END IF;
        END IF;
    END PROCESS;
    rightShiftValue_uid16_fpAccTest_q <= rightShiftValue_uid16_fpAccTest_o(12 downto 0);

    -- rightShiftStageSel7Dto6_uid118_alignmentShifter_uid17_fpAccTest(BITSELECT,117)@1
    rightShiftStageSel7Dto6_uid118_alignmentShifter_uid17_fpAccTest_in <= rightShiftValue_uid16_fpAccTest_q(7 downto 0);
    rightShiftStageSel7Dto6_uid118_alignmentShifter_uid17_fpAccTest_b <= rightShiftStageSel7Dto6_uid118_alignmentShifter_uid17_fpAccTest_in(7 downto 6);

    -- rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest(MUX,118)@1 + 1
    rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_s <= rightShiftStageSel7Dto6_uid118_alignmentShifter_uid17_fpAccTest_b;
    rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_s) IS
                    WHEN "00" => rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q <= rightPaddedIn_uid18_fpAccTest_q;
                    WHEN "01" => rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage0Idx1_uid113_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "10" => rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage0Idx2_uid116_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "11" => rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage0Idx3_uid117_alignmentShifter_uid17_fpAccTest_q;
                    WHEN OTHERS => rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStageSel5Dto4_uid129_alignmentShifter_uid17_fpAccTest(BITSELECT,128)@1
    rightShiftStageSel5Dto4_uid129_alignmentShifter_uid17_fpAccTest_in <= rightShiftValue_uid16_fpAccTest_q(5 downto 0);
    rightShiftStageSel5Dto4_uid129_alignmentShifter_uid17_fpAccTest_b <= rightShiftStageSel5Dto4_uid129_alignmentShifter_uid17_fpAccTest_in(5 downto 4);

    -- redist4(DELAY,198)
    redist4 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid129_alignmentShifter_uid17_fpAccTest_b, xout => redist4_q, ena => en(0), clk => clk, aclr => areset );

    -- rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest(MUX,129)@2 + 1
    rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_s <= redist4_q;
    rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_s) IS
                    WHEN "00" => rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage0_uid119_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "01" => rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage1Idx1_uid122_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "10" => rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage1Idx2_uid125_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "11" => rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage1Idx3_uid128_alignmentShifter_uid17_fpAccTest_q;
                    WHEN OTHERS => rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStageSel3Dto2_uid140_alignmentShifter_uid17_fpAccTest(BITSELECT,139)@1
    rightShiftStageSel3Dto2_uid140_alignmentShifter_uid17_fpAccTest_in <= rightShiftValue_uid16_fpAccTest_q(3 downto 0);
    rightShiftStageSel3Dto2_uid140_alignmentShifter_uid17_fpAccTest_b <= rightShiftStageSel3Dto2_uid140_alignmentShifter_uid17_fpAccTest_in(3 downto 2);

    -- redist3(DELAY,197)
    redist3 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid140_alignmentShifter_uid17_fpAccTest_b, xout => redist3_q, ena => en(0), clk => clk, aclr => areset );

    -- rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest(MUX,140)@3 + 1
    rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_s <= redist3_q;
    rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_s) IS
                    WHEN "00" => rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage1_uid130_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "01" => rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage2Idx1_uid133_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "10" => rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage2Idx2_uid136_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "11" => rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage2Idx3_uid139_alignmentShifter_uid17_fpAccTest_q;
                    WHEN OTHERS => rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStageSel1Dto0_uid151_alignmentShifter_uid17_fpAccTest(BITSELECT,150)@1
    rightShiftStageSel1Dto0_uid151_alignmentShifter_uid17_fpAccTest_in <= rightShiftValue_uid16_fpAccTest_q(1 downto 0);
    rightShiftStageSel1Dto0_uid151_alignmentShifter_uid17_fpAccTest_b <= rightShiftStageSel1Dto0_uid151_alignmentShifter_uid17_fpAccTest_in(1 downto 0);

    -- redist2(DELAY,196)
    redist2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel1Dto0_uid151_alignmentShifter_uid17_fpAccTest_b, xout => redist2_q, ena => en(0), clk => clk, aclr => areset );

    -- rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest(MUX,151)@4 + 1
    rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_s <= redist2_q;
    rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_s) IS
                    WHEN "00" => rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage2_uid141_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "01" => rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage3Idx1_uid144_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "10" => rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage3Idx2_uid147_alignmentShifter_uid17_fpAccTest_q;
                    WHEN "11" => rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage3Idx3_uid150_alignmentShifter_uid17_fpAccTest_q;
                    WHEN OTHERS => rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- wIntCst_uid109_alignmentShifter_uid17_fpAccTest(CONSTANT,108)
    wIntCst_uid109_alignmentShifter_uid17_fpAccTest_q <= "10001011";

    -- shiftedOut_uid110_alignmentShifter_uid17_fpAccTest(COMPARE,109)@1 + 1
    shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_a <= STD_LOGIC_VECTOR("00" & rightShiftValue_uid16_fpAccTest_q);
    shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_b <= STD_LOGIC_VECTOR("0000000" & wIntCst_uid109_alignmentShifter_uid17_fpAccTest_q);
    shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_a) - UNSIGNED(shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_b));
            END IF;
        END IF;
    END PROCESS;
    shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_n(0) <= not (shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_o(14));

    -- redist5(DELAY,199)
    redist5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftedOut_uid110_alignmentShifter_uid17_fpAccTest_n, xout => redist5_q, ena => en(0), clk => clk, aclr => areset );

    -- r_uid154_alignmentShifter_uid17_fpAccTest(MUX,153)@5
    r_uid154_alignmentShifter_uid17_fpAccTest_s <= redist5_q;
    r_uid154_alignmentShifter_uid17_fpAccTest_combproc: PROCESS (r_uid154_alignmentShifter_uid17_fpAccTest_s, en, rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q, rightShiftStage0Idx3_uid117_alignmentShifter_uid17_fpAccTest_q)
    BEGIN
        CASE (r_uid154_alignmentShifter_uid17_fpAccTest_s) IS
            WHEN "0" => r_uid154_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage3_uid152_alignmentShifter_uid17_fpAccTest_q;
            WHEN "1" => r_uid154_alignmentShifter_uid17_fpAccTest_q <= rightShiftStage0Idx3_uid117_alignmentShifter_uid17_fpAccTest_q;
            WHEN OTHERS => r_uid154_alignmentShifter_uid17_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftedFracUpper_uid20_fpAccTest(BITSELECT,19)@5
    shiftedFracUpper_uid20_fpAccTest_in <= r_uid154_alignmentShifter_uid17_fpAccTest_q;
    shiftedFracUpper_uid20_fpAccTest_b <= shiftedFracUpper_uid20_fpAccTest_in(138 downto 53);

    -- extendedAlignedShiftedFrac_uid21_fpAccTest(BITJOIN,20)@5
    extendedAlignedShiftedFrac_uid21_fpAccTest_q <= GND_q & shiftedFracUpper_uid20_fpAccTest_b;

    -- onesComplementExtendedFrac_uid22_fpAccTest(LOGICAL,21)@5 + 1
    onesComplementExtendedFrac_uid22_fpAccTest_a <= STD_LOGIC_VECTOR(extendedAlignedShiftedFrac_uid21_fpAccTest_q);
    onesComplementExtendedFrac_uid22_fpAccTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((86 downto 1 => redist29_q(0)) & redist29_q));
    onesComplementExtendedFrac_uid22_fpAccTest_qi <= onesComplementExtendedFrac_uid22_fpAccTest_a xor onesComplementExtendedFrac_uid22_fpAccTest_b;
    onesComplementExtendedFrac_uid22_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 87, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => onesComplementExtendedFrac_uid22_fpAccTest_qi, xout => onesComplementExtendedFrac_uid22_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- accumulator_uid24_fpAccTest(ADD,23)@6 + 1
    accumulator_uid24_fpAccTest_cin <= redist30_q;
    accumulator_uid24_fpAccTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((95 downto 94 => sum_uid27_fpAccTest_b(93)) & sum_uid27_fpAccTest_b) & '1');
    accumulator_uid24_fpAccTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((95 downto 87 => onesComplementExtendedFrac_uid22_fpAccTest_q(86)) & onesComplementExtendedFrac_uid22_fpAccTest_q) & accumulator_uid24_fpAccTest_cin(0));
    accumulator_uid24_fpAccTest_i <= accumulator_uid24_fpAccTest_b;
    accumulator_uid24_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            accumulator_uid24_fpAccTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (redist32_q = "1") THEN
                    accumulator_uid24_fpAccTest_o <= accumulator_uid24_fpAccTest_i;
                ELSE
                    accumulator_uid24_fpAccTest_o <= STD_LOGIC_VECTOR(SIGNED(accumulator_uid24_fpAccTest_a) + SIGNED(accumulator_uid24_fpAccTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    accumulator_uid24_fpAccTest_c(0) <= accumulator_uid24_fpAccTest_o(96);
    accumulator_uid24_fpAccTest_q <= accumulator_uid24_fpAccTest_o(95 downto 1);

    -- os_uid25_fpAccTest(BITJOIN,24)@7
    os_uid25_fpAccTest_q <= accumulator_uid24_fpAccTest_c & accumulator_uid24_fpAccTest_q;

    -- osr_uid26_fpAccTest(BITSELECT,25)@7
    osr_uid26_fpAccTest_in <= STD_LOGIC_VECTOR(os_uid25_fpAccTest_q(94 downto 0));
    osr_uid26_fpAccTest_b <= STD_LOGIC_VECTOR(osr_uid26_fpAccTest_in(94 downto 0));

    -- sum_uid27_fpAccTest(BITSELECT,26)@7
    sum_uid27_fpAccTest_in <= STD_LOGIC_VECTOR(osr_uid26_fpAccTest_b(93 downto 0));
    sum_uid27_fpAccTest_b <= STD_LOGIC_VECTOR(sum_uid27_fpAccTest_in(93 downto 0));

    -- accumulatorSign_uid29_fpAccTest(BITSELECT,28)@7
    accumulatorSign_uid29_fpAccTest_in <= sum_uid27_fpAccTest_b(92 downto 0);
    accumulatorSign_uid29_fpAccTest_b <= accumulatorSign_uid29_fpAccTest_in(92 downto 92);

    -- accOverflowBitMSB_uid30_fpAccTest(BITSELECT,29)@7
    accOverflowBitMSB_uid30_fpAccTest_in <= sum_uid27_fpAccTest_b;
    accOverflowBitMSB_uid30_fpAccTest_b <= accOverflowBitMSB_uid30_fpAccTest_in(93 downto 93);

    -- accOverflow_uid32_fpAccTest(LOGICAL,31)@7
    accOverflow_uid32_fpAccTest_a <= accOverflowBitMSB_uid30_fpAccTest_b;
    accOverflow_uid32_fpAccTest_b <= accumulatorSign_uid29_fpAccTest_b;
    accOverflow_uid32_fpAccTest_q <= accOverflow_uid32_fpAccTest_a xor accOverflow_uid32_fpAccTest_b;

    -- muxAccOverflowFeedbackSignal_uid59_fpAccTest(MUX,58)@6 + 1
    muxAccOverflowFeedbackSignal_uid59_fpAccTest_s <= redist32_q;
    muxAccOverflowFeedbackSignal_uid59_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            muxAccOverflowFeedbackSignal_uid59_fpAccTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (muxAccOverflowFeedbackSignal_uid59_fpAccTest_s) IS
                    WHEN "0" => muxAccOverflowFeedbackSignal_uid59_fpAccTest_q <= oRAccOverflowFlagFeedback_uid60_fpAccTest_q;
                    WHEN "1" => muxAccOverflowFeedbackSignal_uid59_fpAccTest_q <= GND_q;
                    WHEN OTHERS => muxAccOverflowFeedbackSignal_uid59_fpAccTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- oRAccOverflowFlagFeedback_uid60_fpAccTest(LOGICAL,59)@7
    oRAccOverflowFlagFeedback_uid60_fpAccTest_a <= muxAccOverflowFeedbackSignal_uid59_fpAccTest_q;
    oRAccOverflowFlagFeedback_uid60_fpAccTest_b <= accOverflow_uid32_fpAccTest_q;
    oRAccOverflowFlagFeedback_uid60_fpAccTest_q <= oRAccOverflowFlagFeedback_uid60_fpAccTest_a or oRAccOverflowFlagFeedback_uid60_fpAccTest_b;

    -- redist22(DELAY,216)
    redist22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => oRAccOverflowFlagFeedback_uid60_fpAccTest_q, xout => redist22_q, ena => en(0), clk => clk, aclr => areset );

    -- expLTLSBA_uid11_fpAccTest(CONSTANT,10)
    expLTLSBA_uid11_fpAccTest_q <= "01111001011";

    -- cmpLT_expX_expLTLSBA_uid12_fpAccTest(COMPARE,11)@0
    cmpLT_expX_expLTLSBA_uid12_fpAccTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpAccTest_b);
    cmpLT_expX_expLTLSBA_uid12_fpAccTest_b <= STD_LOGIC_VECTOR("00" & expLTLSBA_uid11_fpAccTest_q);
    cmpLT_expX_expLTLSBA_uid12_fpAccTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpLT_expX_expLTLSBA_uid12_fpAccTest_a) - UNSIGNED(cmpLT_expX_expLTLSBA_uid12_fpAccTest_b));
    cmpLT_expX_expLTLSBA_uid12_fpAccTest_c(0) <= cmpLT_expX_expLTLSBA_uid12_fpAccTest_o(12);

    -- muxXUnderflowFeedbackSignal_uid55_fpAccTest(MUX,54)@0
    muxXUnderflowFeedbackSignal_uid55_fpAccTest_s <= n;
    muxXUnderflowFeedbackSignal_uid55_fpAccTest_combproc: PROCESS (muxXUnderflowFeedbackSignal_uid55_fpAccTest_s, en, oRXUnderflowFlagFeedback_uid56_fpAccTest_q, GND_q)
    BEGIN
        CASE (muxXUnderflowFeedbackSignal_uid55_fpAccTest_s) IS
            WHEN "0" => muxXUnderflowFeedbackSignal_uid55_fpAccTest_q <= oRXUnderflowFlagFeedback_uid56_fpAccTest_q;
            WHEN "1" => muxXUnderflowFeedbackSignal_uid55_fpAccTest_q <= GND_q;
            WHEN OTHERS => muxXUnderflowFeedbackSignal_uid55_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oRXUnderflowFlagFeedback_uid56_fpAccTest(LOGICAL,55)@0 + 1
    oRXUnderflowFlagFeedback_uid56_fpAccTest_a <= muxXUnderflowFeedbackSignal_uid55_fpAccTest_q;
    oRXUnderflowFlagFeedback_uid56_fpAccTest_b <= cmpLT_expX_expLTLSBA_uid12_fpAccTest_c;
    oRXUnderflowFlagFeedback_uid56_fpAccTest_qi <= oRXUnderflowFlagFeedback_uid56_fpAccTest_a or oRXUnderflowFlagFeedback_uid56_fpAccTest_b;
    oRXUnderflowFlagFeedback_uid56_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oRXUnderflowFlagFeedback_uid56_fpAccTest_qi, xout => oRXUnderflowFlagFeedback_uid56_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist23(DELAY,217)
    redist23 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => oRXUnderflowFlagFeedback_uid56_fpAccTest_q, xout => redist23_q, ena => en(0), clk => clk, aclr => areset );

    -- expGTMaxMSBX_uid13_fpAccTest(CONSTANT,12)
    expGTMaxMSBX_uid13_fpAccTest_q <= "10000100001";

    -- cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest(COMPARE,13)@0
    cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_a <= STD_LOGIC_VECTOR("00" & expGTMaxMSBX_uid13_fpAccTest_q);
    cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpAccTest_b);
    cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_a) - UNSIGNED(cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_b));
    cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_c(0) <= cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_o(12);

    -- muxXOverflowFeedbackSignal_uid51_fpAccTest(MUX,50)@0
    muxXOverflowFeedbackSignal_uid51_fpAccTest_s <= n;
    muxXOverflowFeedbackSignal_uid51_fpAccTest_combproc: PROCESS (muxXOverflowFeedbackSignal_uid51_fpAccTest_s, en, oRXOverflowFlagFeedback_uid52_fpAccTest_q, GND_q)
    BEGIN
        CASE (muxXOverflowFeedbackSignal_uid51_fpAccTest_s) IS
            WHEN "0" => muxXOverflowFeedbackSignal_uid51_fpAccTest_q <= oRXOverflowFlagFeedback_uid52_fpAccTest_q;
            WHEN "1" => muxXOverflowFeedbackSignal_uid51_fpAccTest_q <= GND_q;
            WHEN OTHERS => muxXOverflowFeedbackSignal_uid51_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oRXOverflowFlagFeedback_uid52_fpAccTest(LOGICAL,51)@0 + 1
    oRXOverflowFlagFeedback_uid52_fpAccTest_a <= muxXOverflowFeedbackSignal_uid51_fpAccTest_q;
    oRXOverflowFlagFeedback_uid52_fpAccTest_b <= cmpGT_expX_expGTMaxMSBX_uid14_fpAccTest_c;
    oRXOverflowFlagFeedback_uid52_fpAccTest_qi <= oRXOverflowFlagFeedback_uid52_fpAccTest_a or oRXOverflowFlagFeedback_uid52_fpAccTest_b;
    oRXOverflowFlagFeedback_uid52_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oRXOverflowFlagFeedback_uid52_fpAccTest_qi, xout => oRXOverflowFlagFeedback_uid52_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist24(DELAY,218)
    redist24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => oRXOverflowFlagFeedback_uid52_fpAccTest_q, xout => redist24_q, ena => en(0), clk => clk, aclr => areset );

    -- redist27(DELAY,221)
    redist27 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => accumulatorSign_uid29_fpAccTest_b, xout => redist27_q, ena => en(0), clk => clk, aclr => areset );

    -- redist28(DELAY,222)
    redist28 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist27_q, xout => redist28_q, ena => en(0), clk => clk, aclr => areset );

    -- zeroExponent_uid42_fpAccTest(CONSTANT,41)
    zeroExponent_uid42_fpAccTest_q <= "00000000000";

    -- accValidRange_uid33_fpAccTest(BITSELECT,32)@7
    accValidRange_uid33_fpAccTest_in <= sum_uid27_fpAccTest_b(92 downto 0);
    accValidRange_uid33_fpAccTest_b <= accValidRange_uid33_fpAccTest_in(92 downto 0);

    -- accOnesComplement_uid34_fpAccTest(LOGICAL,33)@7 + 1
    accOnesComplement_uid34_fpAccTest_a <= accValidRange_uid33_fpAccTest_b;
    accOnesComplement_uid34_fpAccTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((92 downto 1 => accumulatorSign_uid29_fpAccTest_b(0)) & accumulatorSign_uid29_fpAccTest_b));
    accOnesComplement_uid34_fpAccTest_qi <= accOnesComplement_uid34_fpAccTest_a xor accOnesComplement_uid34_fpAccTest_b;
    accOnesComplement_uid34_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 93, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => accOnesComplement_uid34_fpAccTest_qi, xout => accOnesComplement_uid34_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- accValuePositive_uid35_fpAccTest(ADD,34)@8 + 1
    accValuePositive_uid35_fpAccTest_a <= STD_LOGIC_VECTOR("0" & accOnesComplement_uid34_fpAccTest_q);
    accValuePositive_uid35_fpAccTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" & redist27_q);
    accValuePositive_uid35_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            accValuePositive_uid35_fpAccTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                accValuePositive_uid35_fpAccTest_o <= STD_LOGIC_VECTOR(UNSIGNED(accValuePositive_uid35_fpAccTest_a) + UNSIGNED(accValuePositive_uid35_fpAccTest_b));
            END IF;
        END IF;
    END PROCESS;
    accValuePositive_uid35_fpAccTest_q <= accValuePositive_uid35_fpAccTest_o(93 downto 0);

    -- posAccWoLeadingZeroBit_uid36_fpAccTest(BITSELECT,35)@9
    posAccWoLeadingZeroBit_uid36_fpAccTest_in <= accValuePositive_uid35_fpAccTest_q(91 downto 0);
    posAccWoLeadingZeroBit_uid36_fpAccTest_b <= posAccWoLeadingZeroBit_uid36_fpAccTest_in(91 downto 0);

    -- rVStage_uid65_zeroCounter_uid37_fpAccTest(BITSELECT,64)@9
    rVStage_uid65_zeroCounter_uid37_fpAccTest_in <= posAccWoLeadingZeroBit_uid36_fpAccTest_b;
    rVStage_uid65_zeroCounter_uid37_fpAccTest_b <= rVStage_uid65_zeroCounter_uid37_fpAccTest_in(91 downto 28);

    -- vCount_uid66_zeroCounter_uid37_fpAccTest(LOGICAL,65)@9 + 1
    vCount_uid66_zeroCounter_uid37_fpAccTest_a <= rVStage_uid65_zeroCounter_uid37_fpAccTest_b;
    vCount_uid66_zeroCounter_uid37_fpAccTest_b <= zs_uid64_zeroCounter_uid37_fpAccTest_q;
    vCount_uid66_zeroCounter_uid37_fpAccTest_qi <= "1" WHEN vCount_uid66_zeroCounter_uid37_fpAccTest_a = vCount_uid66_zeroCounter_uid37_fpAccTest_b ELSE "0";
    vCount_uid66_zeroCounter_uid37_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid66_zeroCounter_uid37_fpAccTest_qi, xout => vCount_uid66_zeroCounter_uid37_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist20(DELAY,214)
    redist20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid66_zeroCounter_uid37_fpAccTest_q, xout => redist20_q, ena => en(0), clk => clk, aclr => areset );

    -- vStage_uid68_zeroCounter_uid37_fpAccTest(BITSELECT,67)@9
    vStage_uid68_zeroCounter_uid37_fpAccTest_in <= posAccWoLeadingZeroBit_uid36_fpAccTest_b(27 downto 0);
    vStage_uid68_zeroCounter_uid37_fpAccTest_b <= vStage_uid68_zeroCounter_uid37_fpAccTest_in(27 downto 0);

    -- redist19(DELAY,213)
    redist19 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid68_zeroCounter_uid37_fpAccTest_b, xout => redist19_q, ena => en(0), clk => clk, aclr => areset );

    -- mO_uid67_zeroCounter_uid37_fpAccTest(CONSTANT,66)
    mO_uid67_zeroCounter_uid37_fpAccTest_q <= "111111111111111111111111111111111111";

    -- cStage_uid69_zeroCounter_uid37_fpAccTest(BITJOIN,68)@10
    cStage_uid69_zeroCounter_uid37_fpAccTest_q <= redist19_q & mO_uid67_zeroCounter_uid37_fpAccTest_q;

    -- redist21(DELAY,215)
    redist21 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid65_zeroCounter_uid37_fpAccTest_b, xout => redist21_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid71_zeroCounter_uid37_fpAccTest(MUX,70)@10
    vStagei_uid71_zeroCounter_uid37_fpAccTest_s <= vCount_uid66_zeroCounter_uid37_fpAccTest_q;
    vStagei_uid71_zeroCounter_uid37_fpAccTest_combproc: PROCESS (vStagei_uid71_zeroCounter_uid37_fpAccTest_s, en, redist21_q, cStage_uid69_zeroCounter_uid37_fpAccTest_q)
    BEGIN
        CASE (vStagei_uid71_zeroCounter_uid37_fpAccTest_s) IS
            WHEN "0" => vStagei_uid71_zeroCounter_uid37_fpAccTest_q <= redist21_q;
            WHEN "1" => vStagei_uid71_zeroCounter_uid37_fpAccTest_q <= cStage_uid69_zeroCounter_uid37_fpAccTest_q;
            WHEN OTHERS => vStagei_uid71_zeroCounter_uid37_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid73_zeroCounter_uid37_fpAccTest(BITSELECT,72)@10
    rVStage_uid73_zeroCounter_uid37_fpAccTest_in <= vStagei_uid71_zeroCounter_uid37_fpAccTest_q;
    rVStage_uid73_zeroCounter_uid37_fpAccTest_b <= rVStage_uid73_zeroCounter_uid37_fpAccTest_in(63 downto 32);

    -- vCount_uid74_zeroCounter_uid37_fpAccTest(LOGICAL,73)@10 + 1
    vCount_uid74_zeroCounter_uid37_fpAccTest_a <= rVStage_uid73_zeroCounter_uid37_fpAccTest_b;
    vCount_uid74_zeroCounter_uid37_fpAccTest_b <= zs_uid72_zeroCounter_uid37_fpAccTest_q;
    vCount_uid74_zeroCounter_uid37_fpAccTest_qi <= "1" WHEN vCount_uid74_zeroCounter_uid37_fpAccTest_a = vCount_uid74_zeroCounter_uid37_fpAccTest_b ELSE "0";
    vCount_uid74_zeroCounter_uid37_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid74_zeroCounter_uid37_fpAccTest_qi, xout => vCount_uid74_zeroCounter_uid37_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist17(DELAY,211)
    redist17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid74_zeroCounter_uid37_fpAccTest_q, xout => redist17_q, ena => en(0), clk => clk, aclr => areset );

    -- vStage_uid75_zeroCounter_uid37_fpAccTest(BITSELECT,74)@10
    vStage_uid75_zeroCounter_uid37_fpAccTest_in <= vStagei_uid71_zeroCounter_uid37_fpAccTest_q(31 downto 0);
    vStage_uid75_zeroCounter_uid37_fpAccTest_b <= vStage_uid75_zeroCounter_uid37_fpAccTest_in(31 downto 0);

    -- redist16(DELAY,210)
    redist16 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid75_zeroCounter_uid37_fpAccTest_b, xout => redist16_q, ena => en(0), clk => clk, aclr => areset );

    -- redist18(DELAY,212)
    redist18 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid73_zeroCounter_uid37_fpAccTest_b, xout => redist18_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid77_zeroCounter_uid37_fpAccTest(MUX,76)@11
    vStagei_uid77_zeroCounter_uid37_fpAccTest_s <= vCount_uid74_zeroCounter_uid37_fpAccTest_q;
    vStagei_uid77_zeroCounter_uid37_fpAccTest_combproc: PROCESS (vStagei_uid77_zeroCounter_uid37_fpAccTest_s, en, redist18_q, redist16_q)
    BEGIN
        CASE (vStagei_uid77_zeroCounter_uid37_fpAccTest_s) IS
            WHEN "0" => vStagei_uid77_zeroCounter_uid37_fpAccTest_q <= redist18_q;
            WHEN "1" => vStagei_uid77_zeroCounter_uid37_fpAccTest_q <= redist16_q;
            WHEN OTHERS => vStagei_uid77_zeroCounter_uid37_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid79_zeroCounter_uid37_fpAccTest(BITSELECT,78)@11
    rVStage_uid79_zeroCounter_uid37_fpAccTest_in <= vStagei_uid77_zeroCounter_uid37_fpAccTest_q;
    rVStage_uid79_zeroCounter_uid37_fpAccTest_b <= rVStage_uid79_zeroCounter_uid37_fpAccTest_in(31 downto 16);

    -- vCount_uid80_zeroCounter_uid37_fpAccTest(LOGICAL,79)@11 + 1
    vCount_uid80_zeroCounter_uid37_fpAccTest_a <= rVStage_uid79_zeroCounter_uid37_fpAccTest_b;
    vCount_uid80_zeroCounter_uid37_fpAccTest_b <= zs_uid78_zeroCounter_uid37_fpAccTest_q;
    vCount_uid80_zeroCounter_uid37_fpAccTest_qi <= "1" WHEN vCount_uid80_zeroCounter_uid37_fpAccTest_a = vCount_uid80_zeroCounter_uid37_fpAccTest_b ELSE "0";
    vCount_uid80_zeroCounter_uid37_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid80_zeroCounter_uid37_fpAccTest_qi, xout => vCount_uid80_zeroCounter_uid37_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist14(DELAY,208)
    redist14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid80_zeroCounter_uid37_fpAccTest_q, xout => redist14_q, ena => en(0), clk => clk, aclr => areset );

    -- vStage_uid81_zeroCounter_uid37_fpAccTest(BITSELECT,80)@11
    vStage_uid81_zeroCounter_uid37_fpAccTest_in <= vStagei_uid77_zeroCounter_uid37_fpAccTest_q(15 downto 0);
    vStage_uid81_zeroCounter_uid37_fpAccTest_b <= vStage_uid81_zeroCounter_uid37_fpAccTest_in(15 downto 0);

    -- redist13(DELAY,207)
    redist13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid81_zeroCounter_uid37_fpAccTest_b, xout => redist13_q, ena => en(0), clk => clk, aclr => areset );

    -- redist15(DELAY,209)
    redist15 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid79_zeroCounter_uid37_fpAccTest_b, xout => redist15_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid83_zeroCounter_uid37_fpAccTest(MUX,82)@12
    vStagei_uid83_zeroCounter_uid37_fpAccTest_s <= vCount_uid80_zeroCounter_uid37_fpAccTest_q;
    vStagei_uid83_zeroCounter_uid37_fpAccTest_combproc: PROCESS (vStagei_uid83_zeroCounter_uid37_fpAccTest_s, en, redist15_q, redist13_q)
    BEGIN
        CASE (vStagei_uid83_zeroCounter_uid37_fpAccTest_s) IS
            WHEN "0" => vStagei_uid83_zeroCounter_uid37_fpAccTest_q <= redist15_q;
            WHEN "1" => vStagei_uid83_zeroCounter_uid37_fpAccTest_q <= redist13_q;
            WHEN OTHERS => vStagei_uid83_zeroCounter_uid37_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid85_zeroCounter_uid37_fpAccTest(BITSELECT,84)@12
    rVStage_uid85_zeroCounter_uid37_fpAccTest_in <= vStagei_uid83_zeroCounter_uid37_fpAccTest_q;
    rVStage_uid85_zeroCounter_uid37_fpAccTest_b <= rVStage_uid85_zeroCounter_uid37_fpAccTest_in(15 downto 8);

    -- vCount_uid86_zeroCounter_uid37_fpAccTest(LOGICAL,85)@12 + 1
    vCount_uid86_zeroCounter_uid37_fpAccTest_a <= rVStage_uid85_zeroCounter_uid37_fpAccTest_b;
    vCount_uid86_zeroCounter_uid37_fpAccTest_b <= zs_uid84_zeroCounter_uid37_fpAccTest_q;
    vCount_uid86_zeroCounter_uid37_fpAccTest_qi <= "1" WHEN vCount_uid86_zeroCounter_uid37_fpAccTest_a = vCount_uid86_zeroCounter_uid37_fpAccTest_b ELSE "0";
    vCount_uid86_zeroCounter_uid37_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid86_zeroCounter_uid37_fpAccTest_qi, xout => vCount_uid86_zeroCounter_uid37_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist11(DELAY,205)
    redist11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid86_zeroCounter_uid37_fpAccTest_q, xout => redist11_q, ena => en(0), clk => clk, aclr => areset );

    -- vStage_uid87_zeroCounter_uid37_fpAccTest(BITSELECT,86)@12
    vStage_uid87_zeroCounter_uid37_fpAccTest_in <= vStagei_uid83_zeroCounter_uid37_fpAccTest_q(7 downto 0);
    vStage_uid87_zeroCounter_uid37_fpAccTest_b <= vStage_uid87_zeroCounter_uid37_fpAccTest_in(7 downto 0);

    -- redist10(DELAY,204)
    redist10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid87_zeroCounter_uid37_fpAccTest_b, xout => redist10_q, ena => en(0), clk => clk, aclr => areset );

    -- redist12(DELAY,206)
    redist12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid85_zeroCounter_uid37_fpAccTest_b, xout => redist12_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid89_zeroCounter_uid37_fpAccTest(MUX,88)@13
    vStagei_uid89_zeroCounter_uid37_fpAccTest_s <= vCount_uid86_zeroCounter_uid37_fpAccTest_q;
    vStagei_uid89_zeroCounter_uid37_fpAccTest_combproc: PROCESS (vStagei_uid89_zeroCounter_uid37_fpAccTest_s, en, redist12_q, redist10_q)
    BEGIN
        CASE (vStagei_uid89_zeroCounter_uid37_fpAccTest_s) IS
            WHEN "0" => vStagei_uid89_zeroCounter_uid37_fpAccTest_q <= redist12_q;
            WHEN "1" => vStagei_uid89_zeroCounter_uid37_fpAccTest_q <= redist10_q;
            WHEN OTHERS => vStagei_uid89_zeroCounter_uid37_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid91_zeroCounter_uid37_fpAccTest(BITSELECT,90)@13
    rVStage_uid91_zeroCounter_uid37_fpAccTest_in <= vStagei_uid89_zeroCounter_uid37_fpAccTest_q;
    rVStage_uid91_zeroCounter_uid37_fpAccTest_b <= rVStage_uid91_zeroCounter_uid37_fpAccTest_in(7 downto 4);

    -- vCount_uid92_zeroCounter_uid37_fpAccTest(LOGICAL,91)@13
    vCount_uid92_zeroCounter_uid37_fpAccTest_a <= rVStage_uid91_zeroCounter_uid37_fpAccTest_b;
    vCount_uid92_zeroCounter_uid37_fpAccTest_b <= zs_uid90_zeroCounter_uid37_fpAccTest_q;
    vCount_uid92_zeroCounter_uid37_fpAccTest_q <= "1" WHEN vCount_uid92_zeroCounter_uid37_fpAccTest_a = vCount_uid92_zeroCounter_uid37_fpAccTest_b ELSE "0";

    -- redist9(DELAY,203)
    redist9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid92_zeroCounter_uid37_fpAccTest_q, xout => redist9_q, ena => en(0), clk => clk, aclr => areset );

    -- vStage_uid93_zeroCounter_uid37_fpAccTest(BITSELECT,92)@13
    vStage_uid93_zeroCounter_uid37_fpAccTest_in <= vStagei_uid89_zeroCounter_uid37_fpAccTest_q(3 downto 0);
    vStage_uid93_zeroCounter_uid37_fpAccTest_b <= vStage_uid93_zeroCounter_uid37_fpAccTest_in(3 downto 0);

    -- vStagei_uid95_zeroCounter_uid37_fpAccTest(MUX,94)@13
    vStagei_uid95_zeroCounter_uid37_fpAccTest_s <= vCount_uid92_zeroCounter_uid37_fpAccTest_q;
    vStagei_uid95_zeroCounter_uid37_fpAccTest_combproc: PROCESS (vStagei_uid95_zeroCounter_uid37_fpAccTest_s, en, rVStage_uid91_zeroCounter_uid37_fpAccTest_b, vStage_uid93_zeroCounter_uid37_fpAccTest_b)
    BEGIN
        CASE (vStagei_uid95_zeroCounter_uid37_fpAccTest_s) IS
            WHEN "0" => vStagei_uid95_zeroCounter_uid37_fpAccTest_q <= rVStage_uid91_zeroCounter_uid37_fpAccTest_b;
            WHEN "1" => vStagei_uid95_zeroCounter_uid37_fpAccTest_q <= vStage_uid93_zeroCounter_uid37_fpAccTest_b;
            WHEN OTHERS => vStagei_uid95_zeroCounter_uid37_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid97_zeroCounter_uid37_fpAccTest(BITSELECT,96)@13
    rVStage_uid97_zeroCounter_uid37_fpAccTest_in <= vStagei_uid95_zeroCounter_uid37_fpAccTest_q;
    rVStage_uid97_zeroCounter_uid37_fpAccTest_b <= rVStage_uid97_zeroCounter_uid37_fpAccTest_in(3 downto 2);

    -- redist8(DELAY,202)
    redist8 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid97_zeroCounter_uid37_fpAccTest_b, xout => redist8_q, ena => en(0), clk => clk, aclr => areset );

    -- vCount_uid98_zeroCounter_uid37_fpAccTest(LOGICAL,97)@14
    vCount_uid98_zeroCounter_uid37_fpAccTest_a <= redist8_q;
    vCount_uid98_zeroCounter_uid37_fpAccTest_b <= zs_uid96_zeroCounter_uid37_fpAccTest_q;
    vCount_uid98_zeroCounter_uid37_fpAccTest_q <= "1" WHEN vCount_uid98_zeroCounter_uid37_fpAccTest_a = vCount_uid98_zeroCounter_uid37_fpAccTest_b ELSE "0";

    -- vStage_uid99_zeroCounter_uid37_fpAccTest(BITSELECT,98)@13
    vStage_uid99_zeroCounter_uid37_fpAccTest_in <= vStagei_uid95_zeroCounter_uid37_fpAccTest_q(1 downto 0);
    vStage_uid99_zeroCounter_uid37_fpAccTest_b <= vStage_uid99_zeroCounter_uid37_fpAccTest_in(1 downto 0);

    -- redist7(DELAY,201)
    redist7 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid99_zeroCounter_uid37_fpAccTest_b, xout => redist7_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid101_zeroCounter_uid37_fpAccTest(MUX,100)@14
    vStagei_uid101_zeroCounter_uid37_fpAccTest_s <= vCount_uid98_zeroCounter_uid37_fpAccTest_q;
    vStagei_uid101_zeroCounter_uid37_fpAccTest_combproc: PROCESS (vStagei_uid101_zeroCounter_uid37_fpAccTest_s, en, redist8_q, redist7_q)
    BEGIN
        CASE (vStagei_uid101_zeroCounter_uid37_fpAccTest_s) IS
            WHEN "0" => vStagei_uid101_zeroCounter_uid37_fpAccTest_q <= redist8_q;
            WHEN "1" => vStagei_uid101_zeroCounter_uid37_fpAccTest_q <= redist7_q;
            WHEN OTHERS => vStagei_uid101_zeroCounter_uid37_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid103_zeroCounter_uid37_fpAccTest(BITSELECT,102)@14
    rVStage_uid103_zeroCounter_uid37_fpAccTest_in <= vStagei_uid101_zeroCounter_uid37_fpAccTest_q;
    rVStage_uid103_zeroCounter_uid37_fpAccTest_b <= rVStage_uid103_zeroCounter_uid37_fpAccTest_in(1 downto 1);

    -- vCount_uid104_zeroCounter_uid37_fpAccTest(LOGICAL,103)@14
    vCount_uid104_zeroCounter_uid37_fpAccTest_a <= rVStage_uid103_zeroCounter_uid37_fpAccTest_b;
    vCount_uid104_zeroCounter_uid37_fpAccTest_b <= GND_q;
    vCount_uid104_zeroCounter_uid37_fpAccTest_q <= "1" WHEN vCount_uid104_zeroCounter_uid37_fpAccTest_a = vCount_uid104_zeroCounter_uid37_fpAccTest_b ELSE "0";

    -- r_uid105_zeroCounter_uid37_fpAccTest(BITJOIN,104)@14
    r_uid105_zeroCounter_uid37_fpAccTest_q <= redist20_q & redist17_q & redist14_q & redist11_q & redist9_q & vCount_uid98_zeroCounter_uid37_fpAccTest_q & vCount_uid104_zeroCounter_uid37_fpAccTest_q;

    -- redist6(DELAY,200)
    redist6 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid105_zeroCounter_uid37_fpAccTest_q, xout => redist6_q, ena => en(0), clk => clk, aclr => areset );

    -- expRBias_uid41_fpAccTest(CONSTANT,40)
    expRBias_uid41_fpAccTest_q <= "010000100111";

    -- resExpSub_uid43_fpAccTest(SUB,42)@15
    resExpSub_uid43_fpAccTest_a <= STD_LOGIC_VECTOR("0" & expRBias_uid41_fpAccTest_q);
    resExpSub_uid43_fpAccTest_b <= STD_LOGIC_VECTOR("000000" & redist6_q);
    resExpSub_uid43_fpAccTest_o <= STD_LOGIC_VECTOR(UNSIGNED(resExpSub_uid43_fpAccTest_a) - UNSIGNED(resExpSub_uid43_fpAccTest_b));
    resExpSub_uid43_fpAccTest_q <= resExpSub_uid43_fpAccTest_o(12 downto 0);

    -- finalExponent_uid44_fpAccTest(BITSELECT,43)@15
    finalExponent_uid44_fpAccTest_in <= resExpSub_uid43_fpAccTest_q(10 downto 0);
    finalExponent_uid44_fpAccTest_b <= finalExponent_uid44_fpAccTest_in(10 downto 0);

    -- redist25(DELAY,219)
    redist25 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => finalExponent_uid44_fpAccTest_b, xout => redist25_q, ena => en(0), clk => clk, aclr => areset );

    -- ShiftedOutComparator_uid38_fpAccTest(CONSTANT,37)
    ShiftedOutComparator_uid38_fpAccTest_q <= "1011100";

    -- accResOutOfExpRange_uid39_fpAccTest(LOGICAL,38)@15 + 1
    accResOutOfExpRange_uid39_fpAccTest_a <= ShiftedOutComparator_uid38_fpAccTest_q;
    accResOutOfExpRange_uid39_fpAccTest_b <= redist6_q;
    accResOutOfExpRange_uid39_fpAccTest_qi <= "1" WHEN accResOutOfExpRange_uid39_fpAccTest_a = accResOutOfExpRange_uid39_fpAccTest_b ELSE "0";
    accResOutOfExpRange_uid39_fpAccTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => accResOutOfExpRange_uid39_fpAccTest_qi, xout => accResOutOfExpRange_uid39_fpAccTest_q, ena => en(0), clk => clk, aclr => areset );

    -- finalExpUpdated_uid45_fpAccTest(MUX,44)@16
    finalExpUpdated_uid45_fpAccTest_s <= accResOutOfExpRange_uid39_fpAccTest_q;
    finalExpUpdated_uid45_fpAccTest_combproc: PROCESS (finalExpUpdated_uid45_fpAccTest_s, en, redist25_q, zeroExponent_uid42_fpAccTest_q)
    BEGIN
        CASE (finalExpUpdated_uid45_fpAccTest_s) IS
            WHEN "0" => finalExpUpdated_uid45_fpAccTest_q <= redist25_q;
            WHEN "1" => finalExpUpdated_uid45_fpAccTest_q <= zeroExponent_uid42_fpAccTest_q;
            WHEN OTHERS => finalExpUpdated_uid45_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage3Idx1Rng1_uid190_normalizationShifter_uid40_fpAccTest(BITSELECT,189)@16
    leftShiftStage3Idx1Rng1_uid190_normalizationShifter_uid40_fpAccTest_in <= leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q(92 downto 0);
    leftShiftStage3Idx1Rng1_uid190_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage3Idx1Rng1_uid190_normalizationShifter_uid40_fpAccTest_in(92 downto 0);

    -- leftShiftStage3Idx1_uid191_normalizationShifter_uid40_fpAccTest(BITJOIN,190)@16
    leftShiftStage3Idx1_uid191_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage3Idx1Rng1_uid190_normalizationShifter_uid40_fpAccTest_b & GND_q;

    -- leftShiftStage2Idx3Rng6_uid185_normalizationShifter_uid40_fpAccTest(BITSELECT,184)@16
    leftShiftStage2Idx3Rng6_uid185_normalizationShifter_uid40_fpAccTest_in <= leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q(87 downto 0);
    leftShiftStage2Idx3Rng6_uid185_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage2Idx3Rng6_uid185_normalizationShifter_uid40_fpAccTest_in(87 downto 0);

    -- leftShiftStage2Idx3Pad6_uid184_normalizationShifter_uid40_fpAccTest(CONSTANT,183)
    leftShiftStage2Idx3Pad6_uid184_normalizationShifter_uid40_fpAccTest_q <= "000000";

    -- leftShiftStage2Idx3_uid186_normalizationShifter_uid40_fpAccTest(BITJOIN,185)@16
    leftShiftStage2Idx3_uid186_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage2Idx3Rng6_uid185_normalizationShifter_uid40_fpAccTest_b & leftShiftStage2Idx3Pad6_uid184_normalizationShifter_uid40_fpAccTest_q;

    -- leftShiftStage2Idx2Rng4_uid182_normalizationShifter_uid40_fpAccTest(BITSELECT,181)@16
    leftShiftStage2Idx2Rng4_uid182_normalizationShifter_uid40_fpAccTest_in <= leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q(89 downto 0);
    leftShiftStage2Idx2Rng4_uid182_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage2Idx2Rng4_uid182_normalizationShifter_uid40_fpAccTest_in(89 downto 0);

    -- leftShiftStage2Idx2_uid183_normalizationShifter_uid40_fpAccTest(BITJOIN,182)@16
    leftShiftStage2Idx2_uid183_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage2Idx2Rng4_uid182_normalizationShifter_uid40_fpAccTest_b & zs_uid90_zeroCounter_uid37_fpAccTest_q;

    -- leftShiftStage2Idx1Rng2_uid179_normalizationShifter_uid40_fpAccTest(BITSELECT,178)@16
    leftShiftStage2Idx1Rng2_uid179_normalizationShifter_uid40_fpAccTest_in <= leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q(91 downto 0);
    leftShiftStage2Idx1Rng2_uid179_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage2Idx1Rng2_uid179_normalizationShifter_uid40_fpAccTest_in(91 downto 0);

    -- leftShiftStage2Idx1_uid180_normalizationShifter_uid40_fpAccTest(BITJOIN,179)@16
    leftShiftStage2Idx1_uid180_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage2Idx1Rng2_uid179_normalizationShifter_uid40_fpAccTest_b & zs_uid96_zeroCounter_uid37_fpAccTest_q;

    -- leftShiftStage1Idx3Rng24_uid174_normalizationShifter_uid40_fpAccTest(BITSELECT,173)@15
    leftShiftStage1Idx3Rng24_uid174_normalizationShifter_uid40_fpAccTest_in <= leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q(69 downto 0);
    leftShiftStage1Idx3Rng24_uid174_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage1Idx3Rng24_uid174_normalizationShifter_uid40_fpAccTest_in(69 downto 0);

    -- leftShiftStage1Idx3Pad24_uid173_normalizationShifter_uid40_fpAccTest(CONSTANT,172)
    leftShiftStage1Idx3Pad24_uid173_normalizationShifter_uid40_fpAccTest_q <= "000000000000000000000000";

    -- leftShiftStage1Idx3_uid175_normalizationShifter_uid40_fpAccTest(BITJOIN,174)@15
    leftShiftStage1Idx3_uid175_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage1Idx3Rng24_uid174_normalizationShifter_uid40_fpAccTest_b & leftShiftStage1Idx3Pad24_uid173_normalizationShifter_uid40_fpAccTest_q;

    -- leftShiftStage1Idx2Rng16_uid171_normalizationShifter_uid40_fpAccTest(BITSELECT,170)@15
    leftShiftStage1Idx2Rng16_uid171_normalizationShifter_uid40_fpAccTest_in <= leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q(77 downto 0);
    leftShiftStage1Idx2Rng16_uid171_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage1Idx2Rng16_uid171_normalizationShifter_uid40_fpAccTest_in(77 downto 0);

    -- leftShiftStage1Idx2_uid172_normalizationShifter_uid40_fpAccTest(BITJOIN,171)@15
    leftShiftStage1Idx2_uid172_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage1Idx2Rng16_uid171_normalizationShifter_uid40_fpAccTest_b & zs_uid78_zeroCounter_uid37_fpAccTest_q;

    -- leftShiftStage1Idx1Rng8_uid168_normalizationShifter_uid40_fpAccTest(BITSELECT,167)@15
    leftShiftStage1Idx1Rng8_uid168_normalizationShifter_uid40_fpAccTest_in <= leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q(85 downto 0);
    leftShiftStage1Idx1Rng8_uid168_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage1Idx1Rng8_uid168_normalizationShifter_uid40_fpAccTest_in(85 downto 0);

    -- leftShiftStage1Idx1_uid169_normalizationShifter_uid40_fpAccTest(BITJOIN,168)@15
    leftShiftStage1Idx1_uid169_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage1Idx1Rng8_uid168_normalizationShifter_uid40_fpAccTest_b & zs_uid84_zeroCounter_uid37_fpAccTest_q;

    -- leftShiftStage0Idx3_uid164_normalizationShifter_uid40_fpAccTest(CONSTANT,163)
    leftShiftStage0Idx3_uid164_normalizationShifter_uid40_fpAccTest_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx2Rng64_uid162_normalizationShifter_uid40_fpAccTest(BITSELECT,161)@14
    leftShiftStage0Idx2Rng64_uid162_normalizationShifter_uid40_fpAccTest_in <= redist26_outputreg_q(29 downto 0);
    leftShiftStage0Idx2Rng64_uid162_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage0Idx2Rng64_uid162_normalizationShifter_uid40_fpAccTest_in(29 downto 0);

    -- leftShiftStage0Idx2_uid163_normalizationShifter_uid40_fpAccTest(BITJOIN,162)@14
    leftShiftStage0Idx2_uid163_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage0Idx2Rng64_uid162_normalizationShifter_uid40_fpAccTest_b & zs_uid64_zeroCounter_uid37_fpAccTest_q;

    -- leftShiftStage0Idx1Rng32_uid159_normalizationShifter_uid40_fpAccTest(BITSELECT,158)@14
    leftShiftStage0Idx1Rng32_uid159_normalizationShifter_uid40_fpAccTest_in <= redist26_outputreg_q(61 downto 0);
    leftShiftStage0Idx1Rng32_uid159_normalizationShifter_uid40_fpAccTest_b <= leftShiftStage0Idx1Rng32_uid159_normalizationShifter_uid40_fpAccTest_in(61 downto 0);

    -- leftShiftStage0Idx1_uid160_normalizationShifter_uid40_fpAccTest(BITJOIN,159)@14
    leftShiftStage0Idx1_uid160_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage0Idx1Rng32_uid159_normalizationShifter_uid40_fpAccTest_b & zs_uid72_zeroCounter_uid37_fpAccTest_q;

    -- redist26_notEnable(LOGICAL,234)
    redist26_notEnable_a <= STD_LOGIC_VECTOR(en);
    redist26_notEnable_q <= not (redist26_notEnable_a);

    -- redist26_nor(LOGICAL,235)
    redist26_nor_a <= STD_LOGIC_VECTOR(redist26_notEnable_q);
    redist26_nor_b <= STD_LOGIC_VECTOR(redist26_sticky_ena_q);
    redist26_nor_q <= not (redist26_nor_a or redist26_nor_b);

    -- redist26_cmpReg(REG,233)
    redist26_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist26_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist26_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_sticky_ena(REG,236)
    redist26_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist26_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist26_nor_q = "1") THEN
                redist26_sticky_ena_q <= STD_LOGIC_VECTOR(redist26_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_enaAnd(LOGICAL,237)
    redist26_enaAnd_a <= STD_LOGIC_VECTOR(redist26_sticky_ena_q);
    redist26_enaAnd_b <= STD_LOGIC_VECTOR(en);
    redist26_enaAnd_q <= redist26_enaAnd_a and redist26_enaAnd_b;

    -- redist26_rdcnt(COUNTER,230)
    -- low=0, high=1, step=1, init=1
    redist26_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist26_rdcnt_i <= TO_UNSIGNED(1, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                redist26_rdcnt_i <= redist26_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist26_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist26_rdcnt_i, 1)));

    -- redist26_rdmux(MUX,231)
    redist26_rdmux_s <= en;
    redist26_rdmux_combproc: PROCESS (redist26_rdmux_s, redist26_wraddr_q, redist26_rdcnt_q)
    BEGIN
        CASE (redist26_rdmux_s) IS
            WHEN "0" => redist26_rdmux_q <= redist26_wraddr_q;
            WHEN "1" => redist26_rdmux_q <= redist26_rdcnt_q;
            WHEN OTHERS => redist26_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist26_inputreg(DELAY,227)
    redist26_inputreg : dspba_delay
    GENERIC MAP ( width => 94, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => accValuePositive_uid35_fpAccTest_q, xout => redist26_inputreg_q, ena => en(0), clk => clk, aclr => areset );

    -- redist26_wraddr(REG,232)
    redist26_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist26_wraddr_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist26_wraddr_q <= STD_LOGIC_VECTOR(redist26_rdmux_q);
        END IF;
    END PROCESS;

    -- redist26_mem(DUALMEM,229)
    redist26_mem_ia <= STD_LOGIC_VECTOR(redist26_inputreg_q);
    redist26_mem_aa <= redist26_wraddr_q;
    redist26_mem_ab <= redist26_rdmux_q;
    redist26_mem_reset0 <= areset;
    redist26_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 94,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 94,
        widthad_b => 1,
        numwords_b => 2,
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
        clocken1 => redist26_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist26_mem_reset0,
        clock1 => clk,
        address_a => redist26_mem_aa,
        data_a => redist26_mem_ia,
        wren_a => en(0),
        address_b => redist26_mem_ab,
        q_b => redist26_mem_iq
    );
    redist26_mem_q <= redist26_mem_iq(93 downto 0);

    -- redist26_outputreg(DELAY,228)
    redist26_outputreg : dspba_delay
    GENERIC MAP ( width => 94, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist26_mem_q, xout => redist26_outputreg_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStageSel6Dto5_uid165_normalizationShifter_uid40_fpAccTest(BITSELECT,164)@14
    leftShiftStageSel6Dto5_uid165_normalizationShifter_uid40_fpAccTest_in <= r_uid105_zeroCounter_uid37_fpAccTest_q;
    leftShiftStageSel6Dto5_uid165_normalizationShifter_uid40_fpAccTest_b <= leftShiftStageSel6Dto5_uid165_normalizationShifter_uid40_fpAccTest_in(6 downto 5);

    -- leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest(MUX,165)@14 + 1
    leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_s <= leftShiftStageSel6Dto5_uid165_normalizationShifter_uid40_fpAccTest_b;
    leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_s) IS
                    WHEN "00" => leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q <= redist26_outputreg_q;
                    WHEN "01" => leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage0Idx1_uid160_normalizationShifter_uid40_fpAccTest_q;
                    WHEN "10" => leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage0Idx2_uid163_normalizationShifter_uid40_fpAccTest_q;
                    WHEN "11" => leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage0Idx3_uid164_normalizationShifter_uid40_fpAccTest_q;
                    WHEN OTHERS => leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStageSel4Dto3_uid176_normalizationShifter_uid40_fpAccTest(BITSELECT,175)@15
    leftShiftStageSel4Dto3_uid176_normalizationShifter_uid40_fpAccTest_in <= redist6_q(4 downto 0);
    leftShiftStageSel4Dto3_uid176_normalizationShifter_uid40_fpAccTest_b <= leftShiftStageSel4Dto3_uid176_normalizationShifter_uid40_fpAccTest_in(4 downto 3);

    -- leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest(MUX,176)@15 + 1
    leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_s <= leftShiftStageSel4Dto3_uid176_normalizationShifter_uid40_fpAccTest_b;
    leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_s) IS
                    WHEN "00" => leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage0_uid166_normalizationShifter_uid40_fpAccTest_q;
                    WHEN "01" => leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage1Idx1_uid169_normalizationShifter_uid40_fpAccTest_q;
                    WHEN "10" => leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage1Idx2_uid172_normalizationShifter_uid40_fpAccTest_q;
                    WHEN "11" => leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage1Idx3_uid175_normalizationShifter_uid40_fpAccTest_q;
                    WHEN OTHERS => leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStageSel2Dto1_uid187_normalizationShifter_uid40_fpAccTest(BITSELECT,186)@15
    leftShiftStageSel2Dto1_uid187_normalizationShifter_uid40_fpAccTest_in <= redist6_q(2 downto 0);
    leftShiftStageSel2Dto1_uid187_normalizationShifter_uid40_fpAccTest_b <= leftShiftStageSel2Dto1_uid187_normalizationShifter_uid40_fpAccTest_in(2 downto 1);

    -- redist1(DELAY,195)
    redist1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel2Dto1_uid187_normalizationShifter_uid40_fpAccTest_b, xout => redist1_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest(MUX,187)@16
    leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_s <= redist1_q;
    leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_combproc: PROCESS (leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_s, en, leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q, leftShiftStage2Idx1_uid180_normalizationShifter_uid40_fpAccTest_q, leftShiftStage2Idx2_uid183_normalizationShifter_uid40_fpAccTest_q, leftShiftStage2Idx3_uid186_normalizationShifter_uid40_fpAccTest_q)
    BEGIN
        CASE (leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_s) IS
            WHEN "00" => leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage1_uid177_normalizationShifter_uid40_fpAccTest_q;
            WHEN "01" => leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage2Idx1_uid180_normalizationShifter_uid40_fpAccTest_q;
            WHEN "10" => leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage2Idx2_uid183_normalizationShifter_uid40_fpAccTest_q;
            WHEN "11" => leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage2Idx3_uid186_normalizationShifter_uid40_fpAccTest_q;
            WHEN OTHERS => leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel0Dto0_uid192_normalizationShifter_uid40_fpAccTest(BITSELECT,191)@15
    leftShiftStageSel0Dto0_uid192_normalizationShifter_uid40_fpAccTest_in <= redist6_q(0 downto 0);
    leftShiftStageSel0Dto0_uid192_normalizationShifter_uid40_fpAccTest_b <= leftShiftStageSel0Dto0_uid192_normalizationShifter_uid40_fpAccTest_in(0 downto 0);

    -- redist0(DELAY,194)
    redist0 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid192_normalizationShifter_uid40_fpAccTest_b, xout => redist0_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest(MUX,192)@16
    leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_s <= redist0_q;
    leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_combproc: PROCESS (leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_s, en, leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q, leftShiftStage3Idx1_uid191_normalizationShifter_uid40_fpAccTest_q)
    BEGIN
        CASE (leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_s) IS
            WHEN "0" => leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage2_uid188_normalizationShifter_uid40_fpAccTest_q;
            WHEN "1" => leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_q <= leftShiftStage3Idx1_uid191_normalizationShifter_uid40_fpAccTest_q;
            WHEN OTHERS => leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracR_uid46_fpAccTest(BITSELECT,45)@16
    fracR_uid46_fpAccTest_in <= leftShiftStage3_uid193_normalizationShifter_uid40_fpAccTest_q(90 downto 0);
    fracR_uid46_fpAccTest_b <= fracR_uid46_fpAccTest_in(90 downto 39);

    -- R_uid47_fpAccTest(BITJOIN,46)@16
    R_uid47_fpAccTest_q <= redist28_q & finalExpUpdated_uid45_fpAccTest_q & fracR_uid46_fpAccTest_b;

    -- xOut(GPOUT,4)@16
    r <= R_uid47_fpAccTest_q;
    xo <= redist24_q;
    xu <= redist23_q;
    ao <= redist22_q;

END normal;
