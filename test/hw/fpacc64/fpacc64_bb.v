
module fpacc64 (
	ao,
	areset,
	clk,
	en,
	n,
	r,
	x,
	xo,
	xu);	

	output		ao;
	input		areset;
	input		clk;
	input	[0:0]	en;
	input		n;
	output	[63:0]	r;
	input	[63:0]	x;
	output		xo;
	output		xu;
endmodule
