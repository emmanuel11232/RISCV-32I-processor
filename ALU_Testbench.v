`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 00:15:10
// Design Name: 
// Module Name: ALU_Testbench
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


module ALU_Testbench;
  reg [31:0] data_r1;
  reg [31:0] data_r2;
  reg ALUControl;
  wire [31:0] ALUResult;
  wire Negative;

  ALU ALUTest (
    .data_r1(data_r1),
    .data_r2(data_r2),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Negative(Negative)
  );

  initial begin
    data_r1 = 10;
    data_r2 = 5;
    ALUControl = 0;

    // Inicialización de valores
    #5;

    // Prueba de suma
    ALUControl = 0;
    data_r1 = 15;
    data_r2 = 14;
    #5;

    // Prueba de resta resultado positivo
    ALUControl = 1;
    #5;
    // Prueba de resta resultado negativo
    data_r1 = 4;
    data_r2 = 8;
    #5;
    
    $finish;
  end

endmodule


