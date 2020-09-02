//鏈ā鍧楃敤浜庡淇″彿寤惰繜2*640 + 6clk 涓椂搴

module delay(
	clk,                     //杈撳叆: 鏃堕挓淇″彿
	rst_n,                   //杈撳叆锛氬浣嶄俊鍙
	ien,
	oen,
	aclr,
	gauss_A_in,              //杈撳叆锛歡auss_A淇″彿
	delay_6x
	);
	
	

input clk;
input rst_n;
input ien;
input aclr;
input [9:0] gauss_A_in;
output reg[9:0] delay_6x;
output oen;

wire [9:0] gauss_A_out;
linebuffer_self linebuffer0(
	.aclr(aclr),             //鍚屾娓呴浂淇″彿
	.clken(ien),           //鏃堕挓浣胯兘淇″彿
	.clock(clk),           //鏃堕挓淇″彿
	.shiftin(gauss_A_in),         //鏁版嵁杈撳叆
	.shiftout(),
	.taps0x(),          //绗竴琛岀紦瀛
	.taps1x(gauss_A_out)           //绗簩琛岀紦瀛
	);

reg[9:0] delay_1x;
reg[9:0] delay_2x;
reg[9:0] delay_3x;
reg[9:0] delay_4x;
reg[9:0] delay_5x;


//寤舵椂1clk
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0)  begin
		delay_1x <= 10'b0;
	end
	else begin
		delay_1x <= gauss_A_out;
	end
end

//寤舵椂2clk
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0)  begin
		delay_2x <= 10'b0;
	end
	else begin
		delay_2x <= delay_1x;
	end
end

//寤舵椂3clk
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0)  begin
		delay_3x <= 10'b0;
	end
	else begin
		delay_3x <= delay_2x;
	end
end

//寤舵椂4clk
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0)  begin
		delay_4x <= 10'b0;
	end
	else begin
		delay_4x <= delay_3x;
	end
end

//寤舵椂5clk
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0)  begin
		delay_5x <= 10'b0;
	end
	else begin
		delay_5x <= delay_4x;
	end
end

//寤舵椂6clk
always@(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0)  begin
		delay_6x <= 10'b0;
	end
	else begin
		delay_6x <= delay_5x;
	end
end


//输入使能延时
//延时6clk
reg 	[5:0]	per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(rst_n==1'b0)
		per_clken_r <= 6'b000000	;
	else 
		per_clken_r <= {per_clken_r[4:0], ien};	 
end

assign oen = per_clken_r[5];

endmodule
