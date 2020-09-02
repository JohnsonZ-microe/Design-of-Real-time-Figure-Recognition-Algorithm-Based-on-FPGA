// LUT输入     LUT输出      二进制码
//   0           2            10
//   1        0.7358    0.101111000101110
//   2        0.2706    0.010001010100011
//   3        0.0996    0.000110010111111
//   4        0.0366    0.000010001001101
//   5        0.0135    0.000000110111010
//   6        0.005     0.000000010100011
//   7        0.0018    0.000000000111010
//   8        0.0006    0.000000000010011
//   9        0.0002    0.000000000000110 
//   10       0.0001    0.000000000000011
//   其余         0            0

module exp_LUT(
	datain,         //输入：x
	image_data,     //输入：乘数
	dataout         //输出: 2*exp(-x)*乘数
	);

input  [9:0]  datain;
input  [9:0]  image_data;
output reg [9:0]  dataout;

always@(datain or dataout or image_data)  begin
	// 2
	 if (datain == 0)
		 dataout = image_data<<1; 
	// 0.7358  => 0.101111000101110 
	 else if (datain == 1)  
       dataout = (image_data>>1)+(image_data>>3)+(image_data>>4)+(image_data>>5)+(image_data>>6)+(image_data>>10)+(image_data>>12)+(image_data>>13)+(image_data>>14);
   // 0.2706  => 0.010001010100011
	 else if (datain == 2)
       dataout = (image_data>>2)+(image_data>>6)+(image_data>>8)+(image_data>>10)+(image_data>>14)+(image_data>>15);
   // 0.0996  => 0.000110010111111
    else if (datain == 3)
       dataout = (image_data>>4)+(image_data>>5)+(image_data>>8)+(image_data>>10)+(image_data>>11)+(image_data>>12)+(image_data>>13)+(image_data>>14)+(image_data>>15);
   // 0.0366  => 0.000010001001101
 	 else if (datain == 4)
       dataout = (image_data>>5)+(image_data>>9)+(image_data>>12)+(image_data>>13)+(image_data>>15);
   // 0.0135  => 0.000000110111010
    else if (datain == 5)
       dataout = (image_data>>7)+(image_data>>8)+(image_data>>10)+(image_data>>11)+(image_data>>12)+(image_data>>14);
	// 0.005   => 0.000000010100011
    else if (datain == 6)
       dataout = (image_data>>8)+(image_data>>10)+(image_data>>14)+(image_data>>15);
   // 0.0018  => 0.000000000111010
	 else if (datain == 7)
       dataout = (image_data>>10)+(image_data>>11)+(image_data>>12)+(image_data>>14);
   // 0.0006  => 0.000000000010011
    else if (datain == 8)
       dataout = (image_data>>11)+(image_data>>14)+(image_data>>15);
   // 0.0002  => 0.000000000000110 
	 else if (datain == 9)
       dataout = (image_data>>13)+(image_data>>14);
	// 0.0001  => 0.000000000000011
    else if (datain == 10)
       dataout = (image_data>>14)+(image_data>>15);
    else
       dataout = 10'd0;
   
end

endmodule
