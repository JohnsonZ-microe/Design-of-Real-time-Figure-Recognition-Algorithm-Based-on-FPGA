/*
中值滤波方法:
9宫格数据输入：
第一拍：输出3行中值，3行最大值，3行最小值
第二拍：3行最大值输出最小值，三行最小值输出最大值，三行中值输出中值
第三行：以上3值取中值
*/

module median_filter(
	clk,                          //输入：时钟信号
	rst_n,                        //输入：复位信号
	data11, data12, data13,       //输入：9像素数据
	data21, data22, data23,
	data31, data32, data33,
	ien,
	oen,
	target_data                   //中值滤波结果
);

input		clk;
input		rst_n;
input		[9:0]	data11, data12, data13;
input		[9:0]	data21, data22, data23;
input		[9:0]	data31, data32, data33;
	
output	[9:0]	target_data;

input ien;
output oen;

wire [9:0] max_data1;
wire [9:0] mid_data1;
wire [9:0] min_data1;

//拍1
sort	u_sort_1
(
	.clk		(clk),
	.rst_n		(rst_n),
	.per_clken  (ien),
	.data1		(data11), 
	.data2		(data12), 
	.data3		(data13),
	
	.max_data	(max_data1),
	.mid_data	(mid_data1),
	.min_data   (min_data1)
);

wire	[9:0]	max_data2, mid_data2, min_data2;
sort	u_sort_2
(
	.clk		(clk),
	.rst_n		(rst_n),
	.per_clken  (ien),
	.data1		(data21), 
	.data2		(data22), 
	.data3		(data23),
	
	.max_data	(max_data2),
	.mid_data	(mid_data2),
	.min_data   (min_data2)
);

wire	[9:0]	max_data3, mid_data3, min_data3;
sort	u_sort_3
(
	.clk		(clk),
	.rst_n		(rst_n),
	.per_clken  (ien),
	.data1		(data31), 
	.data2		(data32), 
	.data3		(data33),
	
	.max_data	(max_data3),
	.mid_data	(mid_data3),
	.min_data	(min_data3)
);

//拍2
wire	[9:0]	max_min_data, mid_mid_data, min_max_data;
sort	u_sort_4
(
	.clk		(clk),
	.rst_n		(rst_n),
	.per_clken  (ien),
	.data1		(max_data1), 
	.data2		(max_data2), 
	.data3		(max_data3),
	
	.max_data	(),
	.mid_data	(),
	.min_data   (max_min_data)
);

sort	u_sort_5
(
	.clk		(clk),
	.rst_n		(rst_n),
	.per_clken  (ien),
	.data1		(mid_data1), 
	.data2		(mid_data2), 
	.data3		(mid_data3),
	
	.max_data	(),
	.mid_data	(mid_mid_data),
	.min_data   ()
);

sort	u_sort_6
(
	.clk		(clk),
	.rst_n		(rst_n),
	.per_clken  (ien),
	.data1		(min_data1), 
	.data2		(min_data2), 
	.data3		(min_data3),
	
	.max_data	(min_max_data),
	.mid_data	(),
	.min_data   ()
);

//拍3
sort	u_sort_7
(
	.clk		(clk),
	.rst_n		(rst_n),
	.per_clken  (ien),
	.data1		(max_min_data), 
	.data2		(mid_mid_data), 
	.data3		(min_max_data),
	
	.max_data	(),
	.mid_data	(target_data),
	.min_data   ()
);


//输入使能延时
//根据仿真结果, 水平方向延时3clk
reg [2:0] per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(rst_n==1'b0)
		per_clken_r <= 3'b000	;
	else 
		per_clken_r <= {per_clken_r[1:0], ien};	 
end
assign oen = per_clken_r[2];


endmodule 
