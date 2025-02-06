----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:11 04/09/2024 
-- Design Name: 
-- Module Name:    fa_n_bit - Behavioral 
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

entity fa_n_bit is
	generic
	(
		constant LEN:integer:=8
	);
   Port ( a : in  STD_LOGIC_VECTOR (LEN-1 downto 0);
           b : in  STD_LOGIC_VECTOR (LEN-1 downto 0);
           s : out  STD_LOGIC_VECTOR (LEN-1 downto 0);
           c : out  STD_LOGIC);
end fa_n_bit;

architecture Behavioral of fa_n_bit is

component fa is
    Port ( a 	: in  STD_LOGIC;
           b 	: in  STD_LOGIC;
           ci 	: in  STD_LOGIC;
           co 	: out  STD_LOGIC;
           s 	: out  STD_LOGIC);
end component;

signal sig: std_logic_vector(LEN downto 0);

begin



sig(0)<='0';

u:for k in 0 to LEN-1 generate
	u1 : fa port map
	(
		a 	=>a(k),
		b 	=>b(k),
		ci =>sig(k),
		co =>sig(k+1),
		s 	=>s(k)
	);
end generate;

c<=sig(LEN);


end Behavioral;

