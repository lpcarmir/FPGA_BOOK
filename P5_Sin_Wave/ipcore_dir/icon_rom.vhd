-------------------------------------------------------------------------------
-- Copyright (c) 2024 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : icon_rom.vhd
-- /___/   /\     Timestamp  : Fri Nov 15 19:51:47 Iran Standard Time 2024
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY icon_rom IS
  port (
    CONTROL0: inout std_logic_vector(35 downto 0));
END icon_rom;

ARCHITECTURE icon_rom_a OF icon_rom IS
BEGIN

END icon_rom_a;
