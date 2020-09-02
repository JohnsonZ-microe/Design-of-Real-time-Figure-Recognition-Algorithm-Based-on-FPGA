/*
	分类模块
	延时：1个时钟周期
*/
module sort(
	clk,            //输入：时钟信号
	rst_n,          //输入：复位信号
	per_clken,      //输入：移位使能信号
	data1,          //输入：数据1
	data2,          //输入：数据2
	data3,          //输入：数据3 
	max_data,       //输出：最大值
	mid_data,       //输出：中值
	min_data        //输出：最小值
	);
	
input 					   clk;
input 					   rst_n;
input   						per_clken;
input	    	   [9:0]	   data1;
input 	    	[9:0]	   data2;
input 	    	[9:0]	   data3;
output	reg 	[9:0] 	max_data;
output	reg 	[9:0] 	mid_data;
output	reg 	[9:0] 	min_data;

//max
always @(posedge clk or negedge rst_n)  begin
	if(rst_n==1'b0)
		max_data <= 10'd0;
	else if(per_clken==1'b1) begin
		if(data1 >= data2 && data1 >= data3) 
			max_data <= data1;
		else if(data2 >= data1 && data2 >= data3)
			max_data <= data2;
		else if(data3 >= data1 && data3 >= data2)
			max_data <= data3;
	end
	else 
		max_data <= max_data;
end

always @(posedge clk or negedge rst_n)  begin
	if(!rst_n)
		mid_data <= 10'd0;
	else if(per_clken==1'b1) begin
		if((data2 >= data1 && data1 >= data3) || (data3 >= data1 && data1 >= data2))
			mid_data <= data1;
		else if((data1 >= data2 && data2 >= data3) || (data3 >= data2 && data2 >= data1))
			mid_data <= data2;
		else if((data1 >= data3 && data3 >= data2) || (data1 >= data3 && data3 >= data2))
			mid_data <= data3;
	end
	else
		mid_data <= mid_data;
end

always @(posedge clk or negedge rst_n)  begin
	if(!rst_n)
		min_data <= 10'd0;
	else if(per_clken==1'b1) begin
		if(data3 >= data2 && data2 >= data1)
			min_data <= data1;
		else if(data3 >= data1 && data1 >= data2)
			min_data <= data2;
		else if(data1 >= data2 && data2 >= data3)
			min_data <= data3;
	end
	else 
		min_data <= min_data;
end
	
endmodule 
