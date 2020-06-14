library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g56_lab1_adder is
	Port ( A, B	: in  std_logic_vector(4  downto 0);
	  decoded_A	: out std_logic_vector(13 downto 0);
	  decoded_B : out std_logic_vector(13 downto 0);
decoded_AplusB	: out std_logic_vector(13 downto 0));
end g56_lab1_adder;

architecture behaviour of g56_lab1_adder is
	-- import the 7-seg decoder(g56_lab1_1503) we implemented before 
	component g56_7_seg_decoder is
		port(
			code			: in std_logic_vector(3 downto 0);
			segments		: out std_logic_vector(6 downto 0)
		);
	end component g56_7_seg_decoder;
	-- temporary variable to store 8-bit sum
	signal AplusB		: std_logic_vector(7 downto 0);
	
begin
	-- output
	-- A least sig digit
	decoderA0: g56_7_seg_decoder PORT MAP(code => A(3 downto 0), segments => decoded_A(6 downto 0));
	-- A most sig digit
	decoderA1: g56_7_seg_decoder PORT MAP(code => ("000" & A(4)), segments => decoded_A(13 downto 7));	
	-- B least sig digit
	decoderB0: g56_7_seg_decoder PORT MAP(code => B(3 downto 0), segments => decoded_B(6 downto 0));
	-- B most sig digit
	decoderB1: g56_7_seg_decoder PORT MAP(code => ("000" & B(4)), segments => decoded_B(13 downto 7));	

	AplusB <= std_logic_vector(unsigned("000" & A) + unsigned("000" & B));
	-- A + B least sig digit
	decoderAplusB0: g56_7_seg_decoder PORT MAP(code => AplusB(3 downto 0), segments => decoded_AplusB(6 downto 0));
	-- A + B most sig digit
	decoderAplusB1: g56_7_seg_decoder PORT MAP(code => AplusB(7 downto 4), segments => decoded_AplusB(13 downto 7));
end behaviour;