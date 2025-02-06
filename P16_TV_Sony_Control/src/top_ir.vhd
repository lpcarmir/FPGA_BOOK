----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:43 07/07/2018 
-- Design Name: 
-- Module Name:    top_ir - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_ir is
    Port ( clk : in  STD_LOGIC;
           hs0038i : in  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0));
end top_ir;

architecture Behavioral of top_ir is
COMPONENT ir_receiver_sony
	PORT(
	clk : IN std_logic;
	hs0038i : IN std_logic;          
	data : OUT std_logic_vector(15 downto 0);
	valid : OUT std_logic
	);
END COMPONENT;
COMPONENT hex_cnt
	PORT(
	clk : IN std_logic;
	din : IN std_logic_vector(15 downto 0);          
	sel : OUT std_logic_vector(3 downto 0);
	data : OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;
signal sdata:std_logic_vector(15 downto 0);
begin

u_ir: ir_receiver_sony PORT MAP(
		clk => clk,
		hs0038i => hs0038i,
		data => sdata,
		valid => open
	);

u_7seg: hex_cnt PORT MAP(
		clk => clk,
		din => sdata,
		sel => sel,
		data => data
	);

end Behavioral;

