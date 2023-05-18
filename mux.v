`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2023 19:06:50
// Design Name: 
// Module Name: mux
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


module mux (
  input [31:0] data0,
  input [31:0] data1,
  input sel,
  output reg [31:0] out
);

  always @* begin
    if (sel == 1'b0) begin
      out = data0;
    end else begin
      out = data1;
    end
  end
  
endmodule

