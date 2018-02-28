// Copyright (C) 1991-2009 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II"
// VERSION		"Version 9.1 Build 222 10/21/2009 SJ Full Version"
// CREATED		"Wed Oct 06 02:27:02 2010"

module anpha(
	dataa,
	datab,
	key,
	result
);


input	[7:0] dataa;
input	[7:0] datab;
input	[7:0] key;
output	[15:8] result;

wire	[7:0] key_out;
wire	[15:0] result_ALTERA_SYNTHESIZED;
wire	[15:0] resulta;
wire	[15:0] resultb;





lpm_mult0	b2v_inst(
	.dataa(dataa),
	.datab(key),
	.result(resulta));


lpm_add_sub0	b2v_inst1(
	.dataa(resulta),
	.datab(resultb),
	.result(result_ALTERA_SYNTHESIZED));


lpm_add_sub1	b2v_inst2(
	.datab(key),
	.result(key_out));


lpm_mult0	b2v_inst4(
	.dataa(datab),
	.datab(key_out),
	.result(resultb));

assign	result[15:8] = result_ALTERA_SYNTHESIZED[15:8];

endmodule
