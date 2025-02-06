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

entity BF8 is
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
end BF8;

architecture Behavioral of BF8 is
component complex_multiplier is
    Port ( a 			: in   STD_LOGIC_VECTOR (15 downto 0);
           b 			: in   STD_LOGIC_VECTOR (15 downto 0);
           c 			: in   STD_LOGIC_VECTOR (15 downto 0);
           d 			: in   STD_LOGIC_VECTOR (15 downto 0);
           real_out 	: out  STD_LOGIC_VECTOR (15 downto 0);
           imag_out	: out  STD_LOGIC_VECTOR (15 downto 0);
           clk 		: in   STD_LOGIC);
end component;
signal mem:mem16;
signal memi:mem16;
signal mem2:mem16;
signal mem2i:mem16;
signal mem2t_re:mem9;
signal mem2t_im:mem9;
signal mem3_re:mem16;
signal mem3_im:mem16;
begin
process(clk) begin
	if(rising_edge(clk))then
		mem(15)<=in_re;
		memi(15)<=in_im;
		for i in 14 downto 0 loop
			mem(i)<=mem(i+1);
			memi(i)<=memi(i+1);
		end loop;
	end if;
end process;

process(clk) begin
	if(rising_edge(clk))then
		mem2(0)<=mem(0)+mem(8);
		mem2(1)<=mem(1)+mem(9);
		mem2(2)<=mem(2)+mem(10);
		mem2(3)<=mem(3)+mem(11);
		mem2(4)<=mem(4)+mem(12);
		mem2(5)<=mem(5)+mem(13);
		mem2(6)<=mem(6)+mem(14);
		mem2(7)<=mem(7)+mem(15);
		
		mem2(8)<=mem(0)-mem(8);
		mem2(9)<=mem(1)-mem(9);
		mem2(10)<=mem(2)-mem(10);
		mem2(11)<=mem(3)-mem(11);
		mem2(12)<=mem(4)-mem(12);
		mem2(13)<=mem(5)-mem(13);
		mem2(14)<=mem(6)-mem(14);
		mem2(15)<=mem(7)-mem(15);
		
		for j in 0 to 8 loop
			mem2t_re(j)<=mem2(j);
		end loop;
		
	end if;
end process;

process(clk) begin
	if(rising_edge(clk))then
		mem2i(0)<=memi(0)+memi(8);
		mem2i(1)<=memi(1)+memi(9);
		mem2i(2)<=memi(2)+memi(10);
		mem2i(3)<=memi(3)+memi(11);
		mem2i(4)<=memi(4)+memi(12);
		mem2i(5)<=memi(5)+memi(13);
		mem2i(6)<=memi(6)+memi(14);
		mem2i(7)<=memi(7)+memi(15);
		
		mem2i(8)<=memi(0)-memi(8);
		mem2i(9)<=memi(1)-memi(9);
		mem2i(10)<=memi(2)-memi(10);
		mem2i(11)<=memi(3)-memi(11);
		mem2i(12)<=memi(4)-memi(12);
		mem2i(13)<=memi(5)-memi(13);
		mem2i(14)<=memi(6)-memi(14);
		mem2i(15)<=memi(7)-memi(15);
		
		for j in 0 to 8 loop
			mem2t_im(j)<=mem2i(j);
		end loop;
		
	end if;
end process;

--L0:
--for i in 0 to 7 generate
--u0:complex_multiplier port map
--(
--	a 			=>mem2(i),
--	b 			=>(others=>'0'),
--	c 			=>x"0100",
--	d 			=>x"0000",
--	real_out =>mem3_re(i),
--	imag_out	=>mem3_im(i),
--	clk 		=>clk
--);
--end generate;

L0:
for i in 0 to 8 generate
	mem3_re(i)<=mem2t_re(i);
	mem3_im(i)<=mem2t_im(i);
end generate;

L1:
for i in 9 to 15 generate
u:complex_multiplier port map
(
	a 			=>mem2(i),
	b 			=>(others=>'0'),
	c 			=>wn_real(i-8),
	d 			=>wn_imag(i-8),
	real_out =>mem3_re(i),
	imag_out	=>mem3_im(i),
	clk 		=>clk
);
end generate;

out_re<=mem3_re;
out_im<=mem3_im;

end Behavioral;

