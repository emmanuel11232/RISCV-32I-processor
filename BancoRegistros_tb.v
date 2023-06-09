`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Este testbench se encarga de revisar el banco de registros, se piden diferentes
// registros a leer y se comprueba si la salida de estos es la correcta, asimismo,
// se escribe en diferentes registros, no se necesitan muchas comprobaciones ya que 
// la lógica aplica igual para los 32 registros.
//////////////////////////////////////////////////////////////////////////////////


module BancoRegistros_tb;
//Inputs
reg clk=0; //Reloj
reg RegWriteEn; //Enable de escritura en registros
reg [4:0]read_r1; //Registro a leer 1
reg [4:0]read_r2; //Registro a leer 2
reg [4:0]rd;      //Registro a escribir
reg [31:0]data;   //Datos a escribir en registro
reg rst;          //Reset
//Outputs
wire [31:0]data_r1; //Datos leídos
wire [31:0]data_r2; //Datos leídos

//Unidad para testeo
Banco_Registros uut(
.clk(clk),
.RegWriteEn(RegWriteEn),
.read_r1(read_r1),
.read_r2(read_r2),
.rd(rd),
.data(data),
.rst(rst),
.data_r1(data_r1),
.data_r2(data_r2)
);

initial begin

//Se reinician los registros
rst = 1;
#1;
rst = 0;
read_r1=5'd0;
read_r2=5'd0;
//Se escribe en el registro 3
RegWriteEn=1;
data=32'd45;
rd=5'b00011;
#10;
//Se escribe en el registro 2
rd=5'b00010;
data=32'd8;
#10;
//Se leen los registros 2 y 3, se debe leer 45 y 8
read_r1=5'b0011;
read_r2=5'b0010;
RegWriteEn=0;
rd=5'b00001; //No se debería escribir nada en el registro 1
#10;
read_r1=2'b0001;//Se lee un registro en el que no se ha escrito, se debe leer 0
read_r2=2'b0001;//Se lee un registro en el que no se ha escrito, se debe leer 0
#10;
$finish;
end
always #5 clk = ~clk;
endmodule
