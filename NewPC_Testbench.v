`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 23:18:12
// Design Name: 
// Module Name: NewPC_Testbench
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


module NewPC_Testbench();

  reg clk;
  reg [31:0] pc;
  reg [31:0] immExt;
  wire [31:0] newpc;

  NewPC NewPC_test (
    .clk(clk),
    .pc(pc),
    .immExt(immExt),
    .newpc(newpc)
  );

  initial begin
    clk = 0;
    pc = 32'b00000000000000000000000000000000;
    immExt = 32'b00000000000000000000000000000100;
    
    #10;
    pc = 32'b00000000000000000000000000000100;
    
    #10;
    immExt = 32'b11111111111111111111111111111111;
    
    #10;
    pc = 32'b00000000000000000000000000000000;
    
    #10;
    immExt = 32'b00000000000000000000000000000001;
    
    #10;
    $finish;

  end

  always #5 clk = ~clk;

endmodule


