module Audio_Mixer(clk,Channel1_In,Channel2_In,Channel3_In,Channel1_Out,Channel2_Out,volume1,volume2,volume3,volume_master,pan);

input [23:0] Channel1_In,Channel2_In,Channel3_In;
input [24:0] volume1,volume2,volume3,volume_master;
input [15:0] pan;
input clk;

output [23:0] Channel1_Out,Channel2_Out;

wire [23:0] Channel2_Out;

wire [23:0] Channel1_Out;


function [23:0] devide_2();
	input [23:0] myinput;
	begin
		if(myinput[23]==0)
			begin
				devide_2[23]=myinput[23];
				devide_2[22:0]=myinput[22:0]/2;
			end
		else
			begin
				devide_2[23]=myinput[23];
				devide_2[22:0]=~myinput[22:0];
				devide_2[22:0]=devide_2[22:0]/2;
				devide_2[22:0]=~devide_2[22:0];
			end
		
	end
endfunction

function [23:0] mix();
input [23:0] inputa;
input [23:0] inputb;
	begin
		 
		 if(inputa[23]==0)		   		   
			begin
				if(inputb[23]==0)
					begin
						mix=inputa[22:0]+inputb[22:0];
						if(mix[23]==1)
						 begin
						   mix[23]=0;
						   mix[22:0]=23'h7fffff;						   
						 end												 														
					end
				else
					begin
						if(inputa[22:0]>=(~inputb[22:0]))
							begin								
								mix[22:0]=(inputa[22:0]-(~inputb[22:0]));																								
								mix[23]=0;
							end		
						else
							begin
								mix[22:0]=((~inputb[22:0])-inputa[22:0]);							
								mix[22:0]=~mix[22:0];
								mix[23]=1;								
							end
					end
			end
		else  // inputa[19]==1
			begin
				if(inputb[23]==0)
					begin
						if((~inputa[22:0])>=inputb[22:0])
							begin
								mix[22:0]=((~inputa[22:0])-inputb[22:0]);
								mix[22:0]=~mix[22:0];
								mix[23]=1;
							end		
						else
							begin
								mix[22:0]=(inputb[22:0]-(~inputa[22:0]));								
								mix[23]=0;								
							end						
					end
				else
					begin
						mix=(~inputa[22:0])+(~inputb[22:0]);
						if(mix[23]==1)
						 begin
							mix[22:0]=23'h7fffff;
							mix[23]=0;
					     end						
						mix[22:0]=~mix[22:0];
						mix[23]=1;												
					end
			end
	end
endfunction

wire [23:0] buff_channel1;

gain gain_in_vol1(.clk (clk),.input1 (Channel1_In),.output1 (buff_channel1),.gain (volume1[19:0]));
wire [23:0] buff_channel2;
gain gain_in_vol2(.clk (clk),.input1 (Channel2_In),.output1 (buff_channel2),.gain (volume2[19:0]));
wire [23:0] buff_channel3;
gain gain_in_vol3(.clk (clk),.input1 (Channel3_In),.output1 (buff_channel3),.gain (volume3[19:0]));

reg [23:0] channel1_sample;
reg [42:0] temp_reg1;
always @(posedge clk)
begin
	channel1_sample=0;	
	case(pan[1:0])
		2'b10:
			channel1_sample=buff_channel1;			
		2'b11:
			channel1_sample=devide_2(buff_channel1);
	endcase
	
	case(pan[3:2])
		2'b10:
			channel1_sample=mix(channel1_sample,buff_channel2);			
		2'b11:
			channel1_sample=mix(channel1_sample,devide_2(buff_channel2));
	endcase	
	
	case(pan[5:4])
		2'b10:
			channel1_sample=mix(channel1_sample,buff_channel3);			
		2'b11:
			channel1_sample=mix(channel1_sample,devide_2(buff_channel3));
	endcase			
	
end

gain gain_in_masterch1(.clk (clk),.input1 (channel1_sample),.output1 (Channel1_Out),.gain (volume_master[19:0]));

reg [23:0] channel2_sample;
reg [42:0] temp_reg2;
always @(posedge clk)
begin
	channel2_sample=0;	
	case(pan[1:0])
		2'b01:
			channel2_sample=buff_channel1;			
		2'b11:
			channel2_sample=devide_2(buff_channel1);
	endcase
	
	case(pan[3:2])
		2'b01:
			channel2_sample=mix(channel2_sample,buff_channel2);			
		2'b11:
			channel2_sample=mix(channel2_sample,devide_2(buff_channel2));
	endcase	
	
	case(pan[5:4])
		2'b01:
			channel2_sample=mix(channel2_sample,buff_channel3);			
		2'b11:
			channel2_sample=mix(channel2_sample,devide_2(buff_channel3));
	endcase					
end
gain gain_in_masterch2(.clk (clk),.input1 (channel2_sample),.output1 (Channel2_Out),.gain (volume_master[19:0]));
endmodule