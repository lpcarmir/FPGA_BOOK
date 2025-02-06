library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BF4_radix4 is
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
end BF4_radix4;

architecture Behavioral of BF4_radix4 is
type mem is array(0 to 63) of STD_LOGIC_VECTOR (15 downto 0);
signal memory_re:mem;
signal memory_im:mem;
signal i:integer range 0 to 63;
signal sbusy:std_logic:='0';
begin
process(clk) begin
	if(rising_edge(clk))then
		valid<='0';
		if(en='1' and sbusy='0')then
			i<=i+1;
			memory_re(i)<=din_re;
			memory_im(i)<=din_im;
			if(i=63)then
				i<=0;
				sbusy<='1';
			end if;
		end if;
		if(sbusy='1')then
			valid<='1';
			i<=i+1;
			if(i=15)then
				i<=0;
				sbusy<='0';
			end if;
			re1<=memory_re(i)+memory_re(i+16)+memory_re(i+32)+memory_re(i+48);
			im1<=memory_im(i)+memory_im(i+16)+memory_im(i+32)+memory_im(i+48);
			
			re2<=memory_re(i)+memory_im(i+16)-memory_re(i+32)-memory_im(i+48);
			im2<=memory_im(i)-memory_re(i+16)-memory_im(i+32)+memory_re(i+48);
			
			re3<=memory_re(i)-memory_re(i+16)+memory_re(i+32)-memory_re(i+48);
			im3<=memory_im(i)-memory_im(i+16)+memory_im(i+32)-memory_im(i+48);
			
			re4<=memory_re(i)-memory_im(i+16)-memory_re(i+32)+memory_im(i+48);
			im4<=memory_im(i)+memory_re(i+16)-memory_im(i+32)-memory_re(i+48);
		end if;
	end if;
end process;
busy<=sbusy;
end Behavioral;

