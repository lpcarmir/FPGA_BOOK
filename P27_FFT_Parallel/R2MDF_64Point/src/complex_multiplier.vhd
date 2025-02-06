library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity complex_multiplier is
    Port ( a 			: in   STD_LOGIC_VECTOR (15 downto 0);
           b 			: in   STD_LOGIC_VECTOR (15 downto 0);
           c 			: in   STD_LOGIC_VECTOR (15 downto 0);
           d 			: in   STD_LOGIC_VECTOR (15 downto 0);
           real_out 	: out  STD_LOGIC_VECTOR (31 downto 0);
           imag_out	: out  STD_LOGIC_VECTOR (31 downto 0);
           en 			: in   STD_LOGIC;
           clk 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC);
end complex_multiplier;

architecture Behavioral of complex_multiplier is
signal sreal_part1: signed(31 downto 0);
signal sreal_part2: signed(31 downto 0);
signal simag_part1: signed(31 downto 0);
signal simag_part2: signed(31 downto 0);

signal sa: signed(15 downto 0);
signal sb: signed(15 downto 0);
signal sc: signed(15 downto 0);
signal sd: signed(15 downto 0);
signal svalid:std_logic;
begin

sa<=SIGNED(a);
sb<=SIGNED(b);
sc<=SIGNED(c);
sd<=SIGNED(d);

process(clk) begin
	if(rising_edge(clk))then
		if(en='1')then
			sreal_part1<=sa*sc;
			sreal_part2<=sb*sd;
			simag_part1<=sb*sc;
			simag_part2<=sa*sd;
--			real_out<=std_logic_vector(sreal_part1-sreal_part2);
--			imag_out<=std_logic_vector(simag_part1+simag_part2);
			svalid<='1';
		else
			svalid<='0';
		end if;
		
	end if;
end process;
valid<=svalid;
real_out<=std_logic_vector(sreal_part1-sreal_part2);
imag_out<=std_logic_vector(simag_part1+simag_part2);
--valid<=en;
end Behavioral;

