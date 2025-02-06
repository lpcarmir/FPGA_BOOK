library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity seven_seg is
    Port ( clk : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : out  STD_LOGIC_VECTOR (5 downto 0));
end seven_seg;

architecture Behavioral of seven_seg is
signal cnt_10ms:integer range 0 to 499999;
signal cnt_digit:STD_LOGIC_VECTOR(23 downto 0);
signal data_not:STD_LOGIC_VECTOR(7 downto 0);

type ss_rom_t is array(0 to 15)of std_logic_vector(7 downto 0);
constant ss_rom:ss_rom_t:=
(x"3f",x"06",x"5b",x"4f",x"66",x"6d",x"7d",x"07",
x"7f",x"6f",x"77",x"7c",x"39",x"5e",x"79",x"71");

signal cnt_4ms:integer range 0 to 199999;
signal sel_sig:integer range 0 to 5;
signal y,d,s,h,dh,sh:integer range 0 to 15;
begin

process(clk)
	begin
	if(rising_edge(clk))then
		cnt_10ms<=cnt_10ms+1;
		if(cnt_10ms=499999)then
			cnt_10ms<=0;
			cnt_digit<=cnt_digit+'1';
		end if;
	end if;
end process;

process(clk)
	begin
	if(rising_edge(clk))then
		cnt_4ms<=cnt_4ms+1;
		if(cnt_4ms=199999)then
			cnt_4ms<=0;
			sel_sig<=sel_sig+1;
			if(sel_sig=5)then
				sel_sig<=0;
			end if;
		end if;
	end if;
end process;

y<=conv_integer(cnt_digit(3 downto 0));
d<=conv_integer(cnt_digit(7 downto 4));
s<=conv_integer(cnt_digit(11 downto 8));
h<=conv_integer(cnt_digit(15 downto 12));
dh<=conv_integer(cnt_digit(19 downto 16));
sh<=conv_integer(cnt_digit(23 downto 20));

with sel_sig select
	data_not<=ss_rom(y) when 0,
				 ss_rom(d) when 1,
				 ss_rom(s) when 2,
				 ss_rom(h) when 3,
				 ss_rom(dh) when 4,
				 ss_rom(sh) when 5;
			
with sel_sig select
	sel<="111110" when 0,
	     "111101" when 1,
		  "111011" when 2,
		  "110111" when 3,
		  "101111" when 4,
		  "011111" when 5;

data<=not data_not;
end Behavioral;

