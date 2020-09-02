module gaussian_function_tb;

reg clk;       //输入：时钟信号
reg rst_n;     //输入：复位信号
reg [9:0]Cb;        //输入：通道Cb输入
reg [9:0]Cr;        //输入：通道Cr输入
wire [19:0]gauss_A;     //输出：gauss值

gaussian_function gaussian_function_t(
	.clk(clk),       //输入：时钟信号
	.rst_n(rst_n),     //输入：复位信号
	.Cb(Cb),        //输入：通道Cb输入
	.Cr(Cr),        //输入：通道Cr输入
	.gauss_A(gauss_A)      //输出：gauss值
	);

always @(clk) clk <= #200 ~clk;

always @(rst_n or clk)  begin
	if(rst_n == 1'b0)
		Cb <= 10'b0;
	else if(Cb == 10'd1020)
		Cb <= 10'd0;
	else
		Cb <= Cb + 1'b1;
end

always @(rst_n or clk)  begin
	if(rst_n == 1'b0)
		Cr <= 10'b0;
	else if(Cr == 10'd1020)
		Cr <= 10'd0;
	else
		Cr <= Cr + 1'b1;
end



initial  begin
	begin
		clk <= 1'b0;
		rst_n <= 1'b0;
	end
	#700 begin 
		rst_n <= 1'b1;
		Cb <= 10'b0;
		Cr <= 10'b0;
	end
	#10000000
	$stop;
end

endmodule
