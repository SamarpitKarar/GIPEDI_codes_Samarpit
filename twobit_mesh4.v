`timescale 1ns / 1ps
module twobit_mesh4( 
  input [1:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16, //16 two bit inputs
input RD, WR, // RD = read , WR = write
input clk, reset,
output reg [3:0] led
);

wire [3:0] y[0:15];
reg [3:0] led_pattern[0:15];
reg out[0:15];
reg [3:0]  Count = 0; 
reg [3:0] FIFO [0:15]; 
reg [3:0]  readCounter = 0, writeCounter = 0; 

//twobit_comparator.v is instantiated 4 times for each node (i.e. 64 times in total) in order to connect the node in consideration with its neighboring 4 nodes
twobit_comparator wire12 (in1,in2,y[0][0]);
twobit_comparator wire15 (in1,in5,y[0][1]);
twobit_comparator wire14 (in1,in4,y[0][2]);
twobit_comparator wire113 (in1,in13,y[0][3]);

twobit_comparator wire23 (in2,in3,y[1][0]);
twobit_comparator wire26 (in2,in6,y[1][1]);
twobit_comparator wire21 (in2,in1,y[1][2]);
twobit_comparator wire214 (in2,in14,y[1][3]);

twobit_comparator wire34 (in3,in4,y[2][0]);
twobit_comparator wire37 (in3,in7,y[2][1]);
twobit_comparator wire32 (in3,in2,y[2][2]);
twobit_comparator wire315 (in3,in15,y[2][3]);

twobit_comparator wire41 (in4,in1,y[3][0]);
twobit_comparator wire48 (in4,in8,y[3][1]);
twobit_comparator wire43 (in4,in3,y[3][2]);
twobit_comparator wire416 (in4,in16,y[3][3]);

twobit_comparator wire56 (in5,in6,y[4][0]);
twobit_comparator wire59 (in5,in9,y[4][1]);
twobit_comparator wire58 (in5,in8,y[4][2]);
twobit_comparator wire51 (in5,in1,y[4][3]);

twobit_comparator wire67 (in6,in7,y[5][0]);
twobit_comparator wire610 (in6,in10,y[5][1]);
twobit_comparator wire65 (in6,in5,y[5][2]);
twobit_comparator wire62 (in6,in2,y[5][3]);

twobit_comparator wire78 (in7,in8,y[6][0]);
twobit_comparator wire711 (in7,in11,y[6][1]);
twobit_comparator wire76 (in7,in6,y[6][2]);
twobit_comparator wire73 (in7,in3,y[6][3]);

twobit_comparator wire85 (in8,in5,y[7][0]);
twobit_comparator wire812 (in8,in12,y[7][1]);
twobit_comparator wire87 (in8,in7,y[7][2]);
twobit_comparator wire84 (in8,in4,y[7][3]);

twobit_comparator wire912 (in9,in12,y[8][0]);
twobit_comparator wire95 (in9,in5,y[8][1]);
twobit_comparator wire910 (in9,in10,y[8][2]);
twobit_comparator wire913 (in9,in13,y[8][3]);

twobit_comparator wire109 (in10,in9,y[9][0]);
twobit_comparator wire106 (in10,in6,y[9][1]);
twobit_comparator wire1011 (in10,in11,y[9][2]);
twobit_comparator wire1014 (in10,in14,y[9][3]);

twobit_comparator wire1110 (in11,in10,y[10][0]);
twobit_comparator wire117 (in11,in7,y[10][1]);
twobit_comparator wire1112 (in11,in12,y[10][2]);
twobit_comparator wire1115 (in11,in15,y[10][3]);

twobit_comparator wire1211 (in12,in11,y[11][0]);
twobit_comparator wire128 (in12,in8,y[11][1]);
twobit_comparator wire129 (in12,in9,y[11][2]);
twobit_comparator wire1216 (in12,in16,y[11][3]);

twobit_comparator wire1316 (in13,in16,y[12][0]);
twobit_comparator wire139 (in13,in9,y[12][1]);
twobit_comparator wire1314 (in13,in14,y[12][2]);
twobit_comparator wire131 (in13,in1,y[12][3]);

twobit_comparator wire1413 (in14,in13,y[13][0]);
twobit_comparator wire1410 (in14,in10,y[13][1]);
twobit_comparator wire1415 (in14,in15,y[13][2]);
twobit_comparator wire142 (in14,in2,y[13][3]);

twobit_comparator wire1514 (in15,in14,y[14][0]);
twobit_comparator wire1511 (in15,in11,y[14][1]);
twobit_comparator wire1516 (in15,in16,y[14][2]);
twobit_comparator wire153 (in15,in3,y[14][3]);

twobit_comparator wire1615 (in16,in15,y[15][0]);
twobit_comparator wire1612 (in16,in12,y[15][1]);
twobit_comparator wire1613 (in16,in13,y[15][2]);
twobit_comparator wire164 (in16,in4,y[15][3]);

always @ (*)
begin

// outputs  of the sensor nodes
out[0] = y[0][0] || y[0][1] || y[0][2] || y[0][3];
out[1] = y[1][0] || y[1][1] || y[1][2] || y[1][3];
out[2] = y[2][0] || y[2][1] || y[2][2] || y[2][3];
out[3] = y[3][0] || y[3][1] || y[3][2] || y[3][3];
out[4] = y[4][0] || y[4][1] || y[4][2] || y[4][3];
out[5] = y[5][0] || y[5][1] || y[5][2] || y[5][3];
out[6] = y[6][0] || y[6][1] || y[6][2] || y[6][3];
out[7] = y[7][0] || y[7][1] || y[7][2] || y[7][3];
out[8] = y[8][0] || y[8][1] || y[8][2] || y[8][3];
out[9] = y[9][0] || y[9][1] || y[9][2] || y[9][3];
out[10] = y[10][0] || y[10][1] || y[10][2] || y[10][3];
out[11] = y[11][0] || y[11][1] || y[11][2] || y[11][3];
out[12] = y[12][0] || y[12][1] || y[12][2] || y[12][3];
out[13] = y[13][0] || y[13][1] || y[13][2] || y[13][3];
out[14] = y[14][0] || y[14][1] || y[14][2] || y[14][3];
out[15] = y[15][0] || y[15][1] || y[15][2] || y[15][3];

//If the output of a sensor node is high then, a unique LED glow pattern will be displayed corresponding to the node under consideration   
//The 4 LEDs will not glow if the output of a sensor node is low and thus, the corresponding LED glow pattern will not be displayed
  
	 if (out[0]==1)
	   led_pattern[0] = 4'b0000;
	 else
	   led_pattern[0] = 4'b0000;
		
	 if (out[1]==1)
	   led_pattern[1] = 4'b0001;
	 else
	   led_pattern[1] = 4'b0000;

	 if (out[2]==1)
	   led_pattern[2] = 4'b0010;
	 else
	   led_pattern[2] = 4'b0000;

	 if (out[3]==1)
	   led_pattern[3] = 4'b0011;
	 else
	   led_pattern[3] = 4'b0000;

	 if (out[4]==1)
	   led_pattern[4] = 4'b0100;
	 else
	   led_pattern[4] = 4'b0000;

	 if (out[5]==1)
	   led_pattern[5] = 4'b0101;
	 else
	   led_pattern[5] = 4'b0000;

	 if (out[6]==1)
	   led_pattern[6] = 4'b0110;
	 else
	   led_pattern[6] = 4'b0000;

	 if (out[7]==1)
	   led_pattern[7] = 4'b0111;
	 else
	   led_pattern[7] = 4'b0000;

	 if (out[8]==1)
	   led_pattern[8] = 4'b1000;
	 else
	   led_pattern[8] = 4'b0000;

	 if (out[9]==1)
	   led_pattern[9] = 4'b1001;
	 else
	   led_pattern[9] = 4'b0000;

	 if (out[10]==1)
	   led_pattern[10] = 4'b1010;
	 else
	   led_pattern[10] = 4'b0000;

	 if (out[11]==1)
	   led_pattern[11] = 4'b1011;
	 else
	   led_pattern[11] = 4'b0000;

	 if (out[12]==1)
	   led_pattern[12] = 4'b1100;
	 else
	   led_pattern[12] = 4'b0000;

	 if (out[13]==1)
	   led_pattern[13] = 4'b1101;
	 else
	   led_pattern[13] = 4'b0000;

	 if (out[14]==1)
	   led_pattern[14] = 4'b1110;
	 else
	   led_pattern[14] = 4'b0000;

	 if (out[15]==1)
	   led_pattern[15] = 4'b1111;
	 else
	   led_pattern[15] = 4'b0000;

end

//FIFO memory has been used here to sequentially display the unique LED glow pattern corresponding to each sensor node
always @ (posedge clk)
begin

  if (reset) begin 

   readCounter = 0; 

   writeCounter = 0; 

  end 

  else if (RD ==1'b1 && Count!=0) begin //read operation to display the LED glow pattern corresponding to a sensor node

   led  = FIFO[readCounter]; 

   readCounter = readCounter+1; 

  end 

  else if (WR==1'b1 && Count<16) begin //write operation to store an LED glow pattern in the FIFO memory
   FIFO[writeCounter]  = led_pattern[writeCounter]; 

   writeCounter  = writeCounter+1; 

  end 
  else; 
  
 if (writeCounter==16) 

  writeCounter=0; 

 else if (readCounter==16) 

  readCounter=0; 

 else;

 if (readCounter > writeCounter) begin 

  Count=readCounter-writeCounter; 

 end 

 else if (writeCounter > readCounter) 

  Count=writeCounter-readCounter; 

 else;


end
endmodule
