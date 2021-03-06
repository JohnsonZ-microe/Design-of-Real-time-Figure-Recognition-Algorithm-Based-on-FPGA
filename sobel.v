module sobel(
	clk,                          //输入：时钟信号
	rst_n,                        //输入：复位信号
	ien,                          //输入：时钟移位信号
	oen,                          //输出：带延迟的时钟移位信号                        
	threshold,                    //输入：阈值信号
	data11, data12, data13,       //输入：9像素数据
	data21, data22, data23,
	data31, data32, data33,
	target_data                   //输出：sobel计算结果
	);
	
input		clk;
input		rst_n;
input    ien;
input    [9:0]   threshold;
input		[9:0]	data11, data12, data13;
input		[9:0]	data21, data22, data23;
input		[9:0]	data31, data32, data33;
	
output	reg [9:0]	target_data;
output  oen;

reg [13:0] Gx_1;
reg [13:0] Gx_3;
reg [13:0] Gy_1;
reg [13:0] Gy_3;


reg [13:0] Gx;
reg [13:0] Gy;
reg [13:0]out;


//拍1，各行列相加
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0) begin
		Gx_1 <= 13'b0;
		Gx_3 <= 13'b0; 
		Gy_1 <= 13'b0; 
		Gy_3 <= 13'b0;
	end
	else if(ien==1'b1)begin
		Gx_1 <= data11*4'd1+data12*4'd2+data13*4'd1;
		Gx_3 <= data31*4'd1+data32*4'd2+data33*4'd1;
		Gy_1 <= data11*4'd1+data21*4'd2+data31*4'd1;
		Gy_3 <= data13*4'd1+data23*4'd2+data33*4'd1;
	end
	else begin
		Gx_1 <= Gx_1;
		Gx_3 <= Gx_3; 
		Gy_1 <= Gy_1; 
		Gy_3 <= Gy_3;
	end
end

//拍2:计算绝对值
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0) begin
		Gx <= 13'b0;
		Gy <= 13'b0;
	end
	else if(ien==1'b1) begin
		Gx<= (Gx_1>Gx_3)?(Gx_1-Gx_3):(Gx_3-Gx_1);
		Gy<= (Gy_1>Gy_3)?(Gy_1-Gy_3):(Gy_3-Gy_1);
	end
	else begin
		Gx <= Gx;
		Gy <= Gy;
	end
end

//拍3:计算绝对值
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0) begin
		out <= 13'b0;
	end
	else if(ien==1'b1) begin
		out <= Gx + Gy;
	end
	else begin
		out <= out;	
	end
end

//第一次修改
/*
wire [9:0]judge;
assign judge = out[22:13];
*/

wire [13:0] thre;
assign thre = threshold;

//拍4：二值化
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0) begin
		target_data <= 10'b0;
	end
	else if(ien==1'b1) begin
	if(out<10'd20) begin
			target_data <= 10'b0000000000;
		end
		else begin
			target_data <= out;
		end
	end
	else begin
	      target_data <= 10'b0000000000;
	end
end

//输入使能延时
//延时4clk
reg 	[3:0]	per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(rst_n==1'b0)
		per_clken_r <= 4'b0000	;
	else 
		per_clken_r <= {per_clken_r[2:0], ien};	 
end
assign oen = per_clken_r[3];

endmodule



