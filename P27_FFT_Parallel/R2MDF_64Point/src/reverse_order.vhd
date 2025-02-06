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

entity reverse_order is
	Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
			  din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
			  en	 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC;
           clk 		: in   STD_LOGIC);
end reverse_order;

architecture Behavioral of reverse_order is
type mem_type is array(0 to 15) of std_logic_vector(15 downto 0);
signal mem_re:mem_type;
signal mem_im:mem_type;
signal mem_re2:mem_type;
signal mem_im2:mem_type;
signal i,j:integer range 0 to 15;
signal sj,sj2:std_logic_vector(3 downto 0);
signal flag,svalid:std_logic;
begin
valid<=svalid;
process(clk)
	begin
	if(rising_edge(clk))then
		if(en='1')then
			mem_re(j)<=din_re;
			mem_im(j)<=din_im;
			i<=i+1;
			if(i=15)then
				i<=0;
				svalid<='1';
				flag<='1';
				mem_re2<=mem_re;
				mem_im2<=mem_im;
			else
				if(flag='1')then
					flag<='0';
					mem_re2(15)<=mem_re(15);
					mem_im2(15)<=mem_im(15);
				end if;
			end if;
		else
			i<=0;
			svalid<='0';
		end if;
	end if;
end process;

sj<=conv_std_logic_vector(i,4);
sj2(3)<=sj(0);
sj2(2)<=sj(1);
sj2(1)<=sj(2);
sj2(0)<=sj(3);
j<=conv_integer(sj2);
dout_re<=mem_re2(i);
dout_im<=mem_im2(i);

end Behavioral;

