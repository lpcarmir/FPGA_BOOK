library ieee;
use ieee.std_logic_1164.all;

entity vga_controller is
    Port ( clk : in  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (4 downto 0);
           green : out  STD_LOGIC_VECTOR (5 downto 0);
           blue : out  STD_LOGIC_VECTOR (4 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC);
end vga_controller;

architecture Behavioral of vga_controller is
signal hcnt:integer range 0 to 1040;
signal vcnt:integer range 0 to 666;
begin

process(clk)
	begin
	if(rising_edge(clk))then
		hcnt<=hcnt+1;
		if(hcnt=1039)then
			hcnt<=0;
			vcnt<=vcnt+1;
			if(vcnt=665)then
				vcnt<=0;
			end if;
		end if;
	end if;
end process;

process(clk)
	begin
	if(rising_edge(clk))then
		if(hcnt>=856 and hcnt<=976)then
			hsync<='1';
		else
			hsync<='0';
		end if;
		if(vcnt>=637 and vcnt<=643)then
			vsync<='1';
		else
			vsync<='0';
		end if;
		
		if(vcnt<600 and hcnt<800)then
			red<="00000";
			green<="111111";
			blue<="11111";
		else
			red<="00000";
			green<="000000";
			blue<="00000";
			
		end if;
	end if;
end process;

end Behavioral;
