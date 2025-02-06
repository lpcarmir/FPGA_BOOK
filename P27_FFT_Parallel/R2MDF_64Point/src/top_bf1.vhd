library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_bf1 is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
			  din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  en	 		: in   STD_LOGIC;
			  valid 		: out  STD_LOGIC;
			  clk 		: in   STD_LOGIC);
end top_bf1;

architecture Behavioral of top_bf1 is
component BF1 is
    Port ( clk 	: in   STD_LOGIC;
           in_re 	: in   STD_LOGIC_VECTOR (15 downto 0);
           in_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           out_re : out  STD_LOGIC_VECTOR (15 downto 0);
           out_im : out  STD_LOGIC_VECTOR (15 downto 0);
           valid 	: out  STD_LOGIC;
           start 	: in   STD_LOGIC);
end component;
signal sv,sv2:std_logic;
signal sbf_re,sbf_im:STD_LOGIC_VECTOR (15 downto 0);

signal svalid_bf:STD_LOGIC;
begin
u1:BF1 port map
(
	clk 	=>clk,
   in_re =>din_re,
   in_im =>din_im,
   out_re=>sbf_re,
   out_im=>sbf_im,
   valid =>svalid_bf,
   start  =>en
);


valid<=svalid_bf;
dout_re<=sbf_re;
dout_im<=sbf_im;
end Behavioral;

