`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// El modulo Fetch consiste en la memoria de instrucciones a la cual le va a entrar
// el address de pc el cual va a indicar la instruccion a ejecutar. Las memoria se 
// llena mediante un archivo.txt que contiene las instrucciones necesarias para la 
// 
//////////////////////////////////////////////////////////////////////////////////


module Fetch(
    input [31:0]pc, //Entrada pc es la direcci�n de memoria a revisar para obtener la instrucci�n deseada
    input clk, //Reloj y se�al de reset
    output reg [31:0]data_out //Instrucci�n le�da
    );
    //Se declara el tama�o de la memoria como la variable Espacio
    localparam Espacio=256;
    //Se declara la memoria
    reg [31:0] memory[Espacio:0];
    always @(*) begin
        //Se lee el archivo.txt con las instrucciones y se asigna a la salida la instrucci�n indicada por pc
         $readmemh("archivo.txt", memory, 0);
         data_out = memory[pc];
    end
endmodule
