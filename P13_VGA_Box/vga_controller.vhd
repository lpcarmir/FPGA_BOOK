library ieee;
use ieee.std_logic_1164.all;

entity vga_controller is
    Port ( clk : in  STD_LOGIC;
			  move_h : in   std_logic; 
           move_v : in   std_logic; 
           red : out  STD_LOGIC_VECTOR (4 downto 0);
           green : out  STD_LOGIC_VECTOR (5 downto 0);
           blue : out  STD_LOGIC_VECTOR (4 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC);
end vga_controller;

architecture Behavioral of vga_controller is
signal hcnt:integer range 0 to 1040;
signal vcnt:integer range 0 to 666;

signal count_key:integer range 0 to 100000;
signal vs: integer range 0 to 580:=100;
signal vs20: integer range 0 to 600:=119;
signal hs: integer range 0 to 800:=100;
signal hs20: integer range 0 to 780:=119;

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
			if ((vcnt<vs20 and vcnt>vs) and (hcnt<hs20 and hcnt>hs)) then
           red<="11111";
			  green<="000000";
			  blue<="00000";
			 else
				red<="00000";
				green<="111111";
				blue<="11111";
			end if;
		else
			red<="00000";
			green<="000000";
			blue<="00000";
		end if;
	end if;
end process;

process(clk)
	begin
	if(rising_edge(clk))then
		count_key<=count_key+1;
		if(count_key=99999)then
			count_key<=0;
			if(move_v='0')then
				vs<=vs+1;
				vs20<=vs+20;
				if(vs=579)then
					vs<=1;
				end if;
			elsif(move_h='0')then
				hs<=hs+1;
				hs20<=hs+20;
				if(hs=779)then
					hs<=1;
				end if;
			end if;
		end if;
	end if;
end process;

end Behavioral;
