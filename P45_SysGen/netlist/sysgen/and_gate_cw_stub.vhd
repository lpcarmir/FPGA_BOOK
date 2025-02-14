----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity and_gate_cw_stub is
    port (
      ce: in std_logic := '1'; 
      clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      gateway_in: in std_logic_vector(15 downto 0); 
      gateway_in1: in std_logic_vector(15 downto 0); 
      gateway_out: out std_logic_vector(15 downto 0)
    );
end and_gate_cw_stub;

architecture Behavioral of and_gate_cw_stub is

  component and_gate_cw
    port (
      ce: in std_logic := '1'; 
      clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      gateway_in: in std_logic_vector(15 downto 0); 
      gateway_in1: in std_logic_vector(15 downto 0); 
      gateway_out: out std_logic_vector(15 downto 0)
    );
  end component;
begin

and_gate_cw_i : and_gate_cw
  port map (
    ce => ce,
    clk => clk,
    gateway_in => gateway_in,
    gateway_in1 => gateway_in1,
    gateway_out => gateway_out);
end Behavioral;

