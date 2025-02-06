library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lcd_controller is
    Port (
				clk 	: in   STD_LOGIC;
				en 	: out  STD_LOGIC;
				rs		: out  STD_LOGIC;
				rw 	: out  STD_LOGIC;
				eni 	: in   STD_LOGIC;
				rsi 	: in   STD_LOGIC;
				din 	: in   STD_LOGIC_vector(7 downto 0);
				dout 	: out  STD_LOGIC_vector(3 downto 0));
end lcd_controller;

architecture Behavioral of lcd_controller is
signal cnt:integer range 0 to 10000000;
signal cnt_en:integer range 0 to 99;
type state_type is(init0,init11,init12,init13,initi,init21,init22,
on_lcd1,on_lcd2,clear_lcd1,clear_lcd2,dataCmd1,dataCmd2,idle);

signal state:state_type; 
signal data:std_logic_vector(3 downto 0);

begin
rw<='0';

process(clk)
begin
	if(rising_edge(clk))then
		
		if(cnt_en<99)then
			cnt_en<=cnt_en+1;
		end if;
		
		if(cnt_en<49)then
			en<='0';
		elsif(cnt_en<98)then
			en<='1';
		else
			en<='0';
		end if;
		
		cnt<=cnt+1;
		
		case state is
			when init0=>--wait 200 ms for power up                               
				cnt_en<=0;
				if(cnt=9999999)then
					cnt<=0;
					state<=init11;
				end if;
				
			when init11=>--select 4bit lcd mode
				rs<='0';
				data<=x"3";
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=init12;
					cnt_en<=0;
				end if;
				
			when init12=>--select 4bit lcd mode
				rs<='0';
				data<=x"3";
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=init13;
					cnt_en<=0;
				end if;
				
			when init13=>--select 4bit lcd mode
				rs<='0';
				data<=x"3";
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=initi;
					cnt_en<=0;
				end if;
				
			when initi=>--select 4bit lcd mode
				rs<='0';
				data<=x"2";
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=init21;
					cnt_en<=0;
				end if;
				
			when init21=>--send 0x28 to lcd (0x2 is high nibble)
				rs<='0';
				data<=x"2";
				if(cnt=99)then--2us
					cnt<=0;
					state<=init22;
					cnt_en<=0;
				end if;
			
			when init22=>--send 0x28 to lcd (0x8 is low nibble)
				rs<='0';
				data<=x"8";
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=on_lcd1;
					cnt_en<=0;
				end if;
				
			when on_lcd1=>--send 0x0E to lcd (0x0 is high nibble)
				rs<='0';
				data<=x"0";
				if(cnt=99)then--2us
					cnt<=0;
					state<=on_lcd2;
					cnt_en<=0;
				end if;
				
			when on_lcd2=>--send 0x0E to lcd (0xE is low nibble)
				rs<='0';
				data<=x"E";
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=clear_lcd1;
					cnt_en<=0;
				end if;
				
			when clear_lcd1=>
				rs<='0';
				data<=x"0";
				if(cnt=99)then--2us
					cnt<=0;
					state<=clear_lcd2;
					cnt_en<=0;
				end if;
				
			when clear_lcd2=>
				rs<='0';
				data<=x"1";
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=idle;
				end if;
				
			when dataCmd1=>
				data<=din(7 downto 4);
				if(cnt=99)then--2us
					cnt<=0;
					state<=dataCmd2;
					cnt_en<=0;
				end if;
				
			when dataCmd2=>
				data<=din(3 downto 0);
				if(cnt=2499)then--50us
					cnt<=0;
					state<=idle;
				end if;
				
			when idle=>--200ms
				if(eni='1')then
					rs<=rsi;
					cnt<=0;
					state<=dataCmd1;
					cnt_en<=0;
				end if;
				
		end case;
	end if;
end process;
dout<=data;
end Behavioral;
