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

entity BF4 is
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
end BF4;

architecture Behavioral of BF4 is
component complex_multiplier is
    Port ( a 			: in   STD_LOGIC_VECTOR (15 downto 0);
           b 			: in   STD_LOGIC_VECTOR (15 downto 0);
           c 			: in   STD_LOGIC_VECTOR (15 downto 0);
           d 			: in   STD_LOGIC_VECTOR (15 downto 0);
           real_out 	: out  STD_LOGIC_VECTOR (15 downto 0);
           imag_out	: out  STD_LOGIC_VECTOR (15 downto 0);
           clk 		: in   STD_LOGIC);
end component;
signal mem2_re:mem16;
signal mem2_im:mem16;
signal mem2t_re:mem16;
signal mem2t_im:mem16;
signal mem3_re:mem16;
signal mem3_im:mem16;
begin

process(clk) begin
	if(rising_edge(clk))then
		mem2_re(0)<=in_re(0)+in_re(4);
		mem2_re(1)<=in_re(1)+in_re(5);
		mem2_re(2)<=in_re(2)+in_re(6);
		mem2_re(3)<=in_re(3)+in_re(7);
		
		mem2_re(4)<=in_re(0)-in_re(4);
		mem2_re(5)<=in_re(1)-in_re(5);
		mem2_re(6)<=in_re(2)-in_re(6);
		mem2_re(7)<=in_re(3)-in_re(7);
		
		mem2_re(8)<=in_re(8) + in_re(12);
		mem2_re(9)<=in_re(9) + in_re(13);
		mem2_re(10)<=in_re(10)+in_re(14);
		mem2_re(11)<=in_re(11)+in_re(15);
		
		mem2_re(12)<=in_re(8) -in_re(12);
		mem2_re(13)<=in_re(9) -in_re(13);
		mem2_re(14)<=in_re(10)-in_re(14);
		mem2_re(15)<=in_re(11)-in_re(15);
		
		for j in 0 to 4 loop
			mem2t_re(j)<=mem2_re(j);
			mem2t_re(j+8)<=mem2_re(j+8);
		end loop;
		
	end if;
end process;

process(clk) begin
	if(rising_edge(clk))then
		mem2_im(0)<=in_im(0)+in_im(4);
		mem2_im(1)<=in_im(1)+in_im(5);
		mem2_im(2)<=in_im(2)+in_im(6);
		mem2_im(3)<=in_im(3)+in_im(7);
		
		mem2_im(4)<=in_im(0)-in_im(4);
		mem2_im(5)<=in_im(1)-in_im(5);
		mem2_im(6)<=in_im(2)-in_im(6);
		mem2_im(7)<=in_im(3)-in_im(7);
		
		mem2_im(8)<=in_im(8) + in_im(12);
		mem2_im(9)<=in_im(9) + in_im(13);
		mem2_im(10)<=in_im(10)+in_im(14);
		mem2_im(11)<=in_im(11)+in_im(15);
		
		mem2_im(12)<=in_im(8) -in_im(12);
		mem2_im(13)<=in_im(9) -in_im(13);
		mem2_im(14)<=in_im(10)-in_im(14);
		mem2_im(15)<=in_im(11)-in_im(15);
		
		for j in 0 to 4 loop
			mem2t_im(j)<=mem2_im(j);
			mem2t_im(j+8)<=mem2_im(j+8);
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
for i in 0 to 4 generate
	mem3_re(i)<=mem2t_re(i);
	mem3_im(i)<=mem2t_im(i);
	
	mem3_re(i+8)<=mem2t_re(i+8);
	mem3_im(i+8)<=mem2t_im(i+8);
end generate;

L1:
for i in 5 to 7 generate
u:complex_multiplier port map
(
	a 			=>mem2_re(i),
	b 			=>mem2_im(i),
	c 			=>wn_real((i-4)*2),
	d 			=>wn_imag((i-4)*2),
	real_out =>mem3_re(i),
	imag_out	=>mem3_im(i),
	clk 		=>clk
);
end generate;

L2:
for i in 13 to 15 generate
u:complex_multiplier port map
(
	a 			=>mem2_re(i),
	b 			=>mem2_im(i),
	c 			=>wn_real((i-12)*2),
	d 			=>wn_imag((i-12)*2),
	real_out =>mem3_re(i),
	imag_out	=>mem3_im(i),
	clk 		=>clk
);
end generate;

out_re<=mem3_re;
out_im<=mem3_im;

end Behavioral;

