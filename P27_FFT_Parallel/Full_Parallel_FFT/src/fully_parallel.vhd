library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
use work.my_pkg.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fully_parallel is
    Port ( din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  mem16;
           dout_im 	: out  mem16;
			  valid		: out  STD_LOGIC;
           en	 		: in   STD_LOGIC;
           clk 		: in   STD_LOGIC);
end fully_parallel;

architecture Behavioral of fully_parallel is
component BF8 is
   Port
	(
		clk 		: in   STD_LOGIC;
		in_re 	: in   STD_LOGIC_VECTOR (15 downto 0);
		in_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
		out_re 	: out  mem16;
		out_im 	: out  mem16;
		valid 	: out  STD_LOGIC;
		start 	: in   STD_LOGIC
	);
end component;

component BF4 is
   Port
	(
		clk 		: in   STD_LOGIC;
		in_re 	: in   mem16;
		in_im 	: in   mem16;
		out_re 	: out  mem16;
		out_im 	: out  mem16;
		valid 	: out  STD_LOGIC;
		start 	: in   STD_LOGIC
	);
end component;

component BF2 is
   Port
	(
		clk 		: in   STD_LOGIC;
		in_re 	: in   mem16;
		in_im 	: in   mem16;
		out_re 	: out  mem16;
		out_im 	: out  mem16;
		valid 	: out  STD_LOGIC;
		start 	: in   STD_LOGIC
	);
end component;

component BF1 is
   Port
	(
		clk 		: in   STD_LOGIC;
		in_re 	: in   mem16;
		in_im 	: in   mem16;
		out_re 	: out  mem16;
		out_im 	: out  mem16;
		valid 	: out  STD_LOGIC;
		start 	: in   STD_LOGIC
	);
end component;


signal index:integer range 0 to 15;
signal sig1_re:mem16;
signal sig1_im:mem16;
signal sig2_re:mem16;
signal sig2_im:mem16;
signal sig3_re:mem16;
signal sig3_im:mem16;
begin
u1:BF8 port map
(
	in_re		=>din_re,
	in_im		=>din_im,
   out_re 	=>sig1_re,
   out_im 	=>sig1_im,
   start	 	=>'1',
   valid 	=>open,
   clk 		=>clk   
);

u2:BF4 port map
(
	in_re		=>sig1_re,
	in_im		=>sig1_im,
   out_re 	=>sig2_re,
   out_im 	=>sig2_im,
   start	 	=>'1',
   valid 	=>open,
   clk 		=>clk   
);

u3:BF2 port map
(
	in_re		=>sig2_re,
	in_im		=>sig2_im,
   out_re 	=>sig3_re,
   out_im 	=>sig3_im,
   start	 	=>'1',
   valid 	=>open,
   clk 		=>clk   
);

u4:BF1 port map
(
	in_re		=>sig3_re,
	in_im		=>sig3_im,
   out_re 	=>dout_re,
   out_im 	=>dout_im,
   start	 	=>'1',
   valid 	=>open,
   clk 		=>clk   
);

end Behavioral;

