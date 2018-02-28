module new_rms(rst,clk,Channel1_In,Channel2_In,sum,old_data,state,rd_ptr);



input signed [23:0] Channel1_In,Channel2_In;

input clk;
input rst;

output [48:0] sum;


reg [48:0] sum;



reg [23:0] temp1;

reg [22:0] temp2;

wire [45:0] sum_new;

reg [22:0] temp_var;



(* ramstyle = "M9K" *) reg		[33:0]  buffer [4096:0];

output [12:0] rd_ptr;

reg	[12:0] rd_ptr;
reg [12:0] wr_ptr;


reg wr_req;
reg rd_req;

reg [2:0] state;
output [2:0] state;
reg	[33:0] old_data;
output	[33:0] old_data;
always @(posedge clk)
begin  
	buffer[wr_ptr]<=sum_new_reg;
end


always @(posedge clk)
begin
	

end
always @(negedge clk)
begin
	old_data <= buffer[rd_ptr];
end
//assign old_data = buffer[rd_ptr];
always @(posedge clk)
begin
	if(rst ==1'b1)
		state =3'd0;
	else
		begin
			case (state)
				3'd0:
					begin
						wr_ptr=0;
						rd_ptr=0;						
						state=3'd1;						
						sum[48:0]=0;
					end
				3'd1:
					begin
						sum[48:0] = sum[48:0]+ sum_new_reg[33:0];						
						if(wr_ptr<4096-1)							
							wr_ptr = wr_ptr+1;
						else
							begin
								wr_ptr=0;
								rd_ptr=0;
								state = 3'd2;
							end
					end
				3'd2:
					begin
						sum[48:0] = sum[48:0]+ sum_new_reg[33:0];			
						if(sum[48:0]>=old_data[33:0])
						 sum[48:0] = (sum[48:0]-old_data[33:0]);
						else
						 sum[48:0]=0;						 
						 						
						 
						if(wr_ptr<4096-1)
							wr_ptr=wr_ptr+1;
						else
							wr_ptr=0;
							
						rd_ptr =wr_ptr;
												
					end
			endcase				
		end
end


/*

always @(posedge clk)
begin
	if(rst ==1'b1)
		state = 3'd0;
	else
		begin
			case (state)
				3'd0:
					 begin
						wr_ptr=0;
						rd_ptr=0;
						sum[48:0]=0;
						state=3'd1;
					 end
				3'd1:
					begin
						buffer[wr_ptr][33:0]=sum_new_reg[33:0];
						sum[48:0] = sum[48:0] + sum_new_reg[33:0];
						if(wr_ptr<3)
							wr_ptr=wr_ptr+1;
						else
							begin
								wr_ptr=0;
								state=3'd2;
							end
					end
				3'd2:
					begin
						if(wr_ptr==3-1)
							rd_ptr=0;
						else
							rd_ptr = wr_ptr+1;
						
						sum[48:0] = sum[48:0]+sum_new_reg[33:0];
						if(sum[48:0]>buffer[rd_ptr][33:0])
						 sum[48:0] = sum[48:0] - buffer[rd_ptr][33:0];						
						buffer[wr_ptr][33:0]= sum_new_reg[33:0];											
						if(wr_ptr<3)
							wr_ptr=wr_ptr+1;
						else
							wr_ptr=0;
						
					end
			endcase
		end
				
end		*/
	



reg signed [24:0] sum_ch;


wire [23:0] hien1;
wire [45:0] hien2;
assign hien1[23:0] = (sum_ch[24]==1'b0) ? sum_ch[23:0] : ~sum_ch[23:0];
assign hien2 = (hien1[23:1]*hien1[23:1]);
assign sum_new[33:0] = hien2[45:12];

reg	[35:0] sum_new_reg;

always @(posedge clk)
begin
	sum_new_reg[33:0] <= sum_new[33:0];
end

always @(posedge clk)
begin	
	sum_ch <= (Channel1_In + Channel2_In);							
end



endmodule