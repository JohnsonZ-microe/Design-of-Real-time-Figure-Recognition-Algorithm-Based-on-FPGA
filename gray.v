module gray(
input clk,
input iRST_n,
input [11 : 0] i_r_12b,
input [11 : 0] i_g_12b,
input [11 : 0] i_b_12b,
input i_h_sync,       
input i_v_sync,         
input i_data_en,         
output [11 : 0] o_y_12b,
output o_h_sync,        
output o_v_sync,        
output o_data_en         
);

parameter para_0183_12b = 12'd47; 
parameter para_0614_12b = 12'd157;
parameter para_0062_12b = 12'd16;
parameter para_16_12b = 12'd4096;


wire sign_cb;
wire sign_cr;
wire o_y_12btmp;

reg[13: 0] mult_r_for_y_14b;
reg[13: 0] mult_g_for_y_14b;
reg[13: 0] mult_b_for_y_14b;
reg[13: 0] add_y_0_14b;
reg[13: 0] add_y_1_14b;
reg[13: 0] result_y_14b;

reg i_h_sync_delay_1;
reg i_v_sync_delay_1;
reg i_data_en_delay_1;
reg i_h_sync_delay_2;
reg i_v_sync_delay_2;
reg i_data_en_delay_2;
reg i_h_sync_delay_3;
reg i_v_sync_delay_3;
reg i_data_en_delay_3;

initial
begin
	mult_r_for_y_14b <= 14'd0;
	mult_g_for_y_14b <= 14'd0;
	mult_b_for_y_14b <= 14'd0;
	add_y_0_14b <= 14'd0;
	add_y_1_14b <= 14'd0;
	result_y_14b <= 14'd0;
	i_h_sync_delay_1 <= 1'd0;
	i_v_sync_delay_1 <= 1'd0;
	i_data_en_delay_1 <= 1'd0;
	
	i_h_sync_delay_2 <= 1'd0;
	i_v_sync_delay_2 <= 1'd0;
	i_data_en_delay_2 <= 1'd0;
end

//第一层流水线
always @ (posedge clk or negedge iRST_n )
	begin
	if (!iRST_n)
		begin
			mult_r_for_y_14b <= 0;
		end	
	else
		mult_r_for_y_14b <= i_r_12b * para_0183_12b;
	end

always @ (posedge clk or negedge iRST_n )
	begin
	if (!iRST_n)
		begin
			mult_g_for_y_14b <= 0;
		end	
	else
		mult_g_for_y_14b <= i_g_12b * para_0614_12b;
	end

always @ (posedge clk or negedge iRST_n )
begin
	if (!iRST_n)
		begin
			mult_b_for_y_14b <= 0;
		end	
	else
	mult_b_for_y_14b <= i_b_12b * para_0062_12b;
end

//第二层流水线
always @ (posedge clk or negedge iRST_n )
begin
	if (!iRST_n)
		begin
			add_y_0_14b <= 0;
			add_y_1_14b <= 0;
		end	
	else
	begin
	add_y_0_14b <= mult_r_for_y_14b + mult_g_for_y_14b;
	add_y_1_14b <= mult_b_for_y_14b + para_16_12b;
	end
end

//第三层流水线
always @ (posedge clk or negedge iRST_n )
begin
	if (!iRST_n)
		begin
			result_y_14b <= 0;
		end	
	else
	result_y_14b <= add_y_0_14b + add_y_1_14b;
end

//输出
assign o_y_12btmp = (result_y_14b[13:12] == 2'b00) ? result_y_14b[11 : 0] : 12'hFFF;
assign o_y_12b = o_y_12btmp>>8;

always @ (posedge clk or negedge iRST_n )
begin
	if (!iRST_n)
		begin
			i_data_en_delay_1 <= 0;
			i_data_en_delay_2 <= 0;
			i_data_en_delay_3 <= 0;
		end	
	else
	begin
	i_h_sync_delay_1 <= i_h_sync;
	i_v_sync_delay_1 <= i_v_sync;
	i_data_en_delay_1 <= i_data_en;
	i_h_sync_delay_2 <= i_h_sync_delay_1;
	i_v_sync_delay_2 <= i_v_sync_delay_1;
	i_data_en_delay_2 <= i_data_en_delay_1;
	i_h_sync_delay_3 <= i_h_sync_delay_2;
	i_v_sync_delay_3 <= i_v_sync_delay_2;
	i_data_en_delay_3 <= i_data_en_delay_2;
	end
end


assign o_h_sync = i_h_sync_delay_3;
assign o_v_sync = i_v_sync_delay_3;
assign o_data_en = i_data_en_delay_3;

endmodule

