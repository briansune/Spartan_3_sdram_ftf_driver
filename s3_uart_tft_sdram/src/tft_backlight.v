module tft_backlight(
	
	
	input	[3:0]	scale,
	input	[3:0]	pwm_match,
	output			PWM
);
	
	assign PWM = (pwm_match >= scale) ? 1'b0 : 1'b1;
	
endmodule
