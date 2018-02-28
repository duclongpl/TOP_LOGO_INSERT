module Key_Math(
		clk,
		data_in_a,
		data_in_b,
		key_in,
		data_out);

input	clk;
input	[9:0]	data_in_a;
input	[9:0]	data_in_b;

input	[9:0]	key_in;

output	[9:0]	data_out;

reg		[9:0]	buff_data_in_a;
reg		[9:0]	buff_data_in_b;
reg		[9:0]	buff_key_in;

reg		[9:0]	data_out;

always @(posedge clk)
begin
	buff_data_in_a<=data_in_a;
	buff_data_in_b<=data_in_b;	
	buff_key_in<=key_in;
	data_out[9:0]<=result[19:10];
end

wire [19:0] temp_in_a;
wire [9:0] key_temp;
wire [19:0] temp_in_b;
wire [19:0] result;
assign temp_in_a[19:0] = buff_data_in_a[9:0] * buff_key_in[9:0];
assign key_temp[9:0] = 1023- buff_key_in;
assign temp_in_b[19:0] = buff_data_in_b[9:0] * key_temp[9:0];
assign result[19:0] = temp_in_a+temp_in_b;



endmodule		
		