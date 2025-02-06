--------keys---------
--power key x"95"
--vol up x"92"
--vol down x"93"
--ch up x"90"
--ch down x"91"
--menu x"E0"
--mute x"94"
--1,2,..,9,0 key x"80" to x"89"
---------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ir_receiver_sony is
    Port ( clk 		: in  STD_LOGIC;
           hs0038i   : in  STD_LOGIC;
           data 		: out  STD_LOGIC_VECTOR (15 downto 0);
           valid		: out  STD_LOGIC);
end ir_receiver_sony;

architecture Behavioral of ir_receiver_sony is
signal state:integer range 0 to 6;
signal cnt:integer range 0 to 29999;
signal hs0038:std_logic;
signal din:std_logic_vector(49 downto 0);
signal sdata:std_logic_vector(11 downto 0);
signal code:std_logic_vector(3 downto 0);
signal i:integer range 0 to 49;
signal j:integer range 0 to 11;
begin

hs0038<=not hs0038i;

process(clk)
	begin
	if(rising_edge(clk))then
		valid<='0';
		
		--------watchdog------------
		cnt<=cnt+1;
		if(cnt=29999)then
			cnt<=0;
			state<=0;
		end if;
		----------------------------
		
		case state is
			when 0=>
				code<=x"1";
				if(hs0038='1')then
					state<=1;
					cnt<=0;
				end if;
			when 1=>--berese vasate bit ha
				code<=x"2";
				if(cnt=14999)then
					cnt<=0;
					state<=2;
				end if;
			when 2=>
				code<=x"3";
				if(cnt=29998)then
					cnt<=0;
					if(hs0038='0')then
						state<=3;
						i<=0;
					end if;
				end if;
			when 3=>
				code<=x"4";
				din(i)<=hs0038;
				i<=i+1;
				if(i=49)then
					i<=0;
					j<=0;
					state<=5;
				else
					state<=4;
				end if;
			when 4=>
				code<=x"5";
				if(cnt=29998)then
					cnt<=0;
					state<=3;
				end if;
			when 5=>
				code<=x"6";
				if(din(i)='0' and din(i+1)='1' and din(i+2)='0')then
					sdata(j)<='0';
					j<=j+1;
					i<=i+2;
				end if;
				if(din(i)='0' and din(i+1)='1' and din(i+2)='1')then
					sdata(j)<='1';
					j<=j+1;
					i<=i+3;
				end if;
				if(din(i)='0' and din(i+1)='0' and din(i+2)='0')then
					state<=6;
				end if;
				if(i>=49)then
					state<=6;
				end if;
			when 6=>
				code<=x"8";
				valid<='1';
				state<=0;
		end case;
	end if;
end process;
data<=code & sdata(11 downto 0);
end Behavioral;

