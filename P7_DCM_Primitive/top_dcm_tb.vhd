LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY top_dcm_tb IS
END top_dcm_tb;
 
ARCHITECTURE behavior OF top_dcm_tb IS 

    COMPONENT top_dcm
    PORT(
         clk_in : IN  std_logic;
         clk_out3x : OUT  std_logic;
         clk_outDiv : OUT  std_logic;
         clk_out180 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';

 	--Outputs
   signal clk_out3x : std_logic;
   signal clk_outDiv : std_logic;
   signal clk_out180 : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
   constant clk_out3x_period : time := 10 ns;
   constant clk_outDiv_period : time := 10 ns;
   constant clk_out180_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_dcm PORT MAP (
          clk_in => clk_in,
          clk_out3x => clk_out3x,
          clk_outDiv => clk_outDiv,
          clk_out180 => clk_out180
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 
END;
