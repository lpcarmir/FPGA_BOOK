library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity hex_cnt is
    Port ( clk : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (15 downto 0);
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0));
end hex_cnt;

architecture Behavioral of hex_cnt is
signal cnt_4ms:integer range 0 to 199999;
signal s1:integer range 0 to 3;
signal y,d,s,h:integer range 0 to 15;
type ss1_type is array(0 to 15)of std_logic_vector(7 downto 0);
constant ss:ss1_type:=(x"3f",x"06",x"5b",x"4f",x"66",x"6d",x"7d",
                       x"07",x"7f",x"6f",x"77",x"7c",x"39",x"5e",
							  x"79",x"71");
begin

process(clk)
	begin
	if(rising_edge(clk))then
		cnt_4ms<=cnt_4ms+1;
		if(cnt_4ms=199999)then
			cnt_4ms<=0;
			s1<=s1+1;
			if(s1=3)then
				s1<=0;
			end if;
		end if;
	end if;
end process;

y<=conv_integer(din(3 downto 0));
d<=conv_integer(din(7 downto 4));
s<=conv_integer(din(11 downto 8));
h<=conv_integer(din(15 downto 12));

with s1 select
	data<=ss(y) when 0,
	      ss(d) when 1,
			ss(s) when 2,
			ss(h) when 3;
			
with s1 select
	sel<="0001" when 0,
	     "0010" when 1,
		  "0100" when 2,
		  "1000" when 3;

end Behavioral;

