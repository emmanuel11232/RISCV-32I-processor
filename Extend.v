`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2023 01:24:34 AM
// Design Name: 
// Module Name: Extend
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


module Extend(
 input [31:0]instr,
 input LuiOP,
 input [1:0]immsrc,
 output reg[31:0]immext);
 
always @(*) begin
    if (LuiOP) begin
       immext[31:0]=instr<<12;
    end else begin
        case(immsrc)
            //Tipo I
            2'b00: immext[31:0] = {{20{instr[31]}},instr[31:20]};
            //Tipo S
            2'b01:immext[31:0] = {{20{instr[31]}},instr[31:25],{instr[11:7]}};
            //Tipo B
            2'b10: immext = {{20{instr[31]}}, instr[7], instr[30:25],  instr[11:8],  1'b0};
            //Tipo J
            2'b11:immext[31:0] = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
            default: immext = 32'b0;
        endcase
    end
end
endmodule
