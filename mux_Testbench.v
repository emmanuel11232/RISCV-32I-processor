`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2023 19:10:15
// Design Name: 
// Module Name: mux_Testbench
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


module mux_Testbench();
  reg clk;
  reg [31:0] data0, data1;
  reg sel;
  wire [31:0] out;

  mux mux_test (
    .clk(clk),
    .data0(data0),
    .data1(data1),
    .sel(sel),
    .out(out)
  );

  initial begin
    clk = 0;
    data0 = 32'b00000000000000000000000000000001;
    data1 = 32'b11111111111111111111111111111110;
    sel = 1'b0;
    
    #10;
    sel = 1'b1;
    
    #10;
    data1 = 32'b00000000000000000000000000000010;
    
    #10;
    $finish;
  end

  always #5 clk = ~clk;

endmodule

