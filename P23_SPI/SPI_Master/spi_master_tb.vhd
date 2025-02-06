--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:55:03 06/12/2024
-- Design Name:   
-- Module Name:   E:/Prjs/Sobh/FPGA1403/P33_SPI_Master/spi_master_tb.vhd
-- Project Name:  P33_SPI_Master
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: spi_master
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
 
ENTITY spi_master_tb IS
END spi_master_tb;
 
ARCHITECTURE behavior OF spi_master_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT spi_master
    PORT(
         clk : IN  std_logic;
         MISO : IN  std_logic;
         MOSI : OUT  std_logic;
         SCK : OUT  std_logic;
         SS : OUT  std_logic;
         en : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(7 downto 0);
         valid : OUT  std_logic;
         busy : OUT  std_logic;
         ss_status : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal MISO : std_logic := '0';
   signal en : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal ss_status : std_logic := '0';

 	--Outputs
   signal MOSI : std_logic;
   signal SCK : std_logic;
   signal SS : std_logic;
   signal dout : std_logic_vector(7 downto 0);
   signal valid : std_logic;
   signal busy : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	signal sck_old:std_logic;
	constant data1:std_logic_vector(7 downto 0):=x"aa";
	constant data2:std_logic_vector(7 downto 0):=x"55";
	signal i:integer range 0 to 7;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: spi_master PORT MAP (
          clk => clk,
          MISO => MISO,
          MOSI => MOSI,
          SCK => SCK,
          SS => SS,
          en => en,
          din => din,
          dout => dout,
          valid => valid,
          busy => busy,
          ss_status => ss_status
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
		MISO<='0';
		en<='0';
		ss_status<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		ss_status<='0';
		din<=x"ee";
		wait for 20 ns;
		en<='1';
		wait for 20 ns;
		en<='0';
		i<=7;
		
		loop
			MISO<=data1(i);
			sck_old<=sck;
			if(sck_old='1' and sck<='0')then
				i<=i-1;
				if(i=0)then
					i<=7;
					EXIT;
				end if;
			end if;
			wait for 20 ns;
		end loop;
		
		wait for 30 us;
		
		din<=x"99";
		wait for 20 ns;
		en<='1';
		wait for 20 ns;
		en<='0';
		i<=7;
		
		loop
			MISO<=data2(i);
			sck_old<=sck;
			if(sck_old='1' and sck<='0')then
				i<=i-1;
				if(i=0)then
					i<=7;
					EXIT;
				end if;
			end if;
			wait for 20 ns;
		end loop;
		--signal MISO : std_logic := '0';
	
      wait;
   end process;

END;
