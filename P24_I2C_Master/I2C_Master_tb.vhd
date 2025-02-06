--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:32:37 06/19/2024
-- Design Name:   
-- Module Name:   E:/Prjs/Sobh/FPGA1403/P34_I2C_Master/I2C_Master_tb.vhd
-- Project Name:  P34_I2C_Master
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: I2C_Master
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
 
ENTITY I2C_Master_tb IS
END I2C_Master_tb;
 
ARCHITECTURE behavior OF I2C_Master_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT I2C_Master
    Port ( clk 			: in  	STD_LOGIC;
           SDA 			: inout  STD_LOGIC;
           SCL 			: inout  STD_LOGIC;
           din 			: in  	STD_LOGIC_VECTOR (7 downto 0);
           dout 			: out  	STD_LOGIC_VECTOR (7 downto 0);
           start_en 		: in  	STD_LOGIC;
           stop 			: in  	STD_LOGIC;
           busy 			: buffer	STD_LOGIC;
           finish 		: out  	STD_LOGIC;
           ack_in 		: in  	STD_LOGIC;
           ack_out 		: out  	STD_LOGIC;
           slave_addr 	: in  	STD_LOGIC_VECTOR (6 downto 0);
           rw 				: in  	STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal start_en : std_logic := '0';
   signal stop : std_logic := '0';
   signal ack_in : std_logic := '0';
   signal slave_addr : std_logic_vector(6 downto 0) := (others => '0');
   signal rw : std_logic := '0';

	--BiDirs
   signal SDA : std_logic;
   signal SCL : std_logic;

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal busy : std_logic;
   signal finish : std_logic;
   signal ack_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: I2C_Master PORT MAP (
          clk => clk,
          SDA => SDA,
          SCL => SCL,
          din => din,
          dout => dout,
          start_en => start_en,
          stop => stop,
          busy => busy,
          finish => finish,
          ack_in => ack_in,
          ack_out => ack_out,
          slave_addr => slave_addr,
          rw => rw
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
		SDA<='Z';
		SCL<='Z';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
      -- insert stimulus here
		
		rw<='0';--write
		slave_addr<="1101000";--ds1307 addr
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		
		wait for 1 us;
		din<=x"55";
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		
		wait for 1 us;
		stop<='1';
		wait for 20 ns;
		stop<='0';
		wait for 20 ns;
		
		wait for 10 us;
		
		
		rw<='1';--read
		slave_addr<="1101000";--ds1307 addr
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;
		
		wait for 1 us;
		ack_in<='0';--ack
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;
		
		wait for 1 us;
		ack_in<='0';--ack
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;
		
		wait for 1 us;
		ack_in<='1';--nack
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;

      wait;
   end process;

END;
