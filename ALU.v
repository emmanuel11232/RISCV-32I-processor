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
  input [31:0] data_r1,
  input [31:0] data_r2,
  input ALUControl,
  output reg [31:0] ALUResult,
  output reg Negative
);
    //Realizar la operación en cada cambio en las entradas
  always @* begin 
    case (ALUControl)
      1'b0: begin 
            ALUResult = data_r1 + data_r2; // suma
            Negative = 0;
            end
      1'b1: begin
                ALUResult = data_r1 - data_r2; // resta
                // actualizar el valor de Negative en cada cambio
                Negative = ($signed(ALUResult) < 0);
             end
      default: ALUResult = 0;
    endcase
  end
  
endmodule





