----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:47:21 04/09/2024 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
	generic
	(
		constant LEN:integer:=25
	);
    Port ( clk : in  STD_LOGIC;
           led : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is

component fa_n_bit is
	generic
	(
		constant LEN:integer:=8
	);
   Port ( a : in  STD_LOGIC_VECTOR (LEN-1 downto 0);
           b : in  STD_LOGIC_VECTOR (LEN-1 downto 0);
           s : out  STD_LOGIC_VECTOR (LEN-1 downto 0);
           c : out  STD_LOGIC);
end component;

signal sig1: std_logic_vector(LEN-1 downto 0);
signal sig2: std_logic_vector(LEN-1 downto 0):=(others=>'0');
signal sled: std_logic:='0';

begin


process(clk)
	begin
	if(rising_edge(clk))then
		sig2<=sig1;
		if(sig2=conv_std_logic_vector(24999999,LEN))then
			sled<=not sled;
			sig2<=conv_std_logic_vector(0,LEN);
		end if;
	end if;
end process;


u1: fa_n_bit generic map
(
	LEN=>LEN
)port map
(
	a=>sig2,
	b=>conv_std_logic_vector(1,LEN),
	s=>sig1,
	c=>open
);

led<=sled;

end Behavioral;

