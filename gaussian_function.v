module gaussian_function(
	clk,       //输入：时钟信号
	rst_n,     //输入：复位信号
	Cb,        //输入：通道Cb输入
	Cr,        //输入：通道Cr输入
	gauss_A_out,      //输出：未计算exp的gauss值
	ien,
	oen
	);
	
input clk;
input rst_n;
input [9:0]Cb;
input [9:0]Cr;
input ien;
//output reg [3:0] gauss;
output [9:0] gauss_A_out;
output oen;

reg [19:0] gauss_A;


reg [9:0] gauss_cb_judge;
reg [9:0] gauss_cr_judge;
reg cb_sign;
reg cr_sign;

//拍1，计算绝对值与平方
always @(posedge clk or negedge rst_n) begin
	if(rst_n==1'b0)  begin
		gauss_cb_judge = 10'b0000000000;
		gauss_cr_judge = 10'b0000000000;
	end
	else begin
		if (Cb>10'd704) begin
			gauss_cb_judge = Cb - 10'd704;
			cb_sign = 1'b0;
		end
		else if(Cb <= 10'd704) begin
			gauss_cb_judge = 10'd704 - Cb;
			cb_sign =1'b1;
		end
		if (Cr>10'd780) begin
			gauss_cr_judge = Cr - 10'd780;
			cr_sign = 1'b0;
		end
		else if(Cr <= 10'd780) begin
			gauss_cr_judge = 10'd780 - Cr;
			cr_sign = 1'b1;
		end
	end
end 

wire [19:0]  gauss_cb_square;
wire [19:0]  gauss_cr_square;
wire [19:0]  gauss_cbcr_mult;

square square_cb(
	.dataa(gauss_cb_judge),
	.result(gauss_cb_square)
	);
	
square square_cr(
	.dataa(gauss_cr_judge),
	.result(gauss_cr_square)
	);
	
mult mult_crcb(
	.dataa(gauss_cb_judge),
	.datab(gauss_cr_judge),
	.result(gauss_cbcr_mult)
);


//reg [20:0] gauss_A;
wire sign;

assign sign = cb_sign ^ cr_sign;

wire [19:0] gauss_cb_square_eff;
wire [19:0] gauss_cr_square_eff;
wire [19:0] sign_gauss_crcb_mult_eff;

coeff_1 coeff_1_inp(
	.datain(gauss_cb_square),
	.dataout(gauss_cb_square_eff)
);

coeff_2 coeff_2_inp(
	.datain(gauss_cbcr_mult),
	.dataout(sign_gauss_crcb_mult_eff)

);

coeff_3 coeff_3_inp(
	.datain(gauss_cr_square),
	.dataout(gauss_cr_square_eff)
);

always@(gauss_cb_square_eff or gauss_cr_square_eff or sign_gauss_crcb_mult_eff or sign)  begin
if(sign_gauss_crcb_mult_eff > (gauss_cb_square_eff + gauss_cr_square_eff))  begin
	gauss_A <= 20'd0;
//	sign_gauss_crcb_mult_eff <= sign_gauss_crcb_mult_eff;
//	gauss_cb_square_eff <= gauss_cb_square_eff;
//	gauss_cr_square_eff <= gauss_cr_square_eff;
end
else begin
	if(sign == 1'b0) begin
	gauss_A <=  gauss_cb_square_eff + gauss_cr_square_eff - sign_gauss_crcb_mult_eff;
//	sign_gauss_crcb_mult_eff <= sign_gauss_crcb_mult_eff;
//	gauss_cb_square_eff <= gauss_cb_square_eff;
//	gauss_cr_square_eff <= gauss_cr_square_eff;
	end
	else begin
	gauss_A <=  gauss_cb_square_eff + gauss_cr_square_eff + sign_gauss_crcb_mult_eff;
	end
end
end


assign gauss_A_out = (gauss_A > 10'd1023)? 10'd1023:gauss_A[9:0];


//输入使能延时
//延时1clk
reg per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(rst_n==1'b0)
		per_clken_r <= 1'b0;
	else 
		per_clken_r <= ien;	 
end

assign oen = per_clken_r;

endmodule

