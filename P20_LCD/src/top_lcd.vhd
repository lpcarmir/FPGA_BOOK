library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_lcd is
	Port (
			clk 	: in   STD_LOGIC;
			en 	: out  STD_LOGIC;
			rs		: out  STD_LOGIC;
			rw 	: out  STD_LOGIC;
			dout 	: out  STD_LOGIC_vector(3 downto 0));
end top_lcd;

architecture Behavioral of top_lcd is
component lcd_controller is
    Port (
				clk 	: in   STD_LOGIC;
				en 	: out  STD_LOGIC;
				rs		: out  STD_LOGIC;
				rw 	: out  STD_LOGIC;
				eni 	: in   STD_LOGIC;
				rsi 	: in   STD_LOGIC;
				din 	: in   STD_LOGIC_vector(7 downto 0);
				dout 	: out  STD_LOGIC_vector(3 downto 0));
end component;

component icon1
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
end component;

component vio1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    ASYNC_OUT : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

signal CONTROL: STD_LOGIC_VECTOR(35 DOWNTO 0);
signal ASYNC_OUT: STD_LOGIC_VECTOR(9 DOWNTO 0);
signal vio_data: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal vio_rs: STD_LOGIC;
signal vio_en: STD_LOGIC;
signal vio_en_t: STD_LOGIC;
signal vio_en_t_last: STD_LOGIC;

begin

u1: lcd_controller port map
(
	clk 	=>clk,
   en 	=>en,
   rs		=>rs,
   rw 	=>rw,
   eni 	=>vio_en,
   rsi 	=>vio_rs,
   din 	=>vio_data,
   dout  =>dout
);

u2 : icon1 port map
(
    CONTROL0 => CONTROL
);

u3 : vio1 port map
(
    CONTROL => CONTROL,
    ASYNC_OUT => ASYNC_OUT
);

process(clk)
	begin
	if(clk'event and clk='1')then
		vio_data<=ASYNC_OUT(7 downto 0);
		vio_rs<=ASYNC_OUT(8);
		vio_en_t<=ASYNC_OUT(9);
		vio_en_t_last<=vio_en_t;
		
		if(vio_en_t='1' and vio_en_t_last='0')then
			vio_en<='1';
		else
			vio_en<='0';
		end if;
	end if;
end process;

end Behavioral;

