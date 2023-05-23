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

  reg [31:0] pc;
  reg [31:0] immExt;
  wire [31:0] newpc;

  NewPC NewPC_test (
    .pc(pc),
    .immExt(immExt),
    .newpc(newpc)
  );

  initial begin
    pc = 32'b00000000000000000000000000000000;
    immExt = 32'b00000000000000000000000000000100;
    
    #5;
    pc = 32'b00000000000000000000000000000100;
    
    #5;
    immExt = 32'b11111111111111111111111111111111;
    
    #5;
    pc = 32'b00000000000000000000000000000000;
    
    #5;
    immExt = 32'b00000000000000000000000000000001;
    
    #5;
    $finish;

  end


endmodule


