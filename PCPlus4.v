`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 22:46:59
// Design Name: 
// Module Name: PCPlus4
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


module PCPlus4 (
  input clk,
  input [31:0] pc,
  output reg [31:0] pcplus4
);

  always @(pc or posedge clk) begin
    pcplus4 <= pc + 4;
  end
  
endmodule
