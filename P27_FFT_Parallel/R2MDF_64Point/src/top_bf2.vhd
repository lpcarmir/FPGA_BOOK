library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_bf2 is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
			  din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  en	 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC;
           clk 		: in   STD_LOGIC);
end top_bf2;

architecture Behavioral of top_bf2 is
component BF2 is
    Port ( clk 	: in   STD_LOGIC;
           in_re 	: in   STD_LOGIC_VECTOR (15 downto 0);
           in_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           out_re : out  STD_LOGIC_VECTOR (15 downto 0);
           out_im : out  STD_LOGIC_VECTOR (15 downto 0);
           valid 	: out  STD_LOGIC;
           wn_mult: out  STD_LOGIC;
           start 	: in   STD_LOGIC);
end component;
component complex_multiplier is
    Port ( a 			: in   STD_LOGIC_VECTOR (15 downto 0);
           b 			: in   STD_LOGIC_VECTOR (15 downto 0);
           c 			: in   STD_LOGIC_VECTOR (15 downto 0);
           d 			: in   STD_LOGIC_VECTOR (15 downto 0);
           real_out 	: out  STD_LOGIC_VECTOR (31 downto 0);
           imag_out	: out  STD_LOGIC_VECTOR (31 downto 0);
           en 			: in   STD_LOGIC;
           clk 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC);
end component;
type wn_type is array (0 to 2) of std_logic_vector(15 downto 0);
constant wn_real:wn_type:=(x"0100",x"0061",x"FF14");
--                                0.3827  -0.9239
constant wn_imag:wn_type:=(x"0000",x"FF14",x"FF9F");
--                                -0.9239 -0.3827
signal sbf_re,sbf_im:STD_LOGIC_VECTOR (15 downto 0);
signal sbf_re2,sbf_im2:STD_LOGIC_VECTOR (15 downto 0);
signal mult_out_re:STD_LOGIC_VECTOR (31 downto 0);
signal mult_out_im:STD_LOGIC_VECTOR (31 downto 0);
signal svalid_bf:STD_LOGIC;
signal swn_bf:STD_LOGIC;
signal i:integer range 0 to 2;
signal wn_re,wn_im:STD_LOGIC_VECTOR (15 downto 0);
signal sv,sv2,sv3,sv4,sv5:std_logic;
begin

u1:BF2 port map
(
	clk 	=>clk,
   in_re =>din_re,
   in_im =>din_im,
   out_re=>sbf_re,
   out_im=>sbf_im,
   valid =>svalid_bf,
   wn_mult=>swn_bf,
   start  =>en
);

u2:complex_multiplier port map
(
	a 			=>sbf_re2,
	b 			=>sbf_im2,
	c 			=>wn_re,
	d 			=>wn_im,
	real_out =>mult_out_re,
	imag_out	=>mult_out_im,
	en 		=>'1',
	clk 		=>clk,
	valid 	=>open
);

wn_re<=wn_real(i);
wn_im<=wn_imag(i);

process(clk)
	begin
	if(rising_edge(clk))then
		sv<=svalid_bf;
		sv2<=sv;
		sv3<=sv2;
		sv4<=sv3;
		sv5<=sv4;
		sbf_re2<=sbf_re;
		sbf_im2<=sbf_im;
		if(swn_bf='1')then
			i<=i+1;
			if(i=2)then
				i<=0;
			end if;
		else
			i<=0;
		end if;
	end if;
end process;
valid<=sv5;
dout_re<=mult_out_re(23 downto 8);
dout_im<=mult_out_im(23 downto 8);
end Behavioral;


