
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ALL;
-- declare the entity 
entity g56_stopwatch is
	
	Port (start : in std_logic;
			stop : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			HEX0 : out std_logic_vector(6 downto 0);
			HEX1 : out std_logic_vector(6 downto 0);
			HEX2 : out std_logic_vector(6 downto 0);
			HEX3 : out std_logic_vector(6 downto 0);
			HEX4 : out std_logic_vector(6 downto 0);
			HEX5 : out std_logic_vector(6 downto 0)
			);
end g56_stopwatch;

architecture behaviour of g56_stopwatch is
--import clock divider 
component g56_clock_divider is
		Port(enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			en_out : out std_logic);
end component g56_clock_divider;	
	
--import counter 
component g56_counter is
		Port (enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			count : out std_logic_vector(3 downto 0));
end component g56_counter;
	
--import 7 segment decoder 
component g56_7_segment_decoder is
		Port( code: in std_logic_vector(3 downto 0);
			segments: out std_logic_vector(6 downto 0));
end component g56_7_segment_decoder;
	

signal dgt0 : std_logic_vector(3 downto 0) := "0000";
signal dgt1 : std_logic_vector(3 downto 0) := "0000";
signal dgt2 : std_logic_vector(3 downto 0) := "0000";
signal dgt3 : std_logic_vector(3 downto 0) := "0000";
signal dgt4 : std_logic_vector(3 downto 0) := "0000";
signal dgt5 : std_logic_vector(3 downto 0) := "0000";
	

signal enable_stopwatch : std_logic := '0';
	

	
signal en_out_divider : std_logic := '0';
	
	
signal enable1 : std_logic := '0';
signal enable2 : std_logic := '0';
signal enable3 : std_logic := '0';
signal enable4 : std_logic := '0';
signal enable5 : std_logic := '0';
	
	
	
signal reset0 : std_logic := '1';
signal reset1 : std_logic := '1';
signal reset2 : std_logic := '1';
signal reset3 : std_logic := '1';
signal reset4 : std_logic := '1';
signal reset5 : std_logic := '1';
	

	
begin
	

clock_divider : g56_clock_divider PORT MAP(enable => enable_stopwatch,
														reset => reset, clk => clk, en_out => en_out_divider);
	
counter0 : g56_counter PORT MAP(enable => enable_stopwatch, reset => reset0,
											clk => en_out_divider, count => dgt0);
					
counter1 : g56_counter PORT MAP(enable => enable1, reset => reset1,
											clk => en_out_divider, count => dgt1);
											
counter2 : g56_counter PORT MAP(enable => enable2, reset => reset2,
											clk => en_out_divider, count => dgt2);
											
counter3 : g56_counter PORT MAP(enable => enable3, reset => reset3,
											clk => en_out_divider, count => dgt3);
											
counter4 : g56_counter PORT MAP(enable => enable4, reset => reset4,
											clk => en_out_divider, count => dgt4);
											
counter5 : g56_counter PORT MAP(enable => enable5, reset => reset5,
											clk => en_out_divider, count => dgt5);
Process(clk, start, stop, reset) begin
		


if(start = '0') then
enable_stopwatch <= '1'; 
elsif(stop = '0') then
enable_stopwatch <= '0'; 
elsif(reset = '0') then
reset0 <= '0'; 
reset1 <= '0';
reset2 <= '0';
reset3 <= '0';
reset4 <= '0';
reset5 <= '0';
		
			
		
elsif(rising_edge(clk)) then
		
-- logic for digit 0
if (dgt0 > "1001") then
reset0 <= '0';
enable1 <= '0';	
elsif (dgt0 = "1001") then
enable1 <= '1';
else
reset0  <= '1';
enable1 <= '0';
end if;
			
-- logic for digit 1
if (dgt1 > "1001") then
reset1 <= '0'; 
enable2 <= '0';
elsif (dgt0 = "1001") and (dgt1 = "1001") then
enable2 <= '1';
			
else
reset1 <= '1';
enable2 <= '0';
end if;
			
-- logic for digit 2
if (dgt2 > "1001") then
reset2 <= '0'; 
enable3 <= '0';
elsif (dgt0 = "1001") and (dgt1 = "1001") and (dgt2 = "1001") then
enable3 <= '1';
			
else
reset2 <= '1';
enable3 <= '0';
end if;
			
-- logic for digit 3
if (dgt3 > "0101") then
reset3 <= '0'; 
enable4 <= '0';
elsif (dgt0 = "1001") and (dgt1 = "1001") and (dgt2 = "1001") and (dgt3 = "0101") then
enable4 <= '1';
			
else
reset3 <= '1';
enable4 <= '0';
end if;
			
-- logic for digit 4
if (dgt4 > "1001") then
reset4 <= '0'; 
enable5 <= '0';
elsif (dgt0 = "1001") and (dgt1 = "1001") and (dgt2 = "1001") and (dgt3 = "0101") and (dgt4 = "1001") then
enable5 <= '1';
			
else
reset4 <= '1';
enable5 <= '0';
end if;
			
-- logic for digit 5
if (dgt5 = "0101") then
reset5 <= '0'; 
else
reset5 <= '1';
end if;
end if;
		
end Process;
	
	
	--decoder for counter 0
	decoder0: g56_7_segment_decoder PORT MAP(code => dgt0,
							segments => HEX0);
	--decoder for counter 1
	decoder1: g56_7_segment_decoder PORT MAP(code => dgt1,
							segments => HEX1);
	--decoder for counter 2
	decoder2: g56_7_segment_decoder PORT MAP(code => dgt2,
							segments => HEX2);
	--decoder for counter 3
	decoder3: g56_7_segment_decoder PORT MAP(code => dgt3,
							segments => HEX3);
	--decoder for counter 4
	decoder4: g56_7_segment_decoder PORT MAP(code => dgt4,
							segments => HEX4);
	--decoder for counter 5
	decoder5: g56_7_segment_decoder PORT MAP(code => dgt5,
							segments => HEX5);
							
end behaviour;