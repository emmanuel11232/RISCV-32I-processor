`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 01:34:17 PM
// Design Name: 
// Module Name: main
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


module main(input clk,rst);
reg [31:0]pcinicial = 32'b0;
wire [31:0] pc;
wire [31:0]data_out;
wire [31:0] data0;
//wire [31:0] data1;
wire [31:0] mux_pc;
wire Branch;
wire Jump;
wire PCSrc;
wire [1:0] ImmSel;
wire LUIOP;
wire WDSrc;
wire ALUSrc;
wire ALUOP;
wire Mem2Reg;
wire MemWrite;
wire RegWriteEn;
wire Negative;
wire [31:0] temp;
wire [31:0]data_r1;
wire [31:0]data_r2;
wire [31:0]immext;
wire [31:0]NewPc;
wire [31:0]ALU_input2;
wire [31:0] ALUResult;
wire [31:0] MemoryOut;
wire [31:0] Result;
wire [31:0] WD;

//assign Negative = 1'b0;
FF_D FF1(clk, rst, mux_pc, pc);
Fetch Fetch1 (pc,clk, rst ,data_out);
PCPlus4 sumador1(pc, data0);
mux mux1(data0, NewPc, PCSrc, mux_pc);
UC UC1(data_out[6:2], Negative, Branch, Jump, PCSrc, ImmSel, LUIOP, WDSrc, ALUSrc, ALUOP, Mem2Reg, MemWrite, RegWriteEn);
Banco_Registros Banco1(clk, RegWriteEn, data_out[19:15],data_out[24:20], data_out[11:7], WD, rst, data_r1, data_r2);
Extend Extend1 (data_out, LUIOP,ImmSel, immext);
NewPC NewPC1 (pc, immext,NewPc);
mux mux2(data_r2, immext, ALUSrc, ALU_input2);
ALU ALU1 (data_r1, ALU_input2, ALUOP, ALUResult,Negative);
Data_Memory DataMemory1 (data_r2, ALUResult, MemWrite, clk,rst, MemoryOut);
mux mux3(MemoryOut, ALUResult, Mem2Reg, Result);
mux mux4(Result, immext, WDSrc, WD);

endmodule
