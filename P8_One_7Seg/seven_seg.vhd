library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_seg is
    Port ( clk : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : out  STD_LOGIC_VECTOR (5 downto 0));
end seven_seg;

architecture Behavioral of seven_seg is
signal cnt_1sec:integer range 0 to 49999999;
signal cnt_digit:integer range 0 to 15;

type ss_rom_t is array(0 to 15)of std_logic_vector(7 downto 0);
constant ss_rom:ss_rom_t:=
(x"3f",x"06",x"5b",x"4f",x"66",x"6d",x"7d",x"07",
x"7f",x"6f",x"77",x"7c",x"39",x"5e",x"79",x"71");
							  
begin

process(clk)
	begin
	if(rising_edge(clk))then
		cnt_1sec<=cnt_1sec+1;
		if(cnt_1sec=49999999)then
			cnt_1sec<=0;
			cnt_digit<=cnt_digit+1;
			if(cnt_digit=15)then
				cnt_digit<=0;
			end if;
		end if;
	end if;
end process;

data<=not ss_rom(cnt_digit);
sel<="111110";

end Behavioral;

