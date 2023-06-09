`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Este testbench tiene como objetivo probar el funcionamiento
//correcto del módulo sumador de PC+4
//////////////////////////////////////////////////////////////////////////////////


module PCPlus4_Testbench();
  reg [31:0] pc; //Entrada del valor actual de PC
  wire [31:0] pcplus4; //Salida de valor de PC+4

 //Unidad para testeo
  PCPlus4 pcplus4_test ( 
    .pc(pc),
    .pcplus4(pcplus4)
  );

  initial begin
    pc = 32'h0; //Se inicializa en cero, PC+4 = 4
    #5
    pc = 32'h4; //Se define en cuatro, PC+4 = 8
    #5
    pc = 32'h8; //Se define en ocho, PC+4 = c
    #5
    $finish;
  end


endmodule

