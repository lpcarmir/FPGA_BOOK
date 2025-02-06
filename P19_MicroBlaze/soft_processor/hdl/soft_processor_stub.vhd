-------------------------------------------------------------------------------
-- soft_processor_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity soft_processor_stub is
  port (
    fpga_0_Generic_GPIO_GPIO_IO_pin : inout std_logic_vector(0 to 21);
    fpga_0_RS232_RX_pin : in std_logic;
    fpga_0_RS232_TX_pin : out std_logic;
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic
  );
end soft_processor_stub;

architecture STRUCTURE of soft_processor_stub is

  component soft_processor is
    port (
      fpga_0_Generic_GPIO_GPIO_IO_pin : inout std_logic_vector(0 to 21);
      fpga_0_RS232_RX_pin : in std_logic;
      fpga_0_RS232_TX_pin : out std_logic;
      fpga_0_clk_1_sys_clk_pin : in std_logic;
      fpga_0_rst_1_sys_rst_pin : in std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of soft_processor : component is "user_black_box";

begin

  soft_processor_i : soft_processor
    port map (
      fpga_0_Generic_GPIO_GPIO_IO_pin => fpga_0_Generic_GPIO_GPIO_IO_pin,
      fpga_0_RS232_RX_pin => fpga_0_RS232_RX_pin,
      fpga_0_RS232_TX_pin => fpga_0_RS232_TX_pin,
      fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
      fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin
    );

end architecture STRUCTURE;

