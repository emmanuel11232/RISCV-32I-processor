`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Este módulo consiste en la memoria de datos la cual se se utiliza para
// almacenar instrucciones y datos durante la ejecución de un programa. La memoria
// consiste en un array de datos de acceso aleatorio, en cualquier momento se puede
// acceder a cualquier dirección de memoria. 
// 
//////////////////////////////////////////////////////////////////////////////////


module Data_Memory(
   input      [31:0]data, //Datos a escribir en la memoria
   input     [31:0]addr,  //Address de memoria a leer o escribir
   input we, clk,rst,     //Enable de escritura, reloj y reset 
   output     [31:0]q     //datos leídos     
   );
   
   
   integer i;
   localparam Espacio=255;
   reg        [31:0]ram[Espacio:0];
   always @ (posedge clk or negedge rst) 
   begin
        //Si se activa la escritura de datos
        if (we)
           ram[addr] <= data; //Se escriben los datos en la dirección indicada
   end
   always @ (negedge rst) 
   begin
        if (!rst) 
        begin
        //Si se da un reset, se asigna un 0 a todas las direcciones de memoria
            for (i = 0; i < Espacio; i = i + 1) 
            begin
                ram[i] <= 0;
            end
        end
   end
   assign q = ram[addr]; // lectura de datos con la dirección indicada (asíncrona)
endmodule