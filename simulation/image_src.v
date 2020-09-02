
/*
	Author: Zhao Zhongyv
	Project: image data simulation
*/


`timescale 1ns/1ns

`define SEEK_SET 0
`define SEEK_CUR 1
`define SEEK_END 2

module image_src(
	reset_1,          //全局复位
	clk,              //同步时钟
	src_sel,          //数据源通道选择
	test_vsync,       //场同步输出
	test_dvalid,      //像素有效输出
	test_data,        //像素数据输出
	clk_out
);

parameter iw = 640;         //默认视频宽度
parameter ih = 512;         //默认视频高度
parameter dw = 8;

parameter h_total = 1440;   //行总数
parameter v_total = 600;    //垂直总数

parameter sync_b = 5;		 //场前肩
parameter sync_e = 55;      //场同步脉冲
parameter vld_b = 65;       //场后肩

input reset_1, clk;
input [3:0] src_sel;            //选择输入文件
output test_vsync, test_dvalid, clk_out;
output [dw-1:0] test_data;

reg [dw-1:0] test_data_reg;
reg test_vsync_temp;
reg test_dvalid_tmp;
reg [1:0] test_dvalid_r;

reg [10:0] h_cnt = 0;
reg [10:0] v_cnt = 0;

integer fp_r;
integer cnt=0;

assign clk_out = clk;
assign test_data = test_data_reg;

always @(posedge clk or posedge test_vsync_temp )  begin      //行同步有效时，从文件读取数据输出到数据线上
	if (test_vsync_temp == 1'b1)  begin
		cnt <= 1'b0;                        //新一帧来到时，文件指针清零
	end
	else begin
		if (test_dvalid_tmp == 1'b1)  begin     //行同步有效，即当前时钟数据有效
		case(src_sel)   //选择不同的数据源
			4'b0000: fp_r = $fopen("txt_source/test_src0.txt", "r");
			4'b0001: fp_r = $fopen("txt_source/test_src1.txt", "r");
			4'b0010: fp_r = $fopen("txt_source/test_src2.txt", "r");
			4'b0011: fp_r = $fopen("txt_source/test_src3.txt", "r");
			4'b0100: fp_r = $fopen("txt_source/test_src4.txt", "r");
			4'b0101: fp_r = $fopen("txt_source/test_src5.txt", "r");
			4'b0110: fp_r = $fopen("txt_source/test_src6.txt", "r");
			4'b0111: fp_r = $fopen("txt_source/test_src7.txt", "r");
			4'b1000: fp_r = $fopen("txt_source/test_src8.txt", "r");
			4'b1001: fp_r = $fopen("txt_source/test_src9.txt", "r");
			4'b1010: fp_r = $fopen("txt_source/test_src10.txt", "r");
			4'b1011: fp_r = $fopen("txt_source/test_src11.txt", "r");
			4'b1100: fp_r = $fopen("txt_source/test_src12.txt", "r");
			4'b1101: fp_r = $fopen("txt_source/test_src13.txt", "r");
			4'b1110: fp_r = $fopen("txt_source/test_src14.txt", "r");
			4'b1111: fp_r = $fopen("txt_source/test_src15.txt", "r");
			default: fp_r = $fopen("txt_source/test_src0.txt", "r");
		endcase
		end



	$fseek(fp_r,cnt,0);           //查找当前文件需要读取的文件位置
	$fscanf(fp_r, "%02x\n", test_data_reg);        //按指定的格式读入test_data_reg寄存器
	cnt <= cnt + 4;               // 移动文件指针到下一个数据
	$fclose(fp_r);                // 关闭文件
	$display("02x",test_data_reg);       //for debug use
	
	end
end 
 
//水平计数器，每来一个时钟就+1，加到h_total置零重新计数

	always @(posedge clk or posedge reset_1)
	if (reset_1 == 1'b0) begin
		h_cnt <= #1 11'b00000000000;
	end
	else begin
		if (h_cnt == h_total-1)
			h_cnt <= #1 11'b00000000000;
		else
			h_cnt <= #1 h_cnt + 11'b00000000001;
	end
	
//垂直计数器，水平计数器计满后+1，计满后清零
always @(posedge clk or posedge reset_1) begin
	if(reset_1 == 1'b0) begin
		v_cnt <= #1 11'b00000000000;
	end
	else begin 
		if(h_cnt == h_total-1)  begin
			if (v_cnt == v_total-1) begin
				v_cnt <= #1 11'b00000000000;
			end
			else
				v_cnt <= #1 v_cnt + 11'b00000000001;
		end
	end
end

//场同步信号生成
always @(posedge clk or posedge reset_1) begin
	if (reset_1 == 1'b0) begin
		test_vsync_temp <= #1 1'b1;
	end
	else begin
		if(v_cnt>=sync_b & v_cnt <= sync_e)            //场前肩5 ~ 场同步脉冲55
			test_vsync_temp <= #1 1'b1;
		else
			test_vsync_temp <= #1 1'b0;
	end
end

assign test_vsync = ~test_vsync_temp;

//水平同步信号生成
always @(posedge clk or posedge reset_1) begin
	if (reset_1 == 1'b0) begin
		test_dvalid_tmp <= #1 1'b0;
	end
	else begin
		if(v_cnt>=vld_b & v_cnt < (vld_b + ih))  begin            //场后肩65 ~ 场后肩 + 默认视频高度 65 + 512 
			if(h_cnt == 10'b0000000000) begin
				test_dvalid_tmp <= #1 1'b1;
			end
			else if (h_cnt == iw)  begin
				test_dvalid_tmp <= #1 1'b0;
			end
		else
			test_dvalid_tmp <= #1 1'b0;
		end
	end
end

//水平同步信号输出
assign test_dvalid = test_dvalid_tmp;

always@(posedge clk or posedge reset_1)  begin
	if(reset_1 == 1'b0)  begin
		test_dvalid_r <= #1 2'b00;
	end
	else begin
		test_dvalid_r <= #1 ({test_dvalid_r[0], test_dvalid_tmp});
	end
end

endmodule

