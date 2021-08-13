`timescale 1ns / 1ps

module twobit_mesh4_tb;

	// Inputs
	reg [1:0] in1;
	reg [1:0] in2;
	reg [1:0] in3;
	reg [1:0] in4;
	reg [1:0] in5;
	reg [1:0] in6;
	reg [1:0] in7;
	reg [1:0] in8;
	reg [1:0] in9;
	reg [1:0] in10;
	reg [1:0] in11;
	reg [1:0] in12;
	reg [1:0] in13;
	reg [1:0] in14;
	reg [1:0] in15;
	reg [1:0] in16;
	reg RD;
	reg WR;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] led;

	// Instantiate the Unit Under Test (UUT)
	twobit_mesh4 uut (
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4), 
		.in5(in5), 
		.in6(in6), 
		.in7(in7), 
		.in8(in8), 
		.in9(in9), 
		.in10(in10), 
		.in11(in11), 
		.in12(in12), 
		.in13(in13), 
		.in14(in14), 
		.in15(in15), 
		.in16(in16), 
		.RD(RD), 
		.WR(WR), 
		.clk(clk), 
		.reset(reset), 
		.led(led)
	);

	initial begin
	
    
		reset = 1'b1;
		WR = 1'b0;
		RD = 1'b0;
		#100 reset = 1'b0;		   
		in1 = 2'b00;
		in2 = 2'b10;
		in3 = 2'b10;
		in4 = 2'b01;
		in5 = 2'b11;
		in6 = 2'b00;
		in7 = 2'b10;
		in8 = 2'b01;
		in9 = 2'b01;
		in10 = 2'b11;
		in11 = 2'b00;
		in12 = 2'b10;
		in13 = 2'b01;
		in14 = 2'b01;
		in15 = 2'b11;
		in16 = 2'b00;
		
    // each LED pattern is first stored in the FIFO memory using write operation and then, displayed using the read operation
		#100 WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;		
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
		#200 RD = 1'b0;
		     WR = 1'b1;
		#200 WR = 1'b0;
		     RD = 1'b1;
	end
always 
begin
// clock period = 200ns
clk = 1'b0;
#100; 
clk = 1'b1;
#100;

end       
endmodule
