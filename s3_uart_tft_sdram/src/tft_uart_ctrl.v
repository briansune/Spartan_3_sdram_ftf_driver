module tft_uart_ctrl(
	
	input				nrst,
	input				clk,
	
	input				uart_rx,
	output				uart_tx,
	
	output	[3 : 0]		cmd_opcode,
	output	[15 : 0]	cmd_data,
	output				cmd_load,
	
	output				cmd_dat_update
);
	
	////////////////////////////////////////////////////
	//             finite stage machine
	////////////////////////////////////////////////////
	localparam stage_start				= 4'd0;
	localparam stage_check_cmd_h		= 4'd1;
	localparam stage_check_cmd_t		= 4'd2;
	localparam stage_enter_cmd			= 4'd3;
	localparam stage_enter_tail			= 4'd4;
	localparam stage_enter_tail_ok		= 4'd5;
	localparam stage_enter_opcode		= 4'd6;
	localparam stage_enter_next			= 4'd7;
	localparam stage_enter_opc_d		= 4'd8;
	localparam stage_enter_len			= 4'd9;
	localparam stage_push_data			= 4'd10;
	localparam stage_enter_tail_done	= 4'd11;
	
	localparam to_check_cmd_h		= stage_start;
	localparam to_check_cmd_t		= stage_check_cmd_h;
	localparam to_enter_cmd			= stage_check_cmd_t;
	localparam to_enter_tail		= stage_enter_cmd;
	localparam to_enter_tail_ok		= stage_enter_tail;
	localparam to_enter_opcode		= stage_enter_tail_ok;
	localparam to_enter_next		= stage_enter_opcode;
	localparam to_enter_opc_d		= stage_enter_next;
	localparam to_enter_len			= stage_enter_opc_d;
	localparam to_push_data			= stage_enter_len;
	////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////
	//
	////////////////////////////////////////////////////
	reg [7 : 0] cmd_chk_h_str [3 : 0];
	reg [7 : 0] cmd_str_ok [3 : 0];
	reg [7 : 0] cmd_str_done [5 : 0];
	
	initial begin
		cmd_chk_h_str[0] <= "T";
		cmd_chk_h_str[1] <= "F";
		cmd_chk_h_str[2] <= "T";
		cmd_chk_h_str[3] <= "_";
	end
	
	initial begin
		cmd_str_ok[0] <= "O";
		cmd_str_ok[1] <= "K";
		cmd_str_ok[2] <= 8'h0D;		// \r
		cmd_str_ok[3] <= 8'h0A;		// \n
	end
	
	initial begin
		cmd_str_done[0] <= "D";
		cmd_str_done[1] <= "O";
		cmd_str_done[2] <= "N";
		cmd_str_done[3] <= "E";
		cmd_str_done[4] <= 8'h0D;		// \r
		cmd_str_done[5] <= 8'h0A;		// \n
	end
	////////////////////////////////////////////////////
	
	reg		[3 : 0]		cmd_opcode_r;
	reg		[15 : 0]	cmd_data_r;
	reg					cmd_load_r;
	reg		[19 : 0]	cmd_len_r;
	
	reg					cmd_dat_update_r;
	
	wire				uart_tx_done;
	wire				uart_tx_ready;
	reg					uart_tx_send;
	reg		[7 : 0]		uart_tx_data;
	
	wire uart_rd_rdy;
	wire [7 : 0] uart_rx_data;
	
	reg fifo_rd;
	wire [7 : 0] fifo_rd_data;
	
	wire fifo_full_sig;
	wire fifo_empty_sig;
	wire fifo_rd_sig;
	wire fifo_wr_sig;
	
	reg [3 : 0] stage_cnt;
	reg [3 : 0] stage_ptr;
	reg [2 : 0] send_str;
	
	reg [29 : 0] time_out;
	
	////////////////////////////////////////////////////
	//
	////////////////////////////////////////////////////
	assign fifo_wr_sig = uart_rd_rdy & !fifo_full_sig;
	assign fifo_rd_sig = fifo_rd & !fifo_empty_sig;
	
	assign cmd_opcode = cmd_opcode_r;
	assign cmd_data = cmd_data_r;
	assign cmd_load = cmd_load_r;
	
	assign cmd_dat_update = cmd_dat_update_r;
	
	////////////////////////////////////////////////////
	
	uart_buff uart_buff_inst0(
		
		.clk		(clk),					// input clk
		.srst		(~nrst),				// input srst
		
		.din		(uart_rx_data),			// input [7 : 0] din
		.wr_en		(fifo_wr_sig),			// input wr_en
		.full		(fifo_full_sig),		// output full
		
		.rd_en		(fifo_rd_sig),			// input rd_en
		.dout		(fifo_rd_data),			// output [7 : 0] dout
		.empty		(fifo_empty_sig)		// output empty
	);
	
	uart_tx uart_tx_inst0(
		
		.sys_clk		(clk),
		.sys_nrst		(nrst),
		
		.uart_send		(uart_tx_send),
		.uart_data_tx	(uart_tx_data),
		.uart_tx		(uart_tx),
		.uart_ready		(uart_tx_ready),
		.uart_done		(uart_tx_done)
	);
	
	uart_rx uart_rx_inst0(
		
		.sys_clk			(clk),
		.sys_nrst			(nrst),
		
		.uart_rx			(uart_rx),
		.uart_data_rx		(uart_rx_data),
		.uart_ready			(uart_rd_rdy)
	);
	
	always@(posedge clk or negedge nrst)begin
		
		if(!nrst)begin
			
			stage_cnt <= stage_start;
			stage_ptr <= to_check_cmd_h;
			
			send_str <= 3'd0;
			
			fifo_rd <= 1'b0;
			
			uart_tx_send <= 1'b0;
			uart_tx_data <= 8'd0;
			
			cmd_opcode_r <= 4'h0;
			cmd_data_r <= 16'h0000;
			cmd_len_r <= 20'h00000;
			
			time_out <= 30'd0;
			
			cmd_load_r <= 1'b0;
			cmd_dat_update_r <= 1'b0;
			
		end else begin
			
			case(stage_cnt)
				
				stage_start: begin
					if(!fifo_empty_sig)begin
						fifo_rd <= 1'b1;
						stage_cnt <= stage_ptr + 1'b1;
					end
					
					if(cmd_load_r)begin
						if(time_out[29])begin
							time_out <= 30'd0;
							cmd_load_r <= 1'b0;
							stage_ptr <= to_check_cmd_h;
						end else begin
							time_out <= time_out + 1'b1;
						end
					end
					
					cmd_dat_update_r <= 1'b0;
				end
				
				stage_check_cmd_h: begin
					fifo_rd <= 1'b0;
					stage_cnt <= stage_start;
					
					if(fifo_rd_data == cmd_chk_h_str[send_str[1 : 0]])begin
						
						if(send_str == 3'd3)begin
							stage_ptr <= to_check_cmd_t;
							send_str <= 3'd0;
						end else begin
							stage_ptr <= to_check_cmd_h;
							send_str <= send_str + 1'b1;
						end
						
					end else begin
						send_str <= 3'd0;
						stage_ptr <= to_check_cmd_h;
					end
				end
				
				stage_check_cmd_t: begin
					fifo_rd <= 1'b0;
					send_str <= 3'd0;
					stage_cnt <= stage_start;
					
					if(fifo_rd_data == "C")begin
						stage_ptr <= to_enter_cmd;
						cmd_load_r <= 1'b0;
						cmd_opcode_r <= 4'h0;
					end else if(fifo_rd_data == "L")begin
						stage_ptr <= to_enter_cmd;
						cmd_opcode_r <= 4'hF;
						cmd_load_r <= 1'b1;
					end else begin
						stage_ptr <= to_check_cmd_h;
						cmd_opcode_r <= 4'h0;
					end
				end
				
				stage_enter_cmd: begin
					fifo_rd <= 1'b0;
					stage_cnt <= stage_start;
					
					if(fifo_rd_data == 8'h0D)begin
						stage_ptr <= to_enter_tail;
					end else if(fifo_rd_data == ":")begin
						if(cmd_load_r)begin
							stage_ptr <= to_enter_len;
						end else begin
							stage_ptr <= to_enter_opcode;
						end
					end else begin
						stage_ptr <= to_check_cmd_h;
					end
				end
				
				stage_enter_tail: begin
					fifo_rd <= 1'b0;
					send_str <= 3'd0;
					
					if(fifo_rd_data == 8'h0A)begin
						stage_cnt <= stage_enter_tail_ok;
						stage_ptr <= to_check_cmd_h;
					end else begin
						stage_cnt <= stage_start;
						stage_ptr <= to_check_cmd_h;
					end
				end
				
				stage_enter_tail_ok: begin
					
					if(uart_tx_done)begin
						if(send_str == 3'd3)begin
							send_str <= 3'd0;
							stage_cnt <= stage_start;
							
							if(cmd_load_r)begin
								stage_ptr <= to_push_data;
								cmd_dat_update_r <= 1'b0;
							end else begin
								stage_ptr <= to_check_cmd_h;
								cmd_dat_update_r <= 1'b1;
							end
							
						end else begin
							send_str <= send_str + 1'b1;
						end
					end
					
					if(uart_tx_ready ^ uart_tx_done)begin
						uart_tx_send <= 1'b1;
						uart_tx_data <= cmd_str_ok[send_str[1 : 0]];
					end else begin
						uart_tx_send <= 1'b0;
					end
				end
				
				stage_enter_opcode: begin
					fifo_rd <= 1'b0;
					stage_cnt <= stage_start;
					
					if(fifo_rd_data >= 8'h30 && fifo_rd_data < 8'h3A)begin
						cmd_opcode_r <= fifo_rd_data[3 : 0];
						stage_ptr <= to_enter_next;
					end else if(fifo_rd_data >= 8'h41 && fifo_rd_data < 8'h46)begin
						cmd_opcode_r <= 4'h9 + fifo_rd_data[3 : 0];
						stage_ptr <= to_enter_next;
					end else begin
						stage_ptr <= to_check_cmd_h;
					end
				end
				
				stage_enter_next: begin
					fifo_rd <= 1'b0;
					stage_cnt <= stage_start;
					send_str <= 3'd0;
					
					if(fifo_rd_data == ",")begin
						stage_ptr <= to_enter_opc_d;
					end else begin
						stage_ptr <= to_check_cmd_h;
					end
				end
				
				stage_enter_opc_d: begin
					fifo_rd <= 1'b0;
					stage_cnt <= stage_start;
					
					if(fifo_rd_data >= 8'h30 && fifo_rd_data < 8'h3A)begin
						
						cmd_data_r <= {cmd_data_r[11 : 0], fifo_rd_data[3 : 0]};
						
						if(send_str == 3'd3)begin
							stage_ptr <= to_enter_cmd;
							send_str <= 3'd0;
						end else begin
							stage_ptr <= to_enter_opc_d;
							send_str <= send_str + 3'd1;
						end
						
					end else if(fifo_rd_data >= 8'h41 && fifo_rd_data < 8'h47)begin
						
						cmd_data_r <= {cmd_data_r[11 : 0], (4'h9 + fifo_rd_data[3 : 0])};
						
						if(send_str == 3'd3)begin
							stage_ptr <= to_enter_cmd;
							send_str <= 3'd0;
						end else begin
							stage_ptr <= to_enter_opc_d;
							send_str <= send_str + 3'd1;
						end
						
					end else begin
						send_str <= 3'd0;
						stage_ptr <= to_check_cmd_h;
					end
				end
				
				stage_enter_len: begin
					fifo_rd <= 1'b0;
					stage_cnt <= stage_start;
					
					if(fifo_rd_data >= 8'h30 && fifo_rd_data < 8'h3A)begin
						
						cmd_len_r <= {cmd_len_r[15 : 0], fifo_rd_data[3 : 0]};
						
						if(send_str == 3'd4)begin
							stage_ptr <= to_enter_cmd;
							send_str <= 3'd0;
						end else begin
							stage_ptr <= to_enter_len;
							send_str <= send_str + 3'd1;
						end
						
					end else if(fifo_rd_data >= 8'h41 && fifo_rd_data < 8'h47)begin
						
						cmd_len_r <= {cmd_len_r[15 : 0], (4'h9 + fifo_rd_data[3 : 0])};
						
						if(send_str == 3'd4)begin
							stage_ptr <= to_enter_cmd;
							send_str <= 3'd0;
						end else begin
							stage_ptr <= to_enter_len;
							send_str <= send_str + 3'd1;
						end
						
					end else begin
						send_str <= 3'd0;
						stage_ptr <= to_check_cmd_h;
					end
				end
				
				stage_push_data: begin
					fifo_rd <= 1'b0;
					time_out <= 30'd0;
					
					cmd_data_r <= {cmd_data_r[7 : 0], fifo_rd_data};
					
					if(send_str == 3'd1)begin
						cmd_dat_update_r <= 1'b1;
					end
					
					if(send_str == 3'd1)begin
						if(cmd_len_r > 20'd0)begin
							cmd_len_r <= cmd_len_r - 1'b1;
							stage_ptr <= to_push_data;
							stage_cnt <= stage_start;
						end else begin
							cmd_load_r <= 1'b0;
							send_str <= 3'd0;
							stage_cnt <= stage_enter_tail_done;
						end
					end else begin
						stage_cnt <= stage_start;
					end
					
					if(send_str == 3'd1)begin
						send_str <= 3'd0;
					end else begin
						send_str <= send_str + 3'd1;
					end
				end
				
				stage_enter_tail_done: begin
					
					cmd_dat_update_r <= 1'b0;
					
					if(uart_tx_done)begin
						if(send_str == 3'd5)begin
							send_str <= 3'd0;
							stage_cnt <= stage_start;
							stage_ptr <= to_check_cmd_h;
						end else begin
							send_str <= send_str + 1'b1;
						end
					end
					
					if(uart_tx_ready ^ uart_tx_done)begin
						uart_tx_send <= 1'b1;
						uart_tx_data <= cmd_str_done[send_str];
					end else begin
						uart_tx_send <= 1'b0;
					end
				end
				
			endcase
		end
	end
	
endmodule
