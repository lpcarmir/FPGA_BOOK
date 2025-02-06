library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UART_TX is
    Port ( clk 	: in   STD_LOGIC;
           din 	: in   STD_LOGIC_VECTOR (7 downto 0);
           en 		: in   STD_LOGIC;
           busy 	: out  STD_LOGIC;
           tx 		: out  STD_LOGIC);
end UART_TX;

architecture Behavioral of UART_TX is

type state_type is (idle,start,data,stop);
signal state:state_type:=idle;

signal cnt:integer range 0 to 5207;--5208*20ns=104.16us
signal i:integer range 0 to 7;--8bit data 0..7
signal sdata: std_logic_vector(7 downto 0);
begin

process(clk)
	begin
	if(rising_edge(clk))then
		case state is
			
			when idle=>
				tx<='1';
				if(en='1')then
					sdata<=din;--buffer din
					busy<='1';
					cnt<=0;
					state<=start;
				end if;
				
			when start=>
				tx<='0';
				cnt<=cnt+1;
				if(cnt=5207)then
					cnt<=0;
					i<=0;
					state<=data;
				end if;
				
			when data=>
				tx<=sdata(i);--model 1
				--tx<=sdata(0);--model 2
				cnt<=cnt+1;
				if(cnt=5207)then
					--sdata<='0' & sdata(7 downto 1);--model 2
					cnt<=0;
					i<=i+1;
					if(i=7)then
						i<=0;
						state<=stop;
					end if;
				end if;
				
			when stop=>
				tx<='1';
				cnt<=cnt+1;
				if(cnt=5207)then
					cnt<=0;
					state<=idle;
					busy<='0';
				end if;
		end case;
	end if;
end process;

end Behavioral;
