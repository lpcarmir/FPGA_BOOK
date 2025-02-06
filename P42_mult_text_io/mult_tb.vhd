
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use std.textio.all;

ENTITY mult_tb IS
END mult_tb;
 
ARCHITECTURE behavior OF mult_tb IS 
    COMPONENT mult
    PORT(
         clk : IN  std_logic;
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         p : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal clk : std_logic := '0';
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
 	--Outputs
   signal p : std_logic_vector(15 downto 0);
   signal input_count : integer:=0;
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult PORT MAP (
          clk => clk,
          a => a,
          b => b,
          p => p
        );
	clk<=not clk after 10 ns;
	process
		file ina: text is in "C:\1\ina.txt";
		file inb: text is in "C:\1\inb.txt";
		file outm:text is out"C:\1\output1.txt";
		variable text_line_a :line;
		variable text_line_b :line;
		variable text_line_o: line;
		variable to_file_o: integer;
		variable input_var1: integer;
		variable input_var2: integer;
		begin
			while (not endfile(ina) and not endfile(inb)) loop
				wait until (rising_edge(clk));
				readline(ina,text_line_a);
				readline(inb,text_line_b);
				read(text_line_a,input_var1);
				read(text_line_b,input_var2);
				a<=conv_std_logic_vector(input_var1,8);
				b<=conv_std_logic_vector(input_var2,8);
				wait until (rising_edge(clk));--wait for a and b become update
				wait until (rising_edge(clk));--wait for p become update
				to_file_o:=conv_integer(p);
				write(text_line_o,to_file_o);
				writeline(outm,text_line_o);
				input_count<=input_count+1;--ÊÚÏÇÏ Ê˜ÑÇÑ ÑÇ ãí ÔãÇÑÏ
			end loop;
			wait;
	end process;
END;
