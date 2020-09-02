//0.003262 => 0.00000 00011 01010 11100 01

module coeff_2(
	datain,    
	dataout
	);
	
input [19:0] datain;
output [19:0] dataout;

assign dataout = (datain>>9) + (datain>>10) + (datain>>12) + (datain>>14) + (datain>>16) +(datain>>17) + (datain>>18) + (datain>>22);

endmodule
