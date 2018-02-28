// megafunction wizard: %LPM_MUX%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_mux 

// ============================================================
// File Name: MUX_96X24.v
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


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module MUX_96X24 (
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
	data64x,
	data65x,
	data66x,
	data67x,
	data68x,
	data69x,
	data6x,
	data70x,
	data71x,
	data72x,
	data73x,
	data74x,
	data75x,
	data76x,
	data77x,
	data78x,
	data79x,
	data7x,
	data80x,
	data81x,
	data82x,
	data83x,
	data84x,
	data85x,
	data86x,
	data87x,
	data88x,
	data89x,
	data8x,
	data90x,
	data91x,
	data92x,
	data93x,
	data94x,
	data95x,
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
	input	[23:0]  data64x;
	input	[23:0]  data65x;
	input	[23:0]  data66x;
	input	[23:0]  data67x;
	input	[23:0]  data68x;
	input	[23:0]  data69x;
	input	[23:0]  data6x;
	input	[23:0]  data70x;
	input	[23:0]  data71x;
	input	[23:0]  data72x;
	input	[23:0]  data73x;
	input	[23:0]  data74x;
	input	[23:0]  data75x;
	input	[23:0]  data76x;
	input	[23:0]  data77x;
	input	[23:0]  data78x;
	input	[23:0]  data79x;
	input	[23:0]  data7x;
	input	[23:0]  data80x;
	input	[23:0]  data81x;
	input	[23:0]  data82x;
	input	[23:0]  data83x;
	input	[23:0]  data84x;
	input	[23:0]  data85x;
	input	[23:0]  data86x;
	input	[23:0]  data87x;
	input	[23:0]  data88x;
	input	[23:0]  data89x;
	input	[23:0]  data8x;
	input	[23:0]  data90x;
	input	[23:0]  data91x;
	input	[23:0]  data92x;
	input	[23:0]  data93x;
	input	[23:0]  data94x;
	input	[23:0]  data95x;
	input	[23:0]  data9x;
	input	[6:0]  sel;
	output	[23:0]  result;

	wire [23:0] sub_wire0;
	wire [23:0] sub_wire97 = data95x[23:0];
	wire [23:0] sub_wire96 = data93x[23:0];
	wire [23:0] sub_wire95 = data92x[23:0];
	wire [23:0] sub_wire94 = data91x[23:0];
	wire [23:0] sub_wire93 = data90x[23:0];
	wire [23:0] sub_wire92 = data89x[23:0];
	wire [23:0] sub_wire91 = data88x[23:0];
	wire [23:0] sub_wire90 = data87x[23:0];
	wire [23:0] sub_wire89 = data86x[23:0];
	wire [23:0] sub_wire88 = data85x[23:0];
	wire [23:0] sub_wire87 = data84x[23:0];
	wire [23:0] sub_wire86 = data83x[23:0];
	wire [23:0] sub_wire85 = data82x[23:0];
	wire [23:0] sub_wire84 = data81x[23:0];
	wire [23:0] sub_wire83 = data80x[23:0];
	wire [23:0] sub_wire82 = data79x[23:0];
	wire [23:0] sub_wire81 = data78x[23:0];
	wire [23:0] sub_wire80 = data77x[23:0];
	wire [23:0] sub_wire79 = data76x[23:0];
	wire [23:0] sub_wire78 = data75x[23:0];
	wire [23:0] sub_wire77 = data74x[23:0];
	wire [23:0] sub_wire76 = data73x[23:0];
	wire [23:0] sub_wire75 = data72x[23:0];
	wire [23:0] sub_wire74 = data71x[23:0];
	wire [23:0] sub_wire73 = data70x[23:0];
	wire [23:0] sub_wire72 = data69x[23:0];
	wire [23:0] sub_wire71 = data68x[23:0];
	wire [23:0] sub_wire70 = data67x[23:0];
	wire [23:0] sub_wire69 = data66x[23:0];
	wire [23:0] sub_wire68 = data65x[23:0];
	wire [23:0] sub_wire67 = data64x[23:0];
	wire [23:0] sub_wire66 = data63x[23:0];
	wire [23:0] sub_wire65 = data62x[23:0];
	wire [23:0] sub_wire64 = data61x[23:0];
	wire [23:0] sub_wire63 = data60x[23:0];
	wire [23:0] sub_wire62 = data59x[23:0];
	wire [23:0] sub_wire61 = data58x[23:0];
	wire [23:0] sub_wire60 = data57x[23:0];
	wire [23:0] sub_wire59 = data56x[23:0];
	wire [23:0] sub_wire58 = data55x[23:0];
	wire [23:0] sub_wire57 = data54x[23:0];
	wire [23:0] sub_wire56 = data53x[23:0];
	wire [23:0] sub_wire55 = data52x[23:0];
	wire [23:0] sub_wire54 = data51x[23:0];
	wire [23:0] sub_wire53 = data50x[23:0];
	wire [23:0] sub_wire52 = data49x[23:0];
	wire [23:0] sub_wire51 = data48x[23:0];
	wire [23:0] sub_wire50 = data47x[23:0];
	wire [23:0] sub_wire49 = data46x[23:0];
	wire [23:0] sub_wire48 = data45x[23:0];
	wire [23:0] sub_wire47 = data44x[23:0];
	wire [23:0] sub_wire46 = data43x[23:0];
	wire [23:0] sub_wire45 = data42x[23:0];
	wire [23:0] sub_wire44 = data41x[23:0];
	wire [23:0] sub_wire43 = data40x[23:0];
	wire [23:0] sub_wire42 = data39x[23:0];
	wire [23:0] sub_wire41 = data38x[23:0];
	wire [23:0] sub_wire40 = data37x[23:0];
	wire [23:0] sub_wire39 = data36x[23:0];
	wire [23:0] sub_wire38 = data35x[23:0];
	wire [23:0] sub_wire37 = data34x[23:0];
	wire [23:0] sub_wire36 = data33x[23:0];
	wire [23:0] sub_wire35 = data32x[23:0];
	wire [23:0] sub_wire34 = data31x[23:0];
	wire [23:0] sub_wire33 = data30x[23:0];
	wire [23:0] sub_wire32 = data29x[23:0];
	wire [23:0] sub_wire31 = data28x[23:0];
	wire [23:0] sub_wire30 = data27x[23:0];
	wire [23:0] sub_wire29 = data26x[23:0];
	wire [23:0] sub_wire28 = data25x[23:0];
	wire [23:0] sub_wire27 = data24x[23:0];
	wire [23:0] sub_wire26 = data23x[23:0];
	wire [23:0] sub_wire25 = data22x[23:0];
	wire [23:0] sub_wire24 = data21x[23:0];
	wire [23:0] sub_wire23 = data20x[23:0];
	wire [23:0] sub_wire22 = data19x[23:0];
	wire [23:0] sub_wire21 = data18x[23:0];
	wire [23:0] sub_wire20 = data17x[23:0];
	wire [23:0] sub_wire19 = data16x[23:0];
	wire [23:0] sub_wire18 = data15x[23:0];
	wire [23:0] sub_wire17 = data14x[23:0];
	wire [23:0] sub_wire16 = data13x[23:0];
	wire [23:0] sub_wire15 = data12x[23:0];
	wire [23:0] sub_wire14 = data11x[23:0];
	wire [23:0] sub_wire13 = data10x[23:0];
	wire [23:0] sub_wire12 = data9x[23:0];
	wire [23:0] sub_wire11 = data8x[23:0];
	wire [23:0] sub_wire10 = data7x[23:0];
	wire [23:0] sub_wire9 = data6x[23:0];
	wire [23:0] sub_wire8 = data5x[23:0];
	wire [23:0] sub_wire7 = data4x[23:0];
	wire [23:0] sub_wire6 = data3x[23:0];
	wire [23:0] sub_wire5 = data2x[23:0];
	wire [23:0] sub_wire4 = data1x[23:0];
	wire [23:0] sub_wire3 = data0x[23:0];
	wire [23:0] result = sub_wire0[23:0];
	wire [23:0] sub_wire1 = data94x[23:0];
	wire [2303:0] sub_wire2 = {sub_wire97, sub_wire1, sub_wire96, sub_wire95, sub_wire94, sub_wire93, sub_wire92, sub_wire91, sub_wire90, sub_wire89, sub_wire88, sub_wire87, sub_wire86, sub_wire85, sub_wire84, sub_wire83, sub_wire82, sub_wire81, sub_wire80, sub_wire79, sub_wire78, sub_wire77, sub_wire76, sub_wire75, sub_wire74, sub_wire73, sub_wire72, sub_wire71, sub_wire70, sub_wire69, sub_wire68, sub_wire67, sub_wire66, sub_wire65, sub_wire64, sub_wire63, sub_wire62, sub_wire61, sub_wire60, sub_wire59, sub_wire58, sub_wire57, sub_wire56, sub_wire55, sub_wire54, sub_wire53, sub_wire52, sub_wire51, sub_wire50, sub_wire49, sub_wire48, sub_wire47, sub_wire46, sub_wire45, sub_wire44, sub_wire43, sub_wire42, sub_wire41, sub_wire40, sub_wire39, sub_wire38, sub_wire37, sub_wire36, sub_wire35, sub_wire34, sub_wire33, sub_wire32, sub_wire31, sub_wire30, sub_wire29, sub_wire28, sub_wire27, sub_wire26, sub_wire25, sub_wire24, sub_wire23, sub_wire22, sub_wire21, sub_wire20, sub_wire19, sub_wire18, sub_wire17, sub_wire16, sub_wire15, sub_wire14, sub_wire13, sub_wire12, sub_wire11, sub_wire10, sub_wire9, sub_wire8, sub_wire7, sub_wire6, sub_wire5, sub_wire4, sub_wire3};

	lpm_mux	lpm_mux_component (
				.sel (sel),
				.data (sub_wire2),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.clock ()
				// synopsys translate_on
				);
	defparam
		lpm_mux_component.lpm_size = 96,
		lpm_mux_component.lpm_type = "LPM_MUX",
		lpm_mux_component.lpm_width = 24,
		lpm_mux_component.lpm_widths = 7;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: CONSTANT: LPM_SIZE NUMERIC "96"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "24"
// Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "7"
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
// Retrieval info: USED_PORT: data64x 0 0 24 0 INPUT NODEFVAL data64x[23..0]
// Retrieval info: USED_PORT: data65x 0 0 24 0 INPUT NODEFVAL data65x[23..0]
// Retrieval info: USED_PORT: data66x 0 0 24 0 INPUT NODEFVAL data66x[23..0]
// Retrieval info: USED_PORT: data67x 0 0 24 0 INPUT NODEFVAL data67x[23..0]
// Retrieval info: USED_PORT: data68x 0 0 24 0 INPUT NODEFVAL data68x[23..0]
// Retrieval info: USED_PORT: data69x 0 0 24 0 INPUT NODEFVAL data69x[23..0]
// Retrieval info: USED_PORT: data6x 0 0 24 0 INPUT NODEFVAL data6x[23..0]
// Retrieval info: USED_PORT: data70x 0 0 24 0 INPUT NODEFVAL data70x[23..0]
// Retrieval info: USED_PORT: data71x 0 0 24 0 INPUT NODEFVAL data71x[23..0]
// Retrieval info: USED_PORT: data72x 0 0 24 0 INPUT NODEFVAL data72x[23..0]
// Retrieval info: USED_PORT: data73x 0 0 24 0 INPUT NODEFVAL data73x[23..0]
// Retrieval info: USED_PORT: data74x 0 0 24 0 INPUT NODEFVAL data74x[23..0]
// Retrieval info: USED_PORT: data75x 0 0 24 0 INPUT NODEFVAL data75x[23..0]
// Retrieval info: USED_PORT: data76x 0 0 24 0 INPUT NODEFVAL data76x[23..0]
// Retrieval info: USED_PORT: data77x 0 0 24 0 INPUT NODEFVAL data77x[23..0]
// Retrieval info: USED_PORT: data78x 0 0 24 0 INPUT NODEFVAL data78x[23..0]
// Retrieval info: USED_PORT: data79x 0 0 24 0 INPUT NODEFVAL data79x[23..0]
// Retrieval info: USED_PORT: data7x 0 0 24 0 INPUT NODEFVAL data7x[23..0]
// Retrieval info: USED_PORT: data80x 0 0 24 0 INPUT NODEFVAL data80x[23..0]
// Retrieval info: USED_PORT: data81x 0 0 24 0 INPUT NODEFVAL data81x[23..0]
// Retrieval info: USED_PORT: data82x 0 0 24 0 INPUT NODEFVAL data82x[23..0]
// Retrieval info: USED_PORT: data83x 0 0 24 0 INPUT NODEFVAL data83x[23..0]
// Retrieval info: USED_PORT: data84x 0 0 24 0 INPUT NODEFVAL data84x[23..0]
// Retrieval info: USED_PORT: data85x 0 0 24 0 INPUT NODEFVAL data85x[23..0]
// Retrieval info: USED_PORT: data86x 0 0 24 0 INPUT NODEFVAL data86x[23..0]
// Retrieval info: USED_PORT: data87x 0 0 24 0 INPUT NODEFVAL data87x[23..0]
// Retrieval info: USED_PORT: data88x 0 0 24 0 INPUT NODEFVAL data88x[23..0]
// Retrieval info: USED_PORT: data89x 0 0 24 0 INPUT NODEFVAL data89x[23..0]
// Retrieval info: USED_PORT: data8x 0 0 24 0 INPUT NODEFVAL data8x[23..0]
// Retrieval info: USED_PORT: data90x 0 0 24 0 INPUT NODEFVAL data90x[23..0]
// Retrieval info: USED_PORT: data91x 0 0 24 0 INPUT NODEFVAL data91x[23..0]
// Retrieval info: USED_PORT: data92x 0 0 24 0 INPUT NODEFVAL data92x[23..0]
// Retrieval info: USED_PORT: data93x 0 0 24 0 INPUT NODEFVAL data93x[23..0]
// Retrieval info: USED_PORT: data94x 0 0 24 0 INPUT NODEFVAL data94x[23..0]
// Retrieval info: USED_PORT: data95x 0 0 24 0 INPUT NODEFVAL data95x[23..0]
// Retrieval info: USED_PORT: data9x 0 0 24 0 INPUT NODEFVAL data9x[23..0]
// Retrieval info: USED_PORT: result 0 0 24 0 OUTPUT NODEFVAL result[23..0]
// Retrieval info: USED_PORT: sel 0 0 7 0 INPUT NODEFVAL sel[6..0]
// Retrieval info: CONNECT: result 0 0 24 0 @result 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2280 data95x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2256 data94x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2232 data93x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2208 data92x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2184 data91x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2160 data90x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2136 data89x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2112 data88x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2088 data87x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2064 data86x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2040 data85x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 2016 data84x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1992 data83x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1968 data82x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1944 data81x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1920 data80x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1896 data79x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1872 data78x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1848 data77x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1824 data76x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1800 data75x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1776 data74x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1752 data73x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1728 data72x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1704 data71x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1680 data70x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1656 data69x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1632 data68x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1608 data67x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1584 data66x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1560 data65x 0 0 24 0
// Retrieval info: CONNECT: @data 0 0 24 1536 data64x 0 0 24 0
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
// Retrieval info: CONNECT: @sel 0 0 7 0 sel 0 0 7 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX_96X24.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX_96X24.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX_96X24.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX_96X24.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX_96X24_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL MUX_96X24_bb.v TRUE
// Retrieval info: LIB_FILE: lpm