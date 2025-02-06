
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sort_8 is
    Port ( clk     : in  STD_LOGIC;
			  input0  : in  STD_LOGIC_VECTOR(7 downto 0); -- inputs
			  input1  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input2  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input3  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input4  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input5  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input6  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input7  : in  STD_LOGIC_VECTOR(7 downto 0);
			  output0 : out STD_LOGIC_VECTOR(7 downto 0); -- outputs
			  output1 : out STD_LOGIC_VECTOR(7 downto 0);
			  output2 : out STD_LOGIC_VECTOR(7 downto 0);
			  output3 : out STD_LOGIC_VECTOR(7 downto 0);
			  output4 : out STD_LOGIC_VECTOR(7 downto 0);
			  output5 : out STD_LOGIC_VECTOR(7 downto 0);
			  output6 : out STD_LOGIC_VECTOR(7 downto 0);
			  output7 : out STD_LOGIC_VECTOR(7 downto 0));
end Sort_8;

architecture Behavioral of Sort_8 is
	
	component Sort_4 is
		 Port ( clk     : in  STD_LOGIC;
				  input0  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input1  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input2  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input3  : in  STD_LOGIC_VECTOR(7 downto 0);
				  output0 : out STD_LOGIC_VECTOR(7 downto 0);
				  output1 : out STD_LOGIC_VECTOR(7 downto 0);
				  output2 : out STD_LOGIC_VECTOR(7 downto 0);
				  output3 : out STD_LOGIC_VECTOR(7 downto 0));
	end component;

	type buff_type is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
	signal Step1 : buff_type;
	signal Step2 : buff_type;
	signal Step3 : buff_type;
	signal Step4 : buff_type;

begin
-- =====================================================================================
	Cluster_1 : Sort_4 
		 Port map( clk => clk , 
					  input0=>input0    , input1=>input1    , input2=>input2    , input3=>input3 ,
					  output0=>Step1(0) , output1=>Step1(1) , output2=>Step1(2) , output3=>Step1(3));
	Cluster_2 : Sort_4 
		 Port map( clk => clk , 
					  input0=>input4    , input1=>input5    , input2=>input6    , input3=>input7 ,
					  output0=>Step1(4) , output1=>Step1(5) , output2=>Step1(6) , output3=>Step1(7));
-- ======================================================= Step 1 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			if(Step1(0) > Step1(4))then Step2(0)<=Step1(0); Step2(1)<=Step1(4); else Step2(0)<=Step1(4); Step2(1)<=Step1(0); end if;
			if(Step1(1) > Step1(5))then Step2(2)<=Step1(1); Step2(3)<=Step1(5); else Step2(2)<=Step1(5); Step2(3)<=Step1(1); end if;		
			if(Step1(2) > Step1(6))then Step2(4)<=Step1(2); Step2(5)<=Step1(6); else Step2(4)<=Step1(6); Step2(5)<=Step1(2); end if;		
			if(Step1(3) > Step1(7))then Step2(6)<=Step1(3); Step2(7)<=Step1(7); else Step2(6)<=Step1(7); Step2(7)<=Step1(3); end if;		
		end if;
	end process;
-- ======================================================= Step 2 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step3(0) <= Step2(0);
			if(Step2(1) > Step2(2))then Step3(1)<=Step2(1); Step3(2)<=Step2(2); else Step3(1)<=Step2(2); Step3(2)<=Step2(1); end if;
			if(Step2(3) > Step2(4))then Step3(3)<=Step2(3); Step3(4)<=Step2(4); else Step3(3)<=Step2(4); Step3(4)<=Step2(3); end if;		
			if(Step2(5) > Step2(6))then Step3(5)<=Step2(5); Step3(6)<=Step2(6); else Step3(5)<=Step2(6); Step3(6)<=Step2(5); end if;			
			Step3(7) <= Step2(7);
		end if;
	end process;
-- ======================================================= Step 3 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step4(0) <= Step3(0);
			Step4(1) <= Step3(1);
			if(Step3(2) > Step3(3))then Step4(2)<=Step3(2); Step4(3)<=Step3(3); else Step4(2)<=Step3(3); Step4(3)<=Step3(2); end if;
			if(Step3(4) > Step3(5))then Step4(4)<=Step3(4); Step4(5)<=Step3(5); else Step4(4)<=Step3(5); Step4(5)<=Step3(4); end if;				
			Step4(6) <= Step3(6);
			Step4(7) <= Step3(7);
		end if;
	end process;
-- ======================================================= Step 4 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			output0 <= Step4(0);
			output1 <= Step4(1);
			output2 <= Step4(2);
			if(Step4(3) > Step4(4))then output3<=Step4(3); output4<=Step4(4); else output3<=Step4(4); output4<=Step4(3); end if;		
			output5 <= Step4(5);
			output6 <= Step4(6);
			output7 <= Step4(7);
		end if;
	end process;
-- ================================================================================

end Behavioral;

