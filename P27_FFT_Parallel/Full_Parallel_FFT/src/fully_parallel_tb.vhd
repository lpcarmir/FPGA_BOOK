USE ieee.std_logic_1164.ALL;
USE work.my_pkg.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fully_parallel_tb IS
END fully_parallel_tb;
 
ARCHITECTURE behavior OF fully_parallel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fully_parallel
    PORT(
         din_re : IN  std_logic_vector(15 downto 0);
         din_im : IN  std_logic_vector(15 downto 0);
         dout_re : OUT  mem16;
         dout_im : OUT  mem16;
         valid : OUT  std_logic;
         en : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din_re : std_logic_vector(15 downto 0) := (others => '0');
   signal din_im : std_logic_vector(15 downto 0) := (others => '0');
   signal en : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal dout_re : mem16;
   signal dout_im : mem16;
   signal valid : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fully_parallel PORT MAP (
          din_re => din_re,
          din_im => din_im,
          dout_re => dout_re,
          dout_im => dout_im,
          valid => valid,
          en => en,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      din_im<=x"0000";
		din_re<=x"0000";
		wait for 360 ns;
		loop
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0200";
		wait for 20 ns;
		
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		din_re<=x"0700";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		din_re<=x"0100";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		din_re<=x"0600";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		din_re<=x"0000";
		wait for 20 ns;
		din_re<=x"0300";
		wait for 20 ns;
		end loop;
      wait;
   end process;

END;
