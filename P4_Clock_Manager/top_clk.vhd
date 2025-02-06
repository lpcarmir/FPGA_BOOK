library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_clk is
    Port ( clk : in  STD_LOGIC);
end top_clk;

architecture Behavioral of top_clk is
	
	component ila1
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 TRIG0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	
	component icon1
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
	end component;
	
	component dcm1
		port
		 (-- Clock in ports
		  CLK_IN1           : in     std_logic;
		  -- Clock out ports
		  CLK_OUT1          : out    std_logic;
		  CLK_OUT2          : out    std_logic;
		  CLK_OUT3          : out    std_logic;
		  CLK_OUT4          : out    std_logic;
		  CLK_OUT5          : out    std_logic;
		  -- Status and control signals
		  RESET             : in     std_logic;
		  LOCKED            : out    std_logic
		 );
	end component;
	
	signal CONTROL: std_logic_vector(35 downto 0);
	signal CLK_OUT: std_logic_vector(4 downto 0);
begin

	u1 : ila1 port map
	(
		CONTROL => CONTROL,
		CLK => CLK_OUT(0),
		TRIG0 => CLK_OUT(4 downto 1)
	);
	
	u2 : icon1 port map
	(
		CONTROL0 => CONTROL
	);
	
	u3 : dcm1 port map
   (-- Clock in ports
		CLK_IN1 => clk,
		-- Clock out ports
		CLK_OUT1 => CLK_OUT(0),
		CLK_OUT2 => CLK_OUT(1),
		CLK_OUT3 => CLK_OUT(2),
		CLK_OUT4 => CLK_OUT(3),
		CLK_OUT5 => CLK_OUT(4),
		-- Status and control signals
		RESET  => '0',
		LOCKED => open
	);
	 
end Behavioral;

