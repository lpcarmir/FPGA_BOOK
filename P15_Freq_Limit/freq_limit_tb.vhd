LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY freq_limit_tb IS
END freq_limit_tb;
 
ARCHITECTURE behavior OF freq_limit_tb IS 

    COMPONENT freq_limit
    PORT(
         clk : IN  std_logic;
         f_in : IN  std_logic;
         f_out : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '0';
   signal f_in : std_logic := '0';

 	--Outputs
   signal f_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: freq_limit PORT MAP (
          clk => clk,
          f_in => f_in,
          f_out => f_out
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
      for i in 0 to 100 loop
			f_in<='0';
			wait for 2 us;
			f_in<='1';
			wait for 2 us;
		end loop;
		
		for i in 0 to 100 loop
			f_in<='0';
			wait for 6 us;
			f_in<='1';
			wait for 6 us;
		end loop;
		
		for i in 0 to 100 loop
			f_in<='0';
			wait for 100 ns;
			f_in<='1';
			wait for 100 ns;
		end loop;
		
		for i in 0 to 100 loop
			f_in<='0';
			wait for 60 us;
			f_in<='1';
			wait for 60 us;
		end loop;
		
		for i in 0 to 100 loop
			f_in<='0';
			wait for 4.7 ns;
			f_in<='1';
			wait for 4.7 ns;
		end loop;

      wait;
   end process;

END;
