`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//El módulo iene como propósito calcular la siguiente dirección 
//de memoria de PC para instrucciones tipo B y J, es decir, al 
//valor actual de PC le suma el valor del inmediato
//////////////////////////////////////////////////////////////////////////////////


module NewPC (
  input [31:0] pc, //Entrada de valor atual de PC
  input [31:0] immExt, //Entrada del inmediato extendido para realizar el salto
  output reg [31:0] newpc //Salida de la nueva dirección de PC
);
//Realizar la operación en cada cambio en las entradas
  always @* begin
    newpc = pc + immExt; //Suma el PC más el inmediato
  end
  
endmodule

