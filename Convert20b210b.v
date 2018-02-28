/*--------------------------------------------------------------------------------------
-- Company: HDVIETNAM
-- Engineer: Vo Duy Hien

-- Create Date: 13/5/2011
-- Purpose: Convert 10 bit video data to 20 bit video data
-------------------------------------------------------------------------------------*/
module Convert20b210b(
		clk,	// clock for 10 bit data in
		data_in,	// 10 bit data video in
		hsync,		// hsync for 10 bit video data in
		vsync,
		fsync,
		clk_out,	// clock for 20 bit data in
		data_out,	// 20 bit data video out		
		hsync_out,  // hsync out for 20 bit video
		vsync_out,
		fsync_out,
		selection,		
		);

input clk;
input [9:0] data_in;
input hsync;
input vsync;
input fsync;
output clk_out;
output [19:0] data_out;
output hsync_out;
output vsync_out;
output fsync_out;

output selection;
reg hsync_out;

reg selection;
reg old_hsync;
//reg [19:0] data_out;
reg [19:10] buff_video;
//reg clk_out;
reg clock_div_2;
assign clk_out=!selection;

reg	vsync_out;
reg	fsync_out;
always @(posedge clk) begin
	clock_div_2<=!clock_div_2;
	end

always @(posedge clk) begin
		
		if((hsync==1'b0) && (old_hsync==1'b1)) begin		
				if(selection==1)
					selection<=0;				
			end else begin
					selection<=!selection;
				end			
		old_hsync<=hsync;
	
	end
assign data_out[19:10]=buff_second[9:0];	
assign data_out[9:0]=buff_second[19:10];	


always @(posedge selection) begin			
		hsync_out<=hsync;	
		vsync_out<=vsync;
		fsync_out<=fsync;		
	end
reg [19:0] buff_second;
always @(posedge clk) begin
		if(selection==0)
			begin
				buff_second[19:10]<=buff_video[19:10];
				buff_second[9:0]<=data_in[9:0];
			end
	end
always @(posedge clk) begin
		if(selection==1)
			buff_video[19:10]<=data_in[9:0];		
	end
endmodule		
		