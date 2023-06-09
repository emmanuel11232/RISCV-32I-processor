`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Este testbench tiene como objetivo probar los casos de operación
//a los que se puede ver sometida la ALU. En este caso se prueba
//suma, la resta con resultado positivo, y la resta con
// resultado negativo.
//////////////////////////////////////////////////////////////////////////////////


module ALU_Testbench;
  reg [31:0] data_r1; //Entrada de registro leído 1
  reg [31:0] data_r2; //Entrada de registro leído 2 o inmediato
  reg ALUControl; //Señal de control de la UC para definir operación
  wire [31:0] ALUResult; //Salida del resultado
  wire Negative; //Bandera de resultado negativo

//Unidad de test
  ALU ALUTest (
    .data_r1(data_r1),
    .data_r2(data_r2),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Negative(Negative)
  );

  initial begin
  // Inicialización de valores, prueba de suma
    data_r1 = 10;
    data_r2 = 5;
    ALUControl = 0;
    #5;

    // Prueba de actualización de valores.
    ALUControl = 0;
    data_r1 = 15;
    data_r2 = 14;
    #5;

    // Prueba de resta resultado positivo, no se enciende negative.
    ALUControl = 1;
    #5;
    // Prueba de resta resultado negativo, se enciende negative
    data_r1 = 4;
    data_r2 = 8;
    #5;
    
    $finish;
  end

endmodule


