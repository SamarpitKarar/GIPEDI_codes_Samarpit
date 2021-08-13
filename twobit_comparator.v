`timescale 1ns / 1ps

module twobit_comparator(
input [1:0] in1,in2,
output reg out
);

always @ (*)
begin

 if (in1 >= in2)
 begin
  out <= 1; //output of the sensor node in consideration will be high
 end
 
 else
 begin
  out <= 0; // otherwise output of the sensor node will be low
 end     

end
endmodule
