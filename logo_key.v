module logo_key(				
				// video receiver 
				Rx_Data, // 20 bits data from GS2971
				Pclk_Rx, // pixel clock from GS2971
				Rx_HVF, // F:V:H digital timing signals from GS2971, Rx_HVF[0]= hsync, Rx_HVF[1]=vsync, Rx_HVF[2]=Fsync
				Rx_Audio, // Audio signals from GS2971
				GS_2971_CONTROL, // control pin for GS2971
				// bit 0 = TIM_861
				// bit 1 = SMPTE_BYPASS
				// bit 2 = IOPROC_EN/DIS
				// bit 3 = FW_EN
				//------------------------------------------------------------
				// video transmiter
				// GS2972 pins, SDI transmiter
				Tx_Data,
				Pclk_Tx,  
				Tx_HVF,
				Tx_Audio,
				GS_2972_CONTROL,	
				active_video,
				test_signal,
				// control memory interface
				                            // cpu interface
                DATA,
                ADR,                            
                NCS0,                            
                NWR0,                            				
                NRD,
				//---------------------------------------------------------------
				// DDR2 interface
				// inputs:				
				clk,
				local_rdata,
				local_rdata_valid,
				local_ready,
				local_wdata_req,
				reset_n,

				// outputs:
				local_bank_addr,
				local_be,
				local_col_addr,
				local_cs_addr,
				local_read_req,
				local_row_addr,
				local_size,
				local_wdata,
				local_write_req,
				//input
				test_input,
				rms_usedw
				);
				
input		[19:0]	Rx_Data;
input		Pclk_Rx;
input		[2:0]	Rx_HVF;
input		[6:0]	Rx_Audio;
output		[4:0]	GS_2971_CONTROL;

output 	test_signal;
output	[19:0]	Tx_Data;
output	Pclk_Tx;
output	[2:0]	Tx_HVF;
output	[9:0]	Tx_Audio;
output	[8:0]	GS_2972_CONTROL;

output 		active_video;

  inout		[15:0]  DATA;
  input		[24:0] 	ADR;
  
  input			NCS0;  
  input			NWR0;    
input			NRD;				
				
  output  [  1: 0] local_bank_addr;
  output  [ 15: 0] local_be;
  output  [  8: 0] local_col_addr;
  output           local_cs_addr;
  output           local_read_req;
  output  [ 12: 0] local_row_addr;
  output           local_size;
  output  [127: 0] local_wdata;
  output           local_write_req;


  input            clk;
  input   [127: 0] local_rdata;
  input            local_rdata_valid;
  input            local_ready;
  input            local_wdata_req;
  input            reset_n;		
  input 			test_input;	
				
				
  wire    [  1: 0] MAX_BANK;
  wire             MAX_CHIPSEL;
  wire    [  8: 0] MAX_COL;
  wire    [ 12: 0] MAX_ROW;
  wire    [ 12: 0] MAX_ROW_PIN;
  wire             MIN_CHIPSEL;
  wire    [  2: 0] addr_value;
  
  wire    [  8: 0] max_col_value;				

  reg     [  1: 0] bank_addr;  
  reg     [  8: 0] col_addr;  
  reg              cs_addr; 
  reg     [ 12: 0] row_addr;
  
// dia chi ghi tu ARM   
reg              EMI_cs_addr;
reg     [  8: 0] EMI_col_addr;
reg     [  1: 0] EMI_bank_addr;
reg     [ 12: 0] EMI_row_addr;  
  
  
// cac thanh ghi cho core FPGA
reg [15:0] mode_reg;
reg [15:0] page_reg;

reg [15:0] buff_startx_reg;
reg	[15:0] buff_starty_reg;
reg [15:0] buff_width_reg;
reg [15:0] buff_height_reg;
reg [15:0] startx_reg;
reg [15:0] starty_reg;
reg [15:0] width_reg;
reg [15:0] height_reg;
reg [15:0] anpha_reg;

reg [15:0] format_reg;
  
wire [24:0]	Volume_C1;
wire [24:0] Volume_C2;
wire [24:0] Volume_C3;
wire [24:0] Volume_Master;

reg [15:0]	low_volume_c1;
reg [15:0]	high_volume_c1;
reg [15:0]  low_volume_c2;
reg [15:0]	high_volume_c2;
reg [15:0]  low_volume_c3;
reg [15:0]  high_volume_c3;
reg [15:0]  low_volume_master;
reg [15:0]  high_volume_master;
reg [15:0]	pan_reg;  
  
reg last_rdata_valid;

reg last_wdata_req;
reg		[127:0]	 last_buffer;  
  reg 	read_req;
  reg   write_req;
  //Change COUNTER_VALUE to control the period of power down and self refresh mode
  assign COUNTER_VALUE = 150;

  //Change MAX_ROW to test more or lesser row address in test_seq_addr_mode, maximum value is 2^(row bits) -1, while minimum value is 0
  assign MAX_ROW = 8191;

  //Change MAX_COL to test more or lesser column address in test_seq_addr_mode, maximum value is 2^(column bits) - (LOCAL_BURST_LEN_s * dwidth_ratio (aka half-rate (4) or full-rate (2))), while minimum value is 0 for Half rate and (LOCAL_BURST_LEN_s * dwidth_ratio) for Full rate
  assign MAX_COL = 508;

  //Decrease MAX_BANK to test lesser bank address, minimum value is 0
  assign MAX_BANK = 3;

  //Decrease MAX_CHIPSEL to test lesser memory chip, minimum value is MIN_CHIPSEL
  assign MAX_CHIPSEL = 0;

  //

  assign MIN_CHIPSEL = 0;
  assign MAX_ROW_PIN = {13{1'b1}};
  assign max_col_value =MAX_COL;
  assign addr_value = 4;

/*
assign local_bank_addr=(set_read_address==1) ? bank_addr : wr_bank_addr;
assign local_col_addr=(set_read_address==1) ? col_addr : wr_col_addr;
assign local_cs_addr=(set_read_address==1) ? cs_addr : wr_cs_addr;
assign local_row_addr=(set_read_address==1) ? row_addr : wr_row_addr;
*/
assign local_bank_addr=(set_read_address==1) ? bank_addr : ((IS_EMI==0)? wr_bank_addr: EMI_bank_addr);
assign local_col_addr=(set_read_address==1) ? col_addr :((IS_EMI==0) ? wr_col_addr:EMI_col_addr);
assign local_cs_addr=(set_read_address==1) ? cs_addr : ((IS_EMI==0) ? wr_cs_addr:EMI_cs_addr);
//assign local_row_addr=(set_read_address==1) ? row_addr : ((IS_EMI==0) ? wr_row_addr:EMI_row_addr);

assign local_row_addr[11:0]=(set_read_address==1) ? row_addr[11:0] : ((IS_EMI==0) ? wr_row_addr[11:0]:EMI_row_addr[11:0]);
//assign local_row_addr[12]=(set_read_address==1) ? page_reg[0] : (!page_reg[0]);
assign local_row_addr[12]=(set_read_address==1) ? sync_page_reg : (!page_reg[0]);

reg sync_page_reg;

assign local_size=1'b1;
assign local_be={16{1'b1}};

reg [7:0]	addr_read;	// read counter from buffer
reg [7:0]	addr_write; // write counter to buffer;
reg			reset_address;  
  
reg send_cmd; // doc bat dau tu 0 hay tiep tuc doc
// bit nay neu bang 1 thi se xoa dia chi doc ddr2 ve 0 truoc khi doc
// bit nay neu bang 0 thi tiep tuc doc du lieu tu ddr2 vao bo dem
reg send_req_cmd; // bit nay de bao cho bo nhan biet ben video can them du lieu
// 
reg msg_rd_req; // 
reg     [  4: 0] state; // state for read data from DDR2
reg [3:0] read_counter; // count the number of read event from DDR2
//(* ramstyle = "M9K" *) reg		[127:0]  buffer [11:0];
(* ramstyle = "M9K" *) reg		[127:0]  buffer [17:0];
wire sync_send_cmd;
wire rd_empty;

assign local_write_req=write_req;
assign local_read_req = read_req;

reg [4:0] wr_state;

reg              wr_cs_addr;
reg     [  8: 0] wr_col_addr;
reg     [  1: 0] wr_bank_addr;
reg     [ 12: 0] wr_row_addr;
reg set_read_address; 
reg	reset_address_write;
reg [127:0]	local_wdata;
assign Volume_C1[15:0]=low_volume_c1[15:0];
assign Volume_C1[24:16]=high_volume_c1[8:0];

assign Volume_C2[15:0]=low_volume_c2[15:0];
assign Volume_C2[24:16]=high_volume_c2[8:0];

assign Volume_C3[15:0]=low_volume_c3[15:0];
assign Volume_C3[24:16]=high_volume_c3[8:0];

assign Volume_Master[15:0] = low_volume_master[15:0];
assign Volume_Master[24:16] = high_volume_master[8:0];

reg	[31:0]	step;




wire		[15:0]  status [63:0];

//assign status[21] = ch1_peak[15:0];
//assign status[22][6:0] = ch1_peak[22:16];

assign status[21] = sum_rms[15:0];
assign status[22] = sum_rms[31:16];
assign status[23] = sum_rms[47:32];



assign status[25] = ch1_peak[15:0];
assign status[26][6:0] = ch1_peak[22:16];


//assign status[25] = ch12out_peak[15:0];
//assign status[26][6:0] = ch12out_peak[22:16];
	
assign status[28]	= ch12_in_com_peak[15:0];
assign status[29][6:0] = ch12_in_com_peak[22:16];	
	
assign DATA = ((NRD==1'b0) && (NCS0 == 1'b0) && (ADR[24]==1'b1)) ? status[ADR[6:1]] : 16'hz;


reg	[31:0]	ch12_gain_front;	// gain before input to leveler
reg	[31:0]	comp_gain_front; // gain before input to compressor

reg	[31:0]	ch12_gain;	
reg	[31:0]	com_ch12_gain;
reg	[15:0]	com_ctrl;
reg	[15:0]	leveler_ctrl;
reg [15:0]  agc_ctrl;
always @(posedge NWR0)
	begin
		if((NWR0==1'b1) && (NCS0==1'b0) && (ADR[24]==1'b1))
			begin
				case(ADR[6:1])
					6'b0000000:
						mode_reg<=DATA;
					6'b0000001:
						page_reg<=DATA;
					6'b000010:				
						buff_startx_reg<=DATA;
					6'b000011:
						buff_starty_reg<=DATA;
					6'b000100:
						buff_width_reg<=DATA;
					6'b000101:
						buff_height_reg<=DATA;
					6'b000110:
						anpha_reg<=DATA;
					6'b000111: // 7
						low_volume_c1<=DATA;						
					6'b001000: // 8
						high_volume_c1<=DATA;
					6'b001001: //9
						low_volume_c2<=DATA;						
					6'b001010: // 10
						high_volume_c2<=DATA;						
					6'b001011: //11
						low_volume_c3<=DATA;						
					6'b001100: // 12
						high_volume_c3<=DATA;												
					6'b001101: // 13
						low_volume_master<=DATA;
					6'b001110: // 14
						high_volume_master<=DATA;
					6'd15: // 15
						pan_reg<=DATA;																		
					6'd18: // dia chi thu 18
						format_reg<=DATA; // video format, use low 2 bit											
					6'd19: // 
						step[15:0]<=DATA; // video format, use low 2 bit											
					6'd20: // 
						step[31:16]<=DATA; //
					6'd23:
						ch12_gain[15:0] <= DATA;
					6'd24:
						ch12_gain[31:16] <= DATA;
					6'd25:
						ch12_gain_front[15:0] <=DATA;
					6'd26:
						ch12_gain_front[31:16] <=DATA;
					6'd27:
						leveler_ctrl[15:0] <= DATA; // chua thong tin bypass
					6'd28:
						comp_gain_front[15:0] <=DATA;
					6'd29:
						comp_gain_front[31:16] <=DATA;
					6'd30:
						com_ch12_gain[15:0] <= DATA;
					6'd31:
						com_ch12_gain[31:16] <=DATA;
					6'd32:
						com_ctrl[15:0] <= DATA;											
					6'd33:
						agc_ctrl[15:0] <= DATA;
					
				endcase					
			end
	end	

	
/*****************************************
Xu ly viec ghi du lieu VAO DDR2 tu ARM
**************************************/
reg EMI_rd;
reg EMI_write_reg;
reg EMI_wr;
reg latch_EMI_write_reg;
reg latch_EMI_wr;
reg		IS_EMI;

reg [127:0]		write_buffer[0:1];
reg write_reg;
//reg [22:0]		write_address[0:1];
reg [23:0]		write_address[0:1];

always @(negedge clk)
	begin
		latch_EMI_wr=EMI_wr;
		latch_EMI_write_reg=write_reg;
	end

always @(posedge NWR0)
	begin
		if((NWR0==1) && (NCS0==1'b0) && (ADR[24]==1'b0))		
		begin			
			write_buffer[write_reg][(ADR[3:1]*16)+:16]=DATA[15:0]; // ghi 16 bit vao bo dem
			if(ADR[3:1]==3'd7)
				begin
					write_address[write_reg][23:0]=ADR[23:0];					
					//write_address[write_reg][22:19]=4'b0000;
					write_reg=!write_reg;
					EMI_write_reg=write_reg;
					// send lenh ghi
					EMI_wr=!EMI_wr;
				end
		end
	end


/*****************************************
ghi thu du lieu vao DDR2
**************************************/
always @(posedge clk or negedge reset_n)
begin
	if(reset_n==0)
		begin			
			wr_state=5'd0;			
			reset_address_write=1'b1; 
			write_req=1'b0;    
			wr_cs_addr = 0;
		    wr_bank_addr = 0;
		    wr_row_addr = 0;
		    wr_col_addr = 0;      		    		    
            EMI_rd=latch_EMI_wr;         		    
		        
		end
	else
		begin
			case (wr_state)
				5'd0:
					begin		
						// dieu kien de nhay sang buoc thuc hien bat dau ghi						
						if(EMI_rd!=latch_EMI_wr)
							begin
								EMI_rd=latch_EMI_wr;
								IS_EMI=1'b1;
								local_wdata=write_buffer[!latch_EMI_write_reg];
												
								EMI_col_addr[1:0]=0;
								EMI_col_addr[8:2]=write_address[!latch_EMI_write_reg][10:4];
								EMI_row_addr[12:0]=write_address[!latch_EMI_write_reg][23:11];
								
								EMI_cs_addr=0;
								//EMI_row_addr[12]=0;
								EMI_bank_addr=0;								
								wr_state=5'd10;																							
							end												
						// dieu kien de nhay sang buoc thuc hien bat dau ghi															
						/*if(test_input==0)
							begin
								wr_state=5'd1;
								reset_address_write=1'b1;
								wr_cs_addr = 0;
								wr_bank_addr = 0;
								wr_row_addr = 0;
								wr_col_addr = 0;
								IS_EMI=1'b0;
							end		*/										
					end
				5'd10:
					begin
							if((state!=5'd1) && (state!=5'd2) && (read_req==1'b0) && (local_ready==1'b1)) // neu ko phai process read da duoc thuc thi thi chuan bi nem dia chi
								begin
									wr_state=5'd12;
									write_req=1'b1;								
								end						
					end
				5'd11:
					begin
						wr_state=5'd12;
					end
				5'd12:
					begin
						write_req=1'b0;
						if(last_wdata_req==1'b1)
							wr_state=5'd0;
					end
				5'd1:
					begin
						reset_address_write=1'b0;
						if((state!=5'd1) && (state!=5'd2) && (read_req==1'b0) && (local_ready==1'b1)) // neu ko phai process read da duoc thuc thi thi chuan bi nem dia chi
							begin
							wr_state=5'd3;
							write_req=1'b1;
							if((wr_col_addr==4) && (wr_row_addr==0) &&(wr_bank_addr==0))							
								local_wdata=128'h10101010101010101010101010101010;
							else
								local_wdata=128'h80808080808080808080808080808080;	
							end
					end
				5'd2:
					begin						
						wr_state=5'd3;
					end
				5'd3:
					begin						
						write_req=1'b0;
						if(last_wdata_req==1'b1)
							begin								
							  if (wr_col_addr >= max_col_value)
								begin
								  wr_col_addr = 0;
								  if (wr_row_addr == MAX_ROW)
									begin
									  wr_row_addr = 0;
									  if (wr_bank_addr == MAX_BANK)
										begin
										  wr_bank_addr = 0;
										  if (wr_cs_addr == MAX_CHIPSEL)
											  wr_cs_addr = MIN_CHIPSEL;										  
										  else 
											wr_cs_addr = wr_cs_addr + 1'b1;
										end
									  else 
										wr_bank_addr = wr_bank_addr + 1'b1;
									end
								  else 
									wr_row_addr = wr_row_addr + 1'b1;
								end
							  else 
								wr_col_addr = wr_col_addr + addr_value;											
								if(wr_bank_addr==2)
									wr_state=5'd0;
								else
									wr_state=5'd1;
							
							end
					end
			endcase
		end
end
/// tao mot FIFO de dem tin hieu send_cmd
FIFO_1X4 FIFO1X4Inst(.data (send_cmd),.rdclk (clk),.rdreq (msg_rd_req),.wrclk (Pclk_Rx),.wrreq(send_req_cmd),.q (sync_send_cmd),.rdempty (rd_empty));
/*----------------------------------------------------------
Doan xu ly doc du lieu tu DDR2
--------------------------------------------------------*/  
always @(posedge clk or negedge reset_n)
begin

if(reset_n==0)
	begin
		last_rdata_valid=1'b0;
		last_wdata_req=0;
		last_buffer=128'h80808080808080808080808080808080;
	end
else
	begin
		last_rdata_valid=local_rdata_valid;
		last_wdata_req = local_wdata_req;		
		last_buffer=local_rdata;		
	end
end
reg 	first_word;
reg[3:0] no_read;
reg[7:0] time_out;
always @(posedge clk or negedge reset_n)
begin
	if(reset_n==0)
		begin
			read_req<=1'b0;
			state<=5'd0; 
			set_read_address<=1'b0;						            			
		end
	else
		begin
			case (state)
				5'd0:
					begin
						if(rd_empty==0)
							begin
								msg_rd_req<=1'b1;
								state<=5'd10;
							end							
					end
				5'd10:
					begin
						msg_rd_req<=1'b0;
						state<=5'd11;						
					end
				5'd11:
					begin
						if(sync_send_cmd==1)
							begin
								addr_write<=0;
								reset_address<=1'b1;
								first_word<=1;
							end
						state<=5'd1;
					end
				5'd1:
					begin
						if(local_ready==1'b1)
							begin
								reset_address<=1'b0;
								state<=5'd2;
								read_req<=1'b1;
								read_counter<=0;
								set_read_address<=1'b1;
								no_read<=0;
								time_out<=0;
							end
					end
				5'd2:
					begin
						if(local_ready==1'b1)
								begin																	
									if(read_counter==8)
										begin
											read_req<=1'b0; // stop sending read request from DDR2								
											set_read_address<=1'b0;												
										end
									else
										read_counter<=read_counter+1;									
																																											
								end
							if(last_rdata_valid==1'b1)
									begin
										buffer[addr_write]=last_buffer;									
										if(addr_write==17)
										//if(addr_write==16)
											addr_write<=0;
										else
											addr_write<=addr_write+1;									
										no_read<=no_read+1;									
										if(no_read==8)
											begin
												state<=5'd0;
												t_o<=0;
											end														
										end

							time_out<=time_out+1;
							 if(time_out>80)
								begin
								state<=5'd0;
								t_o<=1;
								end
								
					end
				5'd3:
					begin
							if(last_rdata_valid==1'b1)
								begin						
									buffer[addr_write]=last_buffer;									
									if(addr_write==17)
										addr_write<=0;
									else
										addr_write<=addr_write+1;									
									read_counter<=read_counter+1;									
									if(read_counter==8)
										begin
											state<=5'd0;										
										end				
								end							 																		
					end				
			endcase 
		end
end
reg t_o;

assign test_signal=page_reg[0];				
always @(posedge clk or negedge reset_n)
begin
	if(reset_n==0)
		begin
			cs_addr <= 0;
            bank_addr <= 0;
            row_addr <= 0;
            col_addr <= 0;
        end
    else if(reset_address==1'b1)
		begin
			cs_addr <= 0;
            bank_addr <= 0;
            row_addr <= 0;
            col_addr <= 0;
            if(sync_page_reg!=page_reg[0])
			  begin
				sync_page_reg<=page_reg[0];
				startx_reg<=buff_startx_reg;
				starty_reg<=buff_starty_reg;
				width_reg<=buff_width_reg;
				height_reg<=buff_height_reg;
			 end
		end
	else if((local_ready==1'b1) && (read_req==1'b1) && (state==5'd2))
	begin
				 if (col_addr >= max_col_value)
					begin
					  col_addr <= 0;
					  if (row_addr == MAX_ROW)
						begin
						  row_addr <= 0;
						  if (bank_addr == MAX_BANK)
							begin
							  bank_addr <= 0;
							  if (cs_addr == MAX_CHIPSEL)
								  cs_addr <= MIN_CHIPSEL;										  
							  else 
								cs_addr <= cs_addr + 1'b1;
							end
						  else 
							bank_addr <= bank_addr + 1'b1;
						end
					  else 
						row_addr <= row_addr + 1'b1;
					end
				  else 
					col_addr <= col_addr + addr_value;	
	end

end				
		
				
				
				
//----------------------------------------------------------------------------------------------
// doan xu ly video
//----------------------------------------------------------------------------------------------
				
				
reg [11:0] cur_x;	// current x position from video input
reg [10:0] cur_y;	// current y position from video input
reg [11:0] temp_cur;

reg old_field;

assign GS_2971_CONTROL[0]=0; // place GS_2971 H:V:F output as digital timing signals
assign GS_2971_CONTROL[2]=1; // GS2971 enable video and audio processing features
assign GS_2971_CONTROL[3]=1; // ???? FW_EN

assign GS_2971_CONTROL[1]=1; // ????
assign GS_2971_CONTROL[4]=0; // ????



assign GS_2972_CONTROL[0]=0; // TIM_861
assign GS_2972_CONTROL[1]=1; // SMPTE_BYPASS enable SMPTE mode for GS2972
// SD format
/*
assign GS_2972_CONTROL[2]=1; // RATE_SEL0 = 1
assign GS_2972_CONTROL[3]=0; // RATE_SEL1 = 0
*/

assign GS_2972_CONTROL[2]=format_reg[0];
assign GS_2972_CONTROL[3]=format_reg[1];
/* HD format

assign GS_2972_CONTROL[2]=0; // RATE_SEL0 = 1
assign GS_2972_CONTROL[3]=0; // RATE_SEL1 = 0
*/

assign GS_2972_CONTROL[4]=1; // IOPROC_EN/DIS =1 enable video and audio processing
assign GS_2972_CONTROL[5]=1; // 20/10 select 20 bits mode
//assign GS_2972_CONTROL[6]=1; // DETECT_TRS GS2972 extract all internal timing from TRS 
assign GS_2972_CONTROL[6]=0; // DETECT_TRS GS2972 extract all internal timing from TRS 
assign GS_2972_CONTROL[7]=0; // ANC_BLANK 
assign GS_2972_CONTROL[8]=0; // DVB_ASI

assign Tx_HVF[2:0] = Rx_HVF_DELAY1[2:0];

assign Tx_Audio[0]=1'b1;
assign Tx_Audio[5]=1'b1;

assign Tx_Audio[2]=Rx_Audio[0]; // WCLK
assign Tx_Audio[1]=Rx_Audio[1]	; // Audio clock ACLK1
//assign Tx_Audio[3]=Rx_Audio[5] ; //Ain1/2

assign Tx_Audio[4]=Rx_Audio[4];  // Ain3/4


assign Tx_Audio[6]=Rx_Audio[1]; // Audio clock 2
assign Tx_Audio[7]=Rx_Audio[0]; // Wclk 2
assign Tx_Audio[8]=Rx_Audio[3]; // Ain_5/6
assign Tx_Audio[9]=Rx_Audio[2]; // Ain_7/8



/***************************************
Xu ly Audio
****************************************/	

wire [23:0] out_A;
wire [23:0] out_B;
//module Leveler(A_In,Level,A_Out);
wire [23:0] Channel3,Channel4;
wire [23:0] Channel1,Channel2;

wire	[23:0]	Leveler_Out_Ch1_wire,Leveler_Out_Ch2_wire;
wire	[23:0]	Leveler_Out_Ch1,Leveler_Out_Ch2;

wire	[23:0]	Com_Out_Ch1,Com_Out_Ch2;
wire	[23:0]	Com_Out_Ch1_wire,Com_Out_Ch2_wire;
wire [23:0] Channel1_bus,Channel2_bus;
wire aout;

Audio Audio_Inst1(.wclk (Rx_Audio[0]),.aclk (Rx_Audio[1]),.ain (Rx_Audio[5]),.ChannelA (Channel1),.ChannelB (Channel2));
Audio Audio_Inst2(.wclk (Rx_Audio[0]),.aclk (Rx_Audio[1]),.ain (Rx_Audio[4]),.ChannelA (Channel3),.ChannelB (Channel4));


wire [22:0]	ch1_peak;
wire [22:0]	ch12out_peak;
wire	[22:0]	ch12_in_com_peak;

wire [47:0] sum_rms;
wire [12:0] rms_usedw;
output [12:0] rms_usedw;



//new_rms rms_ch12(.rst (com_ctrl[0]),.clk (Rx_Audio[0]),.Channel1_In (Channel1_wire),.Channel2_In (Channel2_wire),.sum (sum_rms));

//peak_detect peak_detect_inst(.wclk (Rx_Audio[0]),.channel1 (Channel1_wire),.channel2 (Channel2_wire),.step (24'd4800),.peak (sum_rms));


new_rms rms_ch12(.rst (com_ctrl[0]),.clk (Rx_Audio[0]),.Channel1_In (Channel1_wire),.Channel2_In (Channel2_wire),.sum (sum_rms));

peak_detect peak_detect_inst(.wclk (Rx_Audio[0]),.channel1 (Channel1_wire),.channel2 (Channel2_wire),.step (step[23:0]),.peak (ch1_peak));


wire [47:0] a_in_wide;
wire [47:0] a_out_wide;
wire [12:0] n_audio_sample;
assign a_in_wide[23:0] = Channel1_wire[23:0];
assign a_in_wide[47:24] = Channel2_wire[23:0];
wire rd_req_audio;

A_DELAY delay_100ms(.clock (Rx_Audio[0]),.data (a_in_wide[47:0]),.rdreq (rd_req_audio),.wrreq (1'b1),.q (a_out_wide[47:0]),.usedw (n_audio_sample));


assign rd_req_audio = (n_audio_sample>=4800) ? 1'b1:1'b0;


assign Channel1_wire = Channel1;
assign Channel2_wire = Channel2;




wire	[23:0]	Channel1_wire;
wire	[23:0]	Channel2_wire;



gain gain_inst4(.clk (Rx_Audio[0]),.input1 (a_out_wide[23:0]),.output1 (Leveler_Out_Ch1_wire),.gain (ch12_gain[19:0]));
gain gain_inst5(.clk (Rx_Audio[0]),.input1 (a_out_wide[47:24]),.output1 (Leveler_Out_Ch2_wire),.gain (ch12_gain[19:0]));



assign Leveler_Out_Ch1 = (leveler_ctrl[0]==1'b1) ? Leveler_Out_Ch1_wire : Channel1;
assign Leveler_Out_Ch2 = (leveler_ctrl[0]==1'b1) ? Leveler_Out_Ch2_wire : Channel2;



Audio_Mixer Audio_Mixer_Inst(.clk (Rx_Audio[0]),.Channel1_In (Leveler_Out_Ch1),.Channel2_In (Leveler_Out_Ch2),.Channel3_In (Channel3),.Channel1_Out (out_A),.Channel2_Out (out_B),.volume1 (Volume_C1),.volume2 (Volume_C2),.volume3 (Volume_C3),.volume_master (Volume_Master),.pan (pan_reg));


Audio_Out Audio_Out_Inst(.wclk (Rx_Audio[0]),.aclk (Rx_Audio[1]),.ChannelA (out_A),.ChannelB (out_B),.aout (aout));
//Audio_Out Audio_Out_Inst(.wclk (Rx_Audio[0]),.aclk (Rx_Audio[1]),.ChannelA (Leveler_Out_Ch1),.ChannelB (Leveler_Out_Ch2),.aout (aout));

assign Tx_Audio[3]=aout;

/////////////////////////////////////


wire	active_video;	// active_video signal, high when video active, low when video is inactive				
//assign Tx_Data= (active_video==1)? 20'b11000000001100000000 : Rx_Data;
wire [19:0] Tx_Data_sign;
assign Tx_Data_sign[19:10] = (active_video_delay==1)? {high_byte[7:0],2'b11} : video_latch[19:10];
assign Tx_Data_sign[9:0] 	= (active_video_delay==1)? {low_byte[7:0],2'b11} : video_latch[9:0];

reg [19:0] Tx_Data;

always @(posedge Pclk_Rx)
begin
	Tx_Data[19:0]<=Tx_Data_sign[19:0];
end
wire [7:0] high_byte;

wire [7:0] low_byte;

anpha anpha_ins1(.dataa (out_sel_latch[16+:8]),.datab (video_latch[19:12]),.key (out_sel_latch[0+:8]),.result(high_byte));

anpha anpha_ins2(.dataa (out_sel_latch[8+:8]),.datab (video_latch[9:2]),.key (out_sel_latch[0+:8]),.result(low_byte));



//assign Tx_Data[19:10] = (active_video==1)? 10'h200 : Rx_Data[19:10];
//assign Tx_Data[9:0] 	= (active_video==1)? 10'h200 : Rx_Data[9:0];

assign Pclk_Tx=Pclk_Rx;


assign active_video = ((Rx_HVF[0]==1'b0) && (Rx_HVF[1]==1'b0) && (cur_x>=startx_reg) && (cur_x<width_reg) && (cur_y>=starty_reg) && (cur_y<height_reg))? 1'b1:1'b0;  


reg active_video_delay;
reg active_video_delay_one;

always @(posedge Pclk_Rx)
begin
	active_video_delay_one<=active_video_delay;
	video_latch_one<=video_latch;
	
end

reg [23:0] out_sel_latch;
reg [19:0] video_latch;
reg [19:0] video_latch_one;
reg [2:0]	Rx_HVF_DELAY;
reg [2:0]	Rx_HVF_DELAY1;
always @(posedge Pclk_Rx)
begin
	out_sel_latch<=out_sel;
	video_latch<=Rx_Data;
	Rx_HVF_DELAY<=Rx_HVF;
	Rx_HVF_DELAY1 <= Rx_HVF_DELAY;
	active_video_delay<=active_video;
end

wire [23:0] out_sel;
MUX_96X24 MUX96X24_inst(.data0x ({buffer[0][0+:8],buffer[0][8+:8],buffer[0][16+:8]}),
.data1x ({buffer[0][24+:8],buffer[0][32+:8],buffer[0][40+:8]}),.data2x ({buffer[0][48+:8],buffer[0][56+:8],buffer[0][64+:8]}),.data3x ({buffer[0][72+:8],buffer[0][80+:8],buffer[0][88+:8]}),.data4x ({buffer[0][96+:8],buffer[0][104+:8],buffer[0][112+:8]}),.data5x ({buffer[0][120+:8],buffer[1][0+:8],buffer[1][8+:8]}),
.data6x ({buffer[1][16+:8],buffer[1][24+:8],buffer[1][32+:8]}),.data7x ({buffer[1][40+:8],buffer[1][48+:8],buffer[1][56+:8]}),.data8x ({buffer[1][64+:8],buffer[1][72+:8],buffer[1][80+:8]}),.data9x ({buffer[1][88+:8],buffer[1][96+:8],buffer[1][104+:8]}),.data10x ({buffer[1][112+:8],buffer[1][120+:8],buffer[2][0+:8]}),
.data11x ({buffer[2][8+:8],buffer[2][16+:8],buffer[2][24+:8]}),.data12x ({buffer[2][32+:8],buffer[2][40+:8],buffer[2][48+:8]}),.data13x ({buffer[2][56+:8],buffer[2][64+:8],buffer[2][72+:8]}),.data14x ({buffer[2][80+:8],buffer[2][88+:8],buffer[2][96+:8]}),.data15x ({buffer[2][104+:8],buffer[2][112+:8],buffer[2][120+:8]}),
.data16x ({buffer[3][0+:8],buffer[3][8+:8],buffer[3][16+:8]}),.data17x ({buffer[3][24+:8],buffer[3][32+:8],buffer[3][40+:8]}),.data18x ({buffer[3][48+:8],buffer[3][56+:8],buffer[3][64+:8]}),.data19x ({buffer[3][72+:8],buffer[3][80+:8],buffer[3][88+:8]}),.data20x ({buffer[3][96+:8],buffer[3][104+:8],buffer[3][112+:8]}),
.data21x ({buffer[3][120+:8],buffer[4][0+:8],buffer[4][8+:8]}),.data22x ({buffer[4][16+:8],buffer[4][24+:8],buffer[4][32+:8]}),.data23x ({buffer[4][40+:8],buffer[4][48+:8],buffer[4][56+:8]}),.data24x ({buffer[4][64+:8],buffer[4][72+:8],buffer[4][80+:8]}),.data25x ({buffer[4][88+:8],buffer[4][96+:8],buffer[4][104+:8]}),
.data26x ({buffer[4][112+:8],buffer[4][120+:8],buffer[5][0+:8]}),.data27x ({buffer[5][8+:8],buffer[5][16+:8],buffer[5][24+:8]}),.data28x ({buffer[5][32+:8],buffer[5][40+:8],buffer[5][48+:8]}),.data29x ({buffer[5][56+:8],buffer[5][64+:8],buffer[5][72+:8]}),.data30x ({buffer[5][80+:8],buffer[5][88+:8],buffer[5][96+:8]}),
.data31x ({buffer[5][104+:8],buffer[5][112+:8],buffer[5][120+:8]}),.data32x ({buffer[6][0+:8],buffer[6][8+:8],buffer[6][16+:8]}),.data33x ({buffer[6][24+:8],buffer[6][32+:8],buffer[6][40+:8]}),.data34x ({buffer[6][48+:8],buffer[6][56+:8],buffer[6][64+:8]}),.data35x ({buffer[6][72+:8],buffer[6][80+:8],buffer[6][88+:8]}),
.data36x ({buffer[6][96+:8],buffer[6][104+:8],buffer[6][112+:8]}),.data37x ({buffer[6][120+:8],buffer[7][0+:8],buffer[7][8+:8]}),.data38x ({buffer[7][16+:8],buffer[7][24+:8],buffer[7][32+:8]}),.data39x ({buffer[7][40+:8],buffer[7][48+:8],buffer[7][56+:8]}),.data40x ({buffer[7][64+:8],buffer[7][72+:8],buffer[7][80+:8]}),
.data41x ({buffer[7][88+:8],buffer[7][96+:8],buffer[7][104+:8]}),.data42x ({buffer[7][112+:8],buffer[7][120+:8],buffer[8][0+:8]}),.data43x ({buffer[8][8+:8],buffer[8][16+:8],buffer[8][24+:8]}),.data44x ({buffer[8][32+:8],buffer[8][40+:8],buffer[8][48+:8]}),.data45x ({buffer[8][56+:8],buffer[8][64+:8],buffer[8][72+:8]}),
.data46x ({buffer[8][80+:8],buffer[8][88+:8],buffer[8][96+:8]}),.data47x ({buffer[8][104+:8],buffer[8][112+:8],buffer[8][120+:8]}),.data48x ({buffer[9][0+:8],buffer[9][8+:8],buffer[9][16+:8]}),.data49x ({buffer[9][24+:8],buffer[9][32+:8],buffer[9][40+:8]}),.data50x ({buffer[9][48+:8],buffer[9][56+:8],buffer[9][64+:8]}),
.data51x ({buffer[9][72+:8],buffer[9][80+:8],buffer[9][88+:8]}),.data52x ({buffer[9][96+:8],buffer[9][104+:8],buffer[9][112+:8]}),.data53x ({buffer[9][120+:8],buffer[10][0+:8],buffer[10][8+:8]}),.data54x ({buffer[10][16+:8],buffer[10][24+:8],buffer[10][32+:8]}),.data55x ({buffer[10][40+:8],buffer[10][48+:8],buffer[10][56+:8]}),
.data56x ({buffer[10][64+:8],buffer[10][72+:8],buffer[10][80+:8]}),.data57x ({buffer[10][88+:8],buffer[10][96+:8],buffer[10][104+:8]}),.data58x ({buffer[10][112+:8],buffer[10][120+:8],buffer[11][0+:8]}),.data59x ({buffer[11][8+:8],buffer[11][16+:8],buffer[11][24+:8]}),.data60x ({buffer[11][32+:8],buffer[11][40+:8],buffer[11][48+:8]}),
.data61x ({buffer[11][56+:8],buffer[11][64+:8],buffer[11][72+:8]}),.data62x ({buffer[11][80+:8],buffer[11][88+:8],buffer[11][96+:8]}),.data63x ({buffer[11][104+:8],buffer[11][112+:8],buffer[11][120+:8]}),.data64x ({buffer[12][0+:8],buffer[12][8+:8],buffer[12][16+:8]}),.data65x ({buffer[12][24+:8],buffer[12][32+:8],buffer[12][40+:8]}),
.data66x ({buffer[12][48+:8],buffer[12][56+:8],buffer[12][64+:8]}),.data67x ({buffer[12][72+:8],buffer[12][80+:8],buffer[12][88+:8]}),.data68x ({buffer[12][96+:8],buffer[12][104+:8],buffer[12][112+:8]}),.data69x ({buffer[12][120+:8],buffer[13][0+:8],buffer[13][8+:8]}),.data70x ({buffer[13][16+:8],buffer[13][24+:8],buffer[13][32+:8]}),
.data71x ({buffer[13][40+:8],buffer[13][48+:8],buffer[13][56+:8]}),.data72x ({buffer[13][64+:8],buffer[13][72+:8],buffer[13][80+:8]}),.data73x ({buffer[13][88+:8],buffer[13][96+:8],buffer[13][104+:8]}),.data74x ({buffer[13][112+:8],buffer[13][120+:8],buffer[14][0+:8]}),.data75x ({buffer[14][8+:8],buffer[14][16+:8],buffer[14][24+:8]}),
.data76x ({buffer[14][32+:8],buffer[14][40+:8],buffer[14][48+:8]}),.data77x ({buffer[14][56+:8],buffer[14][64+:8],buffer[14][72+:8]}),.data78x ({buffer[14][80+:8],buffer[14][88+:8],buffer[14][96+:8]}),.data79x ({buffer[14][104+:8],buffer[14][112+:8],buffer[14][120+:8]}),.data80x ({buffer[15][0+:8],buffer[15][8+:8],buffer[15][16+:8]}),
.data81x ({buffer[15][24+:8],buffer[15][32+:8],buffer[15][40+:8]}),.data82x ({buffer[15][48+:8],buffer[15][56+:8],buffer[15][64+:8]}),.data83x ({buffer[15][72+:8],buffer[15][80+:8],buffer[15][88+:8]}),.data84x ({buffer[15][96+:8],buffer[15][104+:8],buffer[15][112+:8]}),.data85x ({buffer[15][120+:8],buffer[16][0+:8],buffer[16][8+:8]}),
.data86x ({buffer[16][16+:8],buffer[16][24+:8],buffer[16][32+:8]}),.data87x ({buffer[16][40+:8],buffer[16][48+:8],buffer[16][56+:8]}),.data88x ({buffer[16][64+:8],buffer[16][72+:8],buffer[16][80+:8]}),.data89x ({buffer[16][88+:8],buffer[16][96+:8],buffer[16][104+:8]}),.data90x ({buffer[16][112+:8],buffer[16][120+:8],buffer[17][0+:8]}),
.data91x ({buffer[17][8+:8],buffer[17][16+:8],buffer[17][24+:8]}),.data92x ({buffer[17][32+:8],buffer[17][40+:8],buffer[17][48+:8]}),.data93x ({buffer[17][56+:8],buffer[17][64+:8],buffer[17][72+:8]}),.data94x ({buffer[17][80+:8],buffer[17][88+:8],buffer[17][96+:8]}),.data95x ({buffer[17][104+:8],buffer[17][112+:8],buffer[17][120+:8]}),.sel (addr_read[6:0]),.result (out_sel));




always @(posedge Pclk_Rx) // count the number of x position
begin
	//if((Rx_HVF[0]==1'b1) || (Rx_HVF[1]==1'b1) )
	if((Rx_HVF[0]==1'b1))
		cur_x<=0;
	else
		cur_x<=cur_x+1;
end

always @(posedge Rx_HVF[0]) // count the number of y position
begin
	if(Rx_HVF[1]==1'b1)
		cur_y<=0;
	else
		cur_y<=cur_y+1;
end	

always @(posedge Rx_HVF[0])
begin
	
	if((Rx_HVF[1]==1'b1) && (Rx_HVF[2]==1'b0) &&(old_field==1'b1))
		temp_cur<=0;
	else
		temp_cur<=temp_cur+1;
	old_field<=Rx_HVF[2];
	
end		

reg is_send_init;

always @(posedge Pclk_Rx)
begin
	if(send_req_cmd==1'b1)
		send_req_cmd<=1'b0;
	//if((Rx_HVF[2]==1'b0) && (cur_x==0) && (cur_y==0))
	if((cur_x==0) && (temp_cur==0))
		begin			

			if(is_send_init==1'b0)
				begin
					send_cmd<=1'b1; // xoa dia chi doc roi moi doc du lieu vao bo dem			
					send_req_cmd<=1'b1;				
					is_send_init<=1'b1;
					addr_read<=0;					
				end							
		end
	else
		is_send_init<=1'b0;
		
	if(active_video==1'b1)
		begin
			//if((addr_read==0) || (addr_read==32)) // neu da doc o 1/2 buffer
			if((addr_read==0) || (addr_read==48)) // neu da doc o 1/2 buffer
				begin
					send_cmd<=1'b0; // doc du lieu tu ddr2 vao buffer
					send_req_cmd<=1'b1;
				end
			if(addr_read!=95)
			//if(addr_read!=63)
				addr_read<=addr_read+1;
			else
				addr_read<=0;			
		end
end
//----------------------------------------------------------------------------------------------
// ket thuc doan xu ly video
//----------------------------------------------------------------------------------------------



endmodule