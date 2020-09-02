/*
	实现x-y-z
*/
module abs(
	x,      
	y,
	z,
	o   
	);
	
parameter n = 18;

input [n-1:0] x;
input [n-1:0] y;
input [n-1:0] z;
output reg [n-1:0] o;

always@(x,y,z)  begin
	if((x>y)&&(x-y>z)) begin
		o<=x-y-z+18'd131072;
	end
	else if((x>y)&&(x-y<z)) begin
		o<=18'd131072-z+x-y;
	end
	else begin
		o<=18'd131072-z-y+x;
	end
end
endmodule
