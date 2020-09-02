
/*
	Author: Zhao Zhongyv
	Project: image data simulation
*/


`timescale 1ns/1ns

`define SEEK_SET 0
`define SEEK_CUR 1
`define SEEK_END 2

module image_src(
	reset_1,          //ȫ�ָ�λ
	clk,              //ͬ��ʱ��
	src_sel,          //����Դͨ��ѡ��
	test_vsync,       //��ͬ�����
	test_dvalid,      //������Ч���
	test_data,        //�����������
	clk_out
);

parameter iw = 640;         //Ĭ����Ƶ���
parameter ih = 512;         //Ĭ����Ƶ�߶�
parameter dw = 8;

parameter h_total = 1440;   //������
parameter v_total = 600;    //��ֱ����

parameter sync_b = 5;		 //��ǰ��
parameter sync_e = 55;      //��ͬ������
parameter vld_b = 65;       //�����

input reset_1, clk;
input [3:0] src_sel;            //ѡ�������ļ�
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

always @(posedge clk or posedge test_vsync_temp )  begin      //��ͬ����Чʱ�����ļ���ȡ�����������������
	if (test_vsync_temp == 1'b1)  begin
		cnt <= 1'b0;                        //��һ֡����ʱ���ļ�ָ������
	end
	else begin
		if (test_dvalid_tmp == 1'b1)  begin     //��ͬ����Ч������ǰʱ��������Ч
		case(src_sel)   //ѡ��ͬ������Դ
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



	$fseek(fp_r,cnt,0);           //���ҵ�ǰ�ļ���Ҫ��ȡ���ļ�λ��
	$fscanf(fp_r, "%02x\n", test_data_reg);        //��ָ���ĸ�ʽ����test_data_reg�Ĵ���
	cnt <= cnt + 4;               // �ƶ��ļ�ָ�뵽��һ������
	$fclose(fp_r);                // �ر��ļ�
	$display("02x",test_data_reg);       //for debug use
	
	end
end 
 
//ˮƽ��������ÿ��һ��ʱ�Ӿ�+1���ӵ�h_total�������¼���

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
	
//��ֱ��������ˮƽ������������+1������������
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

//��ͬ���ź�����
always @(posedge clk or posedge reset_1) begin
	if (reset_1 == 1'b0) begin
		test_vsync_temp <= #1 1'b1;
	end
	else begin
		if(v_cnt>=sync_b & v_cnt <= sync_e)            //��ǰ��5 ~ ��ͬ������55
			test_vsync_temp <= #1 1'b1;
		else
			test_vsync_temp <= #1 1'b0;
	end
end

assign test_vsync = ~test_vsync_temp;

//ˮƽͬ���ź�����
always @(posedge clk or posedge reset_1) begin
	if (reset_1 == 1'b0) begin
		test_dvalid_tmp <= #1 1'b0;
	end
	else begin
		if(v_cnt>=vld_b & v_cnt < (vld_b + ih))  begin            //�����65 ~ ����� + Ĭ����Ƶ�߶� 65 + 512 
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

//ˮƽͬ���ź����
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

