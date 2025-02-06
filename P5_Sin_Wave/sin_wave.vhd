----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:15 11/15/2024 
-- Design Name: 
-- Module Name:    sin_wave - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sin_wave is
    Port ( clk : in  STD_LOGIC);
end sin_wave;

architecture Behavioral of sin_wave is

COMPONENT sin_code_rom
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

component icon_rom
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
end component;

component ila_rom
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

signal CONTROL: std_logic_vector(35 downto 0);
signal addr: std_logic_vector(7 downto 0);
signal ila_data: std_logic_vector(7 downto 0);
begin

u1 : sin_code_rom PORT MAP
(
    clka => clk,
    addra => addr,
    douta => ila_data
);

u2 : icon_rom port map
(
    CONTROL0 => CONTROL
);

u3 : ila_rom port map
(
    CONTROL => CONTROL,
    CLK => CLK,
    TRIG0 => ila_data
);

process(clk)
	begin
	if(rising_edge(clk))then
		addr<=addr+'1';
	end if;
end process;

end Behavioral;

