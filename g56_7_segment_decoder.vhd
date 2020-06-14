--author: Glen Xu & Cheng Chen

--import libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declare entity
entity g56_7_segment_decoder is 
	Port (
		code		: in std_logic_vector (3 downto 0);
		segments		: out std_logic_vector (6 downto 0)
		);	
end g56_7_segment_decoder;

architecture behaviour of g56_7_segment_decoder is 

begin

	process(code)
	begin
		case code is 
				when "0000" => segments <= "1000000"; -- 0	
				when "0001" => segments <= "1111001"; -- 1
				when "0010" => segments <= "0100100"; -- 2
				when "0011" => segments <= "0110000"; -- 3
				when "0100" => segments <= "0011001"; -- 4
				when "0101" => segments <= "0010010"; -- 5
				when "0110" => segments <= "0000010"; -- 6
				when "0111" => segments <= "1111000"; -- 7
				when "1000" => segments <= "0000000"; -- 8
				when "1001" => segments <= "0010000"; -- 9
				when "1010" => segments <= "0001000"; -- a 10
				when "1011" => segments <= "0000011"; -- b 11
				when "1100" => segments <= "1000110"; -- c 12
				when "1101" => segments <= "0100001"; -- d 13
				when "1110" => segments <= "0000110"; -- e 14
				when "1111" => segments <= "0001110"; -- f 15
				when others => segments <= "1010101"; 
			end case;
	
	end process;

end behaviour;