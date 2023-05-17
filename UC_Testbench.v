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
// Declaraci�n de se�ales para el testbench
  reg [4:0] selector;
  reg Zero;
  wire Branch, Jump, PCSrc;
  wire [1:0] ImmSel;
  wire LUIOP, WDSrc, ALUSrc;
  wire ALUOP, Mem2Reg, MemWrite, RegWriteEn;

  // Instancia del m�dulo que se va a probar (ejemplo_case)
  UC dut(
    .selector(selector),
    .Zero(Zero),
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
    // Est�mulos del testbench
  initial begin
    // Asignar valores a las se�ales de entrada
    selector = 5'b00000;
    Zero = 0;

    // Esperar un tiempo para estabilizar las se�ales
    #10;

    // Cambiar los valores de las se�ales de entrada
    selector = 5'b00100;
    Zero = 0;

    // Esperar un tiempo
    #10;

    // Otro cambio en las se�ales de entrada
    selector = 5'b01000;
    Zero = 0;
    // Esperar un tiempo
    #10;
    
    // Otro cambio en las se�ales de entrada
    selector = 5'b11000;
    Zero = 1;
    // Esperar un tiempo
    #10;
    
    // Otro cambio en las se�ales de entrada
    selector = 5'b01101;
    Zero = 0;
    // Esperar un tiempo
    #10;
    
    // Otro cambio en las se�ales de entrada
    selector = 5'b11011;
    Zero = 0;

    // Esperar un tiempo
    #10;

    // Finalizar la simulaci�n
    $finish;
  end

  // Impresi�n de resultados
  always @*
  begin
    $display("selector: %b, Zero: %b, Branch: %b, Jump: %b, PCSrc: %b, ImmSel: %b, LUIOP: %b, WDSrc: %b, ALUSrc: %b, ALUOP: %b, Mem2Reg: %b, MemWrite: %b, RegWriteEn: %b", selector, Zero, Branch, Jump, PCSrc, ImmSel, LUIOP, WDSrc, ALUSrc, ALUOP, Mem2Reg, MemWrite, RegWriteEn);
  end
endmodule
