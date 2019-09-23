////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: user_row_cnt.v
// /___/   /\     Timestamp: Wed Sep 18 11:13:02 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Briansune/Desktop/s3_test/s3_test1/src/user_row_cnt/tmp/_cg/user_row_cnt.ngc C:/Users/Briansune/Desktop/s3_test/s3_test1/src/user_row_cnt/tmp/_cg/user_row_cnt.v 
// Device	: 3s100etq144-4
// Input file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/user_row_cnt/tmp/_cg/user_row_cnt.ngc
// Output file	: C:/Users/Briansune/Desktop/s3_test/s3_test1/src/user_row_cnt/tmp/_cg/user_row_cnt.v
// # of Modules	: 1
// Design Name	: user_row_cnt
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

module user_row_cnt (
  clk, ce, load, sclr, q, l
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input ce;
  input load;
  input sclr;
  output [8 : 0] q;
  input [8 : 0] l;
  
  // synthesis translate_off
  
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000035 ;
  wire \blk00000001/sig00000034 ;
  wire \blk00000001/sig00000033 ;
  wire \blk00000001/sig00000032 ;
  wire \blk00000001/sig00000031 ;
  wire \blk00000001/sig00000030 ;
  wire \blk00000001/sig0000002f ;
  wire \blk00000001/sig0000002e ;
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
  wire \blk00000001/sig00000017 ;
  wire \blk00000001/sig00000016 ;
  wire \blk00000001/sig00000015 ;
  wire \blk00000001/sig00000014 ;
  wire \blk00000001/sig00000013 ;
  wire \blk00000001/sig00000012 ;
  wire \blk00000001/sig00000011 ;
  wire \blk00000001/sig00000010 ;
  wire \blk00000001/sig0000000f ;
  wire \blk00000001/sig0000000e ;
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
  LUT2_L #(
    .INIT ( 4'h8 ))
  \blk00000001/blk0000002a  (
    .I0(NlwRenamedSig_OI_q[0]),
    .I1(NlwRenamedSig_OI_q[1]),
    .LO(\blk00000001/sig00000013 )
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  \blk00000001/blk00000029  (
    .I0(sclr),
    .I1(\blk00000001/sig00000011 ),
    .I2(\blk00000001/sig00000013 ),
    .I3(\blk00000001/sig00000012 ),
    .O(\blk00000001/sig0000000f )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000001/blk00000028  (
    .I0(\blk00000001/sig00000010 ),
    .I1(NlwRenamedSig_OI_q[4]),
    .I2(NlwRenamedSig_OI_q[3]),
    .I3(NlwRenamedSig_OI_q[6]),
    .O(\blk00000001/sig00000011 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \blk00000001/blk00000027  (
    .I0(ce),
    .I1(load),
    .O(\blk00000001/sig00000010 )
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \blk00000001/blk00000026  (
    .I0(NlwRenamedSig_OI_q[2]),
    .I1(NlwRenamedSig_OI_q[7]),
    .I2(NlwRenamedSig_OI_q[8]),
    .I3(NlwRenamedSig_OI_q[5]),
    .O(\blk00000001/sig00000012 )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk00000025  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[0]),
    .I2(l[0]),
    .O(\blk00000001/sig0000001c )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk00000024  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[1]),
    .I2(l[1]),
    .O(\blk00000001/sig0000001d )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk00000023  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[2]),
    .I2(l[2]),
    .O(\blk00000001/sig0000001e )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk00000022  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[3]),
    .I2(l[3]),
    .O(\blk00000001/sig0000001f )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk00000021  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[4]),
    .I2(l[4]),
    .O(\blk00000001/sig00000020 )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk00000020  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[5]),
    .I2(l[5]),
    .O(\blk00000001/sig00000021 )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk0000001f  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[6]),
    .I2(l[6]),
    .O(\blk00000001/sig00000022 )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk0000001e  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[7]),
    .I2(l[7]),
    .O(\blk00000001/sig00000023 )
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \blk00000001/blk0000001d  (
    .I0(load),
    .I1(NlwRenamedSig_OI_q[8]),
    .I2(l[8]),
    .O(\blk00000001/sig00000024 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000036 ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000035 ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000034 ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000033 ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000032 ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000031 ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000016  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000030 ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000015  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000002f ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000014  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000002e ),
    .R(\blk00000001/sig0000000f ),
    .Q(NlwRenamedSig_OI_q[0])
  );
  XORCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig0000001a ),
    .LI(\blk00000001/sig00000023 ),
    .O(\blk00000001/sig00000035 )
  );
  MUXCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig0000001a ),
    .DI(load),
    .S(\blk00000001/sig00000023 ),
    .O(\blk00000001/sig0000001b )
  );
  XORCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig00000019 ),
    .LI(\blk00000001/sig00000022 ),
    .O(\blk00000001/sig00000034 )
  );
  MUXCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig00000019 ),
    .DI(load),
    .S(\blk00000001/sig00000022 ),
    .O(\blk00000001/sig0000001a )
  );
  XORCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig00000018 ),
    .LI(\blk00000001/sig00000021 ),
    .O(\blk00000001/sig00000033 )
  );
  MUXCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig00000018 ),
    .DI(load),
    .S(\blk00000001/sig00000021 ),
    .O(\blk00000001/sig00000019 )
  );
  XORCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig00000017 ),
    .LI(\blk00000001/sig00000020 ),
    .O(\blk00000001/sig00000032 )
  );
  MUXCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig00000017 ),
    .DI(load),
    .S(\blk00000001/sig00000020 ),
    .O(\blk00000001/sig00000018 )
  );
  XORCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig00000016 ),
    .LI(\blk00000001/sig0000001f ),
    .O(\blk00000001/sig00000031 )
  );
  MUXCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig00000016 ),
    .DI(load),
    .S(\blk00000001/sig0000001f ),
    .O(\blk00000001/sig00000017 )
  );
  XORCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig00000015 ),
    .LI(\blk00000001/sig0000001e ),
    .O(\blk00000001/sig00000030 )
  );
  MUXCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig00000015 ),
    .DI(load),
    .S(\blk00000001/sig0000001e ),
    .O(\blk00000001/sig00000016 )
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig00000014 ),
    .LI(\blk00000001/sig0000001d ),
    .O(\blk00000001/sig0000002f )
  );
  MUXCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig00000014 ),
    .DI(load),
    .S(\blk00000001/sig0000001d ),
    .O(\blk00000001/sig00000015 )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig0000001b ),
    .LI(\blk00000001/sig00000024 ),
    .O(\blk00000001/sig00000036 )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig0000000e ),
    .LI(\blk00000001/sig0000001c ),
    .O(\blk00000001/sig0000002e )
  );
  MUXCY   \blk00000001/blk00000003  (
    .CI(\blk00000001/sig0000000e ),
    .DI(load),
    .S(\blk00000001/sig0000001c ),
    .O(\blk00000001/sig00000014 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig0000000e )
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
