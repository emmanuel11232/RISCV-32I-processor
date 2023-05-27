`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2023 10:37:22 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
   input      [31:0]data,
   input     [31:0]addr,
   input we, clk,rst,
   output     [31:0]q);
   
   integer i;
   localparam Espacio=256;
   reg        [31:0]ram[Espacio:0];
   always @ (posedge clk or negedge rst) 
   begin
        if (we)
           ram[addr] <= data;
   end
   always @ (negedge rst) 
   begin
        if (!rst) 
        begin
            for (i = 0; i < Espacio; i = i + 1) 
            begin
                ram[i] <= 0;
            end
        end
   end
   assign q = ram[addr]; // read with input address directly    
endmodule