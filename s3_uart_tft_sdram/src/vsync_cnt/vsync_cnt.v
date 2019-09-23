////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: vsync_cnt.v
// /___/   /\     Timestamp: Tue Sep 17 23:18:22 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Briansune/Desktop/s3_test/s3_test1/src/vsync_cnt/tmp/_cg/vsync_cnt.ngc C:/Users/Briansune/Desktop/s3_test/s3_test1/src/vsync_cnt/tmp/_cg/vsync_cnt.v 
// Device	: 3s100etq144-4
// Input file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/vsync_cnt/tmp/_cg/vsync_cnt.ngc
// Output file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/vsync_cnt/tmp/_cg/vsync_cnt.v
// # of Modules	: 1
// Design Name	: vsync_cnt
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

module vsync_cnt (
  clk, ce, sclr, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input ce;
  input sclr;
  output [8 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/sig0000002b ;
  wire \blk00000001/sig0000002a ;
  wire \blk00000001/sig00000029 ;
  wire \blk00000001/sig00000028 ;
  wire \blk00000001/sig00000027 ;
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
  wire \blk00000001/sig00000004 ;
  wire \blk00000001/sig00000003 ;
  wire [8 : 0] NlwRenamedSig_OI_q;
  assign
    q[8] = NlwRenamedSig_OI_q[8],
    q[7] = NlwRenamedSig_OI_q[7],
    q[6] = NlwRenamedSig_OI_q[6],
    q[5] = NlwRenamedSig_OI_q[5],
    q[4] = NlwRenamedSig_OI_q[4],
    q[3] = NlwRenamedSig_OI_q[3],
    q[2] = NlwRenamedSig_OI_q[2],
    q[1] = NlwRenamedSig_OI_q[1],
    q[0] = NlwRenamedSig_OI_q[0];
  LUT4_L #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000029  (
    .I0(NlwRenamedSig_OI_q[2]),
    .I1(NlwRenamedSig_OI_q[7]),
    .I2(NlwRenamedSig_OI_q[6]),
    .I3(NlwRenamedSig_OI_q[5]),
    .LO(\blk00000001/sig00000008 )
  );
  INV   \blk00000001/blk00000028  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\blk00000001/sig00000011 )
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  \blk00000001/blk00000027  (
    .I0(sclr),
    .I1(NlwRenamedSig_OI_q[1]),
    .I2(\blk00000001/sig00000004 ),
    .I3(\blk00000001/sig00000008 ),
    .O(\blk00000001/sig00000007 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000026  (
    .I0(ce),
    .I1(NlwRenamedSig_OI_q[4]),
    .I2(NlwRenamedSig_OI_q[8]),
    .I3(NlwRenamedSig_OI_q[3]),
    .O(\blk00000001/sig00000004 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000025  (
    .I0(NlwRenamedSig_OI_q[8]),
    .O(\blk00000001/sig00000022 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000024  (
    .I0(NlwRenamedSig_OI_q[7]),
    .O(\blk00000001/sig00000021 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000023  (
    .I0(NlwRenamedSig_OI_q[6]),
    .O(\blk00000001/sig00000020 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000022  (
    .I0(NlwRenamedSig_OI_q[5]),
    .O(\blk00000001/sig0000001f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000021  (
    .I0(NlwRenamedSig_OI_q[4]),
    .O(\blk00000001/sig0000001e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000020  (
    .I0(NlwRenamedSig_OI_q[3]),
    .O(\blk00000001/sig0000001d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000001f  (
    .I0(NlwRenamedSig_OI_q[2]),
    .O(\blk00000001/sig0000001c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000001e  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\blk00000001/sig0000001b )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000002b ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000002a ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000029 ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000028 ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000027 ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000026 ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000025 ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000016  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000024 ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000015  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000023 ),
    .R(\blk00000001/sig00000007 ),
    .Q(NlwRenamedSig_OI_q[0])
  );
  XORCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig0000000f ),
    .LI(\blk00000001/sig00000021 ),
    .O(\blk00000001/sig0000002a )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig0000000f ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig00000021 ),
    .O(\blk00000001/sig00000010 )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig0000000e ),
    .LI(\blk00000001/sig00000020 ),
    .O(\blk00000001/sig00000029 )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig0000000e ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig00000020 ),
    .O(\blk00000001/sig0000000f )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig0000000d ),
    .LI(\blk00000001/sig0000001f ),
    .O(\blk00000001/sig00000028 )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig0000000d ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000001f ),
    .O(\blk00000001/sig0000000e )
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig0000000c ),
    .LI(\blk00000001/sig0000001e ),
    .O(\blk00000001/sig00000027 )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig0000000c ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000001e ),
    .O(\blk00000001/sig0000000d )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig0000000b ),
    .LI(\blk00000001/sig0000001d ),
    .O(\blk00000001/sig00000026 )
  );
  MUXCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig0000000b ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000001d ),
    .O(\blk00000001/sig0000000c )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig0000000a ),
    .LI(\blk00000001/sig0000001c ),
    .O(\blk00000001/sig00000025 )
  );
  MUXCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig0000000a ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000001c ),
    .O(\blk00000001/sig0000000b )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig00000009 ),
    .LI(\blk00000001/sig0000001b ),
    .O(\blk00000001/sig00000024 )
  );
  MUXCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig00000009 ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000001b ),
    .O(\blk00000001/sig0000000a )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig00000010 ),
    .LI(\blk00000001/sig00000022 ),
    .O(\blk00000001/sig0000002b )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000003 ),
    .LI(\blk00000001/sig00000011 ),
    .O(\blk00000001/sig00000023 )
  );
  MUXCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000003 ),
    .DI(\blk00000001/sig00000006 ),
    .S(\blk00000001/sig00000011 ),
    .O(\blk00000001/sig00000009 )
  );
  VCC   \blk00000001/blk00000003  (
    .P(\blk00000001/sig00000006 )
  );
  GND   \blk00000001/blk00000002  (
    .G(\blk00000001/sig00000003 )
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
