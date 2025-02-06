--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:38:05 04/30/2024
-- Design Name:   
-- Module Name:   E:/Prjs/Sobh/FPGA1403/P19_UART/UART_RX_tb.vhd
-- Project Name:  P19_UART
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UART_RX
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
 
ENTITY UART_RX_tb IS
END UART_RX_tb;
 
ARCHITECTURE behavior OF UART_RX_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UART_RX
    PORT(
         clk : IN  std_logic;
         rx : IN  std_logic;
         dout : OUT  std_logic_vector(7 downto 0);
         valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rx : std_logic := '1';

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant testData : std_logic_vector(7 downto 0):=x"AA";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UART_RX PORT MAP (
          clk => clk,
          rx => rx,
          dout => dout,
          valid => valid
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
      -- hold reset state for 100 ns.
		rx<='1';--idle
      wait for 100 ns;	
		
		
		----------------------------
		------- test filter -------
		rx<='0';
		wait for 20 ns;
		rx<='1';
		wait for 20 ns;
		
		rx<='0';
		wait for 40 ns;
		rx<='1';
		wait for 40 ns;
		------------------------------

      wait for 1 ms;
		
		rx<='0';--start
		wait for 104.16 us;
		
		for i in 0 to 7 loop
			rx<=testData(i);--data 8bit
			wait for 104.16 us;
		end loop;
		
--		rx<=testData(0);
--		wait for 104.16 us;
--		rx<=testData(1);
--		wait for 104.16 us;
--		rx<=testData(2);
--		wait for 104.16 us;
--		rx<=testData(3);
--		wait for 104.16 us;
--		rx<=testData(4);
--		wait for 104.16 us;
--		rx<=testData(5);
--		wait for 104.16 us;
--		rx<=testData(6);
--		wait for 104.16 us;
--		rx<=testData(7);
--		wait for 104.16 us;

	
		rx<='1';--stop
		wait for 104.16 us;
		
      -- insert stimulus here 

      wait;
   end process;

END;
