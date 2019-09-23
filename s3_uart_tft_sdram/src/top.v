module top(
	
	input	sys_nrst,
	input	sys_clk,
	
	output	TFT_MODE,
	output	PWM,
	
	output [5:0] R,
	output [5:0] G,
	output [5:0] B,
	output DCLK,
	output DE,
	output HSYNC,
	output VSYNC,
	
	input	uart_rx,
	output	uart_tx,
	
	//////////////////////////////////////////////
	//          SDRAM Hardware IO
	//////////////////////////////////////////////
	output				sdram_clk,
	output	[11 : 0]	sdram_addr,
	output	[1 : 0]		sdram_ba,
	inout	[15 : 0]	sdram_dq,
	output				sdram_cke,
	output				sdram_cs_n,
	output				sdram_ras_n,
	output				sdram_cas_n,
	output				sdram_we_n,
	output	[1 : 0]		sdram_dqm
);
	
	//////////////////////////////////////////////
	// This PCB is set to DE mode only
	//////////////////////////////////////////////
	assign HSYNC = 1'b1;
	assign VSYNC = 1'b1;
	assign TFT_MODE = 1'b1;
	//////////////////////////////////////////////
	
	//////////////////////////////////////////////
	//             TFT PWM CTRL
	//////////////////////////////////////////////
	wire	[14 : 0]	pwm_cnt;
	reg					startflag;
	//////////////////////////////////////////////
	
	wire				pll_lock;
	wire				sys_clk_25m;
	wire				sys_clk_100m;
	
	wire	[3 : 0]		user_opcode;
	wire	[15 : 0]	user_data;
	wire				user_data_update;
	
	wire	[3 : 0]		pwm_preload;
	wire	[2 : 0]		page_show;
	wire	[2 : 0]		page_set;
	
	wire	[8 : 0]		row_add;
	wire	[9 : 0]		col_add;
	wire				startup_inc;
	
	wire				FIFO_RD_req;
	wire				FIFO_full;
	wire	[15 : 0]	FIFO_out;
	
	wire				startup_sig;
	
	sys_pll sys_pll_inst0(
		
		.CLKIN_IN			(sys_clk),
		.RST_IN				(~sys_nrst),
		
		.CLKIN_IBUFG_OUT	(),
		.CLK0_OUT			(sys_clk_25m),
		.CLKFX_OUT			(sys_clk_100m),
		.CLKFX180_OUT		(sdram_clk),
		.LOCKED_OUT			(pll_lock)
	);
	
	////////////////////////////////////////////////////////////////
	//
	////////////////////////////////////////////////////////////////
	tft_uart_ctrl tft_uart_ctrl_inst0(
		
		.nrst				(startflag),
		.clk				(sys_clk_100m),
		
		.uart_rx			(uart_rx),
		.uart_tx			(uart_tx),
		
		.cmd_opcode			(user_opcode),
		.cmd_data			(user_data),
		.cmd_dat_update		(user_data_update)
	);
	
	user_ctrl user_ctrl_inst0(
		
		.nrst				(startflag),
		.clk				(sys_clk_100m),
		
		.user_opcode		(user_opcode),
		.user_data			(user_data),
		.user_data_update	(user_data_update),
		
		.pwm_preload		(pwm_preload),
		.page_show			(page_show),
		.page_set			(page_set),
		
		.row_add			(row_add),
		.col_add			(col_add),
		.startup_inc		(startup_inc),
		
		.FIFO_RD_req		(FIFO_RD_req),
		.FIFO_full			(FIFO_full),
		.FIFO_data			(FIFO_out),
		
		.startup			(startup_sig)
	);
	////////////////////////////////////////////////////////////////
	
	
	tft_ctrl tft_ctrl_inst0(
		
		.rst			(startflag),		// input  rst_sig
		.clk			(sys_clk_100m),		// input  clk_sig
		
		.R				(R),				// output [5:0] R_sig
		.G				(G),				// output [5:0] G_sig
		.B				(B),				// output [5:0] B_sig
		.DCLK			(DCLK),				// output  DCLK_sig
		.DE				(DE),				// output  DE_sig
		
		.sdram_addr		(sdram_addr),		// output [11:0] sdram_addr
		.sdram_ba		(sdram_ba),			// output [1:0] sdram_ba
		.sdram_dq		(sdram_dq),			// inout [15:0] sdram_dq
		.sdram_cke		(sdram_cke),		// output  sdram_cke
		.sdram_cs_n		(sdram_cs_n),		// output  sdram_cs_n
		.sdram_ras_n	(sdram_ras_n),		// output  sdram_ras_n
		.sdram_cas_n	(sdram_cas_n),		// output  sdram_cas_n
		.sdram_we_n		(sdram_we_n),		// output  sdram_we_n
		.sdram_dqm		(sdram_dqm),		// output [1:0] sdram_dqm
		
		.page_show		(page_show),		// input [2:0] page_show_sig
		.page_set		(page_set),			// input [2:0] page_set_sig
		.row_add_user	(row_add),			// input [8:0] row_add_user_sig
		.col_add_user	(col_add),			// input [9:0] col_add_user_sig
		.startup_inc	(startup_inc),
		
		.FIFO_RD_req	(FIFO_RD_req),		// output  FIFO_RD_req_sig
		.FIFO_full		(FIFO_full),		// input  FIFO_full_sig
		.FIFO_out		(FIFO_out),			// input [15:0] FIFO_out_sig
		.startup		(startup_sig)		// output  startup
	);
	
	
	////////////////////////////////////////////////////////////////
	//
	////////////////////////////////////////////////////////////////
	wire pwm_cnt_en;
	
	tft_bk_light_cnt tft_bk_light_cnt_inst0(
		
		.sclr		(~pll_lock),		// input sclr
		.clk		(sys_clk_100m),		// input clk
		.thresh0	(pwm_cnt_en),		// output thresh0
		.q			(pwm_cnt)			// output [14 : 0] q
	);
	
	reg [3 : 0] pwm_cnt_r;
	
	always@(posedge sys_clk_100m or negedge pll_lock)begin
		
		if(!pll_lock)begin
			pwm_cnt_r <= 4'd0;
		end else begin
			if(pwm_cnt_en)begin
				pwm_cnt_r <= pwm_cnt_r + 1'b1;
			end
		end
	end
	
	tft_backlight tft_bk_lig_inst0(
		
		.scale			(pwm_preload),
		.pwm_match		(pwm_cnt_r),
		.PWM			(PWM)
	);
	////////////////////////////////////////////////////////////////
	
	always@(posedge sys_clk_100m or negedge pll_lock)begin
		
		if(!pll_lock)begin
			startflag <= 1'b0;
		end else begin
			if(pwm_cnt[13] & pwm_cnt[12])begin
				startflag <= 1'b1;
			end
		end
	end
	
endmodule
