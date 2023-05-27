`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 22:27:03
// Design Name: 
// Module Name: UC
// Project Name: Proyecto RISC-V
// Target Devices: 
// Tool Versions: 
// Description: Este módulo toma los bits del [6:2] de la instrucción (esto porque los bits del [0:1] siempre son 11 para todas las instrucciones)
//              y genera las señales de control apropiadas para cada caso.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UC(
  //Se definen las entradas y salidas del módulo
  input [4:0] selector,
  input Negative,

  output reg Branch,
  output reg Jump,
  output reg PCSrc,
  output reg [1:0] ImmSel,
  output reg LUIOP,
  output reg WDSrc,
  output reg ALUSrc,
  output reg ALUOP,
  output reg Mem2Reg,
  output reg MemWrite,
  output reg RegWriteEn
);
//Se colocan las salidas según la tabla de verdad diseñada para cada caso
always @(*)
  begin
    case (selector)
      5'b00000: begin
        Branch = 0;
        Jump = 0;
        ImmSel = 2'b00;
        LUIOP = 0;
        WDSrc = 0;
        ALUSrc = 1;
        ALUOP = 0;
        Mem2Reg = 0;
        MemWrite = 0;
        RegWriteEn = 1;
        PCSrc = (Branch & Negative) || Jump;
        end
      5'b00100: begin
        Branch = 0;
        Jump = 0;
        ImmSel = 2'b00;
        LUIOP = 0;
        WDSrc = 0;
        ALUSrc = 1;
        ALUOP = 0;
        Mem2Reg = 1;
        MemWrite = 0;
        RegWriteEn = 1;
        PCSrc = (Branch & Negative) || Jump;
        end
      5'b01000: begin
        Branch = 0;
        Jump = 0;
        ImmSel = 2'b01;
        LUIOP = 0;
        ALUSrc = 1;
        ALUOP = 0;
        MemWrite = 1;
        RegWriteEn = 0;
        PCSrc = (Branch & Negative) || Jump;
        end
      5'b11000: begin
        Branch = 1;
        Jump = 0;
        ImmSel = 2'b10;
        LUIOP = 0;
        ALUSrc = 0;
        ALUOP = 1;
        MemWrite = 0;
        RegWriteEn = 0;
        PCSrc = (Branch & Negative) || Jump;
        end
      5'b01101: begin
        Branch = 0;
        Jump = 0;
        LUIOP = 1;
        WDSrc = 1;
        MemWrite = 0;
        RegWriteEn = 1;
        PCSrc = (Branch & Negative) || Jump;
        end
      5'b11011: begin
        Branch = 0;
        Jump = 1;
        ImmSel = 2'b11;
        LUIOP = 0;
        WDSrc = 1;
        ALUOP = 0;
        MemWrite = 0;
        RegWriteEn = 1;
        PCSrc = (Branch & Negative) || Jump;
        end
      default:  begin
        Branch = 0;
        Jump = 0;
        ImmSel = 2'b00;
        LUIOP = 0;
        WDSrc = 0;
        ALUSrc = 0;
        ALUOP = 0;
        Mem2Reg = 0;
        MemWrite = 0;
        RegWriteEn = 0;
        PCSrc = 0;
        end
    endcase
  end
  //Lógica combinacional para el control de PCSource
  /*always @(*)
  begin
    PCSrc = (Branch & Negative) || Jump;
  end*/
endmodule
