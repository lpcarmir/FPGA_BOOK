--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:47:54 04/08/2024
-- Design Name:   
-- Module Name:   E:/Prjs/Sobh/FPGA1403/P3_Full_adder_4bit/fa_4bit_tb.vhd
-- Project Name:  P3_Full_adder_4bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fa_4bit
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
 
ENTITY fa_4bit_tb IS
END fa_4bit_tb;
 
ARCHITECTURE behavior OF fa_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fa_4bit
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         s : OUT  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal c : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fa_4bit PORT MAP (
          a => a,
          b => b,
          s => s,
          c => c
        );
 

   process
   begin
	
      a<="1000";--8
      b<="0001";--1
		wait for 100 ns;
		
		a<="1001";--9
      b<="1100";--12
		wait for 100 ns;
		
   end process;

END;
