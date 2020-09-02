//0.0014166 => 0.00000 00001 01110 01101

module coeff_3(
	datain,    
	dataout
	);
	
input [19:0] datain;
output [19:0] dataout;

assign dataout = (datain>>10) + (datain>>12) + (datain>>13) + (datain>>14) + (datain>>17) +(datain>>18) + (datain>>20);

endmodule
