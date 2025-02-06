library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_radix4 is
	 Port ( din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           re1,im1 	: out  STD_LOGIC_VECTOR (15 downto 0);
           re2,im2 	: out  STD_LOGIC_VECTOR (15 downto 0);
           re3,im3 	: out  STD_LOGIC_VECTOR (15 downto 0);
           re4,im4 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  valid		: out  STD_LOGIC;
			  busy		: out  STD_LOGIC;
           en	 		: in   STD_LOGIC;
           clk 		: in   STD_LOGIC);
end top_radix4;

architecture Behavioral of top_radix4 is
component BF4_radix4 is
	 Port ( din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           re1,im1 	: out  STD_LOGIC_VECTOR (15 downto 0);
           re2,im2 	: out  STD_LOGIC_VECTOR (15 downto 0);
           re3,im3 	: out  STD_LOGIC_VECTOR (15 downto 0);
           re4,im4 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  valid		: out  STD_LOGIC;
			  busy		: out  STD_LOGIC;
           en	 		: in   STD_LOGIC;
           clk 		: in   STD_LOGIC);
end component;
component mult_radix4 is
	 Port ( re1o,im1o	: out  STD_LOGIC_VECTOR (15 downto 0);
           re2o,im2o	: out  STD_LOGIC_VECTOR (15 downto 0);
           re3o,im3o	: out  STD_LOGIC_VECTOR (15 downto 0);
           re4o,im4o	: out  STD_LOGIC_VECTOR (15 downto 0);
           re1,im1 	: in   STD_LOGIC_VECTOR (15 downto 0);
           re2,im2 	: in   STD_LOGIC_VECTOR (15 downto 0);
           re3,im3 	: in   STD_LOGIC_VECTOR (15 downto 0);
           re4,im4 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  valid		: out  STD_LOGIC;
           en	 		: in   STD_LOGIC;
           clk 		: in   STD_LOGIC);
end component;
signal sre1,sim1,sre2,sim2,sre3,sim3,sre4,sim4:STD_LOGIC_VECTOR (15 downto 0);
signal svalid,sen,sbusy:STD_LOGIC;
begin
u1:BF4_radix4 port map
(
	din_re	=>din_re,
	din_im 	=>din_im,
	re1 		=>sre1,
	im1 		=>sim1,
   re2 		=>sre2,
   im2 		=>sim2,
   re3 		=>sre3,
   im3 		=>sim3,
   re4 		=>sre4,
   im4 		=>sim4,
   valid		=>svalid,
   busy		=>sbusy,
   en	 		=>en,
   clk 		=>clk
);

u2:mult_radix4 port map
(
	re1 		=>sre1,
	im1 		=>sim1,
	re2 		=>sre2,
	im2 		=>sim2,
	re3 		=>sre3,
	im3 		=>sim3,
   re4 		=>sre4,
   im4 		=>sim4,
   valid		=>valid,
   en	 		=>svalid,
   clk 		=>clk,
	re1o 		=>re1,
	im1o 		=>im1,
	re2o 		=>re2,
	im2o 		=>im2,
	re3o 		=>re3,
	im3o 		=>im3,
	re4o 		=>re4,
   im4o 		=>im4
);

end Behavioral;

