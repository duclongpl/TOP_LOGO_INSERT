`timescale 1ps / 1ps  
  module Top_HD_LogoInsert (
                           // video in:
                            Rx_Data,
                            Pclk_Rx,
                            Rx_HVF,
                            Rx_Audio,
                            GS_2971_CONTROL,
                           // video out: 
                            Tx_Data,
                            Pclk_Tx,  
                            Tx_HVF,
                            Tx_Audio,
                            GS_2972_CONTROL,
                            
							// ref in
							Pclk_GS4911,
							AClk4911,
							GS_4911_H,
							GS_4911_V,
							GS_4911_F,
							
							// key_video
							Rx_KeyVideo,
							Pclk_KeyVideo,
							Rx_HVF_KeyVideo,
							Video_Key_Audio,
							// key_anpha
							Rx_KeyAnpha,
							Pclk_KeyAnpha,
							Rx_HVF_KeyAnpha,
							Anpha_Key_Audio,
                            
                            
                            // cpu interface
                            DATA,
                            ADR,
                            NWAIT,
                            NCS0,
                            NRD,
                            NWR0,
                            NWR1,
                            NWR2,
                            NWR3,
                            test_signal,
                                                                                                                                          
                            // input:                                                     
                            clock_source,
                            //global_reset_n,                            

                           // outputs:
                            mem_addr,
                            mem_ba,
                            mem_cas_n,
                            mem_cke,
                            mem_clk,
                            mem_clk_n,
                            mem_cs_n,
                            mem_dm,
                            mem_dq,
                            mem_dqs,
                            mem_odt,
                            mem_ras_n,
                            mem_we_n,
                            /*pnf,
                            pnf_per_byte,
                            test_complete,
                            test_status,*/
                            my_test,
                            HVF_delay,
                            real_active,
                            
                            
);
//output [22:0] ch1_peak;
output [11:0] real_active;
output	[2:0]	HVF_delay;
  output test_signal;					
  inout		[15:0]  DATA;
  input	[24:0] 	ADR;
  input			NWAIT;
  input			NCS0;
  input			NRD;
  input			NWR0;
  input			NWR1;
  input			NWR2;
  input			NWR3;
  
  
input		Pclk_GS4911;
input		AClk4911;
input		GS_4911_H;
input		GS_4911_V;
input		GS_4911_F;
  
  
  
input	[9:0]			Rx_KeyVideo;
input					Pclk_KeyVideo;
input	[2:0]			Rx_HVF_KeyVideo;
input	[3:0]			Video_Key_Audio;
							// key_anpha
input	[9:0]			Rx_KeyAnpha;
input					Pclk_KeyAnpha;
input	[2:0]			Rx_HVF_KeyAnpha;
input	[3:0]			Anpha_Key_Audio;  
  
  
  
  input		[19:0]	Rx_Data;
  input		Pclk_Rx;
  input		[2:0]	Rx_HVF;
  input 	[6:0]	Rx_Audio;
  output	[4:0]	GS_2971_CONTROL;
  
  output	[19:0]	Tx_Data;
  output	Pclk_Tx;
  output	[2:0]	Tx_HVF;
  output	[9:0]	Tx_Audio;
  output	[8:0]	GS_2972_CONTROL;
  
  output  [ 15: 0] mem_addr;
  output  [  1: 0] mem_ba;
  output           mem_cas_n;
  output  [  0: 0] mem_cke;
  inout   [  0: 0] mem_clk;
  inout   [  0: 0] mem_clk_n;
  output  [  0: 0] mem_cs_n;
  output  [  3: 0] mem_dm;
  inout   [ 31: 0] mem_dq;
  inout   [  3: 0] mem_dqs;
  output  [  0: 0] mem_odt;
  output           mem_ras_n;
  output           mem_we_n;
//  output           pnf;
 // output  [ 15: 0] pnf_per_byte;
//  output           test_complete;
 // output  [  7: 0] test_status;
  input            clock_source;
  
  
 
  
  
output [1:0] my_test;
assign my_test =	rdusedw_BKGD_sig;

wire [1:0] 	rdusedw_BKGD_sig;  
wire	[22:0]	data_in_BKGD;
wire	[22:0]	data_out_BKGD;



assign HVF_delay[2:0] = data_out_BKGD[22:20];



wire [2:0] HVF_ref_in;		// HVF_ref before delay
wire [2:0] HVF_ref_out;		// HVF_ref after delay, it'll be use for whole design
assign HVF_ref_in[0]=GS_4911_H;
assign HVF_ref_in[1]=GS_4911_V;
assign HVF_ref_in[2]=GS_4911_F;


wire Pclk_GS4911;


wire 	clk_select;





reg [19:0] BKGD_video;		

wire [19:0] BKGD_video_wire;		

assign clk_select=1'b0;

LineSync1 LineSync_BKGD(.clk (Pclk_Rx),.clk_ref (Pclk_GS4911),.hblanking_data (Rx_HVF[0]),.HVF_ref_in (HVF_ref_in),.data_in_BKGD (Rx_Data[19:0]),
.data_out (BKGD_video_wire[19:0]),.HVF_ref_out (HVF_ref_out),.number_active (real_active));

always @(posedge Pclk_GS4911) begin
	BKGD_video <= BKGD_video_wire;
end


wire pclk_keyvideo;
wire [19:0] KeyVideo_In;
wire [2:0] HVF_KeyVideo_In;





wire [19:0] key_sum_out;

wire [9:0]	anpha_channel;

assign anpha_channel[9:0] = ((key_control[1]==1'b0 && is_ok==1'b1)) ? sync_keyanpha_out[19:10] : 10'b0000000000;

Key_Math Key_Math_Inst1(.clk (Pclk_GS4911),.data_in_a (sync_keyvideo_out[19:10]),.data_in_b (BKGD_video[19:10]),.key_in (anpha_channel[9:0]),.data_out (key_sum_out[19:10]));
Key_Math Key_Math_Inst2(.clk (Pclk_GS4911),.data_in_a (sync_keyvideo_out[9:0]),.data_in_b (BKGD_video[9:0]),.key_in (anpha_channel[9:0]),.data_out (key_sum_out[9:0]));
/*
Key_Math Key_Math_Inst1(.clk (Pclk_GS4911),.data_in_a (sync_keyvideo_out[19:10]),.data_in_b (BKGD_video[19:10]),.key_in (sync_keyanpha_out[19:10]),.data_out (key_sum_out[19:10]));
Key_Math Key_Math_Inst2(.clk (Pclk_GS4911),.data_in_a (sync_keyvideo_out[9:0]),.data_in_b (BKGD_video[9:0]),.key_in (sync_keyanpha_out[19:10]),.data_out (key_sum_out[9:0]));
*/

reg [19:0] buffer_key_sum;
reg [2:0] delay_hvf;
reg	[2:0]	delay_hvf1;
reg	[2:0]	delay_hvf2;
reg	[2:0]	delay_hvf3;
reg	[2:0]	delay_hvf4;

always @(posedge Pclk_GS4911)
begin
  buffer_key_sum <= key_sum_out;  
  delay_hvf[2:0]<=delay_hvf4[2:0];
  delay_hvf1[2:0]<=delay_hvf2[2:0];
  delay_hvf2[2:0]<=delay_hvf3[2:0];
  delay_hvf3[2:0]<=delay_hvf4[2:0];
  delay_hvf4[2:0] <= HVF_ref_out[2:0];
  //sync_keyvideo_out <=sync_keyvideo_out_wire;
 // sync_keyanpha_out <= sync_keyanpha_out_wire;
end



wire [19:0] sync_keyvideo_out;
//wire [19:0] sync_keyvideo_out_wire;
Convert20b210b Convert10b_Inst(.clk (Pclk_KeyVideo),.data_in (Rx_KeyVideo),.hsync (Rx_HVF_KeyVideo[0]),.vsync (Rx_HVF_KeyVideo[1]),.fsync (Rx_HVF_KeyVideo[2]),.clk_out (pclk_keyvideo),.data_out (KeyVideo_In[19:0]),.hsync_out (HVF_KeyVideo_In[0]),.vsync_out (HVF_KeyVideo_In[1]),.fsync_out (HVF_KeyVideo_In[2]));
wire select_video;

LineSync LineSync_BKGD_KeyVideo(.clk (pclk_keyvideo),.clk_ref (Pclk_GS4911),.hblanking_data (HVF_KeyVideo_In[0]),.HVF_ref_in (HVF_ref_in),.data_in_BKGD (KeyVideo_In[19:0]),
.data_out (sync_keyvideo_out[19:0]),.test_count (select_video));




wire pclk_keyanpha;
wire [19:0] keyanpha_in;
wire [2:0] HVF_keyanpha_in;
wire [19:0] sync_keyanpha_out;
//wire [19:0] sync_keyanpha_out_wire;

Convert20b210b Convert10b_Inst_Anpha(.clk (Pclk_KeyAnpha),.data_in (Rx_KeyAnpha),.hsync (Rx_HVF_KeyAnpha[0]),.vsync (Rx_HVF_KeyAnpha[1]),.fsync (Rx_HVF_KeyAnpha[2]),.clk_out (pclk_keyanpha),.data_out (keyanpha_in[19:0]),.hsync_out (HVF_keyanpha_in[0]),.vsync_out (HVF_keyanpha_in[1]),.fsync_out (HVF_keyanpha_in[2]));

wire is_ok;
LineSync LineSync_BKGD_KeyAnpha(.clk (pclk_keyanpha),.clk_ref (Pclk_GS4911),.hblanking_data (HVF_keyanpha_in[0]),.HVF_ref_in (HVF_ref_in),.data_in_BKGD (keyanpha_in[19:0]),
.data_out (sync_keyanpha_out[19:0]),.test_count (test_count),.is_ok (is_ok));


wire test_count;


/*
assign Pclk_Tx=Pclk_GS4911;
assign Tx_HVF[2:0]=HVF_ref_out[2:0];
assign Tx_Data[19:0] = (test_count==1'b0) ? sync_keyanpha_out :BKGD_video_in;*/





wire    [ 15: 0] mem_addr;
  wire             mem_aux_full_rate_clk;
  wire             mem_aux_half_rate_clk;
  wire    [  1: 0] mem_ba;
  wire             mem_cas_n;
  wire    [  0: 0] mem_cke;
  wire    [  0: 0] mem_clk;
  wire    [  0: 0] mem_clk_n;
  wire    [  0: 0] mem_cs_n;
  wire    [  3: 0] mem_dm;
  wire    [ 31: 0] mem_dq;
  wire    [  3: 0] mem_dqs;
  wire    [ 21: 0] mem_local_addr;
  wire    [ 15: 0] mem_local_be;
  wire    [  8: 0] mem_local_col_addr;
  wire             mem_local_cs_addr;
  wire    [127: 0] mem_local_rdata;
  wire             mem_local_rdata_valid;
  wire             mem_local_read_req;
  wire             mem_local_ready;
  wire             mem_local_size;
  wire    [127: 0] mem_local_wdata;
  wire             mem_local_wdata_req;
  wire             mem_local_write_req;
  wire    [  0: 0] mem_odt;
  wire             mem_ras_n;
  wire             mem_we_n;
  wire             phy_clk;
  wire             pnf;
  wire    [ 15: 0] pnf_per_byte;
  wire             reset_phy_clk_n;
  wire             test_complete;
  wire    [  7: 0] test_status;
  wire             tie_high;
  wire             tie_low;
  //
  
  
  assign global_reset_n=1'b1;
  //assign global_reset_n=NRD;  
  assign mem_addr[15:13]=0;
  //<< END MEGAWIZARD INSERT MODULE
//assign out[2:0]=mem_addr[15:13];
  assign tie_high = 1'b1;
  assign tie_low = 1'b0;
  //<< START MEGAWIZARD INSERT WRAPPER_NAME
  
  DDR2_IF DDR2_IF_inst
    (
      .aux_full_rate_clk (mem_aux_full_rate_clk),
      .aux_half_rate_clk (mem_aux_half_rate_clk),
      .global_reset_n (global_reset_n),
      .local_address (mem_local_addr),
      .local_be (mem_local_be),
      .local_init_done (),
      .local_rdata (mem_local_rdata),
      .local_rdata_valid (mem_local_rdata_valid),
      .local_read_req (mem_local_read_req),
      .local_ready (mem_local_ready),
      .local_refresh_ack (),
      .local_size (mem_local_size),
      .local_wdata (mem_local_wdata),
      .local_wdata_req (mem_local_wdata_req),
      .local_write_req (mem_local_write_req),
      .mem_addr (mem_addr[12 : 0]),
      .mem_ba (mem_ba),
      .mem_cas_n (mem_cas_n),
      .mem_cke (mem_cke),
      .mem_clk (mem_clk),
      .mem_clk_n (mem_clk_n),
      .mem_cs_n (mem_cs_n),
      .mem_dm (mem_dm[3 : 0]),
      .mem_dq (mem_dq),
      .mem_dqs (mem_dqs[3 : 0]),
      .mem_odt (mem_odt),
      .mem_ras_n (mem_ras_n),
      .mem_we_n (mem_we_n),
      .phy_clk (phy_clk),
      .pll_ref_clk (clock_source),
      .reset_phy_clk_n (reset_phy_clk_n),
      .reset_request_n (),
      .soft_reset_n (tie_high)
    );
  //<< END MEGAWIZARD INSERT WRAPPER_NAME
  //<< START MEGAWIZARD INSERT CS_ADDR_MAP
  //connect up the column address bits, dropping 2 bits from example driver output because of 4:1 data rate
  assign mem_local_addr[6 : 0] = mem_local_col_addr[8 : 2];

  //<< END MEGAWIZARD INSERT CS_ADDR_MAP
//assign Tx_HVF = delay_hvf;
//assign Tx_Data = buffer_key_sum;

/*

assign GS_2972_CONTROL[0]=0; // TIM_861
assign GS_2972_CONTROL[1]=1; // SMPTE_BYPASS enable SMPTE mode for GS2972
// SD format
//*
//assign GS_2972_CONTROL[2]=1; // RATE_SEL0 = 1
//assign GS_2972_CONTROL[3]=0; // RATE_SEL1 = 0
//
assign GS_2972_CONTROL[2]=0;
assign GS_2972_CONTROL[3]=0;
// HD format

//assign GS_2972_CONTROL[2]=0; // RATE_SEL0 = 1
//assign GS_2972_CONTROL[3]=0; // RATE_SEL1 = 0


assign GS_2972_CONTROL[4]=1; // IOPROC_EN/DIS =1 enable video and audio processing
assign GS_2972_CONTROL[5]=1; // 20/10 select 20 bits mode
//assign GS_2972_CONTROL[6]=1; // DETECT_TRS GS2972 extract all internal timing from TRS 
assign GS_2972_CONTROL[6]=0; // DETECT_TRS GS2972 extract all internal timing from TRS 
assign GS_2972_CONTROL[7]=0; // ANC_BLANK 
assign GS_2972_CONTROL[8]=0; // DVB_ASI
*/

wire	[19:0]	data_to_logo_insert_wire;
wire	[2:0]	hvf_to_logo_insert_wire;



reg	[19:0]	data_to_logo_insert;
reg	[2:0]	hvf_to_logo_insert;
wire		clk_logo_insert;

always @(posedge clk_logo_insert) begin
  data_to_logo_insert <=data_to_logo_insert_wire;
  hvf_to_logo_insert <=hvf_to_logo_insert_wire;
  end
/*
assign Tx_Data = data_to_logo_insert;
assign Tx_HVF[2:0] = hvf_to_logo_insert[2:0];
assign Pclk_Tx = clk_logo_insert;*/

assign Pclk_Tx = clk_logo_insert;

//assign Tx_Data = Rx_Data;
//assign Pclk_Tx

//assign clk_logo_insert = (key_control[0]==1'b0) ? Pclk_Rx : Pclk_GS4911;
//assign clk_logo_insert = Pclk_Rx;
assign clk_logo_insert = (key_control[0]==1'b0) ? Pclk_Rx : Pclk_GS4911;

/*
clk_mux clk_mux_inst(
  	.clkselect (key_control[0]),
	.inclk0x (Pclk_Rx),
	.inclk1x (Pclk_GS4911),
	.outclk (clk_logo_insert));
*/
	
//assign hvf_to_logo_insert_wire[2:0] =(key_control[0]==1'b0) ? Rx_HVF[2:0] : delay_hvf[2:0];
//assign data_to_logo_insert_wire = (key_control[0]==1'b0) ? Rx_Data : buffer_key_sum;

//assign hvf_to_logo_insert_wire[2:0] =Rx_HVF[2:0];
//assign data_to_logo_insert_wire = Rx_Data;

assign hvf_to_logo_insert_wire[2:0] =(key_control[0]==1'b0) ? Rx_HVF[2:0] : delay_hvf[2:0];
assign data_to_logo_insert_wire = (key_control[0]==1'b0) ? Rx_Data : buffer_key_sum;

//pclk_keyvideo
/*
assign Tx_Data = sync_keyanpha_out;
assign Pclk_Tx = Pclk_GS4911;
assign Tx_HVF[2:0] = delay_hvf[2:0];
*/
/**
assign Tx_Data = KeyVideo_In;
assign Pclk_Tx = pclk_keyvideo;
assign Tx_HVF[2:0] = HVF_KeyVideo_In[2:0];*/



reg	[15:0]	key_control;


always @(posedge NWR0)
	begin
		if((NWR0==1'b1) && (NCS0==1'b0) && (ADR[24]==1'b1))
			begin
				case(ADR[6:1])					
					6'd33:
						key_control[15:0] <= DATA;											
				endcase					
			end
	end	




logo_key(.Rx_Data (data_to_logo_insert),.Pclk_Rx (clk_logo_insert),.Rx_HVF (hvf_to_logo_insert),.Rx_Audio (Rx_Audio),.GS_2971_CONTROL (GS_2971_CONTROL),
		.Tx_Data (Tx_Data),.Pclk_Tx (),.Tx_HVF (Tx_HVF),.Tx_Audio (Tx_Audio),.GS_2972_CONTROL (GS_2972_CONTROL),
		.active_video (active_video),
		.DATA (DATA),
		.ADR (ADR),
		.NCS0 (NCS0),
		.NWR0 (NWR0),
		.test_signal (test_signal),
		.clk (phy_clk),
		.local_bank_addr (mem_local_addr[21 : 20]),
		.local_be (mem_local_be),
		.local_col_addr (mem_local_col_addr),
		.local_cs_addr (mem_local_cs_addr),
		.local_rdata (mem_local_rdata),
		.local_rdata_valid (mem_local_rdata_valid),
		.local_read_req (mem_local_read_req),
		.local_ready (mem_local_ready),
		.local_row_addr (mem_local_addr[19 : 7]),
		.local_size (mem_local_size),
		.local_wdata (mem_local_wdata),
		.local_wdata_req (mem_local_wdata_req),
		.local_write_req (mem_local_write_req),      
		.reset_n (reset_phy_clk_n),
		.test_input (NRD)		
		);

  
endmodule