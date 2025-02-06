LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY top_bf8_tb IS
END top_bf8_tb;
 
ARCHITECTURE behavior OF top_bf8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_bf8
    Port (  din_re		: in   STD_LOGIC_VECTOR (15 downto 0);
           din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
           dout_re 	: out  STD_LOGIC_VECTOR (15 downto 0);
           dout_im 	: out  STD_LOGIC_VECTOR (15 downto 0);
           en	 		: in   STD_LOGIC;
           valid 		: out  STD_LOGIC;
           clk 		: in   STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(15 downto 0) := (others => '0');
   signal din_im : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal dout_re : std_logic_vector(15 downto 0);
   signal dout_im : std_logic_vector(15 downto 0);
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_bf8 PORT MAP (
          din_re => din,
          din_im => din_im,
          dout_re => dout_re,
          dout_im => dout_im,
          valid => valid,
			 en=>en,
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
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		en<='1';
		din_im<=x"0000";
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
		
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);
		din<=x"0000";
		wait until rising_edge(clk);
		din<=x"0300";
		wait until rising_edge(clk);

      --wait;
   end process;

END;
