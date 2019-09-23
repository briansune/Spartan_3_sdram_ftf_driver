`timescale 1ns / 1ns

module tb_top;
	
	reg clk;
	reg nrst;
	
	reg uart_rx;
	
	wire uart_tx_wire;
	
	top DUT(
		.sys_nrst	(nrst),
		.sys_clk	(clk),
		.uart_rx	(uart_rx),
		.uart_tx	(uart_tx_wire)
	);
	
	always begin
		#20 clk = ~clk;
	end
	
	integer i, j;
	
	reg [7 : 0] str_array [0 : 8];
	
	initial begin
		str_array[0] <= "T";
		str_array[1] <= "F";
		str_array[2] <= "T";
		str_array[3] <= "_";
		str_array[4] <= "C";
		str_array[5] <= "\r";
		str_array[6] <= "\n";
	end
	
	reg [7 : 0] str_array_b [0 : 13];
	
	initial begin
		str_array_b[0] <= "T";
		str_array_b[1] <= "F";
		str_array_b[2] <= "T";
		str_array_b[3] <= "_";
		str_array_b[4] <= "C";
		str_array_b[5] <= ":";
		str_array_b[6] <= "A";
		str_array_b[7] <= ",";
		str_array_b[8] <= "2";
		str_array_b[9] <= "C";
		str_array_b[10] <= "1";
		str_array_b[11] <= "F";
		str_array_b[12] <= "\r";
		str_array_b[13] <= "\n";
	end
	
	reg [7 : 0] str_array_c [0 : 13];
	
	initial begin
		str_array_c[0] <= "T";
		str_array_c[1] <= "F";
		str_array_c[2] <= "T";
		str_array_c[3] <= "_";
		str_array_c[4] <= "C";
		str_array_c[5] <= ":";
		str_array_c[6] <= "4";
		str_array_c[7] <= ",";
		str_array_c[8] <= "D";
		str_array_c[9] <= "E";
		str_array_c[10] <= "7";
		str_array_c[11] <= "2";
		str_array_c[12] <= "\r";
		str_array_c[13] <= "\n";
	end
	
	reg [7 : 0] str_array_d [0 : 12];
	
	initial begin
		str_array_d[0] <= "T";
		str_array_d[1] <= "F";
		str_array_d[2] <= "T";
		str_array_d[3] <= "_";
		str_array_d[4] <= "L";
		str_array_d[5] <= ":";
		str_array_d[6] <= "0";
		str_array_d[7] <= "0";
		str_array_d[8] <= "0";
		str_array_d[9] <= "0";
		str_array_d[10] <= "7";
		str_array_d[11] <= "\r";
		str_array_d[12] <= "\n";
	end
	
	initial begin
		clk = 1'b0;
		nrst = 1'b0;
		
		uart_rx = 1'b1;
		
		fork begin
			#150 nrst = 1'b1;
			
			#5000 uart_rx = 1'b1;
			
			for(j = 0; j < 7; j = j + 1)begin
				//#3000 uart_rx = 1'b1;
				#1000 uart_rx = 1'b0;
				
				for(i = 0; i < 8; i = i + 1)begin
					#1000
					
					if((str_array[j] >> i) & 8'h01)begin
						uart_rx = 1'b1;
					end else begin
						uart_rx = 1'b0;
					end
				end
				
				#1000 uart_rx = 1'b1;
			end
			
			#5000 uart_rx = 1'b1;
			
			for(j = 0; j < 14; j = j + 1)begin
				//#3000 uart_rx = 1'b1;
				#1000 uart_rx = 1'b0;
				
				for(i = 0; i < 8; i = i + 1)begin
					#1000
					
					if((str_array_b[j] >> i) & 8'h01)begin
						uart_rx = 1'b1;
					end else begin
						uart_rx = 1'b0;
					end
				end
				
				#1000 uart_rx = 1'b1;
			end
			
			#5000 uart_rx = 1'b1;
			
			for(j = 0; j < 14; j = j + 1)begin
				//#3000 uart_rx = 1'b1;
				#1000 uart_rx = 1'b0;
				
				for(i = 0; i < 8; i = i + 1)begin
					#1000
					
					if((str_array_c[j] >> i) & 8'h01)begin
						uart_rx = 1'b1;
					end else begin
						uart_rx = 1'b0;
					end
				end
				
				#1000 uart_rx = 1'b1;
			end
			
			#5000 uart_rx = 1'b1;
			
			for(j = 0; j < 13; j = j + 1)begin
				//#3000 uart_rx = 1'b1;
				#1000 uart_rx = 1'b0;
				
				for(i = 0; i < 8; i = i + 1)begin
					#1000
					
					if((str_array_d[j] >> i) & 8'h01)begin
						uart_rx = 1'b1;
					end else begin
						uart_rx = 1'b0;
					end
				end
				
				#1000 uart_rx = 1'b1;
			end
			
			#5000 uart_rx = 1'b1;
			
			for(j = 0; j < 16; j = j + 1)begin
				//#3000 uart_rx = 1'b1;
				#1000 uart_rx = 1'b0;
				
				for(i = 0; i < 8; i = i + 1)begin
					#1000
					
					if(((8'h30+j) >> i) & 8'h01)begin
						uart_rx = 1'b1;
					end else begin
						uart_rx = 1'b0;
					end
				end
				
				#1000 uart_rx = 1'b1;
			end
			
			#500000 uart_rx = 1'b1;
			
			for(j = 0; j < 7; j = j + 1)begin
				//#3000 uart_rx = 1'b1;
				#1000 uart_rx = 1'b0;
				
				for(i = 0; i < 8; i = i + 1)begin
					#1000
					
					if((str_array[j] >> i) & 8'h01)begin
						uart_rx = 1'b1;
					end else begin
						uart_rx = 1'b0;
					end
				end
				
				#1000 uart_rx = 1'b1;
			end
			
		end join
	end
	
endmodule
