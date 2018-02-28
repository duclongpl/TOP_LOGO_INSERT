module Audio_Out(wclk,aclk,aout,counter,ChannelA,ChannelB);

input wclk;
input aclk;
output [4:0] counter;
output aout;

input [23:0] ChannelA;
input [23:0] ChannelB;

reg [4:0] counter;
reg last_word;

wire b_Aout;
wire b_Bout;

reg b_Aout_buff;
reg b_Bout_buff;
always @(posedge aclk)
begin
	if(last_word!=wclk)
		counter<=0;
	else
		counter<=counter+1;
	last_word<=wclk;
end

assign b_Aout=((counter>=0) && (counter<=23)) ? ChannelA[23-counter] : 1'b0;
assign b_Bout=((counter>=0) && (counter<=23)) ? ChannelB[23-counter] : 1'b0;

always @(negedge aclk)
begin
	b_Aout_buff<=b_Aout;
	b_Bout_buff<=b_Bout;
end

assign aout= (wclk==1'b0) ? b_Aout_buff : b_Bout_buff;



endmodule