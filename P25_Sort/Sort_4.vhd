
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sort_4 is
    Port ( clk        : in  STD_LOGIC;
			  input0  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input1  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input2  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input3  : in  STD_LOGIC_VECTOR(7 downto 0);
			  output0 : out STD_LOGIC_VECTOR(7 downto 0);
			  output1 : out STD_LOGIC_VECTOR(7 downto 0);
			  output2 : out STD_LOGIC_VECTOR(7 downto 0);
			  output3 : out STD_LOGIC_VECTOR(7 downto 0));
end Sort_4;

architecture Behavioral of Sort_4 is

	type buff_type is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
	signal Step1 : buff_type;
	signal Step2 : buff_type;

begin

-- ======================================================= Step 1 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			if(input0 > input1)then Step1(0)<=input0; Step1(1)<=input1; else Step1(0)<=input1; Step1(1)<=input0; end if;
			if(input2 > input3)then Step1(2)<=input2; Step1(3)<=input3; else Step1(2)<=input3; Step1(3)<=input2; end if;		
		end if;
	end process;
-- ======================================================= Step 2 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			if(Step1(0) > Step1(2))then Step2(0)<=Step1(0); Step2(1)<=Step1(2); else Step2(0)<=Step1(2); Step2(1)<=Step1(0); end if;
			if(Step1(1) > Step1(3))then Step2(2)<=Step1(1); Step2(3)<=Step1(3); else Step2(2)<=Step1(3); Step2(3)<=Step1(1); end if;		
		end if;
	end process;
-- ======================================================= Step 3 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			output0 <= Step2(0);
			if(Step2(1) > Step2(2))then output1<=Step2(1); output2<=Step2(2); else output1<=Step2(2); output2<=Step2(1); end if;		
			output3 <= Step2(3);
		end if;
	end process;
-- ================================================================================

end Behavioral;

