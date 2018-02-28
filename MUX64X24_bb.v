// megafunction wizard: %LPM_MUX%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_mux 

// ============================================================
// File Name: MUX64X24.v
// Megafunction Name(s):
// 			lpm_mux
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.1 Build 222 10/21/2009 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module MUX64X24 (
	data0x,
	data10x,
	data11x,
	data12x,
	data13x,
	data14x,
	data15x,
	data16x,
	data17x,
	data18x,
	data19x,
	data1x,
	data20x,
	data21x,
	data22x,
	data23x,
	data24x,
	data25x,
	data26x,
	data27x,
	data28x,
	data29x,
	data2x,
	data30x,
	data31x,
	data32x,
	data33x,
	data34x,
	data35x,
	data36x,
	data37x,
	data38x,
	data39x,
	data3x,
	data40x,
	data41x,
	data42x,
	data43x,
	data44x,
	data45x,
	data46x,
	data47x,
	data48x,
	data49x,
	data4x,
	data50x,
	data51x,
	data52x,
	data53x,
	data54x,
	data55x,
	data56x,
	data57x,
	data58x,
	data59x,
	data5x,
	data60x,
	data61x,
	data62x,
	data63x,
	data6x,
	data7x,
	data8x,
	data9x,
	sel,
	result);

	input	[23:0]  data0x;
	input	[23:0]  data10x;
	input	[23:0]  data11x;
	input	[23:0]  data12x;
	input	[23:0]  data13x;
	input	[23:0]  data14x;
	input	[23:0]  data15x;
	input	[23:0]  data16x;
	input	[23:0]  data17x;
	input	[23:0]  data18x;
	input	[23:0]  data19x;
	input	[23:0]  data1x;
	input	[23:0]  data20x;
	input	[23:0]  data21x;
	input	[23:0]  data22x;
	input	[23:0]  data23x;
	input	[23:0]  data24x;
	input	[23:0]  data25x;
	input	[23:0]  data26x;
	input	[23:0]  data27x;
	input	[23:0]  data28x;
	input	[23:0]  data29x;
	input	[23:0]  data2x;
	input	[23:0]  data30x;
	input	[23:0]  data31x;
	input	[23:0]  data32x;
	input	[23:0]  data33x;
	input	[23:0]  data34x;
	input	[23:0]  data35x;
	input	[23:0]  data36x;
	input	[23:0]  data37x;
	input	[23:0]  data38x;
	input	[23:0]  data39x;
	input	[23:0]  data3x;
	input	[23:0]  data40x;
	input	[23:0]  data41x;
	input	[23:0]  data42x;
	input	[23:0]  data43x;
	input	[23:0]  data44x;
	input	[23:0]  data45x;
	input	[23:0]  data46x;
	input	[23:0]  data47x;
	input	[23:0]  data48x;
	input	[23:0]  data49x;
	input	[23:0]  data4x;
	input	[23:0]  data50x;
	input	[23:0]  data51x;
	input	[23:0]  data52x;
	input	[23:0]  data53x;
	input	[23:0]  data54x;
	input	[23:0]  data55x;
	input	[23:0]  data56x;
	input	[23:0]  data57x;
	input	[23:0]  data58x;
	input	[23:0]  data59x;
	input	[23:0]  data5x;
	input	[23:0]  data60x;
	input	[23:0]  data61x;
	input	[23:0]  data62x;
	input	[23:0]  data63x;
	input	[23:0]  data6x;
	input	[23:0]  data7x;
	input	[23:0]  data8x;
	input	[23:0]  data9x;
	input	[5:0]  sel;
	output	[23:0]  result;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: CONSTANT: LPM_SIZE NUMERIC "64"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "24"
// Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "6"
// Retrieval info: USED_PORT: data0x 0 0 24 0 INPUT NODEFVAL data0x[23..0]
// Retrieval info: USED_PORT: data10x 0 0 24 0 INPUT NODEFVAL data10x[23..0]
// Retrieval info: USED_PORT: data11x 0 0 24 0 INPUT NODEFVAL data11x[23..0]
// Retrieval info: USED_PORT: data12x 0 0 24 0 INPUT NODEFVAL data12x[23..0]
// Retrieval info: USED_PORT: data13x 0 0 24 0 INPUT NODEFVAL data13x[23..0]
// Retrieval info: USED_PORT: data14x 0 0 24 0 INPUT NODEFVAL data14x[23..0]
// Retrieval info: USED_PORT: data15x 0 0 24 0 INPUT NODEFVAL data15x[23..0]
// Retrieval info: USED_PORT: data16x 0 0 24 0 INPUT NODEFVAL data16x[23..0]
// Retrieval info: USED_PORT: data17x 0 0 24 0 INPUT NODEFVAL data17x[23..0]
// Retrieval info: USED_PORT: data18x 0 0 24 0 INPUT NODEFVAL data18x[23..0]
// Retrieval info: USED_PORT: data19x 0 0 24 0 INPUT NODEFVAL data19x[23..0]
// Retrieval info: USED_PORT: data1x 0 0 24 0 INPUT NODEFVAL data1x[23..0]
// Retrieval info: USED_PORT: data20x 0 0 24 0 INPUT NODEFVAL data20x[23..0]
// Retrieval info: USED_PORT: data21x 0 0 24 0 INPUT NODEFVAL data21x[23..0]
// Retrieval info: USED_PORT: data22x 0 0 24 0 INPUT NODEFVAL data22x[23..0]
// Retrieval info: USED_PORT: data23x 0 0 24 0 INPUT NODEFVAL data23x[23..0]
// Retrieval info: USED_PORT: data24x 0 0 24 0 INPUT NODEFVAL data24x[23..0]
// Retrieval info: USED_PORT: data25x 0 0 24 0 INPUT NODEFVAL data25x[23..0]
// Retrieval info: USED_PORT: data26x 0 0 24 0 INPUT NODEFVAL data26x[23..0]
// Retrieval info: USED_PORT: data27x 0 0 24 0 INPUT NODEFVAL data27x[23..0]
// Retrieval info: USED_PORT: data28x 0 0 24 0 INPUT NODEFVAL data28x[23..0]
// Retrieval info: USED_PORT: data29x 0 0 24 0 INPUT NODEFVAL data29x[23..0]
// Retrieval info: USED_PORT: data2x 0 0 24 0 INPUT NODEFVAL data2x[23..0]
// Retrieval info: USED_PORT: data30x 0 0 24 0 INPUT NODEFVAL data30x[23..0]
// Retrieval info: USED_PORT: data31x 0 0 24 0 INPUT NODEFVAL data31x[23..0]
// Retrieval info: USED_PORT: data32x 0 0 24 0 INPUT NODEFVAL data32x[23..0]
// Retrieval info: USED_PORT: data33x 0 0 24 0 INPUT NODEFVAL data33x[23..0]
// Retrieval info: USED_PORT: data34x 0 0 24 0 INPUT NODEFVAL data34x[23..0]
// Retrieval info: USED_PORT: data35x 0 0 24 0 INPUT NODEFVAL data35x[23..0]
// Retrieval info: USED_PORT: data36x 0 0 24 0 INPUT NODEFVAL data36x[23..0]
// Retrieval info: USED_PORT: data37x 0 0 24 0 INPUT NODEFVAL data37x[23..0]
// Retrieval info: USED_PORT: data38x 0 0 24 0 INPUT NODEFVAL data38x[23..0]
// Retrieval info: USED_PORT: data39x 0 0 24 0 INPUT NODEFVAL data39x[23..0]
// Retrieval info: USED_PORT: data3x 0 0 24 0 INPUT NODEFVAL data3x[23..0]
// Retrieval info: USED_PORT: data40x 0 0 24 0 INPUT NODEFVAL data40x[23..0]
// Retrieval info: USED_PORT: data41x 0 0 24 0 INPUT NODEFVAL data41x[23..0]
// Retrieval info: USED_PORT: data42x 0 0 24 0 INPUT NODEFVAL data42x[23..0]
// Retrieval info: USED_PORT: data43x 0 0 24 0 INPUT NODEFVAL data43x[23..0]
// Retrieval info: USED_PORT: data44x 0 0 24 0 INPUT NODEFVAL data44x[23..0]
// Retrieval info: USED_PORT: data45x 0 0 24 0 INPUT NODEFVAL data45x[23..0]
// Retrieval info: USED_PORT: data46x 0 0 24 0 INPUT NODEFVAL data46x[23..0]
// Retrieval info: USED_PORT: data47x 0 0 24 0 INPUT NODEFVAL data47x[23..0]
// Retrieval info: USED_PORT: data48x 0 0 24 0 INPUT NODEFVAL data48x[23..0]
// Retrieval info: USED_PORT: data49x 0 0 24 0 INPUT NODEFVAL data49x[23..0]
// Retrieval info: USED_PORT: data4x 0 0 24 0 INPUT NODEFVAL data4x[23..0]
// Retrieval info: USED_PORT: data50x 0 0 24 0 INPUT NODEFVAL data50x[23..0]
// Retrieval info: USED_PORT: data51x 0 0 24 0 INPUT NODEFVAL data51x[23..0]
// Retrieval info: USED_PORT: data52x 0 0 24 0 INPUT NODEFVAL data52x[23..0]
// Retrieval info: USED_PORT: data53x 0 0 24 0 INPUT NODEFVAL data53x[23..0]
// Retrieval info: USED_PORT: data54x 0 0 24 0 INPUT NODEFVAL data54x[23..0]
// Retrieval info: USED_PORT: data55x 0 0 24 0 INPUT NODEFVAL data55x[23..0]
// Retrieval info: USED_PORT: data56x 0 0 24 0 INPUT NODEFVAL data56x[23..0]
// Retrieval info: USED_PORT: data57x 0 0 24 0 INPUT NODEFVAL data57x[23..0]
// Retrieval info: USED_PORT: data58x 0 0 24 0 INPUT NODEFVAL data58x[23..0]
// Retrieval info: USED_PORT: data59x 0 0 24 0 INPUT NODEFVAL data59x[23..0]
// Retrieval info: USED_PORT: data5x 0 0 24 0 INPUT NODEFVAL data5x[23..0]
// Retrieval info: USED_PORT: data60x 0 0 24 0 INPUT NODEFVAL data60x[23..0]
// Retrieval info: USED_PORT: data61x 0 0 24 0 INPUT NODEFVAL data61x[23..0]
// Retrieval info: USED_PORT: data62x 0 0 24 0 INPUT NODEFVAL data62x[23..0]
// Retrieval info: USED_PORT: data63x 0 0 24 0 INPUT NODEFVAL data63x[23..0]
// Retrieval info: USED_PORT: data6x 0 0 24 0 INPUT NODEFVAL data6x[23..0]
// Retrieval info: USED_PORT: data7x 0 0 24 0 INPUT NODEFVAL data7x[23..0]
// Retrieval info: USED_PORT: data8x 0 0 24 0 INPUT NODEFVAL data8x[23..0]
// Retrieval info: USED_PORT: data9x 0 0 24 0 INPUT NODEFVAL data9x[23..0]
// Retrieval info: USED_PORT: result 0 0 24 0 OUTPUT NODEFVAL result[23..0]
// Retrieval info: USED_PORT: sel 0 0 6 0 INPUT NODEFVAL sel[5..0]
// Retrieval info: CONNECT: result 0 0 24 0 @result 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1512 data63x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1488 data62x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1464 data61x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1440 data60x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1416 data59x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1392 data58x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1368 data57x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1344 data56x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1320 data55x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1296 data54x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1272 data53x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1248 data52x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1224 data51x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1200 data50x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1176 data49x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1152 data48x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1128 data47x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1104 data46x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1080 data45x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1056 data44x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1032 data43x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1008 data42x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 984 data41x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 960 data40x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 936 data39x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 912 data38x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 888 data37x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 864 data36x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 840 data35x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 816 data34x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 792 data33x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 768 data32x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 744 data31x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 720 data30x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 696 data29x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 672 data28x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 648 data27x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 624 data26x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 600 data25x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 576 data24x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 552 data23x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 528 data22x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 504 data21x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 480 data20x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 456 data19x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 432 data18x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 408 data17x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 384 data16x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 360 data15x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 336 data14x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 312 data13x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 288 data12x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 264 data11x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 240 data10x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 216 data9x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 192 data8x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 168 data7x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 144 data6x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 120 data5x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 96 data4x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 72 data3x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 48 data2x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 24 data1x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 0 data0x 0 0 24 0
// Retrieval info: CONNECT: @sel 0 0 6 0 sel 0 0 6 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX64X24.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX64X24.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX64X24.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX64X24.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX64X24_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX64X24_bb.v TRUE
// Retrieval info: LIB_FILE: lpm