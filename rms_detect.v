module rms_detect(wclk,channel1,channel2,sum_rms);
input wclk;
input	[23:0] channel1;
input	[23:0] channel2;

output	[47:0] sum_rms;


reg	[22:0]	sample1;
reg	[22:0]	sample2;
reg	[23:0] sum;
reg [22:0]	ch12;
always @(posedge wclk)
begin

	if(channel1[23]==1'b1)
		sample1[22:0] <= ~channel1[22:0];
	else
		sample1[22:0] <= channel1[22:0];
	if(channel2[23]==1'b1)
		sample2[22:0] <= ~channel2[22:0];
	else
		sample2[22:0]<= channel2[22:0];				
	sum[23:0]<= (sample1[22:0]+sample2[22:0]);		
	ch12[22:0] <=sum[23:1];
	
end

wire rdreq;
wire [11:0] use_dw;
wire [33:0] sum_old_dev4096;
reg [47:0] sum_rms;

assign rdreq = (use_dw>=4095) ? 1'b1 : 1'b0;

FIFO_RMS buff_delay(.clock (wclk),.data (sum_new_dev4096[33:0]),.rdreq (rdreq),.wrreq (1'b1),.q (sum_old_dev4096[33:0]),.usedw (use_dw));


reg [45:0] sum_new;
wire [33:0] sum_new_dev4096;

assign sum_new_dev4096[33:0] = sum_new[45:12];

always @(posedge wclk)
begin
	sum_new[45:0] = ch12[22:0]*ch12[22:0];
	sum_rms[47:0] = sum_rms[47:0] + sum_new_dev4096[33:0] - sum_old_dev4096[33:0];
	
end

endmodule