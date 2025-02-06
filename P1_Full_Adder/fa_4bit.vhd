library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_4bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end FA_4bit;

architecture Behavioral of FA_4bit is
	component FA is
		Port ( ai : in  STD_LOGIC;
			   bi : in  STD_LOGIC;
			   ci : in  STD_LOGIC;
			   co : out  STD_LOGIC;
			   so : out  STD_LOGIC);
	end component;
	signal s1,s2,s3:std_logic;
begin

	u1: FA port map
	(
		ai=>a(0),
		bi=>b(0),
		ci=>'0',
		co=>s1,
		so=>s(0)
	);

	u2: FA port map
	(
		ai=>a(1),
		bi=>b(1),
		ci=>s1,
		co=>s2,
		so=>s(1)
	);

	u3: FA port map
	(
		ai=>a(2),
		bi=>b(2),
		ci=>s2,
		co=>s3,
		so=>s(2)
	);

	u4: FA port map
	(
		ai=>a(3),
		bi=>b(3),
		ci=>s3,
		co=>c,
		so=>s(3)
	);

end Behavioral;
