/*
缓存器
只有时钟使能信号为1,matrix才会移位，否则输出原值
*/

module bufferr(
		clk,                     //输入：时钟信号
		rst_n,                   //输入：复位信号
		per_img_Y,               //输入：数据信号
		aclr,                    //输入：清零信号
		matrix_p11,              //输出：99矩阵13位
		matrix_p12,              //输出：99矩阵12位
		matrix_p13,					 //输出：99矩阵11位
		matrix_p21,              //输出：99矩阵23位
		matrix_p22,              //输出：99矩阵22位
		matrix_p23,              //输出：99矩阵21位
		matrix_p31,					 //输出：99矩阵33位
		matrix_p32,					 //输出：99矩阵32位
		matrix_p33,					 //输出：99矩阵31位
		
		ien,
		oen
    );

input clk;					
input rst_n;							
input [9:0]	per_img_Y;
input aclr;

output 	reg [9:0]	matrix_p11;						
output 	reg [9:0]	matrix_p12;						
output 	reg [9:0]	matrix_p13;	//3X3 Matrix output
output 	reg [9:0]	matrix_p21;					
output 	reg [9:0]	matrix_p22;						
output 	reg [9:0]	matrix_p23;						
output 	reg [9:0]	matrix_p31;						
output 	reg [9:0]	matrix_p32;						
output 	reg [9:0]	matrix_p33;	

input    ien;
output   oen;


wire 	[9:0] 		row1_data;//行1缓存数据
wire 	[9:0]	   row2_data;//行2缓存数据
wire 	[9:0] 		row3_data;//行3输入数据


linebuffer_self linebuffer0(
	.aclr(aclr),             //同步清零信号
	.clken(ien),           //时钟使能信号
	.clock(clk),           //时钟信号
	.shiftin(per_img_Y),         //数据输入
	.shiftout(),
	.taps0x(row2_data),          //第一行缓存
	.taps1x(row1_data)           //第二行缓存
	);




assign row3_data = per_img_Y;


//输入使能延时
//根据仿真结果, 缓存器水平方向延时3clk
reg [2:0] per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(rst_n==1'b0)
		per_clken_r <= 3'b000	;
	else 
		per_clken_r <= {per_clken_r[1:0], ien};	 
end
assign oen = per_clken_r[2];


always @(posedge clk or negedge rst_n)  begin
	if(rst_n == 1'b0)begin
		{matrix_p11, matrix_p12, matrix_p13} <= 30'h0;
      {matrix_p21, matrix_p22, matrix_p23} <= 30'h0;
      {matrix_p31, matrix_p32, matrix_p33} <= 30'h0;
	end

	else if(ien==1'b1)  begin
			{matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, row1_data};
			{matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, row2_data};
			{matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, row3_data};
	end
	
	else begin  //缓存器值不变
		{matrix_p11, matrix_p12, matrix_p13} <= {matrix_p11, matrix_p12, matrix_p13};
		{matrix_p21, matrix_p22, matrix_p23} <= {matrix_p21, matrix_p22, matrix_p23};
		{matrix_p31, matrix_p32, matrix_p33} <= {matrix_p31, matrix_p32, matrix_p33};
	end

end	

	
endmodule
