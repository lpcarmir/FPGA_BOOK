LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY complex_multiplier_tb IS
END complex_multiplier_tb;
 
ARCHITECTURE behavior OF complex_multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT complex_multiplier
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         c : IN  std_logic_vector(15 downto 0);
         d : IN  std_logic_vector(15 downto 0);
         real_out : OUT  std_logic_vector(31 downto 0);
         imag_out : OUT  std_logic_vector(31 downto 0);
         en : IN  std_logic;
         clk : IN  std_logic;
         valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal c : std_logic_vector(15 downto 0) := (others => '0');
   signal d : std_logic_vector(15 downto 0) := (others => '0');
   signal en : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal real_out : std_logic_vector(31 downto 0);
   signal imag_out : std_logic_vector(31 downto 0);
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: complex_multiplier PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          real_out => real_out,
          imag_out => imag_out,
          en => en,
          clk => clk,
          valid => valid
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
		en<='1';
		--real_out<=a*c-b*d;=69.818=x"45cb64"
		--imag_out<=b*c+a*d;=-2.37575=x"fffd9d34"
		a<="1111010110100010";-- -10.37
		b<="0000001010100110";-- +2.65
		c<="1111100110100000";-- -6.375
		d<="1111111010011010";-- -1.4
--		--a*c=x"421740"=66.10875
--		--b*d=x"3b424" =-3.71
--		--b*c=x"ffef1dc0"=-16.89375
--		--a*d=x"e7f74"=14.518
--		wait for 100 ns;
--		en<='1';
		wait for 20 ns;
--		en<='0';
		
--		wait for 100 ns;	
		--real_out<=a*c-b*d;=62.39875
		--imag_out<=b*c+a*d;=-31.41175
		a<="1111010110100010";-- -10.37
		b<="0000001010100110";-- +2.65
		c<="1111100110100000";-- -6.375
		d<="0000000101100110";-- +1.4
--		--a*c=66.10875
--		--b*d=3.71
--		--b*c=-16.89375
--		--a*d=-14.518
--		wait for 100 ns;
--		en<='1';
		wait for 20 ns;
--		en<='0';
		
--		wait for 100 ns;	
		--real_out<=a*c-b*d;=-69.81875
		--imag_out<=b*c+a*d;=+2.37575
		a<="1111010110100010";-- -10.37
		b<="0000001010100110";-- +2.65
		c<="0000011001100000";-- +6.375
		d<="0000000101100110";-- +1.4
--		--a*c=-66.10875
--		--b*d=3.71
--		--b*c=16.89375
--		--a*d=-14.518
--		wait for 100 ns;
--		en<='1';
		wait for 20 ns;
--		en<='0';
--		
--		wait for 100 ns;	
		--real_out<=a*c-b*d;=62.39875
		--imag_out<=b*c+a*d;=31.41175
		a<="0000101001011110";-- +10.37
		b<="0000001010100110";-- +2.65
		c<="0000011001100000";-- +6.375
		d<="0000000101100110";-- +1.4
--		--a*c=66.10875
--		--b*d=3.71
--		--b*c=16.89375
--		--a*d=14.518
--		wait for 100 ns;
--		en<='1';
		wait for 20 ns;
--		en<='0';
--		
--		wait for 100 ns;	
		--real_out<=a*c-b*d;=62.39875
		--imag_out<=b*c+a*d;=31.41175
		a<="1111010110100010";-- -10.37
		b<="1111110101011010";-- -2.65
		c<="1111100110100000";-- -6.375
		d<="1111111010011010";-- -1.4
--		--a*c=66.10875
--		--b*d=3.71
--		--b*c=16.89375
--		--a*d=14.518
--		wait for 100 ns;
--		en<='1';
		wait for 20 ns;
--		en<='0';
--		
--		wait for 100 ns;	
		--real_out<=a*c-b*d;=36.4055
		--imag_out<=b*c+a*d;=-62.39875
		b<="1111010110100010";-- -10.37
		d<="0000001010100110";-- +2.65
		c<="0000011001100000";-- +6.375
		a<="0000000101100110";-- +1.4
--		--a*c=8.925
--		--b*d=-27.4805
--		--b*c=-66.10875
--		--a*d=3.71
--		wait for 100 ns;
--		en<='1';
		wait for 20 ns;
--		en<='0';
--		
--		wait for 100 ns;	
		--real_out<=a*c-b*d;=-18.5555
		--imag_out<=b*c+a*d;=69.81875
		b<="0000101001011110";-- +10.37
		d<="0000001010100110";-- +2.65
		c<="0000011001100000";-- +6.375
		a<="0000000101100110";-- +1.4
--		--a*c=8.925
--		--b*d=27.4805
--		--b*c=66.10875
--		--a*d=3.71
--		wait for 100 ns;
--		en<='1';
		wait for 20 ns;
--		en<='0';
      wait;
   end process;

END;
