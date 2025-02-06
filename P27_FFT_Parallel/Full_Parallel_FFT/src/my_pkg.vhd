--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package my_pkg is
type mem16 is array (0 to 15) of std_logic_vector(15 downto 0);
type mem8 is array (0 to 7) of std_logic_vector(15 downto 0);
type mem9 is array (0 to 8) of std_logic_vector(15 downto 0);
type wn_type is array (0 to 7) of std_logic_vector(15 downto 0);
constant wn_real:wn_type:=(x"0100",x"00EC",x"00B5",x"0061",x"0000",x"FF9F",x"FF4B",x"FF14");
--                                 0.9239  0.7071  0.3827         -0.3827 -0.7071 -0.9239
constant wn_imag:wn_type:=(x"0000",x"FF9F",x"FF4B",x"FF14",x"FF00",x"FF14",x"FF4B",x"FF9F");
--                                -0.3827 -0.7071 -0.9239   -1    -0.9239 -0.7071 -0.3827
-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end my_pkg;

package body my_pkg is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end my_pkg;
