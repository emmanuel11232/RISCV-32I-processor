`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Se encarga de la extensión del inmediato y la preparación de este para su 
// utilización en la ALU, debido a que en varias instrucciones se tiene un inmediato
// repartido en varias partes de la decodificación, por lo que este módulo se encarga
// de la unión de todas estas partes y de que el signo se mantenga con una salida
// de un dato de 32bits. También se encarga del acomodo del inmediato en la pseudo
// operación Lui
//////////////////////////////////////////////////////////////////////////////////


module Extend(
 input [31:0]instr, //Se introduce la instrucción con el immediato a extender
 input LuiOP,       //Señal para que la extensión a hacer sea la del inmediato de Lui
 input [1:0]immsrc, //Selector de tipo de extensión a realizar
 output reg[31:0]immext //Inmediato extendido
 );
 
always @(*) begin
    if (LuiOP) begin 
    //Si se requiere la extensión del inmediato de Lui se introducen 12 0s al inicio
       immext[31:0]={instr[31:12],12'b0};
    end else begin
        case(immsrc)
        //Dependiendo del tipo de instrucción se realiza la debida extensión
            //Tipo I
            2'b00: immext[31:0] = {{20{instr[31]}},instr[31:20]};
            //Tipo S
            2'b01:immext[31:0] = {{20{instr[31]}},instr[31:25],{instr[11:7]}};
            //Tipo B
            2'b10: immext = {{20{instr[31]}}, instr[7], instr[30:25],  instr[11:8],  1'b0};
            //Tipo J
            2'b11:immext[31:0] = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
            default: immext = 32'b0;
        endcase
    end
end
endmodule
