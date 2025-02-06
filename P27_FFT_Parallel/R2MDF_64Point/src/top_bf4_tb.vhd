LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY top_bf4_tb IS
END top_bf4_tb;
 
ARCHITECTURE behavior OF top_bf4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_bf4
    PORT(
         din_re : IN  std_logic_vector(15 downto 0);
         din_im : IN  std_logic_vector(15 downto 0);
         dout_re : OUT  std_logic_vector(15 downto 0);
         dout_im : OUT  std_logic_vector(15 downto 0);
			en	 		: in   STD_LOGIC;
         valid : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din_re : std_logic_vector(15 downto 0) := (others => '0');
   signal din_im : std_logic_vector(15 downto 0) := (others => '0');
   signal en : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal dout_re : std_logic_vector(15 downto 0);
   signal dout_im : std_logic_vector(15 downto 0);
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_bf4 PORT MAP (
          din_re => din_re,
          din_im => din_im,
          dout_re => dout_re,
          dout_im => dout_im,
          en => en,
          valid => valid,
          clk => clk
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
      en<='0';
		wait for 90 ns;
		en<='1';
--		din_re<=x"0200";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0400";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0200";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0400";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0400";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0400";
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
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
--		din_re<=x"0000";
--		din_im<=x"0000";
--		wait for 20 ns;
		
		
		
		din_re<=x"0100";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0600";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0700";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0600";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0600";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0600";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0600";
		din_im<=x"0000";
		wait for 20 ns;
		
		din_re<=x"ff00";
		din_im<=x"0000";
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
		din_re<=x"0000";
		din_im<=x"0600";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;
		din_re<=x"0000";
		din_im<=x"0000";
		wait for 20 ns;

      wait;
   end process;

END;
