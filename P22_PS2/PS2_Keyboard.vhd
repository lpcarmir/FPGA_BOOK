library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PS2_Keyboard is
    Port ( clk 		: in   STD_LOGIC;
           ps2_dat 	: in   STD_LOGIC;
           ps2_clk 	: in   STD_LOGIC;
           dout 		: out  STD_LOGIC_VECTOR (7 downto 0);
           valid 		: out  STD_LOGIC);
end PS2_Keyboard;

architecture Behavioral of PS2_Keyboard is

component vio1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    ASYNC_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

component icon1
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
end component;
signal CONTROL : STD_LOGIC_VECTOR(35 DOWNTO 0);
signal ASYNC_IN : STD_LOGIC_VECTOR(7 DOWNTO 0);

type state_type is (idle,data,parity,stop,free);
signal state:state_type:=idle;
signal i:integer range 0 to 7;
signal wdt:integer range 0 to 49999;
signal cnt1ms:integer range 0 to 49999;
signal ps2_clk_last:std_logic;
signal ps2_clk_last2:std_logic;
signal buff:std_logic_vector(7 downto 0);

begin

u_vio1 : vio1 port map
(
    CONTROL => CONTROL,
    ASYNC_IN => ASYNC_IN
);

u_icon1 : icon1 port map
(
    CONTROL0 => CONTROL
);

process(clk)
	begin
	if(rising_edge(clk))then
		valid<='0';
		
		ps2_clk_last<=ps2_clk;
		ps2_clk_last2<=ps2_clk_last;
		
		wdt<=wdt+1;
		if(wdt=49999)then
			wdt<=0;
			state<=idle;
		end if;
		
		case state is
			when idle=>
				--i<=0;
				wdt<=0;
				if(ps2_clk_last2='1' and ps2_clk_last='0')then
					state<=data;
				end if;
				
			when data=>
				if(ps2_clk_last2='1' and ps2_clk_last='0')then
					buff(i)<=ps2_dat;
					i<=i+1;
					if(i=7)then
						i<=0;
						state<=parity;
					end if;
					wdt<=0;
				end if;
			
			when parity=>
				if(ps2_clk_last2='1' and ps2_clk_last='0')then
					state<=stop;
					wdt<=0;
				end if;
			
			when stop=>
				if(ps2_clk_last2='1' and ps2_clk_last='0')then
					state<=free;
					valid<='1';
					dout<=buff;
				end if;
			
			when free=>
				wdt<=0;
				cnt1ms<=cnt1ms+1;
				if(cnt1ms=49999)then
					cnt1ms<=0;
					if(ps2_dat='1' and ps2_clk_last='1')then
						state<=idle;
					end if;
				end if;
		end case;
	end if;
end process;

async_in<=buff;

end Behavioral;

