LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BF4_tb IS
END BF4_tb;
 
ARCHITECTURE behavior OF BF4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BF4
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
   signal in_re : std_logic_vector(15 downto 0) := (others => '0');
   signal in_im : std_logic_vector(15 downto 0) := (others => '0');
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
   uut: BF4 PORT MAP (
          clk => clk,
          in_re => in_re,
          in_im => in_im,
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
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		start<='1';
		in_re<=x"0200";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0400";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0200";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0400";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0400";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0400";
		in_im<=x"0000";
		wait until rising_edge(clk);
		
		in_re<=x"fe00";-- -2
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"016a";-- +1.41
		in_im<=x"fe96";-- -1.41
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		
		
		
		in_re<=x"0100";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0600";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0700";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0600";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0600";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0600";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0600";
		in_im<=x"0000";
		wait until rising_edge(clk);
		
		in_re<=x"ff00";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"04f3";
		in_im<=x"fb0d";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0600";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
		in_re<=x"0000";
		in_im<=x"0000";
		wait until rising_edge(clk);
      wait;
   end process;

END;
