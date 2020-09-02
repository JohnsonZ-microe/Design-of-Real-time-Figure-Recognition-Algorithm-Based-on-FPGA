module sobel_top(
		clk,                     //输入：时钟信号
		rst_n,                   //输入：复位信号
		per_clken,               //输入：时钟使能信号
		R_in,		                //输入：数据信号
		G_in,
		B_in,
		out_data                 //输出：处理信号
	);

input clk;
input rst_n;
input per_clken;
input [9:0]R_in;
input [9:0]G_in;
input [9:0]B_in;
output [9:0] out_data;	

wire [9:0] matrix_data11;
wire [9:0] matrix_data12;
wire [9:0] matrix_data13;
wire [9:0] matrix_data21;
wire [9:0] matrix_data22;
wire [9:0] matrix_data23;
wire [9:0] matrix_data31;
wire [9:0] matrix_data32;
wire [9:0] matrix_data33;
wire [9:0] threshold;
wire [9:0] sobel_fil;

wire [9:0] Y;



wire [9:0] outCb;
wire [9:0] outCr;
wire YCbCl_oen;	
//有3clk的延时
color_space color_space0(
	.clock(clk),               //输入:时钟信号
	.rst_n(rst_n),
	.inR(R_in),                 //输入：R通道
	.inG(G_in),                 //输入：G通道
	.inB(B_in),                 //输入：B通道
	.outY(Y),              	   //输出：Y通道
	.outCb(outCb),             //输出：Cb通道
	.outCr(outCr),
	.ien(per_clken),
	.oen(YCbCl_oen)
);

wire bufferr0_oen;
bufferr bufferr0(
		.clk(clk),                     //输入：时钟信号
		.rst_n(rst_n),                   //输入：复位信号
		.per_img_Y(Y),               //输入：数据信号
		.aclr(1'b0),                          //输入：清零
		.matrix_p11(matrix_data11),              //输出：99矩阵13位
		.matrix_p12(matrix_data12),              //输出：99矩阵12位
		.matrix_p13(matrix_data13),					 //输出：99矩阵11位
		.matrix_p21(matrix_data21),              //输出：99矩阵23位
		.matrix_p22(matrix_data22),              //输出：99矩阵22位
		.matrix_p23(matrix_data23),              //输出：99矩阵21位
		.matrix_p31(matrix_data31),					 //输出：99矩阵33位
		.matrix_p32(matrix_data32),					 //输出：99矩阵32位
		.matrix_p33(matrix_data33),					 //输出：99矩阵31位
		.ien(YCbCl_oen),
		.oen(bufferr0_oen)
    );

wire median_ien;
median_filter median_filter0(
	.clk(clk),                          //输入：时钟信号
	.rst_n(rst_n),                        //输入：复位信号
	.data11(matrix_data11), .data12(matrix_data12), .data13(matrix_data13),       //输入：9像素数据
	.data21(matrix_data21), .data22(matrix_data22), .data23(matrix_data23),
	.data31(matrix_data31), .data32(matrix_data32), .data33(matrix_data33),
	.ien(bufferr0_oen),
	.oen(median_ien),
	.target_data(threshold)                   //中值滤波结果
);

wire sobel_oen;
sobel sobel0(
	.clk(clk),                          //输入：时钟信号
	.rst_n(rst_n),                        //输入：复位信号
	.ien(median_ien),
	.oen(sobel_oen),
	.threshold(threshold),                    //输入：阈值信号
	.data11(matrix_data11), .data12(matrix_data12), .data13(matrix_data13),       //输入：9像素数据
	.data21(matrix_data21), .data22(matrix_data22), .data23(matrix_data23),
	.data31(matrix_data31), .data32(matrix_data32), .data33(matrix_data33),
	.target_data(sobel_fil)                   //输出：sobel计算结果
	);


wire [9:0] gauss_A;

wire gaussian_oen;
gaussian_function gaussian_function0(
	.clk(clk),       //输入：时钟信号
	.rst_n(rst_n),     //输入：复位信号
	.Cb(outCb),        //输入：通道Cb输入
	.Cr(outCr),        //输入：通道Cr输入
	.gauss_A_out(gauss_A),     //输出：未计算exp的gauss值
	.ien(YCbCl_oen),
	.oen(gaussian_oen)
	);
	
wire [9:0] delay_gauss;
delay delay0(
	.clk(clk),                     //输入: 时钟信号
	.rst_n(rst_n),                   //输入：复位信号
	.ien(gaussian_oen),
	.oen(),
	.aclr(1'b0),
	.gauss_A_in(gauss_A),              //输入：gauss_A信号
	.delay_6x(delay_gauss)
);

algorithm algorithm0(
	.clk(clk),
	.rst_n(rst_n),                   //输入：复位信号
	.per_clken(sobel_oen),               //输入：时钟使能信号
	.aclr(1'b0),                    //输入：清零信号
	.image(sobel_fil),
	.gauss(delay_gauss),
	.finaloutcome(out_data)
	);
endmodule
