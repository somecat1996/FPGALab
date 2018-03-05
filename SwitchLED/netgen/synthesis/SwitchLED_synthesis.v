////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: SwitchLED_synthesis.v
// /___/   /\     Timestamp: Thu Mar 01 00:53:35 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim SwitchLED.ngc SwitchLED_synthesis.v 
// Device	: xc3s500e-4-fg320
// Input file	: SwitchLED.ngc
// Output file	: E:\study\FPGALab\homework\SwitchLED\netgen\synthesis\SwitchLED_synthesis.v
// # of Modules	: 1
// Design Name	: SwitchLED
// Xilinx        : G:\coding\Xilinx\Xilinx\14.7\ISE_DS\ISE\
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

module SwitchLED (
LEDOut, SlideSwitch
);
  output [7 : 0] LEDOut;
  input [3 : 0] SlideSwitch;
  wire LEDOut_0_OBUF_8;
  wire LEDOut_1_OBUF_9;
  wire LEDOut_2_OBUF_10;
  wire LEDOut_3_OBUF_11;
  IBUF   SlideSwitch_3_IBUF (
    .I(SlideSwitch[3]),
    .O(LEDOut_3_OBUF_11)
  );
  IBUF   SlideSwitch_2_IBUF (
    .I(SlideSwitch[2]),
    .O(LEDOut_2_OBUF_10)
  );
  IBUF   SlideSwitch_1_IBUF (
    .I(SlideSwitch[1]),
    .O(LEDOut_1_OBUF_9)
  );
  IBUF   SlideSwitch_0_IBUF (
    .I(SlideSwitch[0]),
    .O(LEDOut_0_OBUF_8)
  );
  OBUF   LEDOut_7_OBUF (
    .I(LEDOut_0_OBUF_8),
    .O(LEDOut[7])
  );
  OBUF   LEDOut_6_OBUF (
    .I(LEDOut_1_OBUF_9),
    .O(LEDOut[6])
  );
  OBUF   LEDOut_5_OBUF (
    .I(LEDOut_2_OBUF_10),
    .O(LEDOut[5])
  );
  OBUF   LEDOut_4_OBUF (
    .I(LEDOut_3_OBUF_11),
    .O(LEDOut[4])
  );
  OBUF   LEDOut_3_OBUF (
    .I(LEDOut_3_OBUF_11),
    .O(LEDOut[3])
  );
  OBUF   LEDOut_2_OBUF (
    .I(LEDOut_2_OBUF_10),
    .O(LEDOut[2])
  );
  OBUF   LEDOut_1_OBUF (
    .I(LEDOut_1_OBUF_9),
    .O(LEDOut[1])
  );
  OBUF   LEDOut_0_OBUF (
    .I(LEDOut_0_OBUF_8),
    .O(LEDOut[0])
  );
endmodule


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

