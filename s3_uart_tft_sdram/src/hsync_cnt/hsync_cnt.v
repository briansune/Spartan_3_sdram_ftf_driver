////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: hsync_cnt.v
// /___/   /\     Timestamp: Tue Sep 17 23:12:50 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Briansune/Desktop/s3_test/s3_test1/src/hsync_cnt/tmp/_cg/hsync_cnt.ngc C:/Users/Briansune/Desktop/s3_test/s3_test1/src/hsync_cnt/tmp/_cg/hsync_cnt.v 
// Device	: 3s100etq144-4
// Input file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/hsync_cnt/tmp/_cg/hsync_cnt.ngc
// Output file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/hsync_cnt/tmp/_cg/hsync_cnt.v
// # of Modules	: 1
// Design Name	: hsync_cnt
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

module hsync_cnt (
  clk, ce, thresh0, sclr, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input ce;
  output thresh0;
  input sclr;
  output [9 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/sig00000034 ;
  wire \blk00000001/sig00000033 ;
  wire \blk00000001/sig00000032 ;
  wire \blk00000001/sig00000031 ;
  wire \blk00000001/sig00000030 ;
  wire \blk00000001/sig0000002f ;
  wire \blk00000001/sig0000002e ;
  wire \blk00000001/sig0000002d ;
  wire \blk00000001/sig0000002c ;
  wire \blk00000001/sig0000002b ;
  wire \blk00000001/sig00000020 ;
  wire \blk00000001/sig0000001f ;
  wire \blk00000001/sig0000001e ;
  wire \blk00000001/sig0000001d ;
  wire \blk00000001/sig0000001c ;
  wire \blk00000001/sig0000001b ;
  wire \blk00000001/sig0000001a ;
  wire \blk00000001/sig00000019 ;
  wire \blk00000001/sig00000018 ;
  wire \blk00000001/sig00000017 ;
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
  wire \blk00000001/sig00000006 ;
  wire \blk00000001/sig00000005 ;
  wire \blk00000001/sig00000004 ;
  wire \blk00000001/sig00000003 ;
  wire [9 : 0] NlwRenamedSig_OI_q;
  assign
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
  LUT4_L #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000032  (
    .I0(\blk00000001/sig0000000e ),
    .I1(\blk00000001/sig0000000f ),
    .I2(\blk00000001/sig00000012 ),
    .I3(\blk00000001/sig00000013 ),
    .LO(\blk00000001/sig00000004 )
  );
  LUT4_L #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000031  (
    .I0(NlwRenamedSig_OI_q[7]),
    .I1(NlwRenamedSig_OI_q[8]),
    .I2(NlwRenamedSig_OI_q[9]),
    .I3(ce),
    .LO(\blk00000001/sig00000009 )
  );
  INV   \blk00000001/blk00000030  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\blk00000001/sig00000020 )
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \blk00000001/blk0000002f  (
    .I0(\blk00000001/sig00000014 ),
    .I1(\blk00000001/sig00000015 ),
    .I2(\blk00000001/sig00000006 ),
    .I3(\blk00000001/sig00000004 ),
    .O(\blk00000001/sig00000034 )
  );
  LUT4 #(
    .INIT ( 16'hBFFF ))
  \blk00000001/blk0000002e  (
    .I0(\blk00000001/sig0000000c ),
    .I1(\blk00000001/sig0000000d ),
    .I2(\blk00000001/sig00000010 ),
    .I3(\blk00000001/sig00000011 ),
    .O(\blk00000001/sig00000006 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000002d  (
    .I0(NlwRenamedSig_OI_q[9]),
    .O(\blk00000001/sig00000033 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000002c  (
    .I0(NlwRenamedSig_OI_q[8]),
    .O(\blk00000001/sig00000032 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000002b  (
    .I0(NlwRenamedSig_OI_q[7]),
    .O(\blk00000001/sig00000031 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000002a  (
    .I0(NlwRenamedSig_OI_q[6]),
    .O(\blk00000001/sig00000030 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000029  (
    .I0(NlwRenamedSig_OI_q[5]),
    .O(\blk00000001/sig0000002f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000028  (
    .I0(NlwRenamedSig_OI_q[4]),
    .O(\blk00000001/sig0000002e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000027  (
    .I0(NlwRenamedSig_OI_q[3]),
    .O(\blk00000001/sig0000002d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000026  (
    .I0(NlwRenamedSig_OI_q[2]),
    .O(\blk00000001/sig0000002c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000025  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\blk00000001/sig0000002b )
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  \blk00000001/blk00000024  (
    .I0(sclr),
    .I1(\blk00000001/sig00000009 ),
    .I2(\blk00000001/sig0000000b ),
    .I3(\blk00000001/sig0000000a ),
    .O(\blk00000001/sig00000008 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000001/blk00000023  (
    .I0(NlwRenamedSig_OI_q[1]),
    .I1(NlwRenamedSig_OI_q[2]),
    .O(\blk00000001/sig0000000b )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000022  (
    .I0(NlwRenamedSig_OI_q[3]),
    .I1(NlwRenamedSig_OI_q[4]),
    .I2(NlwRenamedSig_OI_q[5]),
    .I3(NlwRenamedSig_OI_q[6]),
    .O(\blk00000001/sig0000000a )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000021  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000034 ),
    .R(sclr),
    .Q(thresh0)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000020  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000015 ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000014 ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001e  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000013 ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000012 ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000011 ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000010 ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000000f ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000000e ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000000d ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000000c ),
    .R(\blk00000001/sig00000008 ),
    .Q(NlwRenamedSig_OI_q[0])
  );
  XORCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig0000001e ),
    .LI(\blk00000001/sig00000032 ),
    .O(\blk00000001/sig00000014 )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig0000001e ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig00000032 ),
    .O(\blk00000001/sig0000001f )
  );
  XORCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig0000001d ),
    .LI(\blk00000001/sig00000031 ),
    .O(\blk00000001/sig00000013 )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig0000001d ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig00000031 ),
    .O(\blk00000001/sig0000001e )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig0000001c ),
    .LI(\blk00000001/sig00000030 ),
    .O(\blk00000001/sig00000012 )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig0000001c ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig00000030 ),
    .O(\blk00000001/sig0000001d )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig0000001b ),
    .LI(\blk00000001/sig0000002f ),
    .O(\blk00000001/sig00000011 )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig0000001b ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000002f ),
    .O(\blk00000001/sig0000001c )
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig0000001a ),
    .LI(\blk00000001/sig0000002e ),
    .O(\blk00000001/sig00000010 )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig0000001a ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000002e ),
    .O(\blk00000001/sig0000001b )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig00000019 ),
    .LI(\blk00000001/sig0000002d ),
    .O(\blk00000001/sig0000000f )
  );
  MUXCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig00000019 ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000002d ),
    .O(\blk00000001/sig0000001a )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig00000018 ),
    .LI(\blk00000001/sig0000002c ),
    .O(\blk00000001/sig0000000e )
  );
  MUXCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig00000018 ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000002c ),
    .O(\blk00000001/sig00000019 )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig00000017 ),
    .LI(\blk00000001/sig0000002b ),
    .O(\blk00000001/sig0000000d )
  );
  MUXCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig00000017 ),
    .DI(\blk00000001/sig00000003 ),
    .S(\blk00000001/sig0000002b ),
    .O(\blk00000001/sig00000018 )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig0000001f ),
    .LI(\blk00000001/sig00000033 ),
    .O(\blk00000001/sig00000015 )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000003 ),
    .LI(\blk00000001/sig00000020 ),
    .O(\blk00000001/sig0000000c )
  );
  MUXCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000003 ),
    .DI(\blk00000001/sig00000005 ),
    .S(\blk00000001/sig00000020 ),
    .O(\blk00000001/sig00000017 )
  );
  VCC   \blk00000001/blk00000003  (
    .P(\blk00000001/sig00000005 )
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
