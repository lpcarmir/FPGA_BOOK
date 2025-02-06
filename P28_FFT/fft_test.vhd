library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity fft_test is
    Port ( clkin : in  STD_LOGIC);
end fft_test;

architecture Behavioral of fft_test is
component vio1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    ASYNC_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;

component ila1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(34 DOWNTO 0));
end component;

component icon1
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
end component;

COMPONENT fft1
  PORT (
    clk : IN STD_LOGIC;
    start : IN STD_LOGIC;
    xn_re : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    xn_im : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    fwd_inv : IN STD_LOGIC;
    fwd_inv_we : IN STD_LOGIC;
    rfd : OUT STD_LOGIC;
    xn_index : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    busy : OUT STD_LOGIC;
    edone : OUT STD_LOGIC;
    done : OUT STD_LOGIC;
    dv : OUT STD_LOGIC;
    xk_index : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    xk_re : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
    xk_im : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
  );
END COMPONENT;

component dcm1
port
 (
  CLK_IN1           : in     std_logic;
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic
 );
end component;

type mem_type is array (0 to 255) of integer range 0 to 255;
constant mem_sin:mem_type:=(128,131,134,137,140,143,146,149,152,156,159,162,165,168,171,174,176,179,182,185,188,191,193,196,199,201,204,206,209,211,213,216,218,220,222,224,226,228,230,232,234,235,237,239,240,242,243,244,246,247,248,249,250,251,251,252,253,253,254,254,254,255,255,255,255,255,255,255,254,254,253,253,252,252,251,250,249,248,247,246,245,244,242,241,239,238,236,235,233,231,229,227,225,223,221,219,217,215,212,210,207,205,202,200,197,195,192,189,186,184,181,178,175,172,169,166,163,160,157,154,151,148,145,142,138,135,132,129,126,123,120,117,113,110,107,104,101,98,95,92,89,86,83,80,77,74,71,69,66,63,60,58,55,53,50,48,45,43,40,38,36,34,32,30,28,26,24,22,20,19,17,16,14,13,11,10,9,8,7,6,5,4,3,3,2,2,1,1,0,0,0,0,0,0,0,1,1,1,2,2,3,4,4,5,6,7,8,9,11,12,13,15,16,18,20,21,23,25,27,29,31,33,35,37,39,42,44,46,49,51,54,56,59,62,64,67,70,73,76,79,81,84,87,90,93,96,99,103,106,109,112,115,118,121,124,127);
signal data:integer range 0 to 255;
signal data_index:integer range 0 to 255;
signal nc,n,mc:integer range 0 to 255;
signal nc_std,mc_std,data_std:std_logic_vector(7 downto 0);
signal TRIG0:std_logic_vector(34 downto 0);
signal xn_index:std_logic_vector(7 downto 0);
signal CONTROL0,CONTROL1:STD_LOGIC_VECTOR(35 DOWNTO 0);
signal ASYNC_OUT:STD_LOGIC_VECTOR(15 DOWNTO 0);
signal data_out:STD_LOGIC_VECTOR(16 DOWNTO 0);

signal xk_index : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal xk_re : STD_LOGIC_VECTOR(16 DOWNTO 0);
signal xk_im : STD_LOGIC_VECTOR(16 DOWNTO 0);
signal xk_re_s : signed(33 DOWNTO 0);
signal xk_im_s : signed(33 DOWNTO 0);
signal sum_re_im : STD_LOGIC_VECTOR(33 DOWNTO 0);
signal done:std_logic;
signal clk_5M,clk:std_logic;
begin

nc_std<=ASYNC_OUT(7 downto 0);
mc_std<=ASYNC_OUT(15 downto 8);

nc<=conv_integer(nc_std);
mc<=conv_integer(mc_std);
data_std<=conv_std_logic_vector(data,8);

u1 : vio1 port map
(
    CONTROL => CONTROL0,
    ASYNC_OUT => ASYNC_OUT
);

u2 : ila1 port map
(
    CONTROL => CONTROL1,
    CLK => clk_5M,
    TRIG0 => TRIG0
);

u3 : icon1 port map
(
    CONTROL0 => CONTROL0,
    CONTROL1 => CONTROL1
);

u4 : fft1 PORT MAP
(
    clk 				=> clk_5M,
    start 			=> '1',
    xn_re 			=> data_std,
    xn_im 			=> x"00",
    fwd_inv 		=> '1',
    fwd_inv_we 	=> '1',
    rfd 				=> open,
    xn_index 		=> xn_index,
    busy 			=> open,
    edone 			=> done,
    done 			=> open,
    dv 				=> open,
    xk_index 		=> xk_index,
    xk_re 			=> xk_re,
    xk_im 			=> xk_im
);

u5 : dcm1 port map
(
    CLK_IN1 => CLKIN,
    CLK_OUT1 => clk_5M,
    CLK_OUT2 => clk
);

xk_re_s<=signed(xk_re)*signed(xk_re);
xk_im_s<=signed(xk_im)*signed(xk_im);
sum_re_im<=conv_std_logic_vector(xk_re_s+xk_im_s,34);
TRIG0<=done & sum_re_im;

process(clk_5M)
	begin
	if(rising_edge(clk_5M))then
		n<=n+1;
		if(n=nc)then
			n<=0;
			data_index<=data_index+mc;
			data<=mem_sin(data_index);
		end if;
	end if;
end process;


end Behavioral;

