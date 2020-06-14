
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity g56_clock_divider is

	Generic (constant T : integer := 50000000			);
	
	Port (enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			en_out : out std_logic
			);
end g56_clock_divider;


architecture behaviour of g56_clock_divider is

signal en_out1 : std_logic := '0';
signal t1 : integer := T-1;
	

begin Process(clk, reset) begin
if(reset = '0') then
t1 <= T-1; 
en_out1 <= '0';
elsif(rising_edge(clk)) then
			
--enable: active high
if(enable = '0') then
t1 <= t1;
else
t1 <= t1 - 1; 
end if;
			
if(t1 = 0) then
t1 <= T-1;
en_out1 <= '1';
else
 en_out1 <= '0';
end if;
end if;
end Process;
	
en_out <= en_out1;
	
end behaviour;