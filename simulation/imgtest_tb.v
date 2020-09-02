//��Ƶ������

`timescale 1ns/1ns

module imgtest_tb();

parameter iw = 640;         //Ĭ����Ƶ���
parameter ih = 512;         //ͼ��߶�
parameter dvd_dw = 8;

parameter h_total = 1440;   //������
parameter v_total = 600;    //��ֱ����
parameter sync_b = 5;		 //��ǰ��
parameter sync_e = 55;      //��ͬ������
parameter vld_b = 65;       //�����

reg clk;
reg reset_1;
reg src_cel;

always @(reset_1 or clk)  begin
	if(reset_1 == 1'b0)
		clk <= 1'b0;
	else 
		clk <= #200 ~clk;
end

initial  begin
	begin
		clk <= 1'b0;
		reset_1 <= 1'b0;
	end
	#700 begin 
		reset_1 <= 1'b1;
	end
	#10000000
	$stop;
end

wire dv_clk;
wire dvsyn;
wire dhsyn;
wire [dvd_dw-1:0] dvd;

/*
	����ʱ���������һ����ƵԴ
*/

image_src#(.iw(iw), .ih(ih), .dw(dvd_dw), .h_total(h_total), .v_total(v_total), .sync_b(sync_b), .sync_e(sync_e), .vld_b(vld_b) )
img_src_ins(
	.clk(clk),
	.reset_1(reset_1),
	.src_sel(src_sel),
	.test_data(dvd),
	.test_dvalid(dhsyn),
	.test_vsync(dvsyn),
	.clk_out(dv_clk)
);

endmodule

