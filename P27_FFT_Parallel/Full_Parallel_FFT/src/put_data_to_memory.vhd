library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_pkg.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity put_data_to_memory is
    Port ( din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           mem1_re	: out  mem16;
           mem1_im 	: out  mem16;
           clk 		: in   STD_LOGIC);
end put_data_to_memory;

architecture Behavioral of put_data_to_memory is
signal mem_re:mem16;
begin

process(clk) begin
	if(rising_edge(clk))then
		mem_re(15)<=din_re;
		for i in 14 downto 0 loop
			mem_re(i)<=mem_re(i+1);
		end loop;
	end if;
end process;
mem1_re<=mem_re;

end Behavioral;

