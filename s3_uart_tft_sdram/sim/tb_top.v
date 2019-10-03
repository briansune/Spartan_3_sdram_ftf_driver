`timescale 1ns / 1ns

module tb_top;
	
	
	wire PWM;
	wire [5:0] R, G, B;
	wire DCLK, HS, VS, DE;
	
	reg clk;
	reg nrst;
	
	reg uart_rx;
	
	wire uart_tx_wire;
	
	wire TFT_MODE;
	
	/* SDRAM Hardware IO */
	wire [11:0] addr;
	wire [1:0] ba;
	wire [15:0] dq;
	wire cke;
	wire cs_n;
	wire ras_n;
	wire cas_n;
	wire we_n;
	wire [1 : 0] dqm;
	wire sdram_clk;
	
	top DUT(
		.sys_nrst	(nrst),
		.sys_clk	(clk),
		
		.uart_rx	(uart_rx),
		.uart_tx	(uart_tx_wire),
		
		.PWM			(PWM),			// output  PWM_sig
		
		.TFT_MODE		(TFT_MODE),
		
		.DCLK			(DCLK),			// output  DCLK_sig
		.R				(R),			// output [5:0] R_sig
		.G				(G),			// output [5:0] G_sig
		.B				(B),			// output [5:0] B_sig
		
		.HSYNC			(HS),			// output  HS_sig
		.VSYNC			(VS),			// output  VS_sig
		.DE				(DE),			// output  DE_sig
		
		.sdram_clk		(sdram_clk), 	// output  sdram_clk_sig
		.sdram_addr		(addr),			// output [11:0] addr_sig
		.sdram_ba		(ba),			// output [1:0] ba_sig
		.sdram_dq		(dq),			// inout [15:0] dq_sig
		.sdram_cke		(cke),			// output  cke_sig
		.sdram_cs_n		(cs_n),			// output  cs_n_sig
		.sdram_ras_n	(ras_n),		// output  ras_n_sig
		.sdram_cas_n	(cas_n),		// output  cas_n_sig
		.sdram_we_n		(we_n),			// output  we_n_sig
		.sdram_dqm		(dqm)
	);
	
	sdr sdram_model(
		
		.Dq			(dq),
		.Addr		(addr),
		.Ba			(ba),
		.Clk		(sdram_clk),
		.Cke		(cke),
		.Cs_n		(cs_n),
		.Ras_n		(ras_n),
		.Cas_n		(cas_n),
		.We_n		(we_n),
		.Dqm		(dqm)
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
		str_array_d[6] <= "5";
		str_array_d[7] <= "D";
		str_array_d[8] <= "B";
		str_array_d[9] <= "F";
		str_array_d[10] <= "F";
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
			
			#300457 uart_rx = 1'b1;
			
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
			
			for(j = 0; j < 384000; j = j + 1)begin
				//#3000 uart_rx = 1'b1;
				#1000 uart_rx = 1'b0;
				
				for(i = 0; i < 8; i = i + 1)begin
					#1000
					
					if(((j % 256) >> i) & 8'h01)begin
						uart_rx = 1'b1;
					end else begin
						uart_rx = 1'b0;
					end
				end
				
				#1000 uart_rx = 1'b1;
			end
			
			#500000 uart_rx = 1'b1;
			
		end join
	end
	
endmodule
