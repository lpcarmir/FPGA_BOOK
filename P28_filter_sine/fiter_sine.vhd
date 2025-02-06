library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fiter_sine is
    Port ( clk : in  STD_LOGIC);
end fiter_sine;

architecture Behavioral of fiter_sine is

component sine_gen is
    Port ( clk : in  STD_LOGIC;
			  count_in : STD_LOGIC_VECTOR (7 downto 0);
			  sample_in : STD_LOGIC_VECTOR (7 downto 0);
           sine_data : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component fir1
	port (
	clk: in std_logic;
	rfd: out std_logic;
	rdy: out std_logic;
	din: in std_logic_vector(7 downto 0);
	dout: out std_logic_vector(9 downto 0));
end component;

component icon1
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

end component;

component vio1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    SYNC_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));

end component;

component ila1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(17 DOWNTO 0));

end component;

signal CONTROL0 :  STD_LOGIC_VECTOR(35 DOWNTO 0);
signal CONTROL1 :  STD_LOGIC_VECTOR(35 DOWNTO 0);

signal countsig 		 : std_logic_vector(7 downto 0);
signal samplesig		 : std_logic_vector(7 downto 0);
signal unfilteredsig	 : std_logic_vector(7 downto 0);
signal doutsig			 :  std_logic_vector(9 downto 0);

signal rfdsig :std_logic;
signal rdysig :std_logic;

begin

u_sine: sine_gen PORT MAP
(
		clk =>clk ,
		count_in =>countsig ,
		sample_in =>samplesig ,
		sine_data => unfilteredsig
);

u_fir : fir1 port map 
(
		clk => clk,
		rfd => rfdsig,
		rdy => rdysig,
		din => unfilteredsig,
		dout=> doutsig
);
			
u_icon : icon1 port map 
(
    CONTROL0 => CONTROL0,
    CONTROL1 => CONTROL1
);

u_vio : vio1 port map 
(
    CONTROL => CONTROL0,
    CLK => CLK,
    SYNC_OUT(7 downto 0) => countsig,
    SYNC_OUT(15 downto 8) => samplesig
);

u_ila : ila1 port map 
(
    CONTROL => CONTROL1,
    CLK => CLK,
    TRIG0(7 downto 0) => unfilteredsig,
    TRIG0(17 downto 8) => doutsig(9 downto 0)
);

end Behavioral;

