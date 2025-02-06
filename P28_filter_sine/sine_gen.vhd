library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity sine_gen is
    Port ( clk : in  STD_LOGIC;
			  count_in : STD_LOGIC_VECTOR (7 downto 0);
			  sample_in : STD_LOGIC_VECTOR (7 downto 0);
           sine_data : out  STD_LOGIC_VECTOR (7 downto 0));
end sine_gen;

architecture Behavioral of sine_gen is

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

--signal count_in : std_logic_vector(7 downto 0):=conv_std_logic_vector(0,8);
signal counter : std_logic_vector(7 downto 0):=conv_std_logic_vector(0,8);
--signal sample_in : std_logic_vector(7 downto 0):=conv_std_logic_vector(0,8);
signal sampler : std_logic_vector(7 downto 0):=conv_std_logic_vector(0,8);

begin

process(clk)
	begin
	if(rising_edge(clk))then
	
		counter<=counter+'1';
		if counter=count_in then
			counter<=conv_std_logic_vector(0,8);
			sampler<=sampler+sample_in+'1';
--			if sampler>"011111111" then
--				sampler<=sampler-"011111111";
--			end if;
			if sampler="11111111" then
				sampler<="00000000";
			end if;
			
			sine_data<=conv_std_logic_vector(code(conv_integer(sampler)),8);
		end if;
		
	end if;
end process;



end Behavioral;

