--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:36:20 06/11/2024
-- Design Name:   
-- Module Name:   E:/Prjs/Sobh/FPGA1403/P30_FIFO/fifo1_tb.vhd
-- Project Name:  P30_FIFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fifo1_tb IS
END fifo1_tb;
 
ARCHITECTURE behavior OF fifo1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fifo1
    PORT(
         din : IN  std_logic_vector(7 downto 0);
         rst : IN  std_logic;
         wr_en : IN  std_logic;
         clk : IN  std_logic;
         dout : OUT  std_logic_vector(7 downto 0);
         rd_en : IN  std_logic;
         empty : OUT  std_logic;
         full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal wr_en : std_logic := '0';
	signal rd_en : std_logic;
   signal clk : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal empty : std_logic;
   signal full : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo1 PORT MAP (
          din => din,
          rst => rst,
          wr_en => wr_en,
          clk => clk,
          dout => dout,
          rd_en => rd_en,
          empty => empty,
          full => full
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
      rst<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		rst<='0';
		wait for 1 us;
		
		din<=x"01";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"02";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"03";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"04";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"05";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"06";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"07";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"08";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"09";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"10";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"11";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"12";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"13";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"14";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"15";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"16";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		din<=x"17";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		
		wait for 1 us;
		rd_en<='1';
		wait for 20 ns;
		rd_en<='0';
		
		wait for 1 us;
		
		din<=x"18";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		rd_en<='1';
		wait for 2 us;
		
		rd_en<='0';
		wait for 1 us;
		
		
		din<=x"10";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"11";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"12";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"13";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"14";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"15";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		wait for 1 us;
		
		din<=x"16";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		din<=x"17";
		wr_en<='1';
		wait for 20 ns;
		wr_en<='0';
		
		
		rd_en<='1';
		wait for 2 us;
		
		rd_en<='0';
      wait;
   end process;

END;
