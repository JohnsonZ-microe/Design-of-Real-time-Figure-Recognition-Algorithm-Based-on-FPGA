/*
缓存器
只有时钟使能信号为1,matrix才会移位，否则输出原值
*/

module buffer_final(
		clk,                     //输入：时钟信号
		rst_n,                   //输入：复位信号
		per_clken,               //输入：时钟使能信号
		image,                   //输入：图像数据信号
		gauss,                   //输入：高斯数据信号
		aclr,                    //输入：清零信号
		matrix_clken,            //输出：99矩阵移位使能信号，延时2clk
		image_p11,               //输出：图像信息99矩阵13位
		image_p12,               //输出：图像信息99矩阵12位
		image_p13,					 //输出：图像信息99矩阵11位
		image_p21,               //输出：图像信息99矩阵23位
		image_p22,               //输出：图像信息99矩阵22位
		image_p23,               //输出：图像信息99矩阵21位
		image_p31,					 //输出：图像信息99矩阵33位
		image_p32,					 //输出：图像信息99矩阵32位
		image_p33,					 //输出：图像信息99矩阵31位
		gauss_p11,               //输出：高斯信息99矩阵13位
		gauss_p12,               //输出：高斯信息99矩阵12位
		gauss_p13,					 //输出：高斯信息99矩阵11位
		gauss_p21,               //输出：高斯信息99矩阵23位
		gauss_p22,               //输出：高斯信息99矩阵22位
		gauss_p23,               //输出：高斯信息99矩阵21位
		gauss_p31,					 //输出：高斯信息99矩阵33位
		gauss_p32,					 //输出：高斯信息99矩阵32位
		gauss_p33 					 //输出：高斯信息99矩阵31位
    );

input clk;					
input rst_n;							
//Image data prepred to be processd
input per_clken;//Prepared Image data output/capture enable clock
input aclr;
input [9:0]image;
input [9:0]gauss;
//Image data has been processd
output	matrix_clken;	//Prepared Image data output/capture enable clock	
output 	reg [9:0]	image_p11;						
output 	reg [9:0]	image_p12;						
output 	reg [9:0]	image_p13;	//3X3 Matrix output
output 	reg [9:0]	image_p21;					
output 	reg [9:0]	image_p22;						
output 	reg [9:0]	image_p23;						
output 	reg [9:0]	image_p31;						
output 	reg [9:0]	image_p32;						
output 	reg [9:0]	image_p33;	
output 	reg [9:0]	gauss_p11;						
output 	reg [9:0]	gauss_p12;						
output 	reg [9:0]	gauss_p13;	//3X3 Matrix output
output 	reg [9:0]	gauss_p21;					
output 	reg [9:0]	gauss_p22;						
output 	reg [9:0]	gauss_p23;						
output 	reg [9:0]	gauss_p31;						
output 	reg [9:0]	gauss_p32;						
output 	reg [9:0]	gauss_p33;	

wire 	[9:0] 		image_row1_data;//行1缓存数据
wire 	[9:0]	      image_row2_data;//行2缓存数据
wire 	[9:0] 		image_row3_data;//行3输入数据
wire 	[9:0] 		gauss_row1_data;//行1缓存数据
wire 	[9:0]	      gauss_row2_data;//行2缓存数据
wire 	[9:0] 		gauss_row3_data;//行3输入数据


linebuffer_self linebuffer_image(
	.aclr(aclr),             //同步清零信号
	.clken(per_clken),           //时钟使能信号
	.clock(clk),           //时钟信号
	.shiftin(image),         //数据输入
	.shiftout(),
	.taps0x(image_row2_data),          //第一行缓存
	.taps1x(image_row1_data)           //第二行缓存
	);

linebuffer_self linebuffer_gauss(
	.aclr(aclr),             //同步清零信号
	.clken(per_clken),           //时钟使能信号
	.clock(clk),           //时钟信号
	.shiftin(gauss),         //数据输入
	.shiftout(),
	.taps0x(gauss_row2_data),          //第一行缓存
	.taps1x(gauss_row1_data)           //第二行缓存
	);


assign image_row3_data = image;
assign gauss_row3_data = gauss;

//输入使能延时
reg 	[3:0]	per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(rst_n==1'b0)
		per_clken_r <= 4'b0000	;
	else 
		per_clken_r <= {per_clken_r[2:0], per_clken};	 
end



always @(posedge clk or negedge rst_n)  begin
	if(rst_n == 1'b0)begin
		{image_p11, image_p12, image_p13} <= 30'h0;
      {image_p21, image_p22, image_p23} <= 30'h0;
      {image_p31, image_p32, image_p33} <= 30'h0;
	end

	else if(per_clken==1'b1)  begin
			{image_p11, image_p12, image_p13} <= {image_p12, image_p13, image_row1_data};
			{image_p21, image_p22, image_p23} <= {image_p22, image_p23, image_row2_data};
			{image_p31, image_p32, image_p33} <= {image_p32, image_p33, image_row3_data};
	end
	
	else begin  //缓存器值不变
		{image_p11, image_p12, image_p13} <= {image_p11, image_p12, image_p13};
		{image_p21, image_p22, image_p23} <= {image_p21, image_p22, image_p23};
		{image_p31, image_p32, image_p33} <= {image_p31, image_p32, image_p33};
	end

end	



always @(posedge clk or negedge rst_n)  begin
	if(rst_n == 1'b0)begin
		{gauss_p11, gauss_p12, gauss_p13} <= 30'h0;
      {gauss_p21, gauss_p22, gauss_p23} <= 30'h0;
      {gauss_p31, gauss_p32, gauss_p33} <= 30'h0;
	end

	else if(per_clken==1'b1)  begin
			{gauss_p11, gauss_p12, gauss_p13} <= {gauss_p12, gauss_p13, gauss_row1_data};
			{gauss_p21, gauss_p22, gauss_p23} <= {gauss_p22, gauss_p23, gauss_row2_data};
			{gauss_p31, gauss_p32, gauss_p33} <= {gauss_p32, gauss_p33, gauss_row3_data};
	end
	
	else begin  //缓存器值不变
		{gauss_p11, gauss_p12, gauss_p13} <= {gauss_p11, gauss_p12, gauss_p13};
		{gauss_p21, gauss_p22, gauss_p23} <= {gauss_p21, gauss_p22, gauss_p23};
		{gauss_p31, gauss_p32, gauss_p33} <= {gauss_p31, gauss_p32, gauss_p33};
	end

end	

assign 	matrix_clken = per_clken_r[3];      //99矩阵移位使能，延时4clk
	
endmodule
