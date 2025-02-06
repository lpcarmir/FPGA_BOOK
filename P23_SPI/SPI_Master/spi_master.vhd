library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity spi_master is
    Port ( clk 		: in   STD_LOGIC;
           MISO 		: in   STD_LOGIC;
           MOSI 		: out  STD_LOGIC;
           SCK 		: out  STD_LOGIC;
           SS 			: out  STD_LOGIC;
           en 			: in   STD_LOGIC;
           din 		: in   STD_LOGIC_VECTOR (7 downto 0);
           dout 		: out  STD_LOGIC_VECTOR (7 downto 0);
           valid 		: out  STD_LOGIC;
           busy 		: out  STD_LOGIC;
           ss_status : in   STD_LOGIC);
end spi_master;

architecture Behavioral of spi_master is
signal cnt_sck:integer range 0 to 49;--50*20ns=1us
signal i:integer range 0 to 7;--8bit
type state_type is (idle,rising,falling,end_ok);
signal state:state_type;
signal buff_din:STD_LOGIC_VECTOR (7 downto 0);
signal buff_dout:STD_LOGIC_VECTOR (7 downto 0);
begin

process(clk)
	begin
	if(rising_edge(clk))then
		
		valid<='0';
		SS<=ss_status;
		
		case state is
			when idle=>
				busy<='0';
				SCK<='0';
				if(en='1')then
					busy<='1';
					buff_din<=din;
					state<=rising;
					i<=7;
					cnt_sck<=0;
				end if;
			
			when rising=>
				MOSI<=buff_din(i);
				cnt_sck<=cnt_sck+1;
				if(cnt_sck=49)then
					SCK<='1';
					cnt_sck<=0;
					buff_dout(i)<=MISO;
					state<=falling;
				end if;
				
			when falling=>
				cnt_sck<=cnt_sck+1;
				if(cnt_sck=49)then
					SCK<='0';
					cnt_sck<=0;
					i<=i-1;
					if(i=0)then
						state<=end_ok;
					else
						state<=rising;
					end if;
				end if;
					
			when end_ok=>
				dout<=buff_dout;
				valid<='1';
				busy<='0';
				state<=idle;
				
		end case;
	end if;
end process;

end Behavioral;

