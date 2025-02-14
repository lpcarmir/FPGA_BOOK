-------------------------------------------------------------------------------
-- Copyright (c) 2024 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : vio_in.vho
-- /___/   /\     Timestamp  : Fri Oct 25 22:26:40 Iran Standard Time 2024
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: ISE Instantiation template
-- Component Identifier: xilinx.com:ip:chipscope_vio:1.05.a
-------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component vio_in
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    ASYNC_IN : IN STD_LOGIC_VECTOR(4 DOWNTO 0));

end component;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

your_instance_name : vio_in
  port map (
    CONTROL => CONTROL,
    ASYNC_IN => ASYNC_IN);

-- INST_TAG_END ------ End INSTANTIATION Template ------------
