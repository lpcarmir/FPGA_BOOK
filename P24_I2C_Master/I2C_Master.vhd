library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity I2C_Master is
    Port ( clk 			: in  	STD_LOGIC;
           SDA 			: inout  STD_LOGIC;
           SCL 			: inout  STD_LOGIC;
           din 			: in  	STD_LOGIC_VECTOR (7 downto 0);
           dout 			: out  	STD_LOGIC_VECTOR (7 downto 0);
           start_en 		: in  	STD_LOGIC;
           stop 			: in  	STD_LOGIC;
           busy 			: buffer	STD_LOGIC;
           finish 		: out  	STD_LOGIC;
           ack_in 		: in  	STD_LOGIC;
           ack_out 		: out  	STD_LOGIC;
           slave_addr 	: in  	STD_LOGIC_VECTOR (6 downto 0);
           rw 				: in  	STD_LOGIC);
end I2C_Master;

architecture Behavioral of I2C_Master is
signal scl_timing: integer range 0 to 499;--10us
signal i: integer range 0 to 7;
type state_type is (s_idle,s_start,s_sla,s_get_ack,s_send_ack,s_write,s_read,s_read2,s_stop);
signal state:state_type;
signal buff:STD_LOGIC_VECTOR (7 downto 0);
signal srw:STD_LOGIC;
begin

process(clk)
	begin
	if(rising_edge(clk))then
		finish<='0';
		
		case state is
			when s_idle=>
				SDA<='Z';
				SCL<='Z';
				if(start_en='1')then
					busy<='1';
					state<=s_start;
					scl_timing<=0;
					buff<=slave_addr & rw;--make 8bit SLA+RW
					srw<=rw;
					i<=7;
				end if;
				
			when s_start=>
				scl_timing<=scl_timing+1;
				if(scl_timing<250)then
					SDA<='0';
				else
					SDA<='0';
					SCL<='0';
				end if;
				
				if(scl_timing=499)then
					scl_timing<=0;
					state<=s_sla;
				end if;
			
			when s_stop=>
				scl_timing<=scl_timing+1;
				if(scl_timing<250)then
					SCL<='Z';
					SDA<='0';
				else
					SDA<='Z';
					SCL<='Z';
				end if;
				
				if(scl_timing=499)then
					scl_timing<=0;
					state<=s_idle;
				end if;
				
			when s_sla=>
				SDA<=buff(i);
				scl_timing<=scl_timing+1;
				
				if(scl_timing<175 or scl_timing>325)then
					SCL<='0';
				else
					SCL<='1';
				end if;
				
				if(scl_timing=499)then
					scl_timing<=0;
					i<=i-1;
					if(i=0)then
						state<=s_get_ack;
					end if;
				end if;
				
			when s_get_ack=>
				SDA<='Z';
				scl_timing<=scl_timing+1;
				
				if(scl_timing<175 or scl_timing>325)then
					SCL<='0';
				else
					SCL<='1';
				end if;
				
				if(scl_timing=250)then
					ack_out<=SDA;
				end if;
				
				if(scl_timing=499)then
					scl_timing<=0;
					if(srw='1')then
						state<=s_read;
					else
						state<=s_write;
					end if;
					finish<='1';
					busy<='0';
				end if;
				
			when s_write=>
				if(start_en='1')then
					busy<='1';
					state<=s_sla;
					scl_timing<=0;
					buff<=din;
					i<=7;
				end if;
				
			when s_read=>
				if(start_en='1')then
					busy<='1';
					state<=s_read2;
					scl_timing<=0;
					i<=7;
				end if;
				
			when s_read2=>
				SDA<='Z';
				scl_timing<=scl_timing+1;
				
				if(scl_timing<175 or scl_timing>325)then
					SCL<='0';
				else
					SCL<='1';
				end if;
				
				if(scl_timing=250)then
					buff(i)<=SDA;
				end if;
				
				if(scl_timing=499)then
					scl_timing<=0;
					i<=i-1;
					if(i=0)then
						state<=s_send_ack;
					end if;
				end if;
				
			when s_send_ack=>
				SDA<=ack_in;
				scl_timing<=scl_timing+1;
				
				if(scl_timing<175 or scl_timing>325)then
					SCL<='0';
				else
					SCL<='1';
				end if;
				
				if(scl_timing=499)then
					scl_timing<=0;
					state<=s_read;
					dout<=buff;
					finish<='1';
					busy<='0';
					i<=7;
				end if;
				
		end case;
		
		if(stop='1' and busy='0')then
			state<=s_stop;
		end if;
		
	end if;
end process;

end Behavioral;

