
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ALL;

entity g56_multi_mode_counter is
	Port (start : in std_logic;
			stop : in std_logic;
			direction : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			HEX0 : out std_logic_vector(6 downto 0);
			HEX1 : out std_logic_vector(6 downto 0));
			
end g56_multi_mode_counter;

architecture behaviour of g56_multi_mode_counter is

	component g56_FSM is
		Port (enable : in std_logic;
				direction : in std_logic;
				reset : in std_logic;
				clk : in std_logic;
				count : out std_logic_vector(3 downto 0));
	end component g56_FSM;
	
	component g56_clock_divider is
		Port(enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			en_out : out std_logic);
	end component g56_clock_divider;	
	
	component g56_7_segment_decoder is
		Port(code: in std_logic_vector(3 downto 0);
			segments: out std_logic_vector(6 downto 0));
	end component g56_7_segment_decoder;
		
	signal out_clockdivider : std_logic;
	signal enable_temp : std_logic := '0';
	signal count_temp : std_logic_vector(3 downto 0);
	signal dgt0 : std_logic_vector(3 downto 0);
	signal dgt1 : std_logic_vector(3 downto 0);
	
begin
	
	--clock divider component
	clock_divider : g56_clock_divider PORT MAP(enable => enable_temp,reset => reset,clk => clk,en_out => out_clockdivider);

	--FSM component
	FSM : g56_FSM PORT MAP(enable => enable_temp,direction => direction,reset => reset,clk => out_clockdivider,count => count_temp);
	
Process(start, stop, count_temp,reset) begin
--start active low
if(start = '0') then
enable_temp <= '1';
elsif(start = '1' ) then
enable_temp <= enable_temp;
--stop active low
elsif(stop = '0') then
enable_temp <= '0'; 
elsif(stop = '1') then 
enable_temp <= enable_temp;
end if;
		

if(count_temp > "1001")then
dgt0 <= std_logic_vector(unsigned(count_temp) + "0110"); --if the number is greater than 9, add 6 to convert to BCD
dgt1 <= "0001";
else
dgt0 <= count_temp;
dgt1 <= "0000";
end if;	
end Process;
-- decoders component
decoder0: g56_7_segment_decoder PORT MAP(code => dgt0,segments => HEX0);

decoder1: g56_7_segment_decoder PORT MAP(code => dgt1,segments => HEX1);
end behaviour;