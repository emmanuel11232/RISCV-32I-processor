`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Este testbench se encarga de revisar la memoria de datos, se escribe en una
// dirección de memoria y se lee, se desactiva la escritura y se vuelve a leer
// Se tiene que solo se revisa una direccion de memoria ya que todas funcionan
// con la misma lógica.
//////////////////////////////////////////////////////////////////////////////////


module DataMemory_tb();

//Inputs
reg clk; //Reloj
reg rst; //Reset
reg we;  //activar o desactivar escritura 
reg [31:0]addr; //Dirección de memoria a leer
reg [31:0]data; //Datos a escribir
//Outputs
wire [31:0]q;   //Datos leídos
//Unidad para testeo
Data_Memory uut(
.data(data),
.addr(addr),
.we(we),
.clk(clk),
.rst(rst),
.q(q)
);

initial begin
//Se inician todas las variables, se prueba 
clk=0; 
rst=1;
#1;
rst=0;
//Toda la memoria está en 0 por el reset
we=1; //Se activa la escritura y se escribe 45 en 77
data=32'd45;
addr=32'd77;
#10;
we=0; //Se desactiva la escritura y se intenta escribir en 77, no debería cambiar
data=32'd35;
#10;

$finish;
end
always #5 clk = clk + 1;
endmodule
