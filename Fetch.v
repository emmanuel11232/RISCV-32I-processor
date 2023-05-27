`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2023 11:31:33 PM
// Design Name: 
// Module Name: Fetch
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


module Fetch(
    input [31:0]pc,
    input clk,rst,
    output reg [31:0]data_out
    );
    integer i;
    integer j;
    localparam Espacio=256;
    reg [31:0] memory[Espacio:0];
    always @(*) begin
        /*if (!rst) 
        begin
            for (i = 0; i < Espacio; i = i + 1) begin
                memory[i] <= 0;    
         end*/
         //for (j=0; j<Espacio; j=j+1)begin
         //   memory[i]<=0;
         //end
         $readmemh("C:/Users/Usuario MSI/Desktop/archivo.txt", memory, 0);
         data_out = memory[pc];
    end
endmodule
