//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ps / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DDR2_IF_controller_phy (
                                // inputs:
                                 dqs_delay_ctrl_import,
                                 dqs_offset_delay_ctrl,
                                 global_reset_n,
                                 hc_scan_ck,
                                 hc_scan_din,
                                 hc_scan_enable_access,
                                 hc_scan_enable_dm,
                                 hc_scan_enable_dq,
                                 hc_scan_enable_dqs,
                                 hc_scan_enable_dqs_config,
                                 hc_scan_update,
                                 local_address,
                                 local_autopch_req,
                                 local_be,
                                 local_burstbegin,
                                 local_powerdn_req,
                                 local_read_req,
                                 local_refresh_req,
                                 local_self_rfsh_req,
                                 local_size,
                                 local_wdata,
                                 local_write_req,
                                 oct_ctl_rs_value,
                                 oct_ctl_rt_value,
                                 pll_phasecounterselect,
                                 pll_phasestep,
                                 pll_phaseupdown,
                                 pll_reconfig,
                                 pll_reconfig_counter_param,
                                 pll_reconfig_counter_type,
                                 pll_reconfig_data_in,
                                 pll_reconfig_enable,
                                 pll_reconfig_read_param,
                                 pll_reconfig_soft_reset_en_n,
                                 pll_reconfig_write_param,
                                 pll_ref_clk,
                                 soft_reset_n,

                                // outputs:
                                 aux_full_rate_clk,
                                 aux_half_rate_clk,
                                 aux_scan_clk,
                                 aux_scan_clk_reset_n,
                                 dll_reference_clk,
                                 dqs_delay_ctrl_export,
                                 hc_scan_dout,
                                 local_init_done,
                                 local_powerdn_ack,
                                 local_rdata,
                                 local_rdata_error,
                                 local_rdata_valid,
                                 local_ready,
                                 local_refresh_ack,
                                 local_self_rfsh_ack,
                                 local_wdata_req,
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
                                 mem_dqsn,
                                 mem_odt,
                                 mem_ras_n,
                                 mem_reset_n,
                                 mem_we_n,
                                 phy_clk,
                                 pll_phase_done,
                                 pll_reconfig_busy,
                                 pll_reconfig_clk,
                                 pll_reconfig_data_out,
                                 pll_reconfig_reset,
                                 reset_phy_clk_n,
                                 reset_request_n
                              )
;

  output           aux_full_rate_clk;
  output           aux_half_rate_clk;
  output           aux_scan_clk;
  output           aux_scan_clk_reset_n;
  output           dll_reference_clk;
  output  [  5: 0] dqs_delay_ctrl_export;
  output  [ 31: 0] hc_scan_dout;
  output           local_init_done;
  output           local_powerdn_ack;
  output  [127: 0] local_rdata;
  output           local_rdata_error;
  output           local_rdata_valid;
  output           local_ready;
  output           local_refresh_ack;
  output           local_self_rfsh_ack;
  output           local_wdata_req;
  output  [ 12: 0] mem_addr;
  output  [  1: 0] mem_ba;
  output           mem_cas_n;
  output  [  0: 0] mem_cke;
  inout   [  0: 0] mem_clk;
  inout   [  0: 0] mem_clk_n;
  output  [  0: 0] mem_cs_n;
  output  [  3: 0] mem_dm;
  inout   [ 31: 0] mem_dq;
  inout   [  3: 0] mem_dqs;
  inout   [  3: 0] mem_dqsn;
  output  [  0: 0] mem_odt;
  output           mem_ras_n;
  output           mem_reset_n;
  output           mem_we_n;
  output           phy_clk;
  output           pll_phase_done;
  output           pll_reconfig_busy;
  output           pll_reconfig_clk;
  output  [  8: 0] pll_reconfig_data_out;
  output           pll_reconfig_reset;
  output           reset_phy_clk_n;
  output           reset_request_n;
  input   [  5: 0] dqs_delay_ctrl_import;
  input   [  5: 0] dqs_offset_delay_ctrl;
  input            global_reset_n;
  input            hc_scan_ck;
  input   [  3: 0] hc_scan_din;
  input            hc_scan_enable_access;
  input   [  3: 0] hc_scan_enable_dm;
  input   [ 31: 0] hc_scan_enable_dq;
  input   [  3: 0] hc_scan_enable_dqs;
  input   [  3: 0] hc_scan_enable_dqs_config;
  input   [  3: 0] hc_scan_update;
  input   [ 21: 0] local_address;
  input            local_autopch_req;
  input   [ 15: 0] local_be;
  input            local_burstbegin;
  input            local_powerdn_req;
  input            local_read_req;
  input            local_refresh_req;
  input            local_self_rfsh_req;
  input            local_size;
  input   [127: 0] local_wdata;
  input            local_write_req;
  input   [ 13: 0] oct_ctl_rs_value;
  input   [ 13: 0] oct_ctl_rt_value;
  input   [  3: 0] pll_phasecounterselect;
  input            pll_phasestep;
  input            pll_phaseupdown;
  input            pll_reconfig;
  input   [  2: 0] pll_reconfig_counter_param;
  input   [  3: 0] pll_reconfig_counter_type;
  input   [  8: 0] pll_reconfig_data_in;
  input            pll_reconfig_enable;
  input            pll_reconfig_read_param;
  input            pll_reconfig_soft_reset_en_n;
  input            pll_reconfig_write_param;
  input            pll_ref_clk;
  input            soft_reset_n;

  wire             aux_full_rate_clk;
  wire             aux_half_rate_clk;
  wire             aux_scan_clk;
  wire             aux_scan_clk_reset_n;
  wire    [  1: 0] bank_addr;
  wire    [  7: 0] col_addr;
  wire    [ 15: 0] control_be_width;
  wire             cs_addr;
  wire    [ 25: 0] ctl_addr_repl;
  wire    [ 12: 0] ctl_addr_sig;
  wire    [  3: 0] ctl_ba_repl;
  wire    [  1: 0] ctl_ba_sig;
  wire    [  3: 0] ctl_cal_byte_lane_sel_n_sig;
  wire             ctl_cal_fail_sig;
  wire             ctl_cal_success_sig;
  wire             ctl_cal_warning_sig;
  wire    [  1: 0] ctl_cas_n_repl;
  wire             ctl_cas_n_sig;
  wire             ctl_cke_h_sig;
  wire             ctl_cke_l_sig;
  wire    [  1: 0] ctl_cke_repl;
  wire    [  1: 0] ctl_cs_n_repl;
  wire             ctl_cs_n_sig;
  wire    [ 15: 0] ctl_dm_sig;
  wire    [ 15: 0] ctl_dm_sig_temp;
  wire    [  7: 0] ctl_doing_rd_sig;
  wire    [  7: 0] ctl_dqs_burst_sig;
  wire             ctl_mem_clk_disable_sig;
  wire    [  1: 0] ctl_odt_repl;
  wire             ctl_odt_sig;
  wire    [  1: 0] ctl_ras_n_repl;
  wire             ctl_ras_n_sig;
  wire    [127: 0] ctl_rdata_sig;
  wire    [  1: 0] ctl_rdata_valid_sig;
  wire    [  4: 0] ctl_rlat_sig;
  wire    [127: 0] ctl_wdata_sig;
  wire    [  7: 0] ctl_wdata_valid_sig;
  wire    [  1: 0] ctl_we_n_repl;
  wire             ctl_we_n_sig;
  wire    [  4: 0] ctl_wlat_sig;
  wire    [ 31: 0] dbg_rd_data_sig;
  wire             dbg_waitrequest_sig;
  wire             dll_reference_clk;
  wire    [  5: 0] dqs_delay_ctrl_export;
  wire    [ 31: 0] hc_scan_dout;
  wire    [ 15: 0] local_be_sig;
  wire             local_init_done;
  wire             local_powerdn_ack;
  wire    [127: 0] local_rdata;
  wire             local_rdata_error;
  wire    [127: 0] local_rdata_sig;
  wire             local_rdata_valid;
  wire             local_ready;
  wire             local_refresh_ack;
  wire             local_self_rfsh_ack;
  wire             local_wdata_req;
  wire    [127: 0] local_wdata_sig;
  wire    [ 12: 0] mem_addr;
  wire    [  1: 0] mem_ba;
  wire             mem_cas_n;
  wire    [  0: 0] mem_cke;
  wire    [  0: 0] mem_clk;
  wire    [  0: 0] mem_clk_n;
  wire    [  0: 0] mem_cs_n;
  wire    [  3: 0] mem_dm;
  wire    [ 31: 0] mem_dq;
  wire    [  3: 0] mem_dqs;
  wire    [  3: 0] mem_dqsn;
  wire    [  0: 0] mem_odt;
  wire             mem_ras_n;
  wire             mem_reset_n;
  wire             mem_we_n;
  wire             phy_clk;
  wire             phy_clk_sig;
  wire             pll_phase_done;
  wire             pll_reconfig_busy;
  wire             pll_reconfig_clk;
  wire    [  8: 0] pll_reconfig_data_out;
  wire             pll_reconfig_reset;
  wire             reset_phy_clk_n;
  wire             reset_phy_clk_n_sig;
  wire             reset_request_n;
  wire    [ 12: 0] row_addr;
  assign local_wdata_sig[127 : 0] = local_wdata[127 : 0];
  assign local_be_sig[15 : 0] = local_be[15 : 0];
  assign local_rdata = local_rdata_sig[127 : 0];
  assign ctl_mem_clk_disable_sig = 0;
  assign ctl_cal_byte_lane_sel_n_sig = 0;
  assign cs_addr = 0;
  assign bank_addr = local_address[21 : 20];
  assign row_addr = local_address[19 : 7];
  assign col_addr[7 : 1] = local_address[6 : 0];
  assign col_addr[0] = 0;
  assign phy_clk = phy_clk_sig;
  assign reset_phy_clk_n = reset_phy_clk_n_sig;
  DDR2_IF_auk_ddr_hp_controller_wrapper DDR2_IF_auk_ddr_hp_controller_wrapper_inst
    (
      .clk (phy_clk_sig),
      .control_be (control_be_width),
      .control_dm (ctl_dm_sig),
      .control_doing_rd (ctl_doing_rd_sig),
      .control_doing_wr (),
      .control_dqs_burst (ctl_dqs_burst_sig),
      .control_rdata (ctl_rdata_sig),
      .control_rdata_valid (ctl_rdata_valid_sig),
      .control_wdata (ctl_wdata_sig),
      .control_wdata_valid (ctl_wdata_valid_sig),
      .control_wlat (ctl_wlat_sig),
      .ddr_a (ctl_addr_sig),
      .ddr_ba (ctl_ba_sig),
      .ddr_cas_n (ctl_cas_n_sig),
      .ddr_cke_h (ctl_cke_h_sig),
      .ddr_cke_l (ctl_cke_l_sig),
      .ddr_cs_n (ctl_cs_n_sig),
      .ddr_odt (ctl_odt_sig),
      .ddr_ras_n (ctl_ras_n_sig),
      .ddr_we_n (ctl_we_n_sig),
      .local_autopch_req (local_autopch_req),
      .local_bank_addr (bank_addr),
      .local_be (local_be_sig),
      .local_burstbegin (local_burstbegin),
      .local_col_addr (col_addr),
      .local_cs_addr (cs_addr),
      .local_init_done (local_init_done),
      .local_powerdn_ack (local_powerdn_ack),
      .local_powerdn_req (local_powerdn_req),
      .local_rdata (local_rdata_sig),
      .local_rdata_valid (local_rdata_valid),
      .local_read_req (local_read_req),
      .local_ready (local_ready),
      .local_refresh_ack (local_refresh_ack),
      .local_refresh_req (local_refresh_req),
      .local_row_addr (row_addr),
      .local_self_rfsh_ack (local_self_rfsh_ack),
      .local_self_rfsh_req (local_self_rfsh_req),
      .local_size (local_size),
      .local_wdata (local_wdata_sig),
      .local_wdata_req (local_wdata_req),
      .local_write_req (local_write_req),
      .reset_n (reset_phy_clk_n_sig),
      .seq_cal_complete (ctl_cal_success_sig)
    );


  assign ctl_addr_repl = {2{ctl_addr_sig}};
  assign ctl_ba_repl = {2{ctl_ba_sig}};
  assign ctl_odt_repl = {2{ctl_odt_sig}};
  assign ctl_cas_n_repl = {2{ctl_cas_n_sig}};
  assign ctl_ras_n_repl = {2{ctl_ras_n_sig}};
  assign ctl_we_n_repl = {2{ctl_we_n_sig}};
  assign ctl_cke_repl = {ctl_cke_l_sig,ctl_cke_h_sig};
  assign ctl_cs_n_repl = {ctl_cs_n_sig, {1{1'b1}}};
  assign ctl_dm_sig_temp = ctl_dm_sig;
  DDR2_IF_phy DDR2_IF_phy_inst
    (
      .aux_full_rate_clk (aux_full_rate_clk),
      .aux_half_rate_clk (aux_half_rate_clk),
      .ctl_addr (ctl_addr_repl),
      .ctl_ba (ctl_ba_repl),
      .ctl_cal_byte_lane_sel_n (ctl_cal_byte_lane_sel_n_sig),
      .ctl_cal_fail (ctl_cal_fail_sig),
      .ctl_cal_req (1'b0),
      .ctl_cal_success (ctl_cal_success_sig),
      .ctl_cal_warning (ctl_cal_warning_sig),
      .ctl_cas_n (ctl_cas_n_repl),
      .ctl_cke (ctl_cke_repl),
      .ctl_clk (phy_clk_sig),
      .ctl_cs_n (ctl_cs_n_repl),
      .ctl_dm (ctl_dm_sig_temp),
      .ctl_doing_rd (ctl_doing_rd_sig),
      .ctl_dqs_burst (ctl_dqs_burst_sig),
      .ctl_mem_clk_disable (ctl_mem_clk_disable_sig),
      .ctl_odt (ctl_odt_repl),
      .ctl_ras_n (ctl_ras_n_repl),
      .ctl_rdata (ctl_rdata_sig),
      .ctl_rdata_valid (ctl_rdata_valid_sig),
      .ctl_reset_n (reset_phy_clk_n_sig),
      .ctl_rlat (ctl_rlat_sig),
      .ctl_rst_n (2'b11),
      .ctl_wdata (ctl_wdata_sig),
      .ctl_wdata_valid (ctl_wdata_valid_sig),
      .ctl_we_n (ctl_we_n_repl),
      .ctl_wlat (ctl_wlat_sig),
      .dbg_addr (13'b0),
      .dbg_clk (phy_clk),
      .dbg_cs (1'b0),
      .dbg_rd (1'b0),
      .dbg_rd_data (dbg_rd_data_sig),
      .dbg_reset_n (reset_phy_clk_n),
      .dbg_waitrequest (dbg_waitrequest_sig),
      .dbg_wr (1'b0),
      .dbg_wr_data (32'b0),
      .global_reset_n (global_reset_n),
      .mem_addr (mem_addr),
      .mem_ba (mem_ba),
      .mem_cas_n (mem_cas_n),
      .mem_cke (mem_cke),
      .mem_clk (mem_clk),
      .mem_clk_n (mem_clk_n),
      .mem_cs_n (mem_cs_n),
      .mem_dm (mem_dm[3 : 0]),
      .mem_dq (mem_dq),
      .mem_dqs (mem_dqs[3 : 0]),
      .mem_dqs_n (mem_dqsn[3 : 0]),
      .mem_odt (mem_odt),
      .mem_ras_n (mem_ras_n),
      .mem_reset_n (mem_reset_n),
      .mem_we_n (mem_we_n),
      .pll_ref_clk (pll_ref_clk),
      .reset_request_n (reset_request_n),
      .soft_reset_n (soft_reset_n)
    );


  //<< start europa

endmodule

