
module fpmult64 (
	a,
	areset,
	b,
	clk,
	en,
	q);	

	input	[63:0]	a;
	input		areset;
	input	[63:0]	b;
	input		clk;
	input	[0:0]	en;
	output	[63:0]	q;
endmodule
