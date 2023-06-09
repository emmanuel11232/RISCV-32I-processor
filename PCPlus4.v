`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// El módulo corresponde a un sumador, que toma al valor actual de PC 
// y le suma el número cuatro como inmediato para obtener el valor PC+4 para la
// siguiente instrucción.
//////////////////////////////////////////////////////////////////////////////////


module PCPlus4 (
  input [31:0] pc, //Entrada del valor actual de PC
  output reg [31:0] pcplus4 //Salida de valor de PC+4
);

  always @* begin //En cualquier momento
    pcplus4 = pc + 32'd4; //Suma de PC + 4.
  end
  
endmodule
