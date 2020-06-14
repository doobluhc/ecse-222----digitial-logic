-- g56
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
entity g56_FSM is 
 Port ( enable 	 	:in std_logic;
			direction	:in std_logic;
			reset			:in std_logic;
			clk			:in std_logic;
			count			:OUT std_logic_vector(3 downto 0));
			
end g56_FSM;
architecture behaviour of g56_FSM is
	type state_type is (one,two,four,eight,three,six,twelve,eleven,five,ten,seven,fourteen,fifteen,thirteen,nine);
	signal count_temp : state_type := one;
	begin
	
	
	PROCESS(clk,reset) begin
	


	if reset='0' then 
		if direction = '0' then 
		count_temp <= nine; 
		else
		count_temp <= one;
		end if;
	elsif(rising_edge(clk)) then 
	if(enable = '1') then 
	CASE count_temp is 
	when one => 
	if direction = '0' then 
	count_temp <= nine; 
	else 
	count_temp <= two;
	end if;
	
	when two => 
	if direction = '0' then 
	count_temp <= one; 
	else 
	count_temp <= four;
	end if;
	
	when four => 
	if direction = '0' then 
	count_temp <= two; 
	else 
	count_temp <= eight;
	end if;	
	
	when eight => 
	if direction = '0' then 
	count_temp <= four; 
	else 
	count_temp <= three;
	end if;
	
	when three => 
	if direction = '0' then 
	count_temp <= eight; 
	else 
	count_temp <= six;
	end if;
		
	when six => 
	if direction = '0' then 
	count_temp <= three; 
	else 
	count_temp <= twelve;
	end if;
		
	when twelve => 
	if direction = '0' then 
	count_temp <= six; 
	else 
	count_temp <= eleven;
	end if;
		
	when eleven => 
	if direction = '0' then 
	count_temp <= twelve; 
	else 
	count_temp <= five;
	end if;
	
		
	when five => 
	if direction = '0' then 
	count_temp <= eleven; 
	else 
	count_temp <= ten;
	end if;
	
		
	when ten => 
	if direction = '0' then 
	count_temp <= five; 
	else 
	count_temp <= seven;
	end if;
	
		
	when seven => 
	if direction = '0' then 
	count_temp <= ten; 
	else 
	count_temp <= fourteen;
	end if;
	
		
	when fourteen => 
	if direction = '0' then 
	count_temp <= seven; 
	else 
	count_temp <= fifteen;
	end if;
	
		
	when fifteen => 
	if direction = '0' then 
	count_temp <= fourteen; 
	else 
	count_temp <= thirteen;
	end if;
		
	when thirteen => 
	if direction = '0' then 
	count_temp <= fifteen; 
	else 
	count_temp <= nine;
	end if;
		
	when nine => 
	if direction = '0' then 
	count_temp <= thirteen; 
	else 
	count_temp <= one;
	end if;
	
	
	end case;
	else 
	count_temp <= count_temp;
	
	end if;
	end if;
	
	case count_temp is 
	when one => count <= "0001"; --1
	when two => count <= "0010"; --2
	when four => count <= "0100"; --4
	when eight => count <= "1000"; --8
	when three => count <= "0011"; --3
	when six => count <= "0110"; --6
	when twelve => count <= "1100"; --12
	when eleven => count <= "1011"; --11
	when five => count <= "0101"; --5
	when ten => count <= "1010"; --10
	when seven => count <= "0111"; --7
	when fourteen => count <= "1110"; --14
	when fifteen => count <= "1111"; --15
	when thirteen => count <= "1101"; --13
	when nine => count <= "1001"; --9
		end case;

	end process;
	
	end behaviour;
	
	
	
	
	
	
	