--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:50:47 06/12/2024
-- Design Name:   
-- Module Name:   E:/Prjs/Sobh/FPGA1403/P32_SPI_Slave/spi_slave_tb.vhd
-- Project Name:  P32_SPI_Slave
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: spi_slave
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
 
ENTITY spi_slave_tb IS
END spi_slave_tb;
 
ARCHITECTURE behavior OF spi_slave_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT spi_slave
    PORT(
         clk : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(7 downto 0);
         valid : OUT  std_logic;
         MISO : OUT  std_logic;
         MOSI : IN  std_logic;
         SCK : IN  std_logic;
         SS : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal MOSI : std_logic := '0';
   signal SCK : std_logic := '0';
   signal SS : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal valid : std_logic;
   signal MISO : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant sdout1:std_logic_vector(7 downto 0):=x"EE";
	constant sdout2:std_logic_vector(7 downto 0):=x"99";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: spi_slave PORT MAP (
          clk => clk,
          din => din,
          dout => dout,
          valid => valid,
          MISO => MISO,
          MOSI => MOSI,
          SCK => SCK,
          SS => SS
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
		ss<='1';
		sck<='0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here
		
		wait for 1 us;
		
		din<=x"AA";
		wait for 20 ns;
		ss<='0';--select slave;
		
		for i in 0 to 7 loop
			SCK<='0';
			MOSI<=sdout1(7-i);
			wait for 1 us;
			SCK<='1';
			wait for 1 us;
		end loop;
		
		SCK<='0';
		wait for 1 us;
		
		for i in 0 to 7 loop
			SCK<='0';
			MOSI<=sdout2(7-i);
			wait for 1 us;
			SCK<='1';
			wait for 1 us;
		end loop;
		SCK<='0';
		
		

      wait;
   end process;

END;
