`timescale 1ns / 1ps

module twobit_comparator_tb;

	// Inputs
	reg [1:0] in1;
	reg [1:0] in2;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	twobit_comparator uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 10;
		in2 = 01;
		// Here in1 > in2
		#1;
		
		in1 = 01;
		in2 = 10;
		// Here in1 < in2
		#1;
		
		in1 = 11;
		in2 = 11;
		// Here in1 = in2
		#1;
		
	end
      
endmodule


