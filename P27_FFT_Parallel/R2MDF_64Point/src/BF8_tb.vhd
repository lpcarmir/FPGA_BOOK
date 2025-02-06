LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BF8_tb IS
END BF8_tb;
 
ARCHITECTURE behavior OF BF8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BF8
    Port ( clk 	: in   STD_LOGIC;
           in_re 	: in   STD_LOGIC_VECTOR (15 downto 0);
           in_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           out_re : out  STD_LOGIC_VECTOR (15 downto 0);
           out_im : out  STD_LOGIC_VECTOR (15 downto 0);
           valid 	: out  STD_LOGIC;
           wn_mult: out  STD_LOGIC;
           start 	: in   STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal din : std_logic_vector(15 downto 0) := (others => '0');
   signal in_im : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal out_re : std_logic_vector(15 downto 0);
   signal out_im : std_logic_vector(15 downto 0);
   signal wn_mult : std_logic;
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BF8 PORT MAP (
          clk => clk,
          in_re => din,
          in_im => in_im,
          out_re => out_re,
          out_im => out_im,
          wn_mult => wn_mult,
          valid => valid,
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
      -- hold reset state for 100 ns.
      --wait for 100 ns;
		start<='1';		
		in_im<=(others=>'0');
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0200";
		wait until rising_edge(clk); 
		start<='0';
      wait;
   end process;

END;
