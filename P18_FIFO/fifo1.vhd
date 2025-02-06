library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo1 is
    Port ( din 	: in   STD_LOGIC_VECTOR (7 downto 0);
           rst 	: in   STD_LOGIC;
           wr_en 	: in   STD_LOGIC;
           clk 	: in   STD_LOGIC;
           dout 	: out  STD_LOGIC_VECTOR (7 downto 0);
           rd_en 	: in   STD_LOGIC;
           empty 	: out  STD_LOGIC;
           full 	: out  STD_LOGIC);
end fifo1;

architecture Behavioral of fifo1 is

type ram_type is array(0 to 15) of std_logic_vector(7 downto 0);
signal ram:ram_type;

signal wr_cnt:integer range 0 to 15;
signal rd_cnt:integer range 0 to 15;
signal count:integer range 0 to 16;

begin

process(clk)
	begin
	if(rising_edge(clk))then
		if(rst='1')then
			wr_cnt<=0;
			rd_cnt<=0;
			count<=0;
			full<='0';
			empty<='1';
		else
			
			if(wr_en='1')then
				if(count<16)then
					ram(wr_cnt)<=din;
					count<=count+1;
					wr_cnt<=wr_cnt+1;
					if(wr_cnt=15)then
						wr_cnt<=0;
					end if;
				end if;
			end if;
			
			if(rd_en='1')then
				if(count>0)then
					dout<=ram(rd_cnt);
					count<=count-1;
					rd_cnt<=rd_cnt+1;
					if(rd_cnt=15)then
						rd_cnt<=0;
					end if;
				end if;
			end if;
			
			if(count=0)then
				empty<='1';
			else
				empty<='0';
			end if;
			
			if(count=16)then
				full<='1';
			else
				full<='0';
			end if;
			
		end if;
	end if;
end process;

end Behavioral;
