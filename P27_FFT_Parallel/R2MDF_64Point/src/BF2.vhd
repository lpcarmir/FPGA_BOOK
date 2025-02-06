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

entity BF2 is
	 Port ( clk 	: in   STD_LOGIC;
			  in_re 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  in_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
			  out_re : out  STD_LOGIC_VECTOR (15 downto 0);
			  out_im : out  STD_LOGIC_VECTOR (15 downto 0);
			  valid 	: out  STD_LOGIC;
			  wn_mult: out  STD_LOGIC;
			  start 	: in   STD_LOGIC);
end BF2;

architecture Behavioral of BF2 is
type mem2_type is array(0 to 1) of std_logic_vector(15 downto 0);
signal mem2_re:mem2_type;
signal mem2_im:mem2_type;
signal state:integer range 0 to 1;
signal i:integer range 0 to 1;
signal complemet_in_re:std_logic_vector(15 downto 0);
signal complemet_in_im:std_logic_vector(15 downto 0);
signal sout_re:std_logic_vector(15 downto 0);
signal sout_im:std_logic_vector(15 downto 0);
signal flag:std_logic:='0';
signal swn_mult,svalid:std_logic:='0';
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
				if(start='1')then
					if(flag='1')then
						swn_mult<='1';
					end if;
					mem2_re(i)<=in_re;
					mem2_im(i)<=in_im;
					sout_re<=mem2_re(i);
					sout_im<=mem2_im(i);
					i<=i+1;
					if(i=1)then
						i<=0;
						state<=1;
					end if;
				else
					if(flag='1')then
						swn_mult<='1';
						sout_re<=mem2_re(i);
						sout_im<=mem2_im(i);
						i<=i+1;
						if(i=1)then
							i<=0;
							flag<='0';
						end if;
					else
						svalid<='0';
						swn_mult<='0';
					end if;
				end if;
			when 1=>
				swn_mult<='0';
				svalid<='1';
				flag<='1';
				sout_re<=mem2_re(i)+in_re;
				sout_im<=mem2_im(i)+in_im;
				mem2_re(i)<=mem2_re(i)+complemet_in_re;
				mem2_im(i)<=mem2_im(i)+complemet_in_im;
				i<=i+1;
				if(i=1)then
					i<=0;
					state<=0;
				end if;
		end case;
		wn_mult<=swn_mult;
		valid<=svalid;
	end if;
end process;

end Behavioral;

