module delay_tb;

reg clk;
reg rst_n;
reg per_clken;
reg aclr;
reg [9:0] gauss_A_in;
wire [9:0] delay_8x;
delay delay_t(
	.clk(clk),                     //输入: 时钟信号
	.rst_n(rst_n),                   //输入：复位信号
	.per_clken(per_clken),
	.aclr(aclr),
	.gauss_A_in(gauss_A_in),              //输入：gauss_A信号
	.delay_8x(delay_8x)
	);


always @(clk) clk <= #200 ~clk;

always @(posedge clk or negedge rst_n)  begin
	if(rst_n == 1'b0)
		gauss_A_in <= 10'b0;
	else if(gauss_A_in == 10'd640)
		gauss_A_in <= 10'd0;
	else
		gauss_A_in <= gauss_A_in + 1'b1;
end


initial  begin
	begin
		clk <= 1'b0;
		rst_n <= 1'b0;
		per_clken <= 1'b1;
		aclr <= 1'b0;
	end
	#700 begin 
		rst_n <= 1'b1;
		gauss_A_in <= 10'b0;
	end
	#10000000
	$stop;
end

endmodule

