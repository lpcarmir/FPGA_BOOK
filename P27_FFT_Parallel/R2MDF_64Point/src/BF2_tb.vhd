LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BF2_tb IS
END BF2_tb;
 
ARCHITECTURE behavior OF BF2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BF2
    PORT(
         clk : IN  std_logic;
         in_re : IN  std_logic_vector(15 downto 0);
         in_im : IN  std_logic_vector(15 downto 0);
         out_re : OUT  std_logic_vector(15 downto 0);
         out_im : OUT  std_logic_vector(15 downto 0);
         valid : OUT  std_logic;
         wn_mult : OUT  std_logic;
         start : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din_re : std_logic_vector(15 downto 0) := (others => '0');
   signal din_im : std_logic_vector(15 downto 0) := (others => '0');
   signal start : std_logic := '0';

 	--Outputs
   signal out_re : std_logic_vector(15 downto 0);
   signal out_im : std_logic_vector(15 downto 0);
   signal valid : std_logic;
   signal wn_mult : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BF2 PORT MAP (
          clk => clk,
          in_re => din_re,
          in_im => din_im,
          out_re => out_re,
          out_im => out_im,
          valid => valid,
          wn_mult => wn_mult,
          start => start
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
      start<='0';
		wait for 100 ns;
		start<='1';
--		din_re<=x"0200";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0800";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0200";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0800";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"01d8";
--		din_im<=x"ff3e";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"ff3e";
--		din_im<=x"fe28";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		
--		din_re<=x"fe00";-- -2
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"016a";-- +1.41
--		din_im<=x"fe96";-- -1.41
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"fe28";
--		din_im<=x"00c2";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"fe28";
--		din_im<=x"ff3b";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
		
		
		
		din_re<=x"0700";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0c00";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0700";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0c00";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"fb64";
		din_im<=x"01e5";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"fd59";
		din_im<=x"f98c";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		
		din_re<=x"ff00";
		din_im<=x"0600";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"04f3";
		din_im<=x"fb0d";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"FCC7";
		din_im<=x"FAD6";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"f98f";
		din_im<=x"fd50";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;

      wait;
   end process;

END;
