`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//El m�dulo ALU se encarga de realizar las operaciones aritm�tico-l�gicas necesarias para las 
//instrucciones. En este caso, solamente se necesita realizar sumas y restas. 
//Adicionalmente, puede generar una bandera en caso de que su resultado en resta d� negativo.
//////////////////////////////////////////////////////////////////////////////////


module ALU (
  input [31:0] data_r1, //Entrada de registro le�do 1
  input [31:0] data_r2, //Entrada de registro le�do 2 o inmediato
  input ALUOP, //Se�al de control de la UC para definir operaci�n
  output reg [31:0] ALUResult, //Salida del resultado
  output reg Negative //Bandera de resultado negativo
);
   //Realizar la operaci�n en cada cambio en las entradas
  always @(*) begin 
    case (ALUOP) //Dos casos posibles de operaci�n
      1'b0: begin //La se�al de control es 0
            ALUResult = data_r1 + data_r2; // La operaci�n es suma.
            Negative = 0; //No es posible un resultado negativo
            end
      1'b1: begin
                ALUResult = data_r1 - data_r2; // La operaci�n es suma.
                Negative = ($signed(ALUResult) < 0); //La resultado con signo es mejor que 
                //cero, es decir, R2 data_r2 m�s grande que data_r1.
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





