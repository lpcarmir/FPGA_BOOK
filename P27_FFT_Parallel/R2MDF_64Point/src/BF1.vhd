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

entity BF1 is
	 Port ( clk 	: in   STD_LOGIC;
			  in_re 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  in_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  out_re : out  STD_LOGIC_VECTOR (15 downto 0);
			  out_im : out  STD_LOGIC_VECTOR (15 downto 0);
			  valid 	: out  STD_LOGIC;
			  start 	: in   STD_LOGIC);
end BF1;

architecture Behavioral of BF1 is
signal state:integer range 0 to 1;
signal complemet_in_re:std_logic_vector(15 downto 0);
signal complemet_in_im:std_logic_vector(15 downto 0);
signal mem_re,mem_im:std_logic_vector(15 downto 0);
signal sout_re:std_logic_vector(15 downto 0);
signal sout_im:std_logic_vector(15 downto 0);
signal svalid:std_logic:='0';
begin
complemet_in_re<=not(in_re)+1;
complemet_in_im<=not(in_im)+1;
process(clk)
	begin
	if(rising_edge(clk))then
		out_re<=sout_re;
		out_im<=sout_im;
		case(state)is
			when 0=>
				sout_re<=mem_re;
				sout_im<=mem_im;
				if(start='1')then
					mem_re<=in_re;
					mem_im<=in_im;
					state<=1;
				else
					svalid<='0';
				end if;
			when 1=>
				svalid<='1';
				sout_re<=mem_re+in_re;
				sout_im<=mem_im+in_im;
				mem_re<=mem_re+complemet_in_re;
				mem_im<=mem_im+complemet_in_im;
				state<=0;
		end case;
		valid<=svalid;
	end if;
end process;

end Behavioral;

