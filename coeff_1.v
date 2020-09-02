//a 0.0021772 => 0.00000 00010 00111 01010 1

module coeff_1(
	datain,    
	dataout
);
	
input [19:0] datain;
output [19:0] dataout;

assign dataout = (datain>>9) + (datain>>13) + (datain>>14) + (datain>>15) + (datain>>17) + (datain>>19) + (datain>>21);

endmodule

