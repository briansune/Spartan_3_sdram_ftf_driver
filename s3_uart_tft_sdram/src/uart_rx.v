module uart_rx(
	
	input				sys_nrst,
	input				sys_clk,
	
	input				uart_rx,
	output	[7 : 0]		uart_data_rx,
	output				uart_ready
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
	localparam half_interval	= 9'd47;
	localparam full_interval_ex	= full_interval + 9'd4;
	
	reg [1 : 0] stage_cnt;
	reg [2 : 0] data_cnt;
	
	reg [8 : 0] data_bit_cnt;
	
	reg [7 : 0] data_in;
	
	reg uart_ready_r;
	
	assign uart_ready = uart_ready_r;
	assign uart_data_rx = data_in;
	
	always@(posedge sys_clk	or negedge sys_nrst)begin
		
		if(!sys_nrst)begin
			
			data_in <= 8'h00;
			data_cnt <= 3'd0;
			stage_cnt <= 2'd0;
			
			uart_ready_r <= 1'b0;
			data_bit_cnt <= 9'd0;
			
		end else begin
			
			case(stage_cnt)
				
				stage_idle: begin
					if(!uart_rx)begin
						stage_cnt <= stage_start_bit;
					end
					
					uart_ready_r <= 1'b0;
					data_bit_cnt <= 9'd0;
				end
				
				stage_start_bit: begin
					
					if(data_bit_cnt == half_interval & !uart_rx)begin
						stage_cnt <= stage_data;
						data_bit_cnt <= 9'd0;
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
				end
				
				stage_data: begin
					
					if(data_bit_cnt == full_interval)begin
						
						if(data_cnt == 3'd7)begin
							stage_cnt <= stage_stop_bit;
						end
						
						data_bit_cnt <= 9'd0;
						data_cnt <= data_cnt + 1'd1;
						data_in <= {uart_rx, data_in[7 : 1]};
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
				end
				
				stage_stop_bit: begin
					
					if(data_bit_cnt == full_interval & uart_rx)begin
						uart_ready_r <= 1'b1;
					end else begin
						uart_ready_r <= 1'b0;
					end
					
					if(data_bit_cnt == full_interval_ex)begin
						stage_cnt <= stage_idle;
					end else begin
						data_bit_cnt <= data_bit_cnt + 1'd1;
					end
					
					data_cnt <= 3'd0;
				end
				
			endcase
		end
	end
	
endmodule
