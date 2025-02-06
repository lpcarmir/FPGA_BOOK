----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:22 11/15/2024 
-- Design Name: 
-- Module Name:    diff_buffer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
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
library UNISIM;
use UNISIM.VComponents.all;

entity diff_buffer is
    Port ( in_p : in  STD_LOGIC;
           in_n : in  STD_LOGIC;
           out_p : out  STD_LOGIC;
           out_n : out  STD_LOGIC);
end diff_buffer;

architecture Behavioral of diff_buffer is
signal sig1: std_logic;
begin

u1 : IBUFDS generic map
(
      DIFF_TERM => FALSE, -- Differential Termination 
      IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE)
      IOSTANDARD => "DEFAULT"
) port map(
      O => sig1,  -- Buffer output
      I => in_p,  -- Diff_p buffer input
      IB => in_n -- Diff_n buffer input
);

u2 : OBUFDS generic map
(
      IOSTANDARD => "DEFAULT"
) port map(
      O => out_p,     -- Diff_p output
      OB => out_n,   -- Diff_n output
      I => sig1      -- Buffer input 
);

end Behavioral;

