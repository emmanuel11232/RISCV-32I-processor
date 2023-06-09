`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Este testbench se encarga de la comprobaci�n del funcionamiento de cada 
// extensi�n de signo dependiente del tipo de instrucci�n.
// 
//////////////////////////////////////////////////////////////////////////////////


module Extend_tb();
//Inputs
reg [1:0]immsrc; //Tipo de extensi�n
reg [31:0]instr; //La instrucci�n completa con el inmediato a extender
reg LuiOP;       //Se�al para extensi�n de inmediato para Lui

//Outputs
wire [31:0]immext; //Inmediato extendido
//Unidad para testeo
Extend uut(
.immsrc(immsrc),
.instr(instr),
.LuiOP(LuiOP),
.immext(immext)
);

initial begin

immsrc=0;
LuiOP=0;
immsrc=2'b00;     //Extensi�n tipo I Se espera 00000000000000000000011111111111
instr=32'b01111111111100000000000000000000;
#10 immsrc=2'b01; //Extensi�n tipo S se espera 00000000000000000000011111111111
instr=32'b01111110000000000000111110000000;
#10 immsrc=2'b10; //Extensi�n tipo B se espera 00000000000000000000011111111110
instr=32'b01111110000000000000111100000000;
#10 immsrc=2'b11; //Extensi�n tipo J se espera 00000000000011111111111111111110
instr=32'b01111111111111111111000000000000;
#10 LuiOP=1;      //Introducci�n de 12 ceros al inicio para instrucci�n Lui
                  //Se espera 11111111111111111111000000000000
instr=32'b11111111111111111111111111111111;
#10;
$finish;

end
endmodule
