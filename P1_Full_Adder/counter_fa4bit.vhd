library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_4bit is
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end counter_4bit;

architecture Behavioral of counter_4bit is
	component FA_4bit is
		 Port (       a : in  STD_LOGIC_VECTOR (3 downto 0);
				  b : in  STD_LOGIC_VECTOR (3 downto 0);
				  s : out  STD_LOGIC_VECTOR (3 downto 0);
				  c : out  STD_LOGIC);
	end component;
	signal s1,s2:STD_LOGIC_VECTOR (3 downto 0);
begin

	u1:FA_4bit port map
	(
		a =>s2,
		b =>"0001",
		s =>s1,
		c =>open
	);

	process(clk)
		begin
		if(rising_edge(clk))then
			s2<=s1;
		end if;
	end process;

	q<=s2;

end Behavioral;
