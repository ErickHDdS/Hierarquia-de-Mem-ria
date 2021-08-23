module parte2(
	address,
	clock,
	data,
	wren,
	q);

	input	[4:0]  address;
	input	  clock;
	input	[7:0]  data;
	input	  wren;
	output	[7:0]  q;
	
	ramlpm RAMramlpm (
	address,
	clock,
	data,
	wren,
	q);
	
endmodule