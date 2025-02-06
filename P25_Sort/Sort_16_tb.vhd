
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Sort_16_tb IS
END Sort_16_tb;
 
ARCHITECTURE behavior OF Sort_16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sort_16
    PORT(
         clk : IN  std_logic;
         input0 : IN  std_logic_vector(7 downto 0);
         input1 : IN  std_logic_vector(7 downto 0);
         input2 : IN  std_logic_vector(7 downto 0);
         input3 : IN  std_logic_vector(7 downto 0);
         input4 : IN  std_logic_vector(7 downto 0);
         input5 : IN  std_logic_vector(7 downto 0);
         input6 : IN  std_logic_vector(7 downto 0);
         input7 : IN  std_logic_vector(7 downto 0);
         input8 : IN  std_logic_vector(7 downto 0);
         input9 : IN  std_logic_vector(7 downto 0);
         input10 : IN  std_logic_vector(7 downto 0);
         input11 : IN  std_logic_vector(7 downto 0);
         input12 : IN  std_logic_vector(7 downto 0);
         input13 : IN  std_logic_vector(7 downto 0);
         input14 : IN  std_logic_vector(7 downto 0);
         input15 : IN  std_logic_vector(7 downto 0);
         output0 : OUT  std_logic_vector(7 downto 0);
         output1 : OUT  std_logic_vector(7 downto 0);
         output2 : OUT  std_logic_vector(7 downto 0);
         output3 : OUT  std_logic_vector(7 downto 0);
         output4 : OUT  std_logic_vector(7 downto 0);
         output5 : OUT  std_logic_vector(7 downto 0);
         output6 : OUT  std_logic_vector(7 downto 0);
         output7 : OUT  std_logic_vector(7 downto 0);
         output8 : OUT  std_logic_vector(7 downto 0);
         output9 : OUT  std_logic_vector(7 downto 0);
         output10 : OUT  std_logic_vector(7 downto 0);
         output11 : OUT  std_logic_vector(7 downto 0);
         output12 : OUT  std_logic_vector(7 downto 0);
         output13 : OUT  std_logic_vector(7 downto 0);
         output14 : OUT  std_logic_vector(7 downto 0);
         output15 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal input0 : std_logic_vector(7 downto 0) := (others => '0');
   signal input1 : std_logic_vector(7 downto 0) := (others => '0');
   signal input2 : std_logic_vector(7 downto 0) := (others => '0');
   signal input3 : std_logic_vector(7 downto 0) := (others => '0');
   signal input4 : std_logic_vector(7 downto 0) := (others => '0');
   signal input5 : std_logic_vector(7 downto 0) := (others => '0');
   signal input6 : std_logic_vector(7 downto 0) := (others => '0');
   signal input7 : std_logic_vector(7 downto 0) := (others => '0');
   signal input8 : std_logic_vector(7 downto 0) := (others => '0');
   signal input9 : std_logic_vector(7 downto 0) := (others => '0');
   signal input10 : std_logic_vector(7 downto 0) := (others => '0');
   signal input11 : std_logic_vector(7 downto 0) := (others => '0');
   signal input12 : std_logic_vector(7 downto 0) := (others => '0');
   signal input13 : std_logic_vector(7 downto 0) := (others => '0');
   signal input14 : std_logic_vector(7 downto 0) := (others => '0');
   signal input15 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output0 : std_logic_vector(7 downto 0);
   signal output1 : std_logic_vector(7 downto 0);
   signal output2 : std_logic_vector(7 downto 0);
   signal output3 : std_logic_vector(7 downto 0);
   signal output4 : std_logic_vector(7 downto 0);
   signal output5 : std_logic_vector(7 downto 0);
   signal output6 : std_logic_vector(7 downto 0);
   signal output7 : std_logic_vector(7 downto 0);
   signal output8 : std_logic_vector(7 downto 0);
   signal output9 : std_logic_vector(7 downto 0);
   signal output10 : std_logic_vector(7 downto 0);
   signal output11 : std_logic_vector(7 downto 0);
   signal output12 : std_logic_vector(7 downto 0);
   signal output13 : std_logic_vector(7 downto 0);
   signal output14 : std_logic_vector(7 downto 0);
   signal output15 : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sort_16 PORT MAP (
          clk => clk,
          input0 => input0,
          input1 => input1,
          input2 => input2,
          input3 => input3,
          input4 => input4,
          input5 => input5,
          input6 => input6,
          input7 => input7,
          input8 => input8,
          input9 => input9,
          input10 => input10,
          input11 => input11,
          input12 => input12,
          input13 => input13,
          input14 => input14,
          input15 => input15,
          output0 => output0,
          output1 => output1,
          output2 => output2,
          output3 => output3,
          output4 => output4,
          output5 => output5,
          output6 => output6,
          output7 => output7,
          output8 => output8,
          output9 => output9,
          output10 => output10,
          output11 => output11,
          output12 => output12,
          output13 => output13,
          output14 => output14,
          output15 => output15
        );

   process
	begin
		input0 <= X"13";
		input1 <= X"62";
		input2 <= X"F3";
		input3 <= X"55";
		input4 <= X"14";
		input5 <= X"66";
		input6 <= X"FB";
		input7 <= X"11";
		input8 <= X"44";
		input9 <= X"65";
		input10 <= X"E3";
		input11 <= X"65";
		input12 <= X"77";
		input13 <= X"93";
		input14 <= X"AB";
		input15 <= X"02";
		wait for 20 ns;
		-------------------------
		input0 <= X"53";
		input1 <= X"29";
		input2 <= X"30";
		input3 <= X"1E";
		input4 <= X"43";
		input5 <= X"72";
		input6 <= X"BD";
		input7 <= X"C4";
		input8 <= X"01";
		input9 <= X"62";
		input10 <= X"88";
		input11 <= X"BF";
		input12 <= X"BC";
		input13 <= X"D6";
		input14 <= X"5B";
		input15 <= X"88";
		wait for 20 ns;
		-------------------------
		input0 <= X"B1";
		input1 <= X"03";
		input2 <= X"BB";
		input3 <= X"39";
		input4 <= X"99";
		input5 <= X"45";
		input6 <= X"73";
		input7 <= X"F2";
		input8 <= X"19";
		input9 <= X"42";
		input10 <= X"64";
		input11 <= X"A3";
		input12 <= X"D5";
		input13 <= X"9B";
		input14 <= X"98";
		input15 <= X"11";
		wait for 20 ns;
		-------------------------
		input0 <= X"32";
		input1 <= X"77";
		input2 <= X"77";
		input3 <= X"45";
		input4 <= X"52";
		input5 <= X"25";
		input6 <= X"43";
		input7 <= X"51";
		input8 <= X"00";
		input9 <= X"00";
		input10 <= X"03";
		input11 <= X"53";
		input12 <= X"10";
		input13 <= X"66";
		input14 <= X"86";
		input15 <= X"13";
		wait for 20 ns;
		-------------------------
		input0 <= X"1C";
		input1 <= X"9D";
		input2 <= X"C4";
		input3 <= X"22";
		input4 <= X"87";
		input5 <= X"64";
		input6 <= X"19";
		input7 <= X"04";
		input8 <= X"64";
		input9 <= X"75";
		input10 <= X"28";
		input11 <= X"69";
		input12 <= X"14";
		input13 <= X"EB";
		input14 <= X"FC";
		input15 <= X"D6";
		wait for 20 ns;
		-------------------------
		input0 <= X"82";
		input1 <= X"00";
		input2 <= X"FF";
		input3 <= X"49";
		input4 <= X"03";
		input5 <= X"62";
		input6 <= X"98";
		input7 <= X"55";
		input8 <= X"81";
		input9 <= X"16";
		input10 <= X"73";
		input11 <= X"F5";
		input12 <= X"1E";
		input13 <= X"57";
		input14 <= X"12";
		input15 <= X"18";
		wait for 20 ns;
		-------------------------
		input0 <= X"88";
		input1 <= X"62";
		input2 <= X"40";
		input3 <= X"BA";
		input4 <= X"65";
		input5 <= X"63";
		input6 <= X"44";
		input7 <= X"78";
		input8 <= X"13";
		input9 <= X"62";
		input10 <= X"F3";
		input11 <= X"55";
		input12 <= X"14";
		input13 <= X"66";
		input14 <= X"FB";
		input15 <= X"11";
		wait for 20 ns;
		-------------------------
		wait;
	end process;
	clk <= not clk after 10 ns;

END;
