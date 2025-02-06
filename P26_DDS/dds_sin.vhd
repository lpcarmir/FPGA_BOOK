library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity dds_sin is
    Port ( clk : in  STD_LOGIC);
end dds_sin;

architecture Behavioral of dds_sin is

component icon1
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
end component;

component ila1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

component vio1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
	 SYNC_IN : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
    SYNC_OUT : OUT STD_LOGIC_VECTOR(24 DOWNTO 0));
end component;


signal CONTROL0:STD_LOGIC_VECTOR(35 DOWNTO 0);
signal CONTROL1:STD_LOGIC_VECTOR(35 DOWNTO 0);
signal TRIG0:STD_LOGIC_VECTOR(7 DOWNTO 0);
signal vio_din:STD_LOGIC_VECTOR(18 DOWNTO 0);
signal vio_data:STD_LOGIC_VECTOR(24 DOWNTO 0);
signal vio_data_old:STD_LOGIC_VECTOR(24 DOWNTO 0);

type code_type is array (0 to 255) of integer range 0 to 255;
constant code : code_type :=
	(128,131,134,137,140,143,146,149,152,156,159,162,165,168,171,
	174,176,179,182,185,188,191,193,196,199,201,204,206,209,211,
	213,216,218,220,222,224,226,228,230,232,234,235,237,239,240,
	242,243,244,246,247,248,249,250,251,251,252,253,253,254,254,
	254,255,255,255,255,255,255,255,254,254,254,253,252,252,251,
	250,249,248,247,246,245,244,242,241,239,238,236,235,233,231,
	229,227,225,223,221,219,217,215,212,210,208,205,203,200,197,
	195,192,189,187,184,181,178,175,172,169,166,163,160,157,154,
	151,148,145,142,139,135,132,129,126,123,120,117,114,110,107,
	104,101,98,95,92,89,86,83,80,77,74,71,69,66,63,60,58,55,53,
	50,48,45,43,41,38,36,34,32,30,28,26,24,22,20,19,17,16,14,13,
	11,10,9,8,7,6,5,4,3,3,2,2,1,1,0,0,0,0,0,0,0,1,1,1,2,2,3,4,4,
	5,6,7,8,9,11,12,13,15,16,18,19,21,23,25,27,29,31,33,35,37,39,
	41,44,46,49,51,54,56,59,62,64,67,70,73,75,78,81,84,87,90,93,
	96,99,102,105,109,112,115,118,121,124,127
);

signal i: integer range 0 to 255;
signal cnt: integer range 0 to 255;
signal count: integer range 0 to 255;
signal sample: integer range 0 to 255;
signal temp: integer range 0 to 255;
signal target_freq: integer range 0 to 24_999_999;
constant base_freq: integer:=195_311;
signal base_freq_temp: integer range 0 to 195_311;

signal flag_calc: std_logic;
signal flag_calc1: std_logic;
signal flag_calc2: std_logic;
begin

u_icon : icon1 port map
(
    CONTROL0 => CONTROL0,
    CONTROL1 => CONTROL1
);

u_ila : ila1 port map
(
    CONTROL => CONTROL0,
    CLK => CLK,
    TRIG0 => TRIG0
);

u_vio : vio1 port map
(
    CONTROL => CONTROL1,
    CLK => CLK,
	 SYNC_IN=> vio_din,
    SYNC_OUT => vio_data
);

process(clk)
	begin
	if(rising_edge(clk))then
		vio_data_old<=vio_data;
		if(vio_data /= vio_data_old)then--mokhalef
		--if(flag_calc='0' and flag_calc1='0' and flag_calc2='0')then--mokhalef
			flag_calc<='1';
			base_freq_temp<=base_freq;
			target_freq<=conv_integer(vio_data);
		end if;
		
		if(flag_calc='1')then
			if(target_freq<=base_freq)then
				flag_calc1<='1';
			else
				flag_calc2<='1';
			end if;
			flag_calc<='0';
			temp<=0;
		end if;
		
		if(flag_calc1='1')then
			if(base_freq_temp>target_freq)then
				temp<=temp+1;
				base_freq_temp<=base_freq_temp-target_freq;
			else
				sample<=1;
				count<=temp;
				flag_calc1<='0';
			end if;
		end if;
		
		if(flag_calc2='1')then
			if(target_freq>base_freq)then
				temp<=temp+1;
				target_freq<=target_freq-base_freq;
			else
				count<=0;
				sample<=temp;
				flag_calc2<='0';
			end if;
		end if;
		
	end if;
end process;

vio_din(7 downto 0)<=conv_std_logic_vector(count,8);
vio_din(15 downto 8)<=conv_std_logic_vector(sample,8);
vio_din(16)<=flag_calc;
vio_din(17)<=flag_calc1;
vio_din(18)<=flag_calc2;

process(clk)
	begin
	if(rising_edge(clk))then
		cnt<=cnt+1;
		if(cnt=count)then
			cnt<=0;
			i<=i+sample;
		end if;
	end if;
end process;

TRIG0<=conv_std_logic_vector(code(i),8);

end Behavioral;

