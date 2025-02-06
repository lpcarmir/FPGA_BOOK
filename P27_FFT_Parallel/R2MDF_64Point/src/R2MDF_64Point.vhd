library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R2MDF_64Point is
	 Port ( dout_re1	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im1 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  dout_re2	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im2 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  dout_re3	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im3 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  dout_re4	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im4 	: out  STD_LOGIC_VECTOR (15 downto 0);
           din_re 	: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  valid		: out  STD_LOGIC;
           en	 		: in   STD_LOGIC;
           clk 		: in   STD_LOGIC);
end R2MDF_64Point;

architecture Behavioral of R2MDF_64Point is
component top_radix4 is
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
component R2SDF_16Point is
    Port ( din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  valid		: out  STD_LOGIC;
           en	 		: in   STD_LOGIC;
           clk 		: in   STD_LOGIC);
end component;
signal sre1,sim1,sre2,sim2,sre3,sim3,sre4,sim4:STD_LOGIC_VECTOR (15 downto 0);
signal ore1,oim1,ore2,oim2,ore3,oim3,ore4,oim4:STD_LOGIC_VECTOR (15 downto 0);
signal svalid,sen,sbusy:STD_LOGIC;
signal svalid1,svalid2,svalid3,svalid4:STD_LOGIC;
begin

u1:top_radix4 port map
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

u2:R2SDF_16Point port map
(
	din_re	=>sre1,
	din_im 	=>sim1,
	dout_re 	=>ore1,
	dout_im 	=>oim1,
	valid		=>svalid1,
	en	 		=>svalid,
	clk 		=>clk
);

u3:R2SDF_16Point port map
(
	din_re	=>sre2,
	din_im 	=>sim2,
	dout_re 	=>ore2,
	dout_im 	=>oim2,
	valid		=>svalid2,
	en	 		=>svalid,
	clk 		=>clk
);

u4:R2SDF_16Point port map
(
	din_re	=>sre3,
	din_im 	=>sim3,
	dout_re 	=>ore3,
	dout_im 	=>oim3,
	valid		=>svalid3,
	en	 		=>svalid,
	clk 		=>clk
);

u5:R2SDF_16Point port map
(
	din_re	=>sre4,
	din_im 	=>sim4,
	dout_re 	=>ore4,
	dout_im 	=>oim4,
	valid		=>svalid4,
	en	 		=>svalid,
	clk 		=>clk
);
dout_re1<=ore1;
dout_im1<=oim1;

dout_re2<=ore2;
dout_im2<=oim2;

dout_re3<=ore3;
dout_im3<=oim3;

dout_re4<=ore4;
dout_im4<=oim4;

valid<=svalid4;
end Behavioral;

