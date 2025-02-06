----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:14:15 04/08/2024 
-- Design Name: 
-- Module Name:    fa_4bit - Behavioral 
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

entity fa_4bit is
    Port ( a : in  STD_LOGIC_VECTOR (24 downto 0);
           b : in  STD_LOGIC_VECTOR (24 downto 0);
           s : out  STD_LOGIC_VECTOR (24 downto 0);
           c : out  STD_LOGIC);
end fa_4bit;

architecture Behavioral of fa_4bit is

component fa is
    Port ( a 	: in  STD_LOGIC;
           b 	: in  STD_LOGIC;
           ci 	: in  STD_LOGIC;
           co 	: out  STD_LOGIC;
           s 	: out  STD_LOGIC);
end component;

signal sig: std_logic_vector(25 downto 0);

begin


sig(0)<='0';

u:for k in 0 to 24 generate
	u1 : fa port map
	(
		a 	=>a(k),
		b 	=>b(k),
		ci =>sig(k),
		co =>sig(k+1),
		s 	=>s(k)
	);
end generate;

c<=sig(25);



--sig(0)<='0';
--
--u1 : fa port map
--(
--	a 	=>a(0),
--   b 	=>b(0),
--   ci =>sig(0),
--   co =>sig(1),
--   s 	=>s(0)
--);
--
--u2 : fa port map
--(
--	a 	=>a(1),
--   b 	=>b(1),
--   ci =>sig(1),
--   co =>sig(2),
--   s 	=>s(1)
--);
--
--u3 : fa port map
--(
--	a 	=>a(2),
--   b 	=>b(2),
--   ci =>sig(2),
--   co =>sig(3),
--   s 	=>s(2)
--);
--
--u4 : fa port map
--(
--	a 	=>a(3),
--   b 	=>b(3),
--   ci =>sig(3),
--   co =>sig(4),
--   s 	=>s(3)
--);
--
--c<=sig(4);

end Behavioral;

