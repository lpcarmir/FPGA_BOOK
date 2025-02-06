library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity freq_limit is
    Port ( clk : in  STD_LOGIC;
           f_in : in  STD_LOGIC;
           f_out : out  STD_LOGIC);
end freq_limit;

architecture Behavioral of freq_limit is
signal state:integer range 0 to 2;
signal cnt:integer range 0 to 124:=124;
signal cnt_200k:integer range 0 to 124;
signal s200k:std_logic:='0';
signal flag:std_logic;
begin
process(clk)
	begin
	if(rising_edge(clk))then
		case state is
			when 0=>--count 0
				if(flag='0')then
					if(cnt>0)then
						cnt<=cnt-1;
					else
						flag<='1';
					end if;
				end if;
				if(f_in='1')then
					cnt<=0;
					state<=1;
				end if;
			when 1=>--count 1
				if(cnt<124)then
					cnt<=cnt+1;
				end if;
				if(f_in='0')then
					state<=2;
				end if;
			when 2=>--decide
				if(cnt<124)then
					flag<='0';
				else
					flag<='1';
				end if;
				state<=0;
				cnt<=124;
		end case;
	end if;
end process;

process(clk)
	begin
	if(rising_edge(clk))then
		cnt_200k<=cnt_200k+1;
		if(cnt_200k=124)then
			cnt_200k<=0;
			s200k<=not s200k;
		end if;
	end if;
end process;

with flag select
	f_out<=f_in when '1',
	s200k when others;

end Behavioral;

