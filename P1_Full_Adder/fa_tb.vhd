LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fa_tb IS
END fa_tb;
 
ARCHITECTURE behavior OF fa_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fa
    PORT(
         ai : IN  std_logic;
         bi : IN  std_logic;
         ci : IN  std_logic;
         co : OUT  std_logic;
         so : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ai : std_logic := '0';
   signal bi : std_logic := '0';
   signal ci : std_logic := '0';

 	--Outputs
   signal co : std_logic;
   signal so : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fa PORT MAP (
          ai => ai,
          bi => bi,
          ci => ci,
          co => co,
          so => so
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		ai<='1';
		bi<='1';
		ci<='1';
		wait for 100 ns;
		
		ai<='0';
		bi<='1';
		ci<='1';
		wait for 100 ns;
		
		ai<='0';
		bi<='1';
		ci<='0';
		wait for 100 ns;
      wait;
   end process;

END;
