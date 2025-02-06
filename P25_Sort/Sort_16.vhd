
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sort_16 is
    Port ( clk     : in  STD_LOGIC;
			  input0  : in  STD_LOGIC_VECTOR(7 downto 0); -- inputs
			  input1  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input2  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input3  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input4  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input5  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input6  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input7  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input8  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input9  : in  STD_LOGIC_VECTOR(7 downto 0);
			  input10 : in  STD_LOGIC_VECTOR(7 downto 0);
			  input11 : in  STD_LOGIC_VECTOR(7 downto 0);
			  input12 : in  STD_LOGIC_VECTOR(7 downto 0);
			  input13 : in  STD_LOGIC_VECTOR(7 downto 0);
			  input14 : in  STD_LOGIC_VECTOR(7 downto 0);
			  input15 : in  STD_LOGIC_VECTOR(7 downto 0);
			  output0  : out STD_LOGIC_VECTOR(7 downto 0); -- outputs
			  output1  : out STD_LOGIC_VECTOR(7 downto 0);
			  output2  : out STD_LOGIC_VECTOR(7 downto 0);
			  output3  : out STD_LOGIC_VECTOR(7 downto 0);
			  output4  : out STD_LOGIC_VECTOR(7 downto 0);
			  output5  : out STD_LOGIC_VECTOR(7 downto 0);
			  output6  : out STD_LOGIC_VECTOR(7 downto 0);
			  output7  : out STD_LOGIC_VECTOR(7 downto 0);
			  output8  : out STD_LOGIC_VECTOR(7 downto 0);
			  output9  : out STD_LOGIC_VECTOR(7 downto 0);
			  output10 : out STD_LOGIC_VECTOR(7 downto 0);
			  output11 : out STD_LOGIC_VECTOR(7 downto 0);
			  output12 : out STD_LOGIC_VECTOR(7 downto 0);
			  output13 : out STD_LOGIC_VECTOR(7 downto 0);
			  output14 : out STD_LOGIC_VECTOR(7 downto 0);
			  output15 : out STD_LOGIC_VECTOR(7 downto 0));
end Sort_16;

architecture Behavioral of Sort_16 is
	
	component Sort_8 is
		 Port ( clk     : in  STD_LOGIC;
				  input0  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input1  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input2  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input3  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input4  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input5  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input6  : in  STD_LOGIC_VECTOR(7 downto 0);
				  input7  : in  STD_LOGIC_VECTOR(7 downto 0);
				  output0 : out STD_LOGIC_VECTOR(7 downto 0);
				  output1 : out STD_LOGIC_VECTOR(7 downto 0);
				  output2 : out STD_LOGIC_VECTOR(7 downto 0);
				  output3 : out STD_LOGIC_VECTOR(7 downto 0);
				  output4 : out STD_LOGIC_VECTOR(7 downto 0);
				  output5 : out STD_LOGIC_VECTOR(7 downto 0);
				  output6 : out STD_LOGIC_VECTOR(7 downto 0);
				  output7 : out STD_LOGIC_VECTOR(7 downto 0));
	end component;

	type buff_type is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
	signal Step1 : buff_type;
	signal Step2 : buff_type;
	signal Step3 : buff_type;
	signal Step4 : buff_type;
	signal Step5 : buff_type;
	signal Step6 : buff_type;
	signal Step7 : buff_type;
	signal Step8 : buff_type;

begin
-- =====================================================================================
	Cluster_1 : Sort_8 
	 Port map( clk => clk , 
				  input0=>input0   , input1=>input1   , input2=>input2   , input3=>input3   , input4=>input4   , input5=>input5   , input6=>input6   , input7=>input7 ,
				  output0=>Step1(0), output1=>Step1(1), output2=>Step1(2), output3=>Step1(3), output4=>Step1(4), output5=>Step1(5), output6=>Step1(6), output7=>Step1(7));
	Cluster_2 : Sort_8 
	 Port map( clk => clk , 
				  input0=>input8   , input1=>input9   , input2=>input10   , input3=>input11   , input4=>input12   , input5=>input13   , input6=>input14   , input7=>input15 ,
				  output0=>Step1(8), output1=>Step1(9), output2=>Step1(10), output3=>Step1(11), output4=>Step1(12), output5=>Step1(13), output6=>Step1(14), output7=>Step1(15));
-- ======================================================= Step 1 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			if(Step1(0) > Step1(8)) then Step2(0) <=Step1(0); Step2(1) <=Step1(8) ; else Step2(0) <=Step1(8) ; Step2(1) <=Step1(0); end if;
			if(Step1(1) > Step1(9)) then Step2(2) <=Step1(1); Step2(3) <=Step1(9) ; else Step2(2) <=Step1(9) ; Step2(3) <=Step1(1); end if;		
			if(Step1(2) > Step1(10))then Step2(4) <=Step1(2); Step2(5) <=Step1(10); else Step2(4) <=Step1(10); Step2(5) <=Step1(2); end if;		
			if(Step1(3) > Step1(11))then Step2(6) <=Step1(3); Step2(7) <=Step1(11); else Step2(6) <=Step1(11); Step2(7) <=Step1(3); end if;		
			if(Step1(4) > Step1(12))then Step2(8) <=Step1(4); Step2(9) <=Step1(12); else Step2(8) <=Step1(12); Step2(9) <=Step1(4); end if;		
			if(Step1(5) > Step1(13))then Step2(10)<=Step1(5); Step2(11)<=Step1(13); else Step2(10)<=Step1(13); Step2(11)<=Step1(5); end if;		
			if(Step1(6) > Step1(14))then Step2(12)<=Step1(6); Step2(13)<=Step1(14); else Step2(12)<=Step1(14); Step2(13)<=Step1(6); end if;		
			if(Step1(7) > Step1(15))then Step2(14)<=Step1(7); Step2(15)<=Step1(15); else Step2(14)<=Step1(15); Step2(15)<=Step1(7); end if;		
		end if;
	end process;
-- ======================================================= Step 2 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step3(0) <= Step2(0);
			if(Step2(1)  > Step2(2)) then Step3(1) <=Step2(1) ; Step3(2) <=Step2(2) ; else Step3(1) <=Step2(2) ; Step3(2) <=Step2(1) ; end if;
			if(Step2(3)  > Step2(4)) then Step3(3) <=Step2(3) ; Step3(4) <=Step2(4) ; else Step3(3) <=Step2(4) ; Step3(4) <=Step2(3) ; end if;		
			if(Step2(5)  > Step2(6)) then Step3(5) <=Step2(5) ; Step3(6) <=Step2(6) ; else Step3(5) <=Step2(6) ; Step3(6) <=Step2(5) ; end if;			
			if(Step2(7)  > Step2(8)) then Step3(7) <=Step2(7) ; Step3(8) <=Step2(8) ; else Step3(7) <=Step2(8) ; Step3(8) <=Step2(7) ; end if;			
			if(Step2(9)  > Step2(10))then Step3(9) <=Step2(9) ; Step3(10)<=Step2(10); else Step3(9) <=Step2(10); Step3(10)<=Step2(9) ; end if;			
			if(Step2(11) > Step2(12))then Step3(11)<=Step2(11); Step3(12)<=Step2(12); else Step3(11)<=Step2(12); Step3(12)<=Step2(11); end if;			
			if(Step2(13) > Step2(14))then Step3(13)<=Step2(13); Step3(14)<=Step2(14); else Step3(13)<=Step2(14); Step3(14)<=Step2(13); end if;			
			Step3(15) <= Step2(15);
		end if;
	end process;
-- ======================================================= Step 3 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step4(0) <= Step3(0);
			Step4(1) <= Step3(1);
			if(Step3(2)  > Step3(3)) then Step4(2) <=Step3(2) ; Step4(3) <=Step3(3) ; else Step4(2) <=Step3(3) ; Step4(3) <=Step3(2) ; end if;
			if(Step3(4)  > Step3(5)) then Step4(4) <=Step3(4) ; Step4(5) <=Step3(5) ; else Step4(4) <=Step3(5) ; Step4(5) <=Step3(4) ; end if;				
			if(Step3(6)  > Step3(7)) then Step4(6) <=Step3(6) ; Step4(7) <=Step3(7) ; else Step4(6) <=Step3(7) ; Step4(7) <=Step3(6) ; end if;				
			if(Step3(8)  > Step3(9)) then Step4(8) <=Step3(8) ; Step4(9) <=Step3(9) ; else Step4(8) <=Step3(9) ; Step4(9) <=Step3(8) ; end if;				
			if(Step3(10) > Step3(11))then Step4(10)<=Step3(10); Step4(11)<=Step3(11); else Step4(10)<=Step3(11); Step4(11)<=Step3(10); end if;				
			if(Step3(12) > Step3(13))then Step4(12)<=Step3(12); Step4(13)<=Step3(13); else Step4(12)<=Step3(13); Step4(13)<=Step3(12); end if;				
			Step4(14) <= Step3(14);
			Step4(15) <= Step3(15);
		end if;
	end process;
-- ======================================================= Step 4 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step5(0) <= Step4(0);
			Step5(1) <= Step4(1);
			Step5(2) <= Step4(2);
			if(Step4(3)  > Step4(4)) then Step5(3) <=Step4(3) ; Step5(4) <=Step4(4) ; else Step5(3) <=Step4(4) ; Step5(4) <=Step4(3) ; end if;		
			if(Step4(5)  > Step4(6)) then Step5(5) <=Step4(5) ; Step5(6) <=Step4(6) ; else Step5(5) <=Step4(6) ; Step5(6) <=Step4(5) ; end if;		
			if(Step4(7)  > Step4(8)) then Step5(7) <=Step4(7) ; Step5(8) <=Step4(8) ; else Step5(7) <=Step4(8) ; Step5(8) <=Step4(7) ; end if;		
			if(Step4(9)  > Step4(10))then Step5(9) <=Step4(9) ; Step5(10)<=Step4(10); else Step5(9) <=Step4(10); Step5(10)<=Step4(9) ; end if;		
			if(Step4(11) > Step4(12))then Step5(11)<=Step4(11); Step5(12)<=Step4(12); else Step5(11)<=Step4(12); Step5(12)<=Step4(11); end if;		
			Step5(13) <= Step4(13);
			Step5(14) <= Step4(14);
			Step5(15) <= Step4(15);
		end if;
	end process;
-- ======================================================= Step 5 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step6(0) <= Step5(0);
			Step6(1) <= Step5(1);
			Step6(2) <= Step5(2);
			Step6(3) <= Step5(3);
			if(Step5(4)  > Step5(5)) then Step6(4) <=Step5(4) ; Step6(5) <=Step5(5) ; else Step6(4) <=Step5(5) ; Step6(5) <=Step5(4) ; end if;		
			if(Step5(6)  > Step5(7)) then Step6(6) <=Step5(6) ; Step6(7) <=Step5(7) ; else Step6(6) <=Step5(7) ; Step6(7) <=Step5(6) ; end if;		
			if(Step5(8)  > Step5(9)) then Step6(8) <=Step5(8) ; Step6(9) <=Step5(9) ; else Step6(8) <=Step5(9) ; Step6(9) <=Step5(8) ; end if;		
			if(Step5(10) > Step5(11))then Step6(10)<=Step5(10); Step6(11)<=Step5(11); else Step6(10)<=Step5(11); Step6(11)<=Step5(10); end if;			
			Step6(12) <= Step5(12);
			Step6(13) <= Step5(13);
			Step6(14) <= Step5(14);
			Step6(15) <= Step5(15);
		end if;
	end process;
	-- ======================================================= Step 6 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step7(0) <= Step6(0);
			Step7(1) <= Step6(1);
			Step7(2) <= Step6(2);
			Step7(3) <= Step6(3);
			Step7(4) <= Step6(4);		
			if(Step6(5) > Step6(6)) then Step7(5) <=Step6(5) ; Step7(6) <=Step6(6) ; else Step7(5) <=Step6(6) ; Step7(6) <=Step6(5) ; end if;		
			if(Step6(7) > Step6(8)) then Step7(7) <=Step6(7) ; Step7(8) <=Step6(8) ; else Step7(7) <=Step6(8) ; Step7(8) <=Step6(7) ; end if;		
			if(Step6(9) > Step6(10))then Step7(9) <=Step6(9) ; Step7(10)<=Step6(10); else Step7(9) <=Step6(10); Step7(10)<=Step6(9) ; end if;				
			Step7(11) <= Step6(11);
			Step7(12) <= Step6(12);
			Step7(13) <= Step6(13);
			Step7(14) <= Step6(14);
			Step7(15) <= Step6(15);
		end if;
	end process;
	-- ======================================================= Step 7 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			Step8(0) <= Step7(0);
			Step8(1) <= Step7(1);
			Step8(2) <= Step7(2);
			Step8(3) <= Step7(3);		
			Step8(4) <= Step7(4);		
			Step8(5) <= Step7(5);				
			if(Step7(6) > Step7(7)) then Step8(6) <=Step7(6) ; Step8(7) <=Step7(7) ; else Step8(6) <=Step7(7) ; Step8(7) <=Step7(6) ; end if;		
			if(Step7(8) > Step7(9)) then Step8(8) <=Step7(8) ; Step8(9) <=Step7(9) ; else Step8(8) <=Step7(9) ; Step8(9) <=Step7(8) ; end if;			
			Step8(10) <= Step7(10);
			Step8(11) <= Step7(11);
			Step8(12) <= Step7(12);
			Step8(13) <= Step7(13);
			Step8(14) <= Step7(14);
			Step8(15) <= Step7(15);
		end if;
	end process;
	-- ======================================================= Step 8 =================
	process(clk)
	begin
		if(rising_edge(clk))then
			output0 <= Step8(0);
			output1 <= Step8(1);
			output2 <= Step8(2);	
			output3 <= Step8(3);	
			output4 <= Step8(4);	
			output5 <= Step8(5);	
			output6 <= Step8(6);	
			if(Step8(7) > Step8(8)) then output7 <=Step8(7) ; output8 <=Step8(8) ; else output7 <=Step8(8) ; output8 <=Step8(7) ; end if;			
			output9  <= Step8(9);
			output10 <= Step8(10);
			output11 <= Step8(11);
			output12 <= Step8(12);
			output13 <= Step8(13);
			output14 <= Step8(14);
			output15 <= Step8(15);
		end if;
	end process;
-- ===============================================================================================

end Behavioral;

