module RMS(rst,clk,Channel1_In,Channel2_In,sum,sum_max,sum_min,usedw);



input signed [23:0] Channel1_In,Channel2_In;

input clk;
input rst;

output [48:0] sum;


reg [48:0] sum;

output [48:0] sum_max;
output [48:0] sum_min;

reg [48:0] sum_max;
reg [48:0] sum_min;


reg [23:0] temp1;

reg [22:0] temp2;

wire [45:0] sum_new;

reg [22:0] temp_var;

reg [11:0] no_sample;



//reg		[45:0]  buffer [4095:0];


wire [12:0] size_buff;


//assign size_buff=4096;
assign size_buff=8192;


//wire [47:0] data_in;
output [12:0] usedw;
wire [12:0] usedw;
reg wr_req;
reg rd_req;
//assign data_in[23:0]=Channel1_In[23:0];
//assign data_in[47:24]=0;
///FIFO_BUFF FIFO_BUFFInst(.clock (clk),.data (sum_new[35:0]),.rdreq (fifo_read),.wrreq (1'b1),.q (sum_old[35:0]),.usedw (usedw));

FIFO_BUFF FIFO_BUFFInst(.clock (clk),.data (sum_new_reg[33:0]),.rdreq (rd_req),.wrreq (wr_req),.q (sum_old[33:0]),.usedw (usedw));


reg [2:0] state;

reg [12:0]	no_read;
always @(posedge clk)
begin
	if(rst ==1'b1)
		state = 3'd0;
	else
		begin
	case (state)
		3'd0:
			begin
				if(usedw>0)
					begin
						wr_req=1'b0;
						rd_req=1'b1;
					end
				else
					begin
						wr_req=1'b1;
						rd_req=1'b0;
						sum[48:0]=0;
						state = 3'd1;
						no_read =0;						
					end
			end
		3'd1:
			begin				
				if(usedw>=(4096-2))
				   rd_req = 1'b1;
				if(no_read>=4096)
					begin						
						//sum[48:0] = (sum[48:0] - sum_old[33:0]); //tuong duong 4096						
						sum[48:0] = (sum[48:0]+ sum_new_reg[33:0]);						
						if(sum[48:0] > sum_old[33:0])
							sum[48:0] = (sum[48:0] - sum_old[33:0]); //tuong duong 4096						 
						else
							sum[48:0] = 0;
					end
				else
					begin						
						sum[48:0] = (sum[48:0]+sum_new_reg[33:0]);
						no_read = no_read+1;
					end
			end
		default:
			state = 3'd0;			
	endcase
		end
end

/*
always @(negedge clk)
begin
	case (state)
		3'd0:
			begin
				if(usedw>0)
					begin
						wr_req=1'b0;
						rd_req=1'b1;
					end
				else
					begin
						wr_req=1'b1;
						rd_req=1'b0;
						sum[48:0]=0;
						state = 3'b1;						
					end
			end
		3'd1:
			begin
				if(usedw>=4096)
					begin
						rd_req = 1'b1;
						//sum[48:0] = (sum[48:0] - sum_old[33:0]); //tuong duong 4096
						sum[48:0]= (sum[48:0]+ sum_new[33:0]);						
						if(sum[48:0] >=  sum_old[33:0])
							sum[48:0] = (sum[48:0] - sum_old[33:0]); //tuong duong 4096
						else
						    sum[48:0] =0;
					end
				else
					begin
						sum[48:0] = (sum[48:0]+sum_new[33:0]);
					end
			end
		default:
			state = 3'd0;			
	endcase
end
*/

wire [45:0] sum_old;

always @(posedge clk)
begin
	if(no_sample!=size_buff)
		no_sample<=no_sample+1;
	else
		no_sample<=0;
end
wire fifo_read;
assign fifo_read = usedw[12];//(usedw[12:0]>=4096) ? 1'b1 : 1'b0;



reg [12:0] number_zero;


always @(posedge clk)
begin
	if(sum_new==0)
		if(number_zero<4096)
			number_zero = number_zero+1;
	else
		number_zero=0;
end

/*
always @(negedge clk)
begin

	if(number_zero==4096)
		sum[48:0]=0;
	if(usedw[12:0]>=4096)	
		begin
			sum[48:0] = (sum[48:0] - sum_old[33:0]); //tuong duong 4096
			sum[48:0]= (sum[48:0]+ sum_new[33:0]);
		end
	else
	 sum[48:0] = (sum[48:0]+sum_new[33:0]);

end
*/


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


/*
always @(posedge clk)
begin

	temp1=0;
	temp2=0;
	if(Channel1_In[23]==1'b1)
		temp1[22:0]=~Channel1_In[22:0];
	else
		temp1[22:0]=Channel1_In[22:0];

	if(Channel2_In[23]==1'b1)
		temp2[22:0]=~Channel2_In[22:0];
	else
		temp2[22:0]=Channel2_In[22:0];	
	

			
	temp_var[22:0]=temp1[22:1]+temp2[22:1];	
	sum_new[45:0] = temp_var[22:0] * temp_var[22:0];		
	sum_new[33:0]=sum_new[45:12]; // tuong duong chia 4096 	
	
	
	
	temp1=0;
	temp2=0;
	if(Channel1_In[23]==1'b1)
		temp1[22:0]=~Channel1_In[22:0];
	else
		temp1[22:0]=Channel1_In[22:0];
	
	
		
	sum_new[45:0] = temp1[22:0] * temp1[22:0];		
	sum_new[33:0]=sum_new[45:12]; // tuong duong chia 4096 	

	
				
end
*/


endmodule