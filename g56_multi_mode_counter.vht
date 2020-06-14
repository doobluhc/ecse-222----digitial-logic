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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/10/2019 15:24:29"
                                                            
-- Vhdl Test Bench template for design  :  g56_multi_mode_counter
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g56_multi_mode_counter_vhd_tst IS
END g56_multi_mode_counter_vhd_tst;
ARCHITECTURE g56_multi_mode_counter_arch OF g56_multi_mode_counter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL direction : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
COMPONENT g56_multi_mode_counter
	PORT (
	clk : IN STD_LOGIC;
	direction : IN STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	reset : IN STD_LOGIC;
	start : IN STD_LOGIC;
	stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g56_multi_mode_counter
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	direction => direction,
	HEX0 => HEX0,
	HEX1 => HEX1,
	reset => reset,
	start => start,
	stop => stop
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        clk <= '1';
			wait for 10 ns;
			clk <= '0';
			wait for 10 ns;
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN        
	reset <= '0';
	start <= '1';
	stop <= '1';
	wait for 100ns;
                                                 
        start <= '0';
		  stop <= '1';
		  reset <= '1';
		  direction <= '1';
WAIT;                                                        
END PROCESS always;                                          
END g56_multi_mode_counter_arch;
