module tft_ctrl(
	
	input				clk,
	input				rst,
	
	/* TFT Hardware IO */
	output		[5:0]		R,
	output		[5:0]		G,
	output		[5:0]		B,
	output reg				DCLK,
	output reg				DE,
	
	/* SDRAM Hardware IO */
	output		[11 : 0]	sdram_addr,
	output		[1 : 0]		sdram_ba,
	inout		[15 : 0]	sdram_dq,
	output					sdram_cke,
	output					sdram_cs_n,
	output					sdram_ras_n,
	output					sdram_cas_n,
	output					sdram_we_n,
	output		[1 : 0]		sdram_dqm,
	
	input		[2 : 0]		page_show,
	input		[2 : 0]		page_set,
	
	input		[8 : 0]		row_add_user,
	input		[9 : 0]		col_add_user,
	output reg				startup_inc,
	
	output reg				FIFO_RD_req,
	input					FIFO_full,
	input		[15:0]		FIFO_out,
	
	input					startup
);
	
	////////////////////////////////////////////////////////
	//	registers
	////////////////////////////////////////////////////////
		
		//////////////////////////////////
		//	TFT
		//////////////////////////////////
	reg wr_enable_start;
	reg sdram_wr_en;
	
		//////////////////////////////////
		//	SDRAM
		//////////////////////////////////
	reg rd_enable_a;
	reg rd_enable;
	
		//////////////////////////////////
		//	User
		//////////////////////////////////
	wire [8:0] row_add;
	wire [9:0] col_add;
	
	////////////////////////////////////////////////////////
	//	wires
	////////////////////////////////////////////////////////
	
	wire [1:0] clk_33m;
	
	wire TH_cout;
	//wire TV_cout;
	wire [9:0] TH;
	wire [8:0] TV;
	
	wire dclk_rst;
	
		//////////////////////////////////
		//	SDRAM
		//////////////////////////////////
	wire [21:0] wr_addr;
	wire [15:0] wr_data;
	wire wr_enable;
	
	wire [21:0] rd_addr;
	wire [15:0] rd_data;
	wire rd_ready;
	wire busy;
	
	wire data_user;
	
	wire dump_TV_case;
	
	wire dump_TH_case;
	wire dump_data_inc;
	wire dump_data_case;
	
	wire col_cnt_full;
	wire row_cnt_en;
	
	wire wr_addr_inc;
	
	reg dclk_clken;
	
	wire hcnt_clken;
	wire vcnt_clken;
	
	reg auto_refresh;
	
	////////////////////////////////////////////////////////
	//	instantiation
	////////////////////////////////////////////////////////
		
		//////////////////////////////////
		//	SDRAM
		//////////////////////////////////
	sdram_controller sdram_ctrl0(
		
		.auto_refresh	(auto_refresh),
		
		.rst_n			(rst),
		.clk			(clk),
		
		.wr_addr		(wr_addr),
		.wr_data		(wr_data),
		.wr_enable		(wr_enable),
		.wr_addr_inc	(wr_addr_inc),
		
		.rd_addr		(rd_addr),
		.rd_data		(rd_data),
		.rd_ready		(rd_ready),
		.rd_enable		(rd_enable_a),
		.busy			(busy),
		
		/* SDRAM SIDE */
		.addr			(sdram_addr),
		.bank_addr		(sdram_ba),
		.data			(sdram_dq),
		.clken			(sdram_cke),
		.cs_n			(sdram_cs_n),
		.ras_n			(sdram_ras_n),
		.cas_n			(sdram_cas_n),
		.we_n			(sdram_we_n),
		.dqm			(sdram_dqm)
	);
	
	////////////////////////////////////////////////////////
	//	assignments
	////////////////////////////////////////////////////////
	assign wr_addr = {page_set, row_add_user, col_add_user};
	assign rd_addr = {page_show, row_add, col_add};
	
	assign {R,G,B} = {rd_data[15:11],rd_data[15],rd_data[10:5],rd_data[4:0],rd_data[4]};
	
	assign dump_TV_case = ( (TV >= 9'd23 && TV < 9'd503) ) ? 1'b1 : 1'b0;
	assign dump_TH_case = ( (TH >= 10'd45 && TH < 10'd845) ) ? 1'b1 : 1'b0;
	assign dump_data_inc = (dump_TV_case & dump_TH_case);
	
	wire read_ht;
	wire bank_ht;
	wire bank_vt;
	
	assign read_ht = rd_enable & (!col_add[0] & col_add[1]) & ~dclk_clken;
	
	assign bank_ht = ( (TH < 10'd43 || TH > 10'd844) ) ? 1'b1 : 1'b0;
	assign bank_vt = ~dump_TV_case;
	
	assign dump_data_case = (bank_ht | read_ht | bank_vt);
	
	assign data_user = (startup) ? (dump_data_case & FIFO_full) : wr_enable_start;
	
	assign wr_enable = sdram_wr_en;
	assign wr_data = FIFO_out;
	
	
	wire addr_cnt_a;
	wire read_addr_cnt;
	
	assign addr_cnt_a = (clk_33m == 2'b01) & dclk_clken;
	assign read_addr_cnt = rd_enable & addr_cnt_a;
	
	assign rd_ready = rd_enable & addr_cnt_a;
	
	
	
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			startup_inc <= 1'b0;
		end else begin
			if(wr_addr_inc)begin
				startup_inc <= 1'b1;
			end else begin
				startup_inc <= 1'b0;
			end
		end
	end
	
	////////////////////////////////////////////////////////
	//	clocked combinational logic
	////////////////////////////////////////////////////////
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			FIFO_RD_req <= 1'b0;
		end else begin
			if(startup_inc & FIFO_full)begin
				FIFO_RD_req <= 1'b1;
			end else begin
				FIFO_RD_req <= 1'b0;
			end
		end
	end
	
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			sdram_wr_en <= 1'b0;
		end else begin
			if(data_user)begin
				if(!busy)begin
					sdram_wr_en <= 1'b1;
				end else begin
					sdram_wr_en <= 1'b0;
				end
			end else begin
				sdram_wr_en <= 1'b0;
			end
		end
	end
	
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			wr_enable_start <= 1'b0;
		end else begin
			if(!startup)begin
				if(!busy)begin
					wr_enable_start <= 1'b1;
				end
			end else begin
				wr_enable_start <= 1'b0;
			end
		end
	end
	
	
	assign row_cnt_en = col_cnt_full & read_addr_cnt;
	
	tft_row_cnt tft_row_cnt_inst0(
		
		.sclr		(~rst),				// input  aclr_sig
		.clk		(clk),				// input  clock_sig
		.ce			(row_cnt_en),		// input  cnt_en_sig
		
		.q			(row_add) 			// output [8:0] q_sig
	);
	
	tft_col_cnt tft_col_cnt_inst0(
		
		.sclr		(~rst),				// input  aclr_sig
		.clk		(clk),				// input  clock_sig
		.ce			(read_addr_cnt),	// input  cnt_en_sig
		
		.thresh0	(col_cnt_full),		// output  cout_sig
		.q			(col_add)			// output [9:0] q_sig
	);
	
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			auto_refresh <= 1'b0;
		end else begin
			if(addr_cnt_a & dump_TV_case)begin
				if(TH == 10'd42)begin
					auto_refresh <= 1'b1;
				end else begin
					auto_refresh <= 1'b0;
				end
			end else begin
				auto_refresh <= 1'b0;
			end
		end
	end
	
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			rd_enable <= 1'b0;
		end else begin
			if(addr_cnt_a & dump_TV_case)begin
				if(TH == 10'd44)begin
					rd_enable <= 1'b1;
				end else if(TH == 10'd844)begin
					rd_enable <= 1'b0;
				end
			end
		end
	end
	
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			rd_enable_a <= 1'b0;
		end else begin
			if(dump_TV_case)begin
				if((TH > 10'd44 && TH < 10'd843) & col_add[0] & col_add[1] | TH == 10'd44)begin
					rd_enable_a <= addr_cnt_a;
				end else begin
					rd_enable_a <= 1'b0;
				end
			end
		end
	end
	
	
	
	//////////////////////////////////////////////////////////////////
	//                          DCLK
	//////////////////////////////////////////////////////////////////
	dclk_cnt dclk_cnt_inst(
		
		.sclr		(~rst),			// input  aset_sig
		.ce			(startup),		// input  clk_en_sig
		.clk		(clk),			// input  clock_sig
		
		.thresh0	(dclk_rst),		// output  cout_sig
		.q			(clk_33m)		// output [1:0] q_sig
	);
	
	always@(posedge clk or negedge rst)begin
		
		if(!rst)begin
			dclk_clken <= 1'b0;
		end else begin
			if(dclk_rst)begin
				dclk_clken <= ~dclk_clken;
			end
		end
	end
	
	always@(posedge clk or negedge rst)begin
		
		if(!rst)begin
			DCLK <= 1'b1;
		end else begin
			if(dclk_rst)begin
				DCLK <= ~DCLK;
			end
		end
	end
	
	assign hcnt_clken = dclk_clken & dclk_rst & startup;
	assign vcnt_clken = hcnt_clken & TH_cout;
	
	//////////////////////////////////////////////////////////////////
	//                   TFT H-Sync V-Sync control
	//////////////////////////////////////////////////////////////////
	hsync_cnt hsync_cnt_inst(
		
		.sclr		(~rst),			// input  aclr_sig
		.clk		(clk),			// input  clock_sig
		.ce			(hcnt_clken),		// input  clk_en_sig
		
		.thresh0	(TH_cout),		// output  cout_sig
		.q			(TH)			// output [9:0] q_sig
	);
	
	vsync_cnt vsync_cnt_inst(	
		
		.sclr		(~rst),			// input  aset_sig
		.clk		(clk),			// input  clock_sig
		.ce			(vcnt_clken),	// input  clk_en_sig
		
		.q			(TV)			// output [8:0] q_sig
	);
	
	always@(posedge clk or negedge rst)begin
		
		if(!rst)begin
			DE <= 1'b0;
		end else begin
			if(hcnt_clken)begin
				if(dump_data_inc)begin
					DE <= 1'b1;
				end else begin
					DE <= 1'b0;
				end
			end
		end
	end
	//////////////////////////////////////////////////////////////////
	
endmodule
