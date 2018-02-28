module gain(clk,input1,output1,gain);
input		clk;
input	[23:0]		input1;
input	[19:0]		gain;

output	[23:0]		output1;

reg		[42:0]		temp_reg;

reg		[24:0]		val_out;


//wire	[19:0]	smart_gain;

//assign smart_gain = gain;

reg		[19:0]		smart_gain;

always @(negedge clk)
begin
	if(smart_gain[19:0]>gain[19:0])
		begin
			if((smart_gain[19:0]-gain[19:0])>=10)
				smart_gain[19:0] = smart_gain[19:0] - 10;
			else
				smart_gain[19:0] = gain[19:0];			
		end
	if(smart_gain[19:0] < gain[19:0])
		begin
			if((gain[19:0] - smart_gain[19:0]) >=10)
				smart_gain[19:0] = smart_gain[19:0] +10;
			else
				smart_gain[19:0] = gain[19:0];
		end
	
end

/*
always @(posedge clk)
begin

	if(input1[23]==1'b1)
		temp_reg[22:0]=(~input1[22:0]+1);
	else
		temp_reg[22:0]=input1[22:0];
	temp_reg[42:23]=0;
	temp_reg[42:0]=temp_reg[22:0]*smart_gain[19:0];	
	
	val_out[23]=input1[23];
	
	if(input1[23]==1'b1)
		begin
			//if(temp_reg[42:36]==0) begin
//			if(temp_reg[42:13]<23'h7fffff) begin
if((temp_reg[42:13]<23'h7fffff) && (temp_reg[22:0]!=0)) begin
				if(temp_reg[35:13]>0)
					val_out[22:0] = ~(temp_reg[35:13]-1);
				else
					val_out[22:0] = 23'h7fffff;//~(temp_reg[35:13]);
				end
			else			
				val_out[22:0] = 23'b00000000000000000000000;
		end
	else
		begin
			//if(temp_reg[42:36]==0)
			if(temp_reg[42:13]<23'h7fffff)
				val_out[22:0] = temp_reg[35:13];		
			else
				val_out[22:0]=23'b11111111111111111111111;
		end

end
assign output1 = val_out;
*/

always @(posedge clk)
begin

	if(input1[23]==1'b1) begin		
		if(input1[22:0]!=0)
			temp_reg[23:0]=(~input1[22:0]+1);	
		else
			temp_reg[23:0]= 24'hffffff;
	end
	else
		temp_reg[23:0]=input1[23:0];		
	temp_reg[42:23]=0;
	temp_reg[42:0]=temp_reg[22:0]*smart_gain[19:0];	
	
	val_out[24:23]=1'b0;
	
	if(input1[23]==1'b1)
		begin		
			if((temp_reg[42:13]>23'h7fffff))
				val_out[22:0]=23'h7fffff;
			else
				val_out[22:0]=temp_reg[35:13];

			val_out[23:0]=~(val_out[23:0]);
			val_out[24:0]=val_out[24:0]+1;
		end
	else
		begin			
			if(temp_reg[42:13]<23'h7fffff)
				val_out[22:0] = temp_reg[35:13];		
			else
				val_out[22:0]=23'b11111111111111111111111;
		end

end
assign output1 = val_out[23:0];

endmodule