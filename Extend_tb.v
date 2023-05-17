`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 07:18:08 PM
// Design Name: 
// Module Name: Extend_tb
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


module Extend_tb();
//Inputs
reg [1:0]immsrc;
reg [31:0]instr;
reg LuiOP;

//Outputs
wire [31:0]immext;
//Unidad para testeo
Extend uut(
.immsrc(immsrc),
.instr(instr),
.LuiOP(LuiOP),
.immext(immext)
);

initial begin

immsrc=0;
LuiOP=0;
#5 immsrc=2'b00;
instr=32'b01111111111100000000000000000000;
#10 immsrc=2'b01;
instr=32'b01111110000000000000111110000000;
#10 immsrc=2'b10;
instr=32'b01111110000000000000111100000000;
#10 immsrc=2'b11;
instr=32'b01111111111111111111000000000000;
#10 LuiOP=1;
instr=32'b00000000000000000000111111111111;

end
endmodule
