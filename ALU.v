`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//El módulo ALU se encarga de realizar las operaciones aritmético-lógicas necesarias para las 
//instrucciones. En este caso, solamente se necesita realizar sumas y restas. 
//Adicionalmente, puede generar una bandera en caso de que su resultado en resta dé negativo.
//////////////////////////////////////////////////////////////////////////////////


module ALU (
  input [31:0] data_r1, //Entrada de registro leído 1
  input [31:0] data_r2, //Entrada de registro leído 2 o inmediato
  input ALUOP, //Señal de control de la UC para definir operación
  output reg [31:0] ALUResult, //Salida del resultado
  output reg Negative //Bandera de resultado negativo
);
   //Realizar la operación en cada cambio en las entradas
  always @(*) begin 
    case (ALUOP) //Dos casos posibles de operación
      1'b0: begin //La señal de control es 0
            ALUResult = data_r1 + data_r2; // La operación es suma.
            Negative = 0; //No es posible un resultado negativo
            end
      1'b1: begin
                ALUResult = data_r1 - data_r2; // La operación es suma.
                Negative = ($signed(ALUResult) < 0); //La resultado con signo es mejor que 
                //cero, es decir, R2 data_r2 más grande que data_r1.
             end
      default: 
        begin
            //En cualquier otro caso se definen como cero por defecto.
            ALUResult = 0; 
            Negative = 0;
        end
    endcase
  end
  
endmodule





