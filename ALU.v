`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 00:03:06
// Design Name: 
// Module Name: ALU
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


module ALU (
  input clk,
  input [31:0] data_r1,
  input [31:0] data_r2,
  input ALUControl,
  output reg [31:0] ALUResult = 0,
  output reg Negative = 0
);

  always @(data_r1 or data_r2 or ALUControl or posedge clk) begin
    // actualizar los registros en cualquier caso
    ALUResult <= 0;
    Negative <= 0;
    
    // realizar la operación en el primer flanco
    case (ALUControl)
      1'b0: ALUResult <= data_r1 + data_r2; // suma
      1'b1: begin
                ALUResult <= data_r1 - data_r2; // resta
                // actualizar el valor de Negative en el primer flanco
                Negative <= ($signed(ALUResult) < 0);
               end
      default: ALUResult <= 0;
    endcase
    
  end
  
endmodule




