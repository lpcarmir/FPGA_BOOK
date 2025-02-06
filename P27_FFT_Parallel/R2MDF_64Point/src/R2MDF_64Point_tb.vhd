LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY R2MDF_64Point_tb IS
END R2MDF_64Point_tb;
 
ARCHITECTURE behavior OF R2MDF_64Point_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R2MDF_64Point
    PORT(
         dout_re1 : OUT  std_logic_vector(15 downto 0);
         dout_im1 : OUT  std_logic_vector(15 downto 0);
         dout_re2 : OUT  std_logic_vector(15 downto 0);
         dout_im2 : OUT  std_logic_vector(15 downto 0);
         dout_re3 : OUT  std_logic_vector(15 downto 0);
         dout_im3 : OUT  std_logic_vector(15 downto 0);
         dout_re4 : OUT  std_logic_vector(15 downto 0);
         dout_im4 : OUT  std_logic_vector(15 downto 0);
         din_re : IN  std_logic_vector(15 downto 0);
         din_im : IN  std_logic_vector(15 downto 0);
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
   signal dout_re1 : std_logic_vector(15 downto 0);
   signal dout_im1 : std_logic_vector(15 downto 0);
   signal dout_re2 : std_logic_vector(15 downto 0);
   signal dout_im2 : std_logic_vector(15 downto 0);
   signal dout_re3 : std_logic_vector(15 downto 0);
   signal dout_im3 : std_logic_vector(15 downto 0);
   signal dout_re4 : std_logic_vector(15 downto 0);
   signal dout_im4 : std_logic_vector(15 downto 0);
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: R2MDF_64Point PORT MAP (
          dout_re1 => dout_re1,
          dout_im1 => dout_im1,
          dout_re2 => dout_re2,
          dout_im2 => dout_im2,
          dout_re3 => dout_re3,
          dout_im3 => dout_im3,
          dout_re4 => dout_re4,
          dout_im4 => dout_im4,
          din_re => din_re,
          din_im => din_im,
          valid => valid,
          en => en,
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
      wait for 100 ns;
		wait until rising_edge(clk);
		en<='1';
		
		loop
      din_im<=x"0000";
		din_re<=x"0000";
		wait until rising_edge(clk);
		din_re<=x"FFF2";
		wait until rising_edge(clk);
		din_re<=x"FFD2";
		wait until rising_edge(clk);
		din_re<=x"FFB2";
		wait until rising_edge(clk);
		din_re<=x"FFB0";
		wait until rising_edge(clk);
		din_re<=x"FFDA";
		wait until rising_edge(clk);
		din_re<=x"0030";
		wait until rising_edge(clk);
		din_re<=x"0092";
		wait until rising_edge(clk);
		din_re<=x"00D3";
		wait until rising_edge(clk);
		din_re<=x"00C6";
		wait until rising_edge(clk);
		din_re<=x"005D";
		wait until rising_edge(clk);
		din_re<=x"FFB1";
		wait until rising_edge(clk);
		din_re<=x"FF07";
		wait until rising_edge(clk);
		din_re<=x"FEB0";
		wait until rising_edge(clk);
		din_re<=x"FEE9";
		wait until rising_edge(clk);
		din_re<=x"FFAE";
		wait until rising_edge(clk);
		din_re<=x"00B4";
		wait until rising_edge(clk);
		din_re<=x"0181";
		wait until rising_edge(clk);
		din_re<=x"01A4";
		wait until rising_edge(clk);
		din_re<=x"00F6";
		wait until rising_edge(clk);
		din_re<=x"FFBC";
		wait until rising_edge(clk);
		din_re<=x"FE8F";
		wait until rising_edge(clk);
		din_re<=x"FE15";
		wait until rising_edge(clk);
		din_re<=x"FE9D";
		wait until rising_edge(clk);
		din_re<=x"FFEE";
		wait until rising_edge(clk);
		din_re<=x"0153";
		wait until rising_edge(clk);
		din_re<=x"01FF";
		wait until rising_edge(clk);
		din_re<=x"0185";
		wait until rising_edge(clk);
		din_re<=x"0027";
		wait until rising_edge(clk);
		din_re<=x"FEB6";
		wait until rising_edge(clk);
		din_re<=x"FE15";
		wait until rising_edge(clk);
		din_re<=x"FEA7";
		wait until rising_edge(clk);
		din_re<=x"0009";
		wait until rising_edge(clk);
		din_re<=x"0151";
		wait until rising_edge(clk);
		din_re<=x"01A9";
		wait until rising_edge(clk);
		din_re<=x"00E5";
		wait until rising_edge(clk);
		din_re<=x"FFA0";
		wait until rising_edge(clk);
		din_re<=x"FEC4";
		wait until rising_edge(clk);
		din_re<=x"FEDD";
		wait until rising_edge(clk);
		din_re<=x"FFB6";
		wait until rising_edge(clk);
		din_re<=x"0095";
		wait until rising_edge(clk);
		din_re<=x"00D6";
		wait until rising_edge(clk);
		din_re<=x"0071";
		wait until rising_edge(clk);
		din_re<=x"FFE3";
		wait until rising_edge(clk);
		din_re<=x"FFAC";
		wait until rising_edge(clk);
		din_re<=x"FFD5";
		wait until rising_edge(clk);
		din_re<=x"FFFF";
		wait until rising_edge(clk);
		din_re<=x"FFE3";
		wait until rising_edge(clk);
		din_re<=x"FFAF";
		wait until rising_edge(clk);
		din_re<=x"FFD2";
		wait until rising_edge(clk);
		din_re<=x"0062";
		wait until rising_edge(clk);
		din_re<=x"00D6";
		wait until rising_edge(clk);
		din_re<=x"0084";
		wait until rising_edge(clk);
		din_re<=x"FF7D";
		wait until rising_edge(clk);
		din_re<=x"FEB6";
		wait until rising_edge(clk);
		din_re<=x"FF24";
		wait until rising_edge(clk);
		din_re<=x"0097";
		wait until rising_edge(clk);
		din_re<=x"01A7";
		wait until rising_edge(clk);
		din_re<=x"0117";
		wait until rising_edge(clk);
		din_re<=x"FF4A";
		wait until rising_edge(clk);
		din_re<=x"FE19";
		wait until rising_edge(clk);
		din_re<=x"FEE2";
		wait until rising_edge(clk);
		din_re<=x"00EA";
		wait until rising_edge(clk);
		din_re<=x"0200";
		wait until rising_edge(clk);
      end loop; 

      wait;
   end process;

END;
