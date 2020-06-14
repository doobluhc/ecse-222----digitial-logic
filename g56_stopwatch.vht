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
-- Generated on "03/29/2019 20:44:44"
                                                            
-- Vhdl Test Bench template for design  :  g56_stopwatch
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g56_stopwatch_vhd_tst IS
END g56_stopwatch_vhd_tst;
ARCHITECTURE g56_stopwatch_arch OF g56_stopwatch_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
COMPONENT g56_stopwatch
	PORT (
	clk : IN STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	reset : IN STD_LOGIC;
	start : IN STD_LOGIC;
	stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g56_stopwatch
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	reset => reset,
	start => start,
	stop => stop
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
       
		clk <= '1';

		WAIT FOR 1ns;

		clk <= '0';

		WAIT FOR 1ns;                                                                           
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        reset <= '1';	

      start <= '1';

		stop <='1';

		

		WAIT FOR 5ns;

		--test start

		start <= '0';

		
		

		--test stop

		stop <= '0';

		WAIT FOR 5ns;

		stop <='1';

				

		--test reset

		reset <= '0';

		
WAIT;                                                        
END PROCESS always;                                          
END g56_stopwatch_arch;
