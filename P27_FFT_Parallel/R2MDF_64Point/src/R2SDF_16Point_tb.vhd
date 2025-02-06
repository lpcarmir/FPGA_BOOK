LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
use std.textio.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY R2SDF_16Point_tb IS
END R2SDF_16Point_tb;
 
ARCHITECTURE behavior OF R2SDF_16Point_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R2SDF_16Point
    PORT(
         din_re	: in   STD_LOGIC_VECTOR (15 downto 0);
         din_im 	: in   STD_LOGIC_VECTOR (15 downto 0);
         dout_re 	: OUT  std_logic_vector(15 downto 0);
         dout_im 	: OUT  std_logic_vector(15 downto 0);
			valid		: out  STD_LOGIC;
			en			: in   STD_LOGIC;
         clk 		: IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din_re : std_logic_vector(15 downto 0) := (others => '0');
   signal din_im : std_logic_vector(15 downto 0) := (others => '0');
   signal en  : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
	signal valid : std_logic;
   signal dout_re : std_logic_vector(15 downto 0);
   signal dout_im : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: R2SDF_16Point PORT MAP (
          din_re => din_re,
          din_im => din_im,
          dout_re => dout_re,
          dout_im => dout_im,
          valid => valid,
          en => en,
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
 
	process
		file outm_re:text is out"..\out_re.txt";
		file outm_im:text is out"..\out_im.txt";
		variable text_line_o_re: line;
		variable text_line_o_im: line;
		variable to_file_o_re: integer;
		variable to_file_o_im: integer;
		begin
			wait until (valid='1');
			loop
			wait until rising_edge(clk);
			to_file_o_re:=conv_integer(dout_re);
			to_file_o_im:=conv_integer(dout_im);
			write(text_line_o_re,to_file_o_re);
			write(text_line_o_im,to_file_o_im);
			writeline(outm_re,text_line_o_re);
			writeline(outm_im,text_line_o_im);
			end loop;
			wait;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      en<='0';
		--wait for 90 ns;
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		en<='1';
		--wait for 1 ns;
--		loop
--		din_re<=x"1400";
--		din_im<=not(x"0000")+1;
--		wait until rising_edge(clk);
--		din_re<=x"FF6A";
--		din_im<=not(x"FE96")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0116";
--		din_im<=not(x"FD66")+1;
--		wait until rising_edge(clk);
--		din_re<=x"FC51";
--		din_im<=not(x"FFFD")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		din_im<=not(x"0000")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0002";
--		din_im<=not(x"03AE")+1;
--		wait until rising_edge(clk);
--		din_re<=x"01FC";
--		din_im<=not(x"FE03")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0168";
--		din_im<=not(x"0095")+1;
--		wait until rising_edge(clk);
--		din_re<=x"F400";
--		din_im<=not(x"0000")+1;
--		wait until rising_edge(clk);
--		din_re<=x"FF6A";
--		din_im<=not(x"FE96")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0116";
--		din_im<=not(x"FD66")+1;
--		wait until rising_edge(clk);
--		din_re<=x"FC51";
--		din_im<=not(x"FFFD")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		din_im<=not(x"0000")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0002";
--		din_im<=not(x"03AE")+1;
--		wait until rising_edge(clk);
--		din_re<=x"01FC";
--		din_im<=not(x"FE03")+1;
--		wait until rising_edge(clk);
--		din_re<=x"0168";
--		din_im<=not(x"0095")+1;
--		wait until rising_edge(clk);
--		end loop;

		--for test a0 input
		loop
		din_im<=x"0000";
		din_re<=x"006C";
		wait until rising_edge(clk);
		din_re<=x"0296";
		wait until rising_edge(clk);
		din_re<=x"0380";
		wait until rising_edge(clk);
		din_re<=x"0263";
		wait until rising_edge(clk);
		din_re<=x"FF90";
		wait until rising_edge(clk);
		din_re<=x"FCAB";
		wait until rising_edge(clk);
		din_re<=x"FBD7";
		wait until rising_edge(clk);
		din_re<=x"FE09";
		wait until rising_edge(clk);
		din_re<=x"01EC";
		wait until rising_edge(clk);
		din_re<=x"0496";
		wait until rising_edge(clk);
		din_re<=x"03E3";
		wait until rising_edge(clk);
		din_re<=x"0063";
		wait until rising_edge(clk);
		din_re<=x"FCF3";
		wait until rising_edge(clk);
		din_re<=x"FC1E";
		wait until rising_edge(clk);
		din_re<=x"FDE7";
		wait until rising_edge(clk);
		din_re<=x"0038";
		wait until rising_edge(clk);
		end loop;
		
--		loop
--		din_im<=x"0000";
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0200";
--		wait until rising_edge(clk);
--		
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0700";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0100";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0600";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--
--		end loop;

--		loop
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0700";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0100";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0600";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--		din_re<=x"0000";
--		wait until rising_edge(clk);
--		din_re<=x"0300";
--		wait until rising_edge(clk);
--
--		end loop;
      --wait;
   end process;

END;
