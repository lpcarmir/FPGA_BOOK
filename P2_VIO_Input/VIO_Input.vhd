library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VIO_Input is
    Port ( keys : in  STD_LOGIC_VECTOR (4 downto 0);
	        clk  : in  STD_LOGIC);
end VIO_Input;

architecture Behavioral of VIO_Input is
	component vio_in
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 ASYNC_IN : IN STD_LOGIC_VECTOR(4 DOWNTO 0));
	end component;
	
	component icon_ip
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
	end component;
	
	signal CONTROL: STD_LOGIC_VECTOR(35 DOWNTO 0);
	signal skeys: STD_LOGIC_VECTOR(4 DOWNTO 0);
begin

	process(clk)
		begin
		if(rising_edge(clk))then
			skeys<=keys;
		end if;
	end process;

	u1 : vio_in port map
	(
		CONTROL => CONTROL,
		ASYNC_IN => skeys
	);
	
	u2 : icon_ip port map
	(
		CONTROL0 => CONTROL
	);
end Behavioral;

