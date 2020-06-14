-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/27/2019 14:48:35"
                                                            
-- Vhdl Test Bench template for design  :  G56_Lab2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY G56_counter_vhd_tst IS
END G56_Lab2_vhd_tst;
ARCHITECTURE G56_Lab2_arch OF G56_counter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL enable : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT G56_Lab2
	PORT (
	clk : IN STD_LOGIC;
	count : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	enable : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : G56_counter
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	count => count,
	enable => enable,
	reset => reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
  clk <= ‘1’;
  WAIT FOR 10 ns;
  clk <= ‘0’;
  WAIT FOR 10 ns;                                                      
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
  reset <= ‘1’;
  enable <= ‘0’;
  WAIT FOR 50 ns;
  reset <= ‘0’;
  enable <= ‘0’;
  WAIT FOR 50 ns;
  reset <= ‘0’;
  enable <= ‘1’;
  WAIT FOR 50 ns;
  reset <= ‘1’;
  enable <= ‘1’;
WAIT;                                                      
END PROCESS always;                                          
END G56_Lab2_arch;
