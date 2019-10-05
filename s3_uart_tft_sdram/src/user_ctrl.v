module user_ctrl(

	input clk,
	input nrst,
	
	input [3 : 0] user_opcode,
	input [15 : 0] user_data,
	input user_data_update,
	
	output reg [3:0] pwm_preload,
	
	/* USER INTERFACE */
	output reg [2:0] page_show,
	output reg [2:0] page_set,
	
	output [8:0] row_add,
	output [9:0] col_add,
	input startup_inc,
	
	input FIFO_RD_req,
	output reg FIFO_full,
	output reg [15:0] FIFO_data,
	
	output reg startup
);
	
	//////////////////////////////////////////////////////////////////
	//                       Parameter
	//////////////////////////////////////////////////////////////////
	localparam [3:0] TFT_CMD_NOP			= 4'h0;
	localparam [3:0] TFT_CMD_Backlight		= 4'h1;
	localparam [3:0] TFT_CMD_Row_Add_S		= 4'h2;
	localparam [3:0] TFT_CMD_Col_Add_S		= 4'h3;
	localparam [3:0] TFT_CMD_Row_Add_E		= 4'h6;
	localparam [3:0] TFT_CMD_Col_Add_E		= 4'h7;
	localparam [3:0] TFT_CMD_Dis_Page		= 4'h4;
	localparam [3:0] TFT_CMD_Page_No		= 4'h5;	
	localparam [3:0] TFT_CMD_Sleep			= 4'hB;
	localparam [3:0] TFT_CMD_Disp_Mode		= 4'hC;
	localparam [3:0] TFT_CMD_Add_ptr_inc	= 4'hD;
	localparam [3:0] TFT_CMD_data_ptr		= 4'hF;
	//////////////////////////////////////////////////////////////////
	
	//////////////////////////////////////
	//        Address Increment
	//////////////////////////////////////
	reg row_col_inc;
	//////////////////////////////////////
	
	//////////////////////////////////////
	//        Address Boundary
	//////////////////////////////////////
	reg [8:0] row_add_S;
	reg [9:0] col_add_S;
	reg [8:0] row_add_E;
	reg [9:0] col_add_E;
	//////////////////////////////////////
	
	//////////////////////////////////////
	reg update_col_row_add;
	//////////////////////////////////////
	
	
	//////////////////////////////////////////////////////////////////
	//            user TFT control column and row address
	//////////////////////////////////////////////////////////////////
	wire col_cnt_end;
	wire row_cnt_end;
	
	wire user_col_ld;
	wire user_row_ld;
	
	wire col_cnt_en;
	wire row_cnt_en;
	
	assign col_cnt_end = (col_add == col_add_E) ? 1'b1 : 1'b0;
	assign row_cnt_end = (row_add == row_add_E) ? 1'b1 : 1'b0;
	
	assign user_col_ld = update_col_row_add | (col_cnt_end & col_cnt_en);
	assign user_row_ld = update_col_row_add | (row_cnt_end & row_cnt_en);
	
	assign col_cnt_en = ((~row_col_inc | row_cnt_end) & startup_inc) | update_col_row_add;
	assign row_cnt_en = ((row_col_inc | col_cnt_end) & startup_inc) | update_col_row_add;
	
	user_col_cnt user_col_cnt_inst(
		
		.sclr		(~nrst),				// input  aclr_sig
		.clk		(clk),					// input  clock_sig
		.ce			(col_cnt_en),			// input  cnt_en_sig
		
		.load		(user_col_ld),			// input  sload_sig
		.l			(col_add_S),			// input [9:0] data_sig
		
		.q			(col_add) 				// output [9:0] q_sig
	);
	
	user_row_cnt user_row_cnt_inst(
		
		.sclr		(~nrst),				// input  aclr_sig
		.clk		(clk),					// input  clock_sig
		.ce			(row_cnt_en),			// input  cnt_en_sig
		
		.load		(user_row_ld),			// input  sload_sig
		.l			(row_add_S),			// input [8:0] data_sig
		
		.q			(row_add) 				// output [8:0] q_sig
	);
	
	initial begin
		startup <= 1'b0;
		//startup <= 1'b1;
	end
	
	always@(posedge clk)begin
		if(col_cnt_en & col_cnt_end & row_cnt_end)begin
			startup <= 1'b1;
		end
	end
	
	always@(posedge clk or negedge nrst)begin
		
		if(!nrst)begin
		
			pwm_preload <= 4'd0;
			
			page_show <= 3'b0;
			page_set <= 3'b0;
			
			row_add_S <= 9'd0;
			col_add_S <= 10'd0;
			row_add_E <= 9'd479;
			col_add_E <= 10'd799;
			
			update_col_row_add <= 1'b0;
			
			FIFO_full <= 1'b0;
			FIFO_data <= 16'b0;
			
			row_col_inc <= 1'b0;
			
		end else begin
			
			if(user_data_update)begin
				
				case(user_opcode)
					
					TFT_CMD_Backlight: begin
						pwm_preload <= user_data[3:0];
					end
					
					TFT_CMD_Row_Add_S: begin
						if(user_data[8 : 0] <= row_add_E)begin
							row_add_S <= user_data[8:0];
							update_col_row_add <= 1'b1;
						end
					end
						
					TFT_CMD_Col_Add_S: begin
						if(user_data[9 : 0] <= col_add_E)begin
							col_add_S <= user_data[9:0];
							update_col_row_add <= 1'b1;
						end
					end
						
					TFT_CMD_Row_Add_E: begin
						if(user_data[8 : 0] < 9'd480)begin
							row_add_E <= user_data[8:0];
						end
					end
						
					TFT_CMD_Col_Add_E: begin
						if(user_data[9 : 0] < 10'd800)begin
							col_add_E <= user_data[9:0];
						end
					end
						
					TFT_CMD_Dis_Page: begin
						page_show <= user_data[2:0];
					end
						
					TFT_CMD_Page_No: begin
						page_set <= user_data[2:0];
					end
						
					TFT_CMD_Add_ptr_inc: begin
						row_col_inc <= user_data[0];
					end
						
					TFT_CMD_data_ptr: begin
						if(!FIFO_full)begin
							FIFO_data <= user_data;
							FIFO_full <= 1'b1;
						end
					end
					
				endcase
				
			end else begin
				
				if(FIFO_RD_req & FIFO_full)begin
					FIFO_full <= 1'b0;
				end
				
				if(update_col_row_add)begin
					update_col_row_add <= 1'b0;
				end
			end
		end
	end
	
endmodule

