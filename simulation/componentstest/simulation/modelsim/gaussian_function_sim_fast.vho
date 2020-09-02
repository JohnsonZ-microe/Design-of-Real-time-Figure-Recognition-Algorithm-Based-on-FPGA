-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "03/05/2020 09:25:03"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	gaussian_function IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	Cb : IN std_logic_vector(9 DOWNTO 0);
	Cr : IN std_logic_vector(9 DOWNTO 0);
	gauss_A : OUT std_logic_vector(3 DOWNTO 0)
	);
END gaussian_function;

-- Design Ports Information
-- gauss_A[0]	=>  Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- gauss_A[1]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- gauss_A[2]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- gauss_A[3]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[0]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst_n	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[8]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[9]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[2]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[3]	=>  Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[1]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[4]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[5]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[6]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cr[7]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[0]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[8]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[9]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[7]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[6]	=>  Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[4]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[5]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[1]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[2]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cb[3]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF gaussian_function IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_Cb : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_Cr : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_gauss_A : std_logic_vector(3 DOWNTO 0);
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst_n~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~10\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~11\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~12\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~13\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~14\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_out2~15\ : std_logic;
SIGNAL \square_cb|altsquare_component|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \gauss_cr_judge[0]~10_combout\ : std_logic;
SIGNAL \rst_n~combout\ : std_logic;
SIGNAL \rst_n~clkctrl_outclk\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \Add5~0_combout\ : std_logic;
SIGNAL \cr_sign~0_combout\ : std_logic;
SIGNAL \cr_sign~regout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \cb_sign~0_combout\ : std_logic;
SIGNAL \cb_sign~regout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \gauss_cb_judge[0]~10_combout\ : std_logic;
SIGNAL \gauss_cb_judge[0]~11\ : std_logic;
SIGNAL \gauss_cb_judge[1]~12_combout\ : std_logic;
SIGNAL \gauss_cb_judge[1]~13\ : std_logic;
SIGNAL \gauss_cb_judge[2]~14_combout\ : std_logic;
SIGNAL \gauss_cb_judge[2]~15\ : std_logic;
SIGNAL \gauss_cb_judge[3]~16_combout\ : std_logic;
SIGNAL \gauss_cb_judge[3]~17\ : std_logic;
SIGNAL \gauss_cb_judge[4]~18_combout\ : std_logic;
SIGNAL \gauss_cb_judge[4]~19\ : std_logic;
SIGNAL \gauss_cb_judge[5]~20_combout\ : std_logic;
SIGNAL \gauss_cb_judge[5]~21\ : std_logic;
SIGNAL \gauss_cb_judge[6]~22_combout\ : std_logic;
SIGNAL \Cb[6]~_wirecell_combout\ : std_logic;
SIGNAL \gauss_cb_judge[6]~23\ : std_logic;
SIGNAL \gauss_cb_judge[7]~24_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \gauss_cb_judge[7]~25\ : std_logic;
SIGNAL \gauss_cb_judge[8]~26_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \gauss_cb_judge[8]~27\ : std_logic;
SIGNAL \gauss_cb_judge[9]~28_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \gauss_cr_judge[0]~11\ : std_logic;
SIGNAL \gauss_cr_judge[1]~12_combout\ : std_logic;
SIGNAL \gauss_cr_judge[1]~13\ : std_logic;
SIGNAL \gauss_cr_judge[2]~14_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \gauss_cr_judge[2]~15\ : std_logic;
SIGNAL \gauss_cr_judge[3]~16_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \gauss_cr_judge[3]~17\ : std_logic;
SIGNAL \gauss_cr_judge[4]~18_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \gauss_cr_judge[4]~19\ : std_logic;
SIGNAL \gauss_cr_judge[5]~20_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \gauss_cr_judge[5]~21\ : std_logic;
SIGNAL \gauss_cr_judge[6]~22_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \gauss_cr_judge[6]~23\ : std_logic;
SIGNAL \gauss_cr_judge[7]~24_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \gauss_cr_judge[7]~25\ : std_logic;
SIGNAL \gauss_cr_judge[8]~26_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \gauss_cr_judge[8]~27\ : std_logic;
SIGNAL \gauss_cr_judge[9]~28_combout\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT19\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~10\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~11\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~12\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~13\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~14\ : std_logic;
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~15\ : std_logic;
SIGNAL \sign_gauss_crcb_mult[0]~0_combout\ : std_logic;
SIGNAL \Add6~0_combout\ : std_logic;
SIGNAL \Add5~1\ : std_logic;
SIGNAL \Add5~2_combout\ : std_logic;
SIGNAL \sign_gauss_crcb_mult[1]~1_combout\ : std_logic;
SIGNAL \Add6~1\ : std_logic;
SIGNAL \Add6~2_combout\ : std_logic;
SIGNAL \sign_gauss_crcb_mult[2]~2_combout\ : std_logic;
SIGNAL \Add5~4_combout\ : std_logic;
SIGNAL \Add6~3\ : std_logic;
SIGNAL \Add6~4_combout\ : std_logic;
SIGNAL \sign_gauss_crcb_mult[3]~3_combout\ : std_logic;
SIGNAL \square_cr|altsquare_component|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \Add5~5\ : std_logic;
SIGNAL \Add5~6_combout\ : std_logic;
SIGNAL \Add6~5\ : std_logic;
SIGNAL \Add6~6_combout\ : std_logic;
SIGNAL gauss_cr_judge : std_logic_vector(9 DOWNTO 0);
SIGNAL gauss_cb_judge : std_logic_vector(9 DOWNTO 0);
SIGNAL \square_cb|altsquare_component|auto_generated|w11w\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \mult_crcb|lpm_mult_component|auto_generated|result\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \Cr~combout\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Cb~combout\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \square_cr|altsquare_component|auto_generated|w11w\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_rst_n~clkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_Cb <= Cb;
ww_Cr <= Cr;
gauss_A <= ww_gauss_A;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAA_bus\ <= (\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT19\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT18\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT17\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT16\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT15\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT14\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT13\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT12\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT11\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT10\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT9\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT8\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT7\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT6\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT5\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT4\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT3\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT2\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT1\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~dataout\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~15\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~14\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~13\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~12\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~11\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~10\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~9\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~8\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~7\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~6\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~5\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~4\ & 
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~3\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~2\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~1\ & \mult_crcb|lpm_mult_component|auto_generated|mac_mult1~0\);

\mult_crcb|lpm_mult_component|auto_generated|mac_out2~0\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(0);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~1\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(1);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~2\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(2);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~3\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(3);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~4\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(4);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~5\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(5);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~6\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(6);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~7\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(7);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~8\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(8);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~9\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(9);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~10\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(10);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~11\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(11);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~12\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(12);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~13\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(13);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~14\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(14);
\mult_crcb|lpm_mult_component|auto_generated|mac_out2~15\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(15);
\mult_crcb|lpm_mult_component|auto_generated|result\(0) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(16);
\mult_crcb|lpm_mult_component|auto_generated|result\(1) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(17);
\mult_crcb|lpm_mult_component|auto_generated|result\(2) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(18);
\mult_crcb|lpm_mult_component|auto_generated|result\(3) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(19);
\mult_crcb|lpm_mult_component|auto_generated|result\(4) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(20);
\mult_crcb|lpm_mult_component|auto_generated|result\(5) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(21);
\mult_crcb|lpm_mult_component|auto_generated|result\(6) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(22);
\mult_crcb|lpm_mult_component|auto_generated|result\(7) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(23);
\mult_crcb|lpm_mult_component|auto_generated|result\(8) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(24);
\mult_crcb|lpm_mult_component|auto_generated|result\(9) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(25);
\mult_crcb|lpm_mult_component|auto_generated|result\(10) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(26);
\mult_crcb|lpm_mult_component|auto_generated|result\(11) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(27);
\mult_crcb|lpm_mult_component|auto_generated|result\(12) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(28);
\mult_crcb|lpm_mult_component|auto_generated|result\(13) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(29);
\mult_crcb|lpm_mult_component|auto_generated|result\(14) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(30);
\mult_crcb|lpm_mult_component|auto_generated|result\(15) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(31);
\mult_crcb|lpm_mult_component|auto_generated|result\(16) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(32);
\mult_crcb|lpm_mult_component|auto_generated|result\(17) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(33);
\mult_crcb|lpm_mult_component|auto_generated|result\(18) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(34);
\mult_crcb|lpm_mult_component|auto_generated|result\(19) <= \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\(35);

\mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAA_bus\ <= (gauss_cb_judge(9) & gauss_cb_judge(8) & gauss_cb_judge(7) & gauss_cb_judge(6) & gauss_cb_judge(5) & gauss_cb_judge(4) & gauss_cb_judge(3) & gauss_cb_judge(2) & 
gauss_cb_judge(1) & gauss_cb_judge(0) & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAB_bus\ <= (gauss_cr_judge(9) & gauss_cr_judge(8) & gauss_cr_judge(7) & gauss_cr_judge(6) & gauss_cr_judge(5) & gauss_cr_judge(4) & gauss_cr_judge(3) & gauss_cr_judge(2) & 
gauss_cr_judge(1) & gauss_cr_judge(0) & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~0\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(0);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~1\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(1);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~2\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(2);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~3\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(3);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~4\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(4);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~5\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(5);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~6\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(6);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~7\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(7);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~8\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(8);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~9\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(9);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~10\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(10);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~11\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(11);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~12\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(12);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~13\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(13);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~14\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(14);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~15\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(15);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~dataout\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(16);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT1\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(17);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT2\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(18);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT3\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(19);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT4\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(20);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT5\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(21);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT6\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(22);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT7\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(23);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT8\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(24);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT9\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(25);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT10\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(26);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT11\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(27);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT12\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(28);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT13\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(29);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT14\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(30);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT15\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(31);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT16\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(32);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT17\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(33);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT18\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(34);
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1~DATAOUT19\ <= \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\(35);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\rst_n~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \rst_n~combout\);
\ALT_INV_rst_n~clkctrl_outclk\ <= NOT \rst_n~clkctrl_outclk\;

-- Location: DSPOUT_X39_Y32_N2
\mult_crcb|lpm_mult_component|auto_generated|mac_out2\ : cycloneii_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \mult_crcb|lpm_mult_component|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X38_Y32_N10
\square_cr|altsquare_component|auto_generated|w11w[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \square_cr|altsquare_component|auto_generated|w11w\(0) = (gauss_cr_judge(1) & !gauss_cr_judge(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => gauss_cr_judge(1),
	datad => gauss_cr_judge(0),
	combout => \square_cr|altsquare_component|auto_generated|w11w\(0));

-- Location: LCCOMB_X38_Y32_N24
\square_cb|altsquare_component|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \square_cb|altsquare_component|auto_generated|op_1~0_combout\ = (gauss_cb_judge(0) & (gauss_cb_judge(1) $ (gauss_cb_judge(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => gauss_cb_judge(1),
	datac => gauss_cb_judge(2),
	datad => gauss_cb_judge(0),
	combout => \square_cb|altsquare_component|auto_generated|op_1~0_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X38_Y33_N10
\gauss_cr_judge[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[0]~10_combout\ = \Cr~combout\(0) $ (GND)
-- \gauss_cr_judge[0]~11\ = CARRY(!\Cr~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(0),
	datad => VCC,
	combout => \gauss_cr_judge[0]~10_combout\,
	cout => \gauss_cr_judge[0]~11\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(0),
	combout => \Cr~combout\(0));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst_n,
	combout => \rst_n~combout\);

-- Location: CLKCTRL_G1
\rst_n~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst_n~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst_n~clkctrl_outclk\);

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(7),
	combout => \Cr~combout\(7));

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(6),
	combout => \Cr~combout\(6));

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(4),
	combout => \Cr~combout\(4));

-- Location: LCCOMB_X38_Y33_N30
\LessThan3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (\Cr~combout\(5)) # ((\Cr~combout\(7)) # ((\Cr~combout\(6)) # (\Cr~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(5),
	datab => \Cr~combout\(7),
	datac => \Cr~combout\(6),
	datad => \Cr~combout\(4),
	combout => \LessThan3~1_combout\);

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(2),
	combout => \Cr~combout\(2));

-- Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(3),
	combout => \Cr~combout\(3));

-- Location: LCCOMB_X38_Y33_N4
\LessThan3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (\Cr~combout\(2) & (\Cr~combout\(3) & ((\Cr~combout\(1)) # (\Cr~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(1),
	datab => \Cr~combout\(2),
	datac => \Cr~combout\(3),
	datad => \Cr~combout\(0),
	combout => \LessThan3~0_combout\);

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(9),
	combout => \Cr~combout\(9));

-- Location: LCCOMB_X38_Y33_N0
\LessThan3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (\Cr~combout\(8) & (\Cr~combout\(9) & ((\LessThan3~1_combout\) # (\LessThan3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(8),
	datab => \LessThan3~1_combout\,
	datac => \LessThan3~0_combout\,
	datad => \Cr~combout\(9),
	combout => \LessThan3~2_combout\);

-- Location: LCFF_X38_Y33_N11
\gauss_cr_judge[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[0]~10_combout\,
	sdata => \Cr~combout\(0),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(0));

-- Location: LCCOMB_X38_Y32_N26
\Add5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add5~0_combout\ = (gauss_cb_judge(0) & (gauss_cr_judge(0) $ (VCC))) # (!gauss_cb_judge(0) & (gauss_cr_judge(0) & VCC))
-- \Add5~1\ = CARRY((gauss_cb_judge(0) & gauss_cr_judge(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => gauss_cb_judge(0),
	datab => gauss_cr_judge(0),
	datad => VCC,
	combout => \Add5~0_combout\,
	cout => \Add5~1\);

-- Location: LCCOMB_X38_Y33_N8
\cr_sign~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \cr_sign~0_combout\ = !\LessThan3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \LessThan3~2_combout\,
	combout => \cr_sign~0_combout\);

-- Location: LCFF_X38_Y33_N9
cr_sign : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \cr_sign~0_combout\,
	ena => \rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cr_sign~regout\);

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(7),
	combout => \Cb~combout\(7));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(8),
	combout => \Cb~combout\(8));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(4),
	combout => \Cb~combout\(4));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(5),
	combout => \Cb~combout\(5));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(2),
	combout => \Cb~combout\(2));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(1),
	combout => \Cb~combout\(1));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(0),
	combout => \Cb~combout\(0));

-- Location: LCCOMB_X40_Y32_N0
\LessThan1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\Cb~combout\(3)) # ((\Cb~combout\(2)) # ((\Cb~combout\(1)) # (\Cb~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(3),
	datab => \Cb~combout\(2),
	datac => \Cb~combout\(1),
	datad => \Cb~combout\(0),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X40_Y32_N2
\LessThan1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (\Cb~combout\(6) & ((\Cb~combout\(4)) # ((\Cb~combout\(5)) # (\LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(6),
	datab => \Cb~combout\(4),
	datac => \Cb~combout\(5),
	datad => \LessThan1~0_combout\,
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X40_Y32_N4
\LessThan1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (\Cb~combout\(9) & ((\Cb~combout\(8)) # ((\Cb~combout\(7) & \LessThan1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(9),
	datab => \Cb~combout\(7),
	datac => \Cb~combout\(8),
	datad => \LessThan1~1_combout\,
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X38_Y32_N0
\cb_sign~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \cb_sign~0_combout\ = !\LessThan1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan1~2_combout\,
	combout => \cb_sign~0_combout\);

-- Location: LCFF_X38_Y32_N1
cb_sign : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \cb_sign~0_combout\,
	ena => \rst_n~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \cb_sign~regout\);

-- Location: LCCOMB_X40_Y31_N0
\~GND\ : cycloneii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X40_Y32_N12
\gauss_cb_judge[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[0]~10_combout\ = \Cb~combout\(0) $ (GND)
-- \gauss_cb_judge[0]~11\ = CARRY(!\Cb~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(0),
	datad => VCC,
	combout => \gauss_cb_judge[0]~10_combout\,
	cout => \gauss_cb_judge[0]~11\);

-- Location: LCFF_X40_Y32_N13
\gauss_cb_judge[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[0]~10_combout\,
	sdata => \Cb~combout\(0),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(0));

-- Location: LCCOMB_X40_Y32_N14
\gauss_cb_judge[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[1]~12_combout\ = (\Cb~combout\(1) & ((\gauss_cb_judge[0]~11\) # (GND))) # (!\Cb~combout\(1) & (!\gauss_cb_judge[0]~11\))
-- \gauss_cb_judge[1]~13\ = CARRY((\Cb~combout\(1)) # (!\gauss_cb_judge[0]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(1),
	datad => VCC,
	cin => \gauss_cb_judge[0]~11\,
	combout => \gauss_cb_judge[1]~12_combout\,
	cout => \gauss_cb_judge[1]~13\);

-- Location: LCFF_X40_Y32_N15
\gauss_cb_judge[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[1]~12_combout\,
	sdata => \Cb~combout\(1),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(1));

-- Location: LCCOMB_X40_Y32_N16
\gauss_cb_judge[2]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[2]~14_combout\ = (\Cb~combout\(2) & (!\gauss_cb_judge[1]~13\ & VCC)) # (!\Cb~combout\(2) & (\gauss_cb_judge[1]~13\ $ (GND)))
-- \gauss_cb_judge[2]~15\ = CARRY((!\Cb~combout\(2) & !\gauss_cb_judge[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cb~combout\(2),
	datad => VCC,
	cin => \gauss_cb_judge[1]~13\,
	combout => \gauss_cb_judge[2]~14_combout\,
	cout => \gauss_cb_judge[2]~15\);

-- Location: LCFF_X40_Y32_N17
\gauss_cb_judge[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[2]~14_combout\,
	sdata => \Cb~combout\(2),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(2));

-- Location: LCCOMB_X40_Y32_N18
\gauss_cb_judge[3]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[3]~16_combout\ = (\Cb~combout\(3) & ((\gauss_cb_judge[2]~15\) # (GND))) # (!\Cb~combout\(3) & (!\gauss_cb_judge[2]~15\))
-- \gauss_cb_judge[3]~17\ = CARRY((\Cb~combout\(3)) # (!\gauss_cb_judge[2]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(3),
	datad => VCC,
	cin => \gauss_cb_judge[2]~15\,
	combout => \gauss_cb_judge[3]~16_combout\,
	cout => \gauss_cb_judge[3]~17\);

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(3),
	combout => \Cb~combout\(3));

-- Location: LCFF_X40_Y32_N19
\gauss_cb_judge[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[3]~16_combout\,
	sdata => \Cb~combout\(3),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(3));

-- Location: LCCOMB_X40_Y32_N20
\gauss_cb_judge[4]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[4]~18_combout\ = (\Cb~combout\(4) & (!\gauss_cb_judge[3]~17\ & VCC)) # (!\Cb~combout\(4) & (\gauss_cb_judge[3]~17\ $ (GND)))
-- \gauss_cb_judge[4]~19\ = CARRY((!\Cb~combout\(4) & !\gauss_cb_judge[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cb~combout\(4),
	datad => VCC,
	cin => \gauss_cb_judge[3]~17\,
	combout => \gauss_cb_judge[4]~18_combout\,
	cout => \gauss_cb_judge[4]~19\);

-- Location: LCFF_X40_Y32_N21
\gauss_cb_judge[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[4]~18_combout\,
	sdata => \Cb~combout\(4),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(4));

-- Location: LCCOMB_X40_Y32_N22
\gauss_cb_judge[5]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[5]~20_combout\ = (\Cb~combout\(5) & ((\gauss_cb_judge[4]~19\) # (GND))) # (!\Cb~combout\(5) & (!\gauss_cb_judge[4]~19\))
-- \gauss_cb_judge[5]~21\ = CARRY((\Cb~combout\(5)) # (!\gauss_cb_judge[4]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cb~combout\(5),
	datad => VCC,
	cin => \gauss_cb_judge[4]~19\,
	combout => \gauss_cb_judge[5]~20_combout\,
	cout => \gauss_cb_judge[5]~21\);

-- Location: LCFF_X40_Y32_N23
\gauss_cb_judge[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[5]~20_combout\,
	sdata => \Cb~combout\(5),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(5));

-- Location: LCCOMB_X40_Y32_N24
\gauss_cb_judge[6]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[6]~22_combout\ = (\Cb~combout\(6) & (\gauss_cb_judge[5]~21\ $ (GND))) # (!\Cb~combout\(6) & ((GND) # (!\gauss_cb_judge[5]~21\)))
-- \gauss_cb_judge[6]~23\ = CARRY((!\gauss_cb_judge[5]~21\) # (!\Cb~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(6),
	datad => VCC,
	cin => \gauss_cb_judge[5]~21\,
	combout => \gauss_cb_judge[6]~22_combout\,
	cout => \gauss_cb_judge[6]~23\);

-- Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(6),
	combout => \Cb~combout\(6));

-- Location: LCCOMB_X41_Y32_N0
\Cb[6]~_wirecell\ : cycloneii_lcell_comb
-- Equation(s):
-- \Cb[6]~_wirecell_combout\ = !\Cb~combout\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Cb~combout\(6),
	combout => \Cb[6]~_wirecell_combout\);

-- Location: LCFF_X40_Y32_N25
\gauss_cb_judge[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[6]~22_combout\,
	sdata => \Cb[6]~_wirecell_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(6));

-- Location: LCCOMB_X40_Y32_N26
\gauss_cb_judge[7]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[7]~24_combout\ = (\Cb~combout\(7) & (!\gauss_cb_judge[6]~23\)) # (!\Cb~combout\(7) & (\gauss_cb_judge[6]~23\ & VCC))
-- \gauss_cb_judge[7]~25\ = CARRY((\Cb~combout\(7) & !\gauss_cb_judge[6]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cb~combout\(7),
	datad => VCC,
	cin => \gauss_cb_judge[6]~23\,
	combout => \gauss_cb_judge[7]~24_combout\,
	cout => \gauss_cb_judge[7]~25\);

-- Location: LCCOMB_X40_Y32_N6
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \Cb~combout\(7) $ (\Cb~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Cb~combout\(7),
	datad => \Cb~combout\(6),
	combout => \Add0~0_combout\);

-- Location: LCFF_X40_Y32_N27
\gauss_cb_judge[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[7]~24_combout\,
	sdata => \Add0~0_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(7));

-- Location: LCCOMB_X40_Y32_N28
\gauss_cb_judge[8]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[8]~26_combout\ = (\Cb~combout\(8) & (!\gauss_cb_judge[7]~25\ & VCC)) # (!\Cb~combout\(8) & (\gauss_cb_judge[7]~25\ $ (GND)))
-- \gauss_cb_judge[8]~27\ = CARRY((!\Cb~combout\(8) & !\gauss_cb_judge[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cb~combout\(8),
	datad => VCC,
	cin => \gauss_cb_judge[7]~25\,
	combout => \gauss_cb_judge[8]~26_combout\,
	cout => \gauss_cb_judge[8]~27\);

-- Location: LCCOMB_X40_Y32_N8
\Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = \Cb~combout\(8) $ (((!\Cb~combout\(6)) # (!\Cb~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Cb~combout\(7),
	datac => \Cb~combout\(8),
	datad => \Cb~combout\(6),
	combout => \Add0~1_combout\);

-- Location: LCFF_X40_Y32_N29
\gauss_cb_judge[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[8]~26_combout\,
	sdata => \Add0~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(8));

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cb[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cb(9),
	combout => \Cb~combout\(9));

-- Location: LCCOMB_X40_Y32_N30
\gauss_cb_judge[9]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cb_judge[9]~28_combout\ = \gauss_cb_judge[8]~27\ $ (\Cb~combout\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Cb~combout\(9),
	cin => \gauss_cb_judge[8]~27\,
	combout => \gauss_cb_judge[9]~28_combout\);

-- Location: LCCOMB_X40_Y32_N10
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = \Cb~combout\(9) $ (((\Cb~combout\(8)) # ((\Cb~combout\(7) & \Cb~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cb~combout\(9),
	datab => \Cb~combout\(7),
	datac => \Cb~combout\(8),
	datad => \Cb~combout\(6),
	combout => \Add0~2_combout\);

-- Location: LCFF_X40_Y32_N31
\gauss_cb_judge[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cb_judge[9]~28_combout\,
	sdata => \Add0~2_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cb_judge(9));

-- Location: LCCOMB_X38_Y33_N12
\gauss_cr_judge[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[1]~12_combout\ = (\Cr~combout\(1) & ((\gauss_cr_judge[0]~11\) # (GND))) # (!\Cr~combout\(1) & (!\gauss_cr_judge[0]~11\))
-- \gauss_cr_judge[1]~13\ = CARRY((\Cr~combout\(1)) # (!\gauss_cr_judge[0]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(1),
	datad => VCC,
	cin => \gauss_cr_judge[0]~11\,
	combout => \gauss_cr_judge[1]~12_combout\,
	cout => \gauss_cr_judge[1]~13\);

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(1),
	combout => \Cr~combout\(1));

-- Location: LCFF_X38_Y33_N13
\gauss_cr_judge[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[1]~12_combout\,
	sdata => \Cr~combout\(1),
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(1));

-- Location: LCCOMB_X38_Y33_N14
\gauss_cr_judge[2]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[2]~14_combout\ = (\Cr~combout\(2) & (\gauss_cr_judge[1]~13\ $ (GND))) # (!\Cr~combout\(2) & ((GND) # (!\gauss_cr_judge[1]~13\)))
-- \gauss_cr_judge[2]~15\ = CARRY((!\gauss_cr_judge[1]~13\) # (!\Cr~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(2),
	datad => VCC,
	cin => \gauss_cr_judge[1]~13\,
	combout => \gauss_cr_judge[2]~14_combout\,
	cout => \gauss_cr_judge[2]~15\);

-- Location: LCCOMB_X38_Y34_N4
\Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = \Cr~combout\(2) $ (VCC)
-- \Add2~1\ = CARRY(\Cr~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(2),
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: LCFF_X38_Y33_N15
\gauss_cr_judge[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[2]~14_combout\,
	sdata => \Add2~0_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(2));

-- Location: LCCOMB_X38_Y33_N16
\gauss_cr_judge[3]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[3]~16_combout\ = (\Cr~combout\(3) & (!\gauss_cr_judge[2]~15\)) # (!\Cr~combout\(3) & (\gauss_cr_judge[2]~15\ & VCC))
-- \gauss_cr_judge[3]~17\ = CARRY((\Cr~combout\(3) & !\gauss_cr_judge[2]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(3),
	datad => VCC,
	cin => \gauss_cr_judge[2]~15\,
	combout => \gauss_cr_judge[3]~16_combout\,
	cout => \gauss_cr_judge[3]~17\);

-- Location: LCCOMB_X38_Y34_N6
\Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (\Cr~combout\(3) & (!\Add2~1\)) # (!\Cr~combout\(3) & ((\Add2~1\) # (GND)))
-- \Add2~3\ = CARRY((!\Add2~1\) # (!\Cr~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(3),
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCFF_X38_Y33_N17
\gauss_cr_judge[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[3]~16_combout\,
	sdata => \Add2~2_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(3));

-- Location: LCCOMB_X38_Y33_N18
\gauss_cr_judge[4]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[4]~18_combout\ = (\Cr~combout\(4) & (!\gauss_cr_judge[3]~17\ & VCC)) # (!\Cr~combout\(4) & (\gauss_cr_judge[3]~17\ $ (GND)))
-- \gauss_cr_judge[4]~19\ = CARRY((!\Cr~combout\(4) & !\gauss_cr_judge[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(4),
	datad => VCC,
	cin => \gauss_cr_judge[3]~17\,
	combout => \gauss_cr_judge[4]~18_combout\,
	cout => \gauss_cr_judge[4]~19\);

-- Location: LCCOMB_X38_Y34_N8
\Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (\Cr~combout\(4) & ((GND) # (!\Add2~3\))) # (!\Cr~combout\(4) & (\Add2~3\ $ (GND)))
-- \Add2~5\ = CARRY((\Cr~combout\(4)) # (!\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(4),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: LCFF_X38_Y33_N19
\gauss_cr_judge[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[4]~18_combout\,
	sdata => \Add2~4_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(4));

-- Location: LCCOMB_X38_Y33_N20
\gauss_cr_judge[5]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[5]~20_combout\ = (\Cr~combout\(5) & ((\gauss_cr_judge[4]~19\) # (GND))) # (!\Cr~combout\(5) & (!\gauss_cr_judge[4]~19\))
-- \gauss_cr_judge[5]~21\ = CARRY((\Cr~combout\(5)) # (!\gauss_cr_judge[4]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(5),
	datad => VCC,
	cin => \gauss_cr_judge[4]~19\,
	combout => \gauss_cr_judge[5]~20_combout\,
	cout => \gauss_cr_judge[5]~21\);

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(5),
	combout => \Cr~combout\(5));

-- Location: LCCOMB_X38_Y34_N10
\Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (\Cr~combout\(5) & (\Add2~5\ & VCC)) # (!\Cr~combout\(5) & (!\Add2~5\))
-- \Add2~7\ = CARRY((!\Cr~combout\(5) & !\Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(5),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCFF_X38_Y33_N21
\gauss_cr_judge[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[5]~20_combout\,
	sdata => \Add2~6_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(5));

-- Location: LCCOMB_X38_Y33_N22
\gauss_cr_judge[6]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[6]~22_combout\ = (\Cr~combout\(6) & (!\gauss_cr_judge[5]~21\ & VCC)) # (!\Cr~combout\(6) & (\gauss_cr_judge[5]~21\ $ (GND)))
-- \gauss_cr_judge[6]~23\ = CARRY((!\Cr~combout\(6) & !\gauss_cr_judge[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(6),
	datad => VCC,
	cin => \gauss_cr_judge[5]~21\,
	combout => \gauss_cr_judge[6]~22_combout\,
	cout => \gauss_cr_judge[6]~23\);

-- Location: LCCOMB_X38_Y34_N12
\Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (\Cr~combout\(6) & ((GND) # (!\Add2~7\))) # (!\Cr~combout\(6) & (\Add2~7\ $ (GND)))
-- \Add2~9\ = CARRY((\Cr~combout\(6)) # (!\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(6),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCFF_X38_Y33_N23
\gauss_cr_judge[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[6]~22_combout\,
	sdata => \Add2~8_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(6));

-- Location: LCCOMB_X38_Y33_N24
\gauss_cr_judge[7]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[7]~24_combout\ = (\Cr~combout\(7) & ((\gauss_cr_judge[6]~23\) # (GND))) # (!\Cr~combout\(7) & (!\gauss_cr_judge[6]~23\))
-- \gauss_cr_judge[7]~25\ = CARRY((\Cr~combout\(7)) # (!\gauss_cr_judge[6]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(7),
	datad => VCC,
	cin => \gauss_cr_judge[6]~23\,
	combout => \gauss_cr_judge[7]~24_combout\,
	cout => \gauss_cr_judge[7]~25\);

-- Location: LCCOMB_X38_Y34_N14
\Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (\Cr~combout\(7) & (\Add2~9\ & VCC)) # (!\Cr~combout\(7) & (!\Add2~9\))
-- \Add2~11\ = CARRY((!\Cr~combout\(7) & !\Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(7),
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: LCFF_X38_Y33_N25
\gauss_cr_judge[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[7]~24_combout\,
	sdata => \Add2~10_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(7));

-- Location: LCCOMB_X38_Y33_N26
\gauss_cr_judge[8]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[8]~26_combout\ = (\Cr~combout\(8) & (\gauss_cr_judge[7]~25\ $ (GND))) # (!\Cr~combout\(8) & ((GND) # (!\gauss_cr_judge[7]~25\)))
-- \gauss_cr_judge[8]~27\ = CARRY((!\gauss_cr_judge[7]~25\) # (!\Cr~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Cr~combout\(8),
	datad => VCC,
	cin => \gauss_cr_judge[7]~25\,
	combout => \gauss_cr_judge[8]~26_combout\,
	cout => \gauss_cr_judge[8]~27\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cr[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cr(8),
	combout => \Cr~combout\(8));

-- Location: LCCOMB_X38_Y34_N16
\Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = (\Cr~combout\(8) & (\Add2~11\ $ (GND))) # (!\Cr~combout\(8) & (!\Add2~11\ & VCC))
-- \Add2~13\ = CARRY((\Cr~combout\(8) & !\Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(8),
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: LCFF_X38_Y33_N27
\gauss_cr_judge[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[8]~26_combout\,
	sdata => \Add2~12_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(8));

-- Location: LCCOMB_X38_Y33_N28
\gauss_cr_judge[9]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \gauss_cr_judge[9]~28_combout\ = \gauss_cr_judge[8]~27\ $ (\Cr~combout\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Cr~combout\(9),
	cin => \gauss_cr_judge[8]~27\,
	combout => \gauss_cr_judge[9]~28_combout\);

-- Location: LCCOMB_X38_Y34_N18
\Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = \Cr~combout\(9) $ (\Add2~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Cr~combout\(9),
	cin => \Add2~13\,
	combout => \Add2~14_combout\);

-- Location: LCFF_X38_Y33_N29
\gauss_cr_judge[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \gauss_cr_judge[9]~28_combout\,
	sdata => \Add2~14_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sload => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => gauss_cr_judge(9));

-- Location: DSPMULT_X39_Y32_N0
\mult_crcb|lpm_mult_component|auto_generated|mac_mult1\ : cycloneii_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "none",
	dataa_width => 18,
	datab_clock => "none",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => \~GND~combout\,
	signb => \~GND~combout\,
	dataa => \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAA_bus\,
	datab => \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \mult_crcb|lpm_mult_component|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: LCCOMB_X38_Y32_N14
\sign_gauss_crcb_mult[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \sign_gauss_crcb_mult[0]~0_combout\ = \cr_sign~regout\ $ (\cb_sign~regout\ $ (\mult_crcb|lpm_mult_component|auto_generated|result\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cr_sign~regout\,
	datac => \cb_sign~regout\,
	datad => \mult_crcb|lpm_mult_component|auto_generated|result\(0),
	combout => \sign_gauss_crcb_mult[0]~0_combout\);

-- Location: LCCOMB_X38_Y32_N16
\Add6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~0_combout\ = (\Add5~0_combout\ & (\sign_gauss_crcb_mult[0]~0_combout\ $ (VCC))) # (!\Add5~0_combout\ & (\sign_gauss_crcb_mult[0]~0_combout\ & VCC))
-- \Add6~1\ = CARRY((\Add5~0_combout\ & \sign_gauss_crcb_mult[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~0_combout\,
	datab => \sign_gauss_crcb_mult[0]~0_combout\,
	datad => VCC,
	combout => \Add6~0_combout\,
	cout => \Add6~1\);

-- Location: LCCOMB_X38_Y32_N28
\Add5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add5~2_combout\ = \Add5~1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add5~1\,
	combout => \Add5~2_combout\);

-- Location: LCCOMB_X38_Y32_N8
\sign_gauss_crcb_mult[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \sign_gauss_crcb_mult[1]~1_combout\ = \mult_crcb|lpm_mult_component|auto_generated|result\(1) $ (\cb_sign~regout\ $ (\cr_sign~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mult_crcb|lpm_mult_component|auto_generated|result\(1),
	datab => \cb_sign~regout\,
	datad => \cr_sign~regout\,
	combout => \sign_gauss_crcb_mult[1]~1_combout\);

-- Location: LCCOMB_X38_Y32_N18
\Add6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~2_combout\ = (\Add5~2_combout\ & ((\sign_gauss_crcb_mult[1]~1_combout\ & (\Add6~1\ & VCC)) # (!\sign_gauss_crcb_mult[1]~1_combout\ & (!\Add6~1\)))) # (!\Add5~2_combout\ & ((\sign_gauss_crcb_mult[1]~1_combout\ & (!\Add6~1\)) # 
-- (!\sign_gauss_crcb_mult[1]~1_combout\ & ((\Add6~1\) # (GND)))))
-- \Add6~3\ = CARRY((\Add5~2_combout\ & (!\sign_gauss_crcb_mult[1]~1_combout\ & !\Add6~1\)) # (!\Add5~2_combout\ & ((!\Add6~1\) # (!\sign_gauss_crcb_mult[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~2_combout\,
	datab => \sign_gauss_crcb_mult[1]~1_combout\,
	datad => VCC,
	cin => \Add6~1\,
	combout => \Add6~2_combout\,
	cout => \Add6~3\);

-- Location: LCCOMB_X38_Y32_N30
\sign_gauss_crcb_mult[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \sign_gauss_crcb_mult[2]~2_combout\ = \cr_sign~regout\ $ (\mult_crcb|lpm_mult_component|auto_generated|result\(2) $ (\cb_sign~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cr_sign~regout\,
	datac => \mult_crcb|lpm_mult_component|auto_generated|result\(2),
	datad => \cb_sign~regout\,
	combout => \sign_gauss_crcb_mult[2]~2_combout\);

-- Location: LCCOMB_X38_Y32_N12
\square_cb|altsquare_component|auto_generated|w11w[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \square_cb|altsquare_component|auto_generated|w11w\(0) = (gauss_cb_judge(1) & !gauss_cb_judge(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => gauss_cb_judge(1),
	datad => gauss_cb_judge(0),
	combout => \square_cb|altsquare_component|auto_generated|w11w\(0));

-- Location: LCCOMB_X38_Y32_N2
\Add5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add5~4_combout\ = (\square_cr|altsquare_component|auto_generated|w11w\(0) & (\square_cb|altsquare_component|auto_generated|w11w\(0) $ (VCC))) # (!\square_cr|altsquare_component|auto_generated|w11w\(0) & 
-- (\square_cb|altsquare_component|auto_generated|w11w\(0) & VCC))
-- \Add5~5\ = CARRY((\square_cr|altsquare_component|auto_generated|w11w\(0) & \square_cb|altsquare_component|auto_generated|w11w\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \square_cr|altsquare_component|auto_generated|w11w\(0),
	datab => \square_cb|altsquare_component|auto_generated|w11w\(0),
	datad => VCC,
	combout => \Add5~4_combout\,
	cout => \Add5~5\);

-- Location: LCCOMB_X38_Y32_N20
\Add6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~4_combout\ = ((\sign_gauss_crcb_mult[2]~2_combout\ $ (\Add5~4_combout\ $ (!\Add6~3\)))) # (GND)
-- \Add6~5\ = CARRY((\sign_gauss_crcb_mult[2]~2_combout\ & ((\Add5~4_combout\) # (!\Add6~3\))) # (!\sign_gauss_crcb_mult[2]~2_combout\ & (\Add5~4_combout\ & !\Add6~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sign_gauss_crcb_mult[2]~2_combout\,
	datab => \Add5~4_combout\,
	datad => VCC,
	cin => \Add6~3\,
	combout => \Add6~4_combout\,
	cout => \Add6~5\);

-- Location: LCCOMB_X38_Y32_N6
\sign_gauss_crcb_mult[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \sign_gauss_crcb_mult[3]~3_combout\ = \cr_sign~regout\ $ (\cb_sign~regout\ $ (\mult_crcb|lpm_mult_component|auto_generated|result\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cr_sign~regout\,
	datac => \cb_sign~regout\,
	datad => \mult_crcb|lpm_mult_component|auto_generated|result\(3),
	combout => \sign_gauss_crcb_mult[3]~3_combout\);

-- Location: LCCOMB_X38_Y33_N2
\square_cr|altsquare_component|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \square_cr|altsquare_component|auto_generated|op_1~0_combout\ = (gauss_cr_judge(0) & (gauss_cr_judge(1) $ (gauss_cr_judge(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => gauss_cr_judge(1),
	datac => gauss_cr_judge(2),
	datad => gauss_cr_judge(0),
	combout => \square_cr|altsquare_component|auto_generated|op_1~0_combout\);

-- Location: LCCOMB_X38_Y32_N4
\Add5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add5~6_combout\ = \square_cb|altsquare_component|auto_generated|op_1~0_combout\ $ (\Add5~5\ $ (\square_cr|altsquare_component|auto_generated|op_1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \square_cb|altsquare_component|auto_generated|op_1~0_combout\,
	datad => \square_cr|altsquare_component|auto_generated|op_1~0_combout\,
	cin => \Add5~5\,
	combout => \Add5~6_combout\);

-- Location: LCCOMB_X38_Y32_N22
\Add6~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~6_combout\ = \sign_gauss_crcb_mult[3]~3_combout\ $ (\Add5~6_combout\ $ (\Add6~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sign_gauss_crcb_mult[3]~3_combout\,
	datab => \Add5~6_combout\,
	cin => \Add6~5\,
	combout => \Add6~6_combout\);

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\gauss_A[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Add6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_gauss_A(0));

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\gauss_A[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Add6~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_gauss_A(1));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\gauss_A[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Add6~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_gauss_A(2));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\gauss_A[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Add6~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_gauss_A(3));
END structure;


