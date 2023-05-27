`timescale 1ns/1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 22:37:05
// Design Name: 
// Module Name: UC_Testbench
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

module UC_Testbench;
// Declaración de señales para el testbench
  reg [4:0] selector;
  reg Negative;
  wire Branch, Jump, PCSrc;
  wire [1:0] ImmSel;
  wire LUIOP, WDSrc, ALUSrc;
  wire ALUOP, Mem2Reg, MemWrite, RegWriteEn;

  // Instancia del módulo que se va a probar (ejemplo_case)
  UC dut(
    .selector(selector),
    .Negative(Negative),
    .Branch(Branch),
    .Jump(Jump),
    .PCSrc(PCSrc),
    .ImmSel(ImmSel),
    .LUIOP(LUIOP),
    .WDSrc(WDSrc),
    .ALUSrc(ALUSrc),
    .ALUOP(ALUOP),
    .Mem2Reg(Mem2Reg),
    .MemWrite(MemWrite),
    .RegWriteEn(RegWriteEn)
    );
    // Estímulos del testbench
  initial begin
    // Asignar valores a las señales de entrada
    selector = 5'b00000;
    Negative = 0;

    // Esperar un tiempo para estabilizar las señales
    #10;

    // Cambiar los valores de las señales de entrada
    selector = 5'b00100;
    Negative = 0;

    // Esperar un tiempo
    #10;

    // Otro cambio en las señales de entrada
    selector = 5'b01000;
    Negative = 0;
    // Esperar un tiempo
    #10;
    
    // Otro cambio en las señales de entrada
    selector = 5'b11000;
    Negative = 1;
    // Esperar un tiempo
    #10;
    
    // Otro cambio en las señales de entrada
    selector = 5'b01101;
    Negative = 0;
    // Esperar un tiempo
    #10;
    
    // Otro cambio en las señales de entrada
    selector = 5'b11011;
    Negative = 0;

    // Esperar un tiempo
    #10;

    // Finalizar la simulación
    $finish;
  end

  // Impresión de resultados
  always @*
  begin
    $display("selector: %b, Negative: %b, Branch: %b, Jump: %b, PCSrc: %b, ImmSel: %b, LUIOP: %b, WDSrc: %b, ALUSrc: %b, ALUOP: %b, Mem2Reg: %b, MemWrite: %b, RegWriteEn: %b", selector, Negative, Branch, Jump, PCSrc, ImmSel, LUIOP, WDSrc, ALUSrc, ALUOP, Mem2Reg, MemWrite, RegWriteEn);
  end
endmodule
