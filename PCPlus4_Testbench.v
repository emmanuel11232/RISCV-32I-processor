`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 22:50:38
// Design Name: 
// Module Name: PCPlus4_Testbench
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


module PCPlus4_Testbench();
  reg [31:0] pc;
  wire [31:0] pcplus4;

  PCPlus4 pcplus4_test (
    .pc(pc),
    .pcplus4(pcplus4)
  );

  initial begin
    pc = 32'b00000000000000000000000000000000;
    #5
    pc = 32'b00000000000000000000000000000001;
    #5
    pc = 32'b00000000000000000000000011111111;
    #5
    pc = 32'b11111111111111111111111111111111;
    #5
    $finish;
  end


endmodule

