library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UART_RX is
    Port ( clk 	: in   STD_LOGIC;
           rx 		: in   STD_LOGIC;
           dout 	: out  STD_LOGIC_VECTOR (7 downto 0);
           valid 	: out  STD_LOGIC);
end UART_RX;

architecture Behavioral of UART_RX is

type state_type is (idle,start,sample,next_bit,stop);
signal state:state_type:=idle;

signal cnt: integer range 0 to 7811;--104.16us*1.5
signal i: integer range 0 to 7;--8bit
signal srx,srx1,srx2,srx3: std_logic;
signal temp: std_logic;
signal sdata: std_logic_vector(7 downto 0);
begin

process(clk)
	begin
	if(rising_edge(clk))then
		valid<='0';
		srx1<=rx;--meta stability
		srx2<=srx1;
		srx3<=srx2;
		
		if(srx1='0' and srx2='0' and srx3='0')then
			srx<='0';
		end if;
		
		if(srx1='1' and srx2='1' and srx3='1')then
			srx<='1';
		end if;
		
		case state is
			when idle=>
				if(srx='0')then
					cnt<=0;
					i<=0;
					state<=start;
				end if;
				
			when start=>
				cnt<=cnt+1;
				if(cnt=7811)then
					cnt<=0;
					state<=sample;
				end if;
				
			when sample=>
				sdata(i)<=srx;--model 1
				--temp<=srx;--model 2
				cnt<=0;
				state<=next_bit;
			
			when next_bit=>
				cnt<=cnt+1;
				if(cnt=5207)then
					--sdata<= temp & sdata(7 downto 1);--model 2
					cnt<=0;
					i<=i+1;
					if(i=7)then
						i<=0;
						state<=stop;
					else
						state<=sample;
					end if;
				end if;
				
			when stop=>
				cnt<=cnt+1;
				if(cnt=5207)then
					cnt<=0;
					state<=idle;
					dout<=sdata;
					valid<='1';
				end if;
		end case;
	end if;
end process;

end Behavioral;

