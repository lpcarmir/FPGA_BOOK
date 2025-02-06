library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity counter_easy is
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end counter_easy;

architecture Behavioral of counter_easy is
	signal cnt:integer range 0 to 15;
begin

	process(clk)
		begin
		if(rising_edge(clk))then
		
			cnt<=cnt+1;
			if(cnt=9)then
				cnt<=0;
			end if;
			
		end if;
	end process;

	q<=conv_STD_LOGIC_VECTOR(cnt,4);

end Behavioral;
