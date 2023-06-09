`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//El m�dulo iene como prop�sito calcular la siguiente direcci�n 
//de memoria de PC para instrucciones tipo B y J, es decir, al 
//valor actual de PC le suma el valor del inmediato
//////////////////////////////////////////////////////////////////////////////////


module NewPC (
  input [31:0] pc, //Entrada de valor atual de PC
  input [31:0] immExt, //Entrada del inmediato extendido para realizar el salto
  output reg [31:0] newpc //Salida de la nueva direcci�n de PC
);
//Realizar la operaci�n en cada cambio en las entradas
  always @* begin
    newpc = pc + immExt; //Suma el PC m�s el inmediato
  end
  
endmodule

