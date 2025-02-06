LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY detect_tb IS
END detect_tb;
 
ARCHITECTURE behavior OF detect_tb IS 
    COMPONENT detect
    PORT(
         clk : IN  std_logic;
         pulse : IN  std_logic;
         led : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pulse : std_logic := '0';

 	--Outputs
   signal led : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: detect PORT MAP (
          clk => clk,
          pulse => pulse,
          led => led
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      pulse<='1';
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here
		pulse<='1';
		wait for 150.1 ms;
		pulse<='0';
		wait for 179.5 ms;
		pulse<='1';
		wait for 50.3 ms;
		pulse<='0';

      wait;
   end process;

END;
