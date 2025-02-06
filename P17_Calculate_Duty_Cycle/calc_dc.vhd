library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity calc_dc is
    Port ( clk : in  STD_LOGIC;
           freq : in  STD_LOGIC;
           dc : out  STD_LOGIC_VECTOR (6 downto 0));
end calc_dc;

architecture Behavioral of calc_dc is
signal last_freq:std_logic;
type state_type is (wait_rising,calc_ton,calc_period,product,result);
signal state:state_type;
signal tonx100:integer range 0 to 100000000;
signal ton:integer range 0 to 1000000;
signal T:integer range 0 to 1000000;
signal cnt:integer range 0 to 1000000;
signal sdc:integer range 0 to 99;
begin
process(clk)
	begin
	if(rising_edge(clk))then
		last_freq<=freq;
		case (state) is
			when wait_rising=>
				cnt<=0;
				if(last_freq='0' and freq='1')then
					state<=calc_ton;
				end if;
			when calc_ton=>
				cnt<=cnt+1;
				if(last_freq='1' and freq='0')then
					Ton<=cnt;
					state<=calc_period;
				end if;
			when calc_period=>
				cnt<=cnt+1;
				if(last_freq='0' and freq='1')then
					T<=cnt;
					cnt<=0;
					state<=product;
				end if;
			when product=>
				tonx100<=ton*100;
				state<=result;
				sdc<=0;
			when result=>
				if(tonx100>T)then
					tonx100<=tonx100-T;
					sdc<=sdc+1;
				else
					dc<=conv_std_logic_vector(sdc,7);
					state<=wait_rising;
				end if;
		end case;
	end if;
end process;

end Behavioral;

