`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 00:15:10
// Design Name: 
// Module Name: ALU_Testbench
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


module ALU_Testbench();

  reg clk;
  reg [31:0] data_r1;
  reg [31:0] data_r2;
  reg ALUControl;
  wire [31:0] ALUResult;
  wire Negative;

  ALU ALU_test (
    .clk(clk),
    .data_r1(data_r1),
    .data_r2(data_r2),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Negative(Negative)
  );

  initial begin
    clk = 0;
    data_r1 = 32'b00000000000000000000000000001110;
    data_r2 = 32'b00000000000000000000000000001111;
    ALUControl = 1'b1;
    #50;
    ALUControl = 1'b0;
    
    #100;
    $finish;

  end

  always #5 clk = ~clk;

endmodule

