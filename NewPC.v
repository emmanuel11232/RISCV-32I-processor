`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 23:10:32
// Design Name: 
// Module Name: NewPC
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


module NewPC (
  input clk,
  input [31:0] pc,
  input [31:0] immExt,
  output reg [31:0] newpc
);

  always @(pc or immExt or posedge clk) begin
    newpc <= pc + immExt;
  end
  
endmodule

