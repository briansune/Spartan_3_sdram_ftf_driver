////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: tft_bk_light_cnt.v
// /___/   /\     Timestamp: Tue Sep 24 00:23:20 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog F:/github_projects/s3_test/s3_uart_ram_tft_ctrl/s3_uart/src/tft_bk_light_cnt/tmp/_cg/tft_bk_light_cnt.ngc F:/github_projects/s3_test/s3_uart_ram_tft_ctrl/s3_uart/src/tft_bk_light_cnt/tmp/_cg/tft_bk_light_cnt.v 
// Device	: 3s100etq144-4
// Input file	: F:/github_projects/s3_test/s3_uart_ram_tft_ctrl/s3_uart/src/tft_bk_light_cnt/tmp/_cg/tft_bk_light_cnt.ngc
// Output file	: F:/github_projects/s3_test/s3_uart_ram_tft_ctrl/s3_uart/src/tft_bk_light_cnt/tmp/_cg/tft_bk_light_cnt.v
// # of Modules	: 1
// Design Name	: tft_bk_light_cnt
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module tft_bk_light_cnt (
  clk, thresh0, sclr, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output thresh0;
  input sclr;
  output [14 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/sig0000004a ;
  wire \blk00000001/sig00000049 ;
  wire \blk00000001/sig00000048 ;
  wire \blk00000001/sig00000047 ;
  wire \blk00000001/sig00000046 ;
  wire \blk00000001/sig00000045 ;
  wire \blk00000001/sig00000044 ;
  wire \blk00000001/sig00000043 ;
  wire \blk00000001/sig00000042 ;
  wire \blk00000001/sig00000041 ;
  wire \blk00000001/sig00000040 ;
  wire \blk00000001/sig0000003f ;
  wire \blk00000001/sig0000003e ;
  wire \blk00000001/sig0000003d ;
  wire \blk00000001/sig0000003c ;
  wire \blk00000001/sig0000003b ;
  wire \blk00000001/sig0000003a ;
  wire \blk00000001/sig00000039 ;
  wire \blk00000001/sig00000038 ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000026 ;
  wire \blk00000001/sig00000025 ;
  wire \blk00000001/sig00000024 ;
  wire \blk00000001/sig00000023 ;
  wire \blk00000001/sig00000022 ;
  wire \blk00000001/sig00000021 ;
  wire \blk00000001/sig00000020 ;
  wire \blk00000001/sig0000001f ;
  wire \blk00000001/sig0000001e ;
  wire \blk00000001/sig0000001d ;
  wire \blk00000001/sig0000001c ;
  wire \blk00000001/sig0000001b ;
  wire \blk00000001/sig0000001a ;
  wire \blk00000001/sig00000019 ;
  wire \blk00000001/sig00000018 ;
  wire \blk00000001/sig00000016 ;
  wire \blk00000001/sig00000015 ;
  wire \blk00000001/sig00000014 ;
  wire \blk00000001/sig00000013 ;
  wire \blk00000001/sig00000012 ;
  wire \blk00000001/sig00000011 ;
  wire \blk00000001/sig00000010 ;
  wire \blk00000001/sig0000000f ;
  wire \blk00000001/sig0000000e ;
  wire \blk00000001/sig0000000d ;
  wire \blk00000001/sig0000000c ;
  wire \blk00000001/sig0000000b ;
  wire \blk00000001/sig0000000a ;
  wire \blk00000001/sig00000009 ;
  wire \blk00000001/sig00000008 ;
  wire \blk00000001/sig00000007 ;
  wire \blk00000001/sig00000006 ;
  wire \blk00000001/sig00000005 ;
  wire \blk00000001/sig00000003 ;
  wire \blk00000001/sig00000002 ;
  wire [14 : 0] NlwRenamedSig_OI_q;
  assign
    q[14] = NlwRenamedSig_OI_q[14],
    q[13] = NlwRenamedSig_OI_q[13],
    q[12] = NlwRenamedSig_OI_q[12],
    q[11] = NlwRenamedSig_OI_q[11],
    q[10] = NlwRenamedSig_OI_q[10],
    q[9] = NlwRenamedSig_OI_q[9],
    q[8] = NlwRenamedSig_OI_q[8],
    q[7] = NlwRenamedSig_OI_q[7],
    q[6] = NlwRenamedSig_OI_q[6],
    q[5] = NlwRenamedSig_OI_q[5],
    q[4] = NlwRenamedSig_OI_q[4],
    q[3] = NlwRenamedSig_OI_q[3],
    q[2] = NlwRenamedSig_OI_q[2],
    q[1] = NlwRenamedSig_OI_q[1],
    q[0] = NlwRenamedSig_OI_q[0];
  LUT2_L #(
    .INIT ( 4'h1 ))
  \blk00000001/blk00000049  (
    .I0(\blk00000001/sig00000008 ),
    .I1(\blk00000001/sig0000000e ),
    .LO(\blk00000001/sig00000048 )
  );
  LUT2_L #(
    .INIT ( 4'h1 ))
  \blk00000001/blk00000048  (
    .I0(\blk00000001/sig0000000f ),
    .I1(\blk00000001/sig00000010 ),
    .LO(\blk00000001/sig00000045 )
  );
  LUT2_L #(
    .INIT ( 4'h4 ))
  \blk00000001/blk00000047  (
    .I0(\blk00000001/sig0000000c ),
    .I1(\blk00000001/sig0000000d ),
    .LO(\blk00000001/sig0000004a )
  );
  LUT2_L #(
    .INIT ( 4'h8 ))
  \blk00000001/blk00000046  (
    .I0(NlwRenamedSig_OI_q[12]),
    .I1(NlwRenamedSig_OI_q[14]),
    .LO(\blk00000001/sig00000006 )
  );
  INV   \blk00000001/blk00000045  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\blk00000001/sig00000026 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000044  (
    .I0(NlwRenamedSig_OI_q[14]),
    .O(\blk00000001/sig00000043 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000043  (
    .I0(NlwRenamedSig_OI_q[13]),
    .O(\blk00000001/sig00000039 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000042  (
    .I0(NlwRenamedSig_OI_q[12]),
    .O(\blk00000001/sig00000038 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000041  (
    .I0(NlwRenamedSig_OI_q[11]),
    .O(\blk00000001/sig00000037 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000040  (
    .I0(NlwRenamedSig_OI_q[10]),
    .O(\blk00000001/sig00000036 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003f  (
    .I0(NlwRenamedSig_OI_q[9]),
    .O(\blk00000001/sig00000042 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003e  (
    .I0(NlwRenamedSig_OI_q[8]),
    .O(\blk00000001/sig00000041 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003d  (
    .I0(NlwRenamedSig_OI_q[7]),
    .O(\blk00000001/sig00000040 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003c  (
    .I0(NlwRenamedSig_OI_q[6]),
    .O(\blk00000001/sig0000003f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003b  (
    .I0(NlwRenamedSig_OI_q[5]),
    .O(\blk00000001/sig0000003e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003a  (
    .I0(NlwRenamedSig_OI_q[4]),
    .O(\blk00000001/sig0000003d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000039  (
    .I0(NlwRenamedSig_OI_q[3]),
    .O(\blk00000001/sig0000003c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000038  (
    .I0(NlwRenamedSig_OI_q[2]),
    .O(\blk00000001/sig0000003b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000037  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\blk00000001/sig0000003a )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000036  (
    .I0(\blk00000001/sig00000046 ),
    .I1(\blk00000001/sig0000004a ),
    .I2(\blk00000001/sig00000049 ),
    .I3(\blk00000001/sig00000047 ),
    .O(\blk00000001/sig00000044 )
  );
  LUT4 #(
    .INIT ( 16'h1000 ))
  \blk00000001/blk00000035  (
    .I0(\blk00000001/sig00000013 ),
    .I1(\blk00000001/sig00000014 ),
    .I2(\blk00000001/sig00000015 ),
    .I3(\blk00000001/sig00000048 ),
    .O(\blk00000001/sig00000049 )
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \blk00000001/blk00000034  (
    .I0(\blk00000001/sig00000016 ),
    .I1(\blk00000001/sig00000009 ),
    .I2(\blk00000001/sig0000000a ),
    .I3(\blk00000001/sig00000045 ),
    .O(\blk00000001/sig00000047 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \blk00000001/blk00000033  (
    .I0(\blk00000001/sig00000011 ),
    .I1(\blk00000001/sig00000012 ),
    .I2(\blk00000001/sig0000000b ),
    .O(\blk00000001/sig00000046 )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \blk00000001/blk00000032  (
    .I0(NlwRenamedSig_OI_q[4]),
    .I1(\blk00000001/sig00000006 ),
    .I2(\blk00000001/sig00000007 ),
    .I3(sclr),
    .O(\blk00000001/sig00000005 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000031  (
    .I0(NlwRenamedSig_OI_q[5]),
    .I1(NlwRenamedSig_OI_q[8]),
    .I2(NlwRenamedSig_OI_q[9]),
    .I3(NlwRenamedSig_OI_q[10]),
    .O(\blk00000001/sig00000007 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000030  (
    .C(clk),
    .CE(\blk00000001/sig00000003 ),
    .D(\blk00000001/sig00000044 ),
    .R(sclr),
    .Q(thresh0)
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002f  (
    .C(clk),
    .D(\blk00000001/sig0000000d ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002e  (
    .C(clk),
    .D(\blk00000001/sig0000000c ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002d  (
    .C(clk),
    .D(\blk00000001/sig0000000b ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002c  (
    .C(clk),
    .D(\blk00000001/sig0000000a ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002b  (
    .C(clk),
    .D(\blk00000001/sig00000009 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002a  (
    .C(clk),
    .D(\blk00000001/sig00000016 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000029  (
    .C(clk),
    .D(\blk00000001/sig00000015 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000028  (
    .C(clk),
    .D(\blk00000001/sig00000014 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000027  (
    .C(clk),
    .D(\blk00000001/sig00000013 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000026  (
    .C(clk),
    .D(\blk00000001/sig00000012 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000025  (
    .C(clk),
    .D(\blk00000001/sig00000011 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000024  (
    .C(clk),
    .D(\blk00000001/sig00000010 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000023  (
    .C(clk),
    .D(\blk00000001/sig0000000f ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000022  (
    .C(clk),
    .D(\blk00000001/sig0000000e ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000021  (
    .C(clk),
    .D(\blk00000001/sig00000008 ),
    .R(\blk00000001/sig00000005 ),
    .Q(NlwRenamedSig_OI_q[0])
  );
  XORCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig0000001b ),
    .LI(\blk00000001/sig00000039 ),
    .O(\blk00000001/sig0000000c )
  );
  MUXCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig0000001b ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig00000039 ),
    .O(\blk00000001/sig0000001c )
  );
  XORCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig0000001a ),
    .LI(\blk00000001/sig00000038 ),
    .O(\blk00000001/sig0000000b )
  );
  MUXCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig0000001a ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig00000038 ),
    .O(\blk00000001/sig0000001b )
  );
  XORCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig00000019 ),
    .LI(\blk00000001/sig00000037 ),
    .O(\blk00000001/sig0000000a )
  );
  MUXCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig00000019 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig00000037 ),
    .O(\blk00000001/sig0000001a )
  );
  XORCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig00000025 ),
    .LI(\blk00000001/sig00000036 ),
    .O(\blk00000001/sig00000009 )
  );
  MUXCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig00000025 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig00000036 ),
    .O(\blk00000001/sig00000019 )
  );
  XORCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig00000024 ),
    .LI(\blk00000001/sig00000042 ),
    .O(\blk00000001/sig00000016 )
  );
  MUXCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig00000024 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig00000042 ),
    .O(\blk00000001/sig00000025 )
  );
  XORCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig00000023 ),
    .LI(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig00000015 )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig00000023 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig00000024 )
  );
  XORCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig00000022 ),
    .LI(\blk00000001/sig00000040 ),
    .O(\blk00000001/sig00000014 )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig00000022 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig00000040 ),
    .O(\blk00000001/sig00000023 )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig00000021 ),
    .LI(\blk00000001/sig0000003f ),
    .O(\blk00000001/sig00000013 )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig00000021 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig0000003f ),
    .O(\blk00000001/sig00000022 )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig00000020 ),
    .LI(\blk00000001/sig0000003e ),
    .O(\blk00000001/sig00000012 )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig00000020 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig0000003e ),
    .O(\blk00000001/sig00000021 )
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig0000001f ),
    .LI(\blk00000001/sig0000003d ),
    .O(\blk00000001/sig00000011 )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig0000001f ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig0000003d ),
    .O(\blk00000001/sig00000020 )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig0000001e ),
    .LI(\blk00000001/sig0000003c ),
    .O(\blk00000001/sig00000010 )
  );
  MUXCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig0000001e ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig0000003c ),
    .O(\blk00000001/sig0000001f )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig0000001d ),
    .LI(\blk00000001/sig0000003b ),
    .O(\blk00000001/sig0000000f )
  );
  MUXCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig0000001d ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig0000003b ),
    .O(\blk00000001/sig0000001e )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig00000018 ),
    .LI(\blk00000001/sig0000003a ),
    .O(\blk00000001/sig0000000e )
  );
  MUXCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig00000018 ),
    .DI(\blk00000001/sig00000002 ),
    .S(\blk00000001/sig0000003a ),
    .O(\blk00000001/sig0000001d )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig0000001c ),
    .LI(\blk00000001/sig00000043 ),
    .O(\blk00000001/sig0000000d )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000002 ),
    .LI(\blk00000001/sig00000026 ),
    .O(\blk00000001/sig00000008 )
  );
  MUXCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000002 ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig00000026 ),
    .O(\blk00000001/sig00000018 )
  );
  VCC   \blk00000001/blk00000003  (
    .P(\blk00000001/sig00000003 )
  );
  GND   \blk00000001/blk00000002  (
    .G(\blk00000001/sig00000002 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
