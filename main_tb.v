`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 01:58:19 PM
// Design Name: 
// Module Name: main_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_tb;
reg clk = 0;
reg rst = 0;

//wire [31:0]data_out;

main uut(

clk,
rst);

initial begin
  rst = 0;
  #1;
  rst = 1;
  clk = 0;
  #1;
  rst = 0;
  #318;
  $finish;



end
always #5 clk = clk + 1;
endmodule
