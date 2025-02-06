LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY calc_dc_tb IS
END calc_dc_tb;
 
ARCHITECTURE behavior OF calc_dc_tb IS 

    COMPONENT calc_dc
    PORT(
         clk : IN  std_logic;
         freq : IN  std_logic;
         dc : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal freq : std_logic := '0';

 	--Outputs
   signal dc : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: calc_dc PORT MAP (
          clk => clk,
          freq => freq,
          dc => dc
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --9%
		freq<='1';
		wait for 1 ms;
		freq<='0';
		wait for 10 ms;
		
		--9%
		freq<='1';
		wait for 1 ms;
		freq<='0';
		wait for 10 ms;
		
		--25%
		freq<='1';
		wait for 3 ms;
		freq<='0';
		wait for 9 ms;
		
		--25%
		freq<='1';
		wait for 3 ms;
		freq<='0';
		wait for 9 ms;
		
		--20%
		freq<='1';
		wait for 2 ms;
		freq<='0';
		wait for 8 ms;
		
		--20%
		freq<='1';
		wait for 2 ms;
		freq<='0';
		wait for 8 ms;
		
		--40%
		freq<='1';
		wait for 6 ms;
		freq<='0';
		wait for 9 ms;
		
		--40%
		freq<='1';
		wait for 6 ms;
		freq<='0';
		wait for 9 ms;
		
		freq<='1';--amdan
		freq<='0';
      wait;
   end process;

END;
