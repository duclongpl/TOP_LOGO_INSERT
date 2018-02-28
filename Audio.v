module Audio(wclk,aclk,ain,aout,counter,ChannelA,ChannelB);

input wclk;
input aclk;
input ain;
output [4:0] counter;
output aout;

output [23:0] ChannelA;
output [23:0] ChannelB;

reg [23:0] ChannelA;
reg [23:0] ChannelB;

reg [23:0] buff_A;
reg [23:0] buff_B;


reg [4:0] counter;
reg last_word;
always @(posedge aclk)
begin
	if(last_word!=wclk)
		counter<=0;
	else
		counter<=counter+1;
	last_word<=wclk;
end
//
always @(posedge aclk)
begin
	if((wclk==1'b1) && (counter==30))
		begin
			ChannelA[23:0]<=buff_A[23:0];
			ChannelB[23:0]<=buff_B[23:0];			
		end
		
end

always @(posedge aclk)
begin
	if((counter>=0) && (counter<=23) && (wclk==1'b0))
		buff_A[23-counter]<=ain;
end
always @(posedge aclk)
begin
	if((counter>=0) && (counter<=23) && (wclk==1'b1))
		buff_B[23-counter]<=ain;
end
endmodule