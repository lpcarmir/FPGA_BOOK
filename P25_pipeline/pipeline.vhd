library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity pipeline is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : in  STD_LOGIC_VECTOR (7 downto 0);
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           e : out  STD_LOGIC_VECTOR (9 downto 0));
end pipeline;

architecture Behavioral of pipeline is
signal sa,sb,sc,sd:integer range 0 to 255;--8bit
signal s1,s2:integer range 0 to 511;--9bit
signal se:integer range 0 to 1023;--10bit

begin

process(clk)
	begin
	if(rising_edge(clk))then
		sa<=conv_integer(a);
		sb<=conv_integer(b);
		sc<=conv_integer(c);
		sd<=conv_integer(d);
		
		s1<=sa+sb;
		s2<=sc+sd;
		
		se<=s1+s2;
		
	end if;
end process;

e<=conv_std_logic_vector(se,10);

--model big
--process(clk)
--	begin
--	if(rising_edge(clk))then
--		sa<=conv_integer(a);
--		sb<=conv_integer(b);
--		sc<=conv_integer(c);
--		sd<=conv_integer(d);
--		
--		se<=sa+sb+sc+sd;
--		
--	end if;
--end process;
--
--e<=conv_std_logic_vector(se,10);

end Behavioral;

