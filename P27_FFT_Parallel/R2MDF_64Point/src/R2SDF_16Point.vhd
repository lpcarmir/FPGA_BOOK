library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R2SDF_16Point is
    Port ( din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  valid		: out  STD_LOGIC;
           en	 		: in   STD_LOGIC;
           clk 		: in   STD_LOGIC);
end R2SDF_16Point;

architecture Behavioral of R2SDF_16Point is
component top_bf8 is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
           en	 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC;
           clk 		: in   STD_LOGIC);
end component;
component top_bf4 is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
			  din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
           en	 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC;
           clk 		: in   STD_LOGIC);
end component;
component top_bf2 is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
			  din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  en	 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC;
           clk 		: in   STD_LOGIC);
end component;
component top_bf1 is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
			  din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  en	 		: in   STD_LOGIC;
			  valid 		: out  STD_LOGIC;
			  clk 		: in   STD_LOGIC);
end component;
component reverse_order is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
			  din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  en	 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC;
           clk 		: in   STD_LOGIC);
end component;
signal svalid,svalid2,svalid3,svalid4,svalid5:std_logic;
signal s_re,s_im:STD_LOGIC_VECTOR (15 downto 0);
signal s_re2,s_im2:STD_LOGIC_VECTOR (15 downto 0);
signal s_re3,s_im3:STD_LOGIC_VECTOR (15 downto 0);
signal s_re4,s_im4:STD_LOGIC_VECTOR (15 downto 0);
signal s_re5,s_im5:STD_LOGIC_VECTOR (15 downto 0);
signal s_im6:STD_LOGIC_VECTOR (15 downto 0);
begin

u1:top_bf8 port map
(
	din_re	=>din_re,
	din_im	=>din_im,
   dout_re 	=>s_re,
   dout_im 	=>s_im,
   en		 	=>en,
   valid 	=>svalid,
   clk 		=>clk   
);

u2:top_bf4 port map
(
	din_re	=>s_re,
   din_im 	=>s_im,
   dout_re 	=>s_re2,
   dout_im 	=>s_im2,
	en			=>svalid,
   valid 	=>svalid2,
   clk 		=>clk
);

u3:top_bf2 port map
(
	din_re	=>s_re2,
   din_im 	=>s_im2,
   dout_re 	=>s_re3,
   dout_im 	=>s_im3,
	en			=>svalid2,
   valid 	=>svalid3,
   clk 		=>clk
);

u4:top_bf1 port map
(
	din_re	=>s_re3,
   din_im 	=>s_im3,
   dout_re 	=>s_re4,
   dout_im 	=>s_im4,
	en			=>svalid3,
   valid 	=>svalid4,
   clk 		=>clk
);

--for remove reverse_order uncomment following lines and comment u5 lines
--valid<=svalid4;
--dout_re<=s_re4;
--dout_im<=s_im4;

u5:reverse_order port map
(
	din_re	=>s_re4,
   din_im 	=>s_im4,
   dout_re 	=>s_re5,
   dout_im 	=>s_im5,
	en			=>svalid4,
   valid 	=>svalid5,
   clk 		=>clk
);
valid<=svalid5;
dout_re<=s_re5;
dout_im<=s_im5;
end Behavioral;

