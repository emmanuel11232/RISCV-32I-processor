`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 11:04:38 PM
// Design Name: 
// Module Name: BancoRegistros_tb
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


module BancoRegistros_tb;
//Inputs
reg clk;
reg RegWriteEn;
reg [4:0]read_r1;
reg [4:0]read_r2;
reg [4:0]rd;
reg [31:0]data;
reg rst;
//Outputs
wire [31:0]data_r1;
wire [31:0]data_r2;

//Unidad para testeo
Banco_Registros uut(
.clk(clk),
.RegWriteEn(RegWriteEn),
.read_r1(read_r1),
.read_r2(read_r2),
.rd(rd),
.data(data),
.rst(rst),
.data_r1(data_r1),
.data_r2(data_r2)
);

initial begin
//Inputs
rst = 0;
clk=0;
read_r1=0;
read_r2=0;
RegWriteEn=0;
data=0;
#1 rst = 1;
#1 rst = 0;
read_r1=2'b0011;
read_r2=2'b0010;
RegWriteEn=1;
data=10'd45;
rd=2'b00011;
read_r2=2'b0010;
#100 rst=1;
#100 rst=0;
rd=2'b00001;
end
always #5 clk = clk + 1;
endmodule
