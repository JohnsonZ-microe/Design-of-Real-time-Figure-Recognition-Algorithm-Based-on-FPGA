//共延时3个clk

module color_space #(
	parameter	DSIZE	= 10,
	parameter	MSIZE	= 12
)(
	input				clock  		,
	input          rst_n         ,
	input [DSIZE-1:0]	inR         ,
	input [DSIZE-1:0]	inG         ,
	input [DSIZE-1:0]	inB         ,
	output[DSIZE-1:0]	outY        ,
	output[DSIZE-1:0]	outCb       ,
	output[DSIZE-1:0]	outCr       ,
	input    ien,
	output   oen
);


/*
Y   =  0.257*R+0.504*G+0.098*B+16 
Cb 	= -0.148*R-0.291*G+0.439*B+128
Cr  =  0.439*R-0.368*G-0.071*B+128
|Y  |    |16 |              |65.738   129.057  25.06 |  |R|
|Cb | =  |128| +  (1/256) * |-37.945  -74.494  112.43| *|G|
|Cr |    |128|              |112.439  -94.154  -18.28|  |B|
Matrix
M = 
 0.257  +0.504  +0.098
-0.148  -0.291  +0.439
 0.439  -0.368  -0.071
M * 2**12 = 
  1053        2064         401
  -606       -1192        1798
  1798       -1507        -291
*/


reg [DSIZE+MSIZE-1:0]	Rxp0_257,Rxn0_148,Rxp0_439;
reg [DSIZE+MSIZE-1:0]	Gxp0_504,Gxn0_291,Gxn0_368;
reg [DSIZE+MSIZE-1:0]	Bxp0_098,Bxp0_439,Bxn0_071;
always@(posedge clock or negedge rst_n) begin
	if(rst_n == 1'b0) begin
	Rxp0_257	<= 21'd0;
	Rxn0_148	<= 21'd0;
	Rxp0_439	<= 21'd0;
	Gxp0_504	<= 21'd0;
	Gxn0_291	<= 21'd0;
	Gxn0_368	<= 21'd0;
	Bxp0_098	<= 21'd0;
	Bxp0_439	<= 21'd0;
	Bxn0_071	<= 21'd0;
	end
	else begin
	//1053  => 10000011101
	Rxp0_257	<= inR+(inR<<2)+(inR<<3)+(inR<<4)+(inR<<10);  
	//606   => 1001011110
	Rxn0_148	<= 0;                                   //(inR<<1)+(inR<<2)+(inR<<3)+(inR<<4)+(inR<<6)+(inR<<9);
	//1798  => 11100000110
	Rxp0_439	<= (inR<<1)+(inR<<2)+(inR<<8)+(inR<<9)+(inR<<10);
	//2064  => 100000010000
	Gxp0_504	<= (inG<<4)+(inG<<11);
	//1192  => 10010101000
	Gxn0_291	<= 0;                                    //(inG<<3)+(inG<<5)+(inG<<7)+(inG<<10);
	//1507  => 10111100011
	Gxn0_368	<= 0;                                    //inG + (inG<<1)+(inG<<5)+(inG<<6)+(inG<<7)+ (inG<<8)+(inG<<10);
	//401   => 110010001
	Bxp0_098	<= inB + (inB<<4)+(inB<<7)+(inB<<8);
	//1798  => 11100000110
	Bxp0_439	<=(inB<<1)+(inB<<2)+(inB<<8)+(inB<<9)+ (inB<<10);
	//291  => 100100011
	Bxn0_071	<= 0;                                    //inB +(inB<<1)+(inB<<5)+(inB<<8);
	end
end


reg [DSIZE-1:0]	Rxp0_257__Gxp0_504;
reg [DSIZE-1:0]	Rxn0_148__Gxn0_291;
reg [DSIZE-1:0]	Gxn0_368__Bxn0_071;

reg [DSIZE-1:0]	Bxp0_098__16;
reg [DSIZE-1:0]	Bxp0_439__128;
reg [DSIZE-1:0]	Rxp0_439__128;

always@(posedge clock or negedge rst_n)begin
if(rst_n == 1'b0)  begin
	Rxp0_257__Gxp0_504   <=  10'b0;
	Rxn0_148__Gxn0_291   <=  10'b0;
	Gxn0_368__Bxn0_071   <=  10'b0;

	Bxp0_098__16		<=  10'b0;
	Bxp0_439__128		<=  10'b0;
	Rxp0_439__128		<=  10'b0;  
end
else  begin
	Rxp0_257__Gxp0_504	<= Rxp0_257[DSIZE+MSIZE-1:MSIZE] + Gxp0_504[DSIZE+MSIZE-1:MSIZE];
	Rxn0_148__Gxn0_291	<= Rxn0_148[DSIZE+MSIZE-1:MSIZE] + Gxn0_291[DSIZE+MSIZE-1:MSIZE];
	Gxn0_368__Bxn0_071	<= Gxn0_368[DSIZE+MSIZE-1:MSIZE] + Bxn0_071[DSIZE+MSIZE-1:MSIZE];

	Bxp0_098__16		<= Bxp0_098[DSIZE+MSIZE-1:MSIZE] + (2**DSIZE)/16;
	Bxp0_439__128		<= Bxp0_439[DSIZE+MSIZE-1:MSIZE] + (2**DSIZE)/2;
	Rxp0_439__128		<= Rxp0_439[DSIZE+MSIZE-1:MSIZE] + (2**DSIZE)/2;
end
end

reg [DSIZE-1:0]	Rxp0_257__Gxp0_504___Bxp0_098__16;
reg [DSIZE-1:0]	Rxn0_148__Gxn0_291___Bxp0_439__128;
reg [DSIZE-1:0]	Gxn0_368__Bxn0_071___Rxp0_439__128;

always@(posedge clock or negedge rst_n)begin
if(rst_n == 1'b0) begin
	Rxp0_257__Gxp0_504___Bxp0_098__16   <= 10'b0;
	Rxn0_148__Gxn0_291___Bxp0_439__128  <= 10'b0;
   Gxn0_368__Bxn0_071___Rxp0_439__128  <= 10'b0;
end
else begin
	Rxp0_257__Gxp0_504___Bxp0_098__16	<= Rxp0_257__Gxp0_504 	+ Bxp0_098__16;
	Rxn0_148__Gxn0_291___Bxp0_439__128	<= Bxp0_439__128		- Rxn0_148__Gxn0_291;
	Gxn0_368__Bxn0_071___Rxp0_439__128	<= Rxp0_439__128		- Gxn0_368__Bxn0_071;
end
end    


assign	outY  		=  Rxp0_257__Gxp0_504___Bxp0_098__16; 
assign	outCb       =  Rxn0_148__Gxn0_291___Bxp0_439__128;
assign	outCr       =  Gxn0_368__Bxn0_071___Rxp0_439__128; 

//输入使能延时
//延时3clk
reg 	[2:0]	per_clken_r;
always @(posedge clock or negedge rst_n)begin
	if(rst_n==1'b0)
		per_clken_r <= 3'b000	;
	else 
		per_clken_r <= {per_clken_r[1:0], ien};	 
end

assign oen = per_clken_r[2];

endmodule

