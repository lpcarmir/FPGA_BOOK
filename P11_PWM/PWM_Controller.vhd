library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PWM_Controller is
    Port ( clk : in  STD_LOGIC;
           pwm : out  STD_LOGIC;
           up : in  STD_LOGIC;
           down : in  STD_LOGIC);
end PWM_Controller;

architecture Behavioral of PWM_Controller is

signal cnt_pwm: integer range 0 to 499;
signal compare_pwm: integer range 0 to 499:=25;
signal up_filter: integer range 0 to 999999;
signal down_filter: integer range 0 to 999999;
begin

process(clk)
	begin
	if(rising_edge(clk))then
		cnt_pwm<=cnt_pwm+1;
		if(cnt_pwm=499)then
			cnt_pwm<=0;
		end if;
	end if;
end process;

process(clk)
	begin
	if(rising_edge(clk))then
		if(cnt_pwm>=compare_pwm)then
			pwm<='0';
		else
			pwm<='1';
		end if;
	end if;
end process;

process(clk)
	begin
	if(rising_edge(clk))then
		if(up='0')then
			if(up_filter<999999)then
				up_filter<=up_filter+1;
			end if;
			if(up_filter=999998)then
				if(compare_pwm<475)then
					compare_pwm<=compare_pwm+25;
				end if;
			end if;
		else
			up_filter<=0;
		end if;
		
		if(down='0')then
			if(down_filter<999999)then
				down_filter<=down_filter+1;
			end if;
			if(down_filter=999998)then
				if(compare_pwm>25)then
					compare_pwm<=compare_pwm-25;
				end if;
			end if;
		else
			down_filter<=0;
		end if;
	end if;
end process;

end Behavioral;

