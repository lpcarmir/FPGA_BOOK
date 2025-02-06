----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:00 10/24/2024 
-- Design Name: 
-- Module Name:    fa - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fa is
    Port ( ai : in  STD_LOGIC;
           bi : in  STD_LOGIC;
           ci : in  STD_LOGIC;
           co : out  STD_LOGIC;
           so : out  STD_LOGIC);
end fa;

architecture Behavioral of fa is
	component HA is
		 Port ( a : in  STD_LOGIC;
				  b : in  STD_LOGIC;
				  c : out  STD_LOGIC;
				  s : out  STD_LOGIC);
	end component;
	signal s1,s2,s3:STD_LOGIC;
begin

	u1: HA port map
	(
		a=>ai,
		b=>bi,
		c=>s1,
		s=>s2
	);

	u2: HA port map
	(
		a=>s2,
		b=>ci,
		c=>s3,
		s=>so
	);

	co<=s1 or s3;

end Behavioral;

