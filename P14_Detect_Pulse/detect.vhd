library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detect is
    Port ( clk 	: in   STD_LOGIC;
           pulse 	: in   STD_LOGIC;
           led 	: out  STD_LOGIC);
end detect;

architecture Behavioral of detect is

type state_type is (idle,p150,p180,p50,wait0);
signal state: state_type;

signal cnt: integer range 0 to 9090000;
signal cnt_led: integer range 0 to 49999999;
signal sled: std_logic:='0';
signal spulse: std_logic;
signal spulse2: std_logic;

begin

process(clk)
	begin
	if(rising_edge(clk))then
		spulse<=pulse;
		spulse2<=spulse;
	
		case state is
		
			when idle=>
				if(spulse2='1')then
					state<=p150;
					cnt<=0;
				--else
					--state<=idle;
				end if;
				
			when p150=>
				if(cnt<=7575000)then
					cnt<=cnt+1;
				end if;
				
				if(spulse2='0')then
					if(cnt>=7425000 and cnt<=7574999 )then
						state<=p180;
						cnt<=0;
					else
						state<=idle;
					end if;
				end if;
				
			when p180=>
				if(cnt<=9090000)then
					cnt<=cnt+1;
				end if;
				
				if(spulse2='1')then
					if(cnt>=8910000 and cnt<=9089999 )then
						state<=p50;
						cnt<=0;
					else
						state<=wait0;
					end if;
				end if;
				
			when p50=>
				if(cnt<=2525000)then
					cnt<=cnt+1;
				end if;
				
				if(spulse2='0')then
					if(cnt>=2475000 and cnt<=2524999 )then
						sled<='1';
					end if;
					state<=idle;
				end if;
				
			when wait0=>
				if(spulse2='0')then
					state<=idle;
				end if;
				
		end case;
		
		if(sled='1')then
			cnt_led<=cnt_led+1;
			if(cnt_led=49999999)then
				cnt_led<=0;
				sled<='0';
			end if;
		end if;
		
	end if;
end process;

led<=sled;

end Behavioral;
