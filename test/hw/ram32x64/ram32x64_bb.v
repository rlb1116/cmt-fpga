
module ram32x64 (
	data,
	address,
	wren,
	clock,
	q);	

	input	[63:0]	data;
	input	[4:0]	address;
	input		wren;
	input		clock;
	output	[63:0]	q;
endmodule
