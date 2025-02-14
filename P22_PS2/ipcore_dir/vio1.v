///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2024 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : vio1.v
// /___/   /\     Timestamp  : Wed Jul 03 09:44:02 Iran Standard Time 2024
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module vio1(
    CONTROL,
    ASYNC_IN) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input [7 : 0] ASYNC_IN;

endmodule
