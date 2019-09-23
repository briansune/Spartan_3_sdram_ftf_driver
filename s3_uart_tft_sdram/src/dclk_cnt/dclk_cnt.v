////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: dclk_cnt.v
// /___/   /\     Timestamp: Tue Sep 17 23:08:56 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Briansune/Desktop/s3_test/s3_test1/src/dclk_cnt/tmp/_cg/dclk_cnt.ngc C:/Users/Briansune/Desktop/s3_test/s3_test1/src/dclk_cnt/tmp/_cg/dclk_cnt.v 
// Device	: 3s100etq144-4
// Input file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/dclk_cnt/tmp/_cg/dclk_cnt.ngc
// Output file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/dclk_cnt/tmp/_cg/dclk_cnt.v
// # of Modules	: 1
// Design Name	: dclk_cnt
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

module dclk_cnt (
  clk, ce, thresh0, sclr, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input ce;
  output thresh0;
  input sclr;
  output [1 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/sig0000000f ;
  wire \blk00000001/sig0000000e ;
  wire \blk00000001/sig0000000b ;
  wire \blk00000001/sig0000000a ;
  wire \blk00000001/sig00000008 ;
  wire \blk00000001/sig00000007 ;
  wire \blk00000001/sig00000006 ;
  wire \blk00000001/sig00000004 ;
  wire \blk00000001/sig00000003 ;
  wire [1 : 0] NlwRenamedSig_OI_q;
  assign
    q[1] = NlwRenamedSig_OI_q[1],
    q[0] = NlwRenamedSig_OI_q[0];
  INV   \blk00000001/blk0000000d  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\blk00000001/sig0000000b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000000c  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\blk00000001/sig0000000e )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \blk00000001/blk0000000b  (
    .I0(\blk00000001/sig00000007 ),
    .I1(\blk00000001/sig00000008 ),
    .O(\blk00000001/sig0000000f )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \blk00000001/blk0000000a  (
    .I0(ce),
    .I1(NlwRenamedSig_OI_q[1]),
    .I2(sclr),
    .O(\blk00000001/sig00000006 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000009  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000000f ),
    .R(sclr),
    .Q(thresh0)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000008  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000008 ),
    .R(\blk00000001/sig00000006 ),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000007  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000007 ),
    .R(\blk00000001/sig00000006 ),
    .Q(NlwRenamedSig_OI_q[0])
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig0000000a ),
    .LI(\blk00000001/sig0000000e ),
    .O(\blk00000001/sig00000008 )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000003 ),
    .LI(\blk00000001/sig0000000b ),
    .O(\blk00000001/sig00000007 )
  );
  MUXCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000003 ),
    .DI(\blk00000001/sig00000004 ),
    .S(\blk00000001/sig0000000b ),
    .O(\blk00000001/sig0000000a )
  );
  VCC   \blk00000001/blk00000003  (
    .P(\blk00000001/sig00000004 )
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
