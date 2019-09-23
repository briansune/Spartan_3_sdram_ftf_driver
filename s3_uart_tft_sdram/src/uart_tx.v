module uart_tx(
	
	input				sys_nrst,
	input				sys_clk,
	
	input				uart_send,
	input	[7 : 0]		uart_data_tx,
	
	output				uart_tx,
	output				uart_ready,
	output				uart_done
);
	
	localparam stage_idle		= 2'd0;
	localparam stage_start_bit	= 2'd1;
	localparam stage_data		= 2'd2;
	localparam stage_stop_bit	= 2'd3;
	
	
	// baud rate
	// the system clock __MHz
	// the baud rate is set to 1000000
	
	// 100000000 / 1000000 / 1 = 100 = 98
	// 100000000 / 1000000 / 2 = 50 = 47
	
	// 50000000 / 1000000 / 1 = 50 = 48
	// 50000000 / 1000000 / 2 = 25 = 22
	
	// 25000000 / 1000000 / 1 = 25 = 23
	// 25000000 / 1000000 / 2 = 12 = 9
	localparam full_interval	= 9'd98;
	
	
	reg [8 : 0] data_bit_cnt;
	
	reg [7 : 0] data_load;
	reg [2 : 0] data_cnt;
	reg [1 : 0] stage_cnt;
	
	reg uart_ready_r;
	reg uart_done_r;
	reg uart_tx_r;
	
	assign uart_ready = uart_ready_r;
	assign uart_tx = uart_tx_r;
	assign uart_done = uart_done_r;
	
	always@(posedge sys_clk	or negedge sys_nrst)begin
		
		if(!sys_nrst)begin
			
			data_load <= 8'h00;
			data_cnt <= 3'd0;
			stage_cnt <= 2'd0;
			uart_tx_r <= 1'b1;
			uart_ready_r <= 1'b1;
			uart_done_r <= 1'b0;
			
			data_bit_cnt <= 9'd0;
			
		end else begin
			
			case(stage_cnt)
					
				stage_idle: begin
					if(uart_send)begin
						stage_cnt <= stage_start_bit;
						data_load <= uart_data_tx;
						uart_ready_r <= 1'b0;
					end
					
					uart_tx_r <= 1'b1;
					data_cnt <= 3'd0;
					uart_done_r <= 1'b0;
					data_bit_cnt <= 9'd0;
				end
				
				stage_start_bit: begin
					
					if(data_bit_cnt == full_interval)begin
						stage_cnt <= stage_data;
						data_bit_cnt <= 9'd0;
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
					
					uart_tx_r <= 1'b0;
				end
				
				stage_data: begin
					
					uart_tx_r <= data_load[data_cnt];
					
					if(data_bit_cnt == full_interval)begin
						
						if(data_cnt == 3'd7)begin
							stage_cnt <= stage_stop_bit;
						end
						
						data_cnt <= data_cnt + 1'd1;
						data_bit_cnt <= 9'd0;
						
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
				end
				
				stage_stop_bit: begin
					
					uart_tx_r <= 1'b1;
					
					if(data_bit_cnt == full_interval)begin
						
						data_cnt <= 3'd0;
						data_bit_cnt <= 9'd0;
					
						if(uart_send)begin
							stage_cnt <= stage_start_bit;
							data_load <= uart_data_tx;
							uart_ready_r <= 1'b0;
						end else begin
							stage_cnt <= stage_idle;
							uart_ready_r <= 1'b1;
							uart_done_r <= 1'b1;
						end
						
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
				end
				
			endcase
		end
	end
	
endmodule
