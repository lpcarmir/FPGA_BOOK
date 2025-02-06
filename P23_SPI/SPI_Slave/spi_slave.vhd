library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity spi_slave is
    Port ( clk 	: in   STD_LOGIC;
			  din 	: in   STD_LOGIC_VECTOR(7 downto 0);
			  dout 	: out  STD_LOGIC_VECTOR(7 downto 0);
			  valid 	: out  STD_LOGIC;
           MISO 	: out  STD_LOGIC;
           MOSI 	: in   STD_LOGIC;
           SCK 	: in   STD_LOGIC;
           SS 		: in   STD_LOGIC);
end spi_slave;

architecture Behavioral of spi_slave is
signal i:integer range 0 to 7;
signal buff_in:STD_LOGIC_VECTOR(7 downto 0);
signal buff_out:STD_LOGIC_VECTOR(7 downto 0);
signal sck1,sck2,sck3:STD_LOGIC;
signal flag,flag2:STD_LOGIC;
begin

process(clk)
	begin
	if(rising_edge(clk))then
		
		valid<='0';
		sck1<=SCK;
		sck2<=sck1;
		sck3<=sck2;
		
		if(SS='0')then
			if(sck3='0' and sck2='1')then--rising
				buff_out(i)<=MOSI;
			end if;
			
			if(sck3='1' and sck2='0')then--falling
				flag2<='1';
				i<=i-1;
				if(i=0)then
					i<=7;
					flag<='1';
					dout<=buff_out;
					valid<='1';
				end if;
			end if;
			
			if(flag='1')then
				flag<='0';
				i<=7;
				MISO<=din(7);
				buff_in<=din;
			end if;
			
			if(flag2='1')then
				flag2<='0';
				MISO<=buff_in(i);
			end if;
		else
			buff_in<=din;
			MISO<=din(7);
			i<=7;
		end if;
	end if;
end process;

end Behavioral;

