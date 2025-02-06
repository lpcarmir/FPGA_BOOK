library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "AND_GATE"

entity and_gate is
  port (
    gateway_in: in std_logic_vector(15 downto 0); 
    gateway_in1: in std_logic_vector(15 downto 0); 
    gateway_out: out std_logic_vector(15 downto 0)
  );
end and_gate;

architecture structural of and_gate is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "AND_GATE,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,compilation=HDL_Netlist,testbench=0,total_blocks=9,xilinx_gateway_in_block=2,xilinx_gateway_out_block=1,xilinx_logical_block_block=1,xilinx_system_generator_block=1,}";

  signal gateway_in1_net: std_logic_vector(15 downto 0);
  signal gateway_in_net: std_logic_vector(15 downto 0);
  signal gateway_out_net: std_logic_vector(15 downto 0);

begin
  gateway_in_net <= gateway_in;
  gateway_in1_net <= gateway_in1;
  gateway_out <= gateway_out_net;

  logical: entity work.logical_2a516dc919
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => gateway_in_net,
      d1 => gateway_in1_net,
      y => gateway_out_net
    );

end structural;
