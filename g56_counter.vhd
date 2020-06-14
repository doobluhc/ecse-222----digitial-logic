library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity g56_counter is
	Port (enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			count : out std_logic_vector(3 downto 0)
			);
end g56_counter;


architecture behaviour of g56_counter is
signal dgt : std_logic_vector(3 downto 0) := "0000";
	
begin

Process(clk, reset) begin	
if(reset = '0') then
dgt <= "0000";
elsif(rising_edge(clk)) then
if(enable = '1') then
dgt <= std_logic_vector(unsigned(dgt) + 1);
else
dgt <= dgt;
end if;
end if;
end Process;
	

count <= dgt;
	
end behaviour;