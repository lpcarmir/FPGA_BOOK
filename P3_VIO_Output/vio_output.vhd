library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_output is
    Port ( leds : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC);
end vio_output;

architecture Behavioral of vio_output is

	component vio1
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 ASYNC_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	
	component icon1
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
	end component;
	
	signal CONTROL: STD_LOGIC_VECTOR(35 DOWNTO 0);
	signal ASYNC_OUT: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

	u1 : vio1 port map
	(
		CONTROL => CONTROL,
		ASYNC_OUT => ASYNC_OUT
	);

	u2 : icon1 port map
	(
		CONTROL0 => CONTROL
	);
	
	process(clk)
		begin
		if(rising_edge(clk))then
			leds<=ASYNC_OUT;
		end if;
	end process;

end Behavioral;

