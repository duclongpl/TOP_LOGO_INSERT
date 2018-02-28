module peak_detect(wclk,channel1,channel2,step,peak);
input wclk;
input	[23:0] channel1;
input	[23:0] channel2;
input	[23:0]	step;
output	[22:0] peak;

reg	[3:0]	state;
reg	[22:0]	peak;
reg	[23:0]	ntime;

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
	
	/*
	if(channel1[23]==1'b1)
		sample1[22:0] = 0;
	else
	    sample1[22:0] = channel1[22:0];
	
	if(channel2[23]==1'b1)
		sample2[22:0] =0;
	else
		sample2[22:0] = channel2[22:0];
		
	sum[23:0] = sample1[22:0] + sample2[22:0];
	ch12[22:0] = sum[23:1];*/
end

always @(posedge wclk)
begin

	case(state)
		4'd0:
			begin
				peak[22:0] <= ch12[22:0];
				state <= 4'd1;	
				ntime <= 0;
			end
		4'd1:
			begin
				ntime <= ntime +1; // increase counter timer
				if(ntime < step) begin // check if new samples are greater peak
					if(peak[22:0] < ch12[22:0]) begin
						peak[22:0] <= ch12[22:0];
						ntime <=0;
					end					
				end else begin
					ntime <= 0; // clear timer
					peak[22:0] <= ch12[22:0];					
				end				
			end
		default:
			state<=4'd0;
	endcase
			
end
endmodule