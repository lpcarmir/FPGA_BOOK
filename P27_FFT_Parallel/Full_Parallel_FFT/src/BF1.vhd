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

entity BF1 is
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
end BF1;

architecture Behavioral of BF1 is
signal mem2_re:mem16;
signal mem2_im:mem16;
begin

process(clk) begin
	if(rising_edge(clk))then
		mem2_re(0)<=in_re(0)+in_re(1);
		mem2_re(8)<=in_re(0)-in_re(1);
		
		mem2_re(4)<=in_re(2)+in_re(3);
		mem2_re(12)<=in_re(2)-in_re(3);
		
		mem2_re(2)<=in_re(4)+in_re(5);
		mem2_re(10)<=in_re(4)-in_re(5);
		
		mem2_re(6)<=in_re(6)+in_re(7);
		mem2_re(14)<=in_re(6)-in_re(7);
		
		mem2_re(1)<=in_re(8)+in_re(9);
		mem2_re(9)<=in_re(8)-in_re(9);
		
		mem2_re(5)<=in_re(10)+in_re(11);
		mem2_re(13)<=in_re(10)-in_re(11);
		
		mem2_re(3)<=in_re(12)+in_re(13);
		mem2_re(11)<=in_re(12)-in_re(13);
		
		mem2_re(7)<=in_re(14)+in_re(15);
		mem2_re(15)<=in_re(14)-in_re(15);
		
	end if;
end process;

process(clk) begin
	if(rising_edge(clk))then
		mem2_im(0)<=in_im(0)+in_im(1);
		mem2_im(8)<=in_im(0)-in_im(1);
		            
		mem2_im(4)<=in_im(2)+in_im(3);
		mem2_im(12)<=in_im(2)-in_im(3);
		            
		mem2_im(2)<=in_im(4)+in_im(5);
		mem2_im(10)<=in_im(4)-in_im(5);
		            
		mem2_im(6)<=in_im(6)+in_im(7);
		mem2_im(14)<=in_im(6)-in_im(7);
		            
		mem2_im(1)<=in_im(8)+in_im(9);
		mem2_im(9)<=in_im(8)-in_im(9);
		            
		mem2_im(5)<=in_im(10)+in_im(11);
		mem2_im(13)<=in_im(10)-in_im(11);
		            
		mem2_im(3)<=in_im(12)+in_im(13);
		mem2_im(11)<=in_im(12)-in_im(13);
		            
		mem2_im(7)<=in_im(14)+in_im(15);
		mem2_im(15)<=in_im(14)-in_im(15);
		
	end if;
end process;

out_re<=mem2_re;
out_im<=mem2_im;

end Behavioral;

