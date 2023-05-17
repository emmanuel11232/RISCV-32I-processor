`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2023 11:10:56 PM
// Design Name: 
// Module Name: DataMemory_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DataMemory_tb();

//Inputs
reg clk;
reg we;
reg [31:0]addr;
reg [31:0]data;
//Outputs
wire [31:0]q;
//Unidad para testeo
Data_Memory uut(
.data(data),
.addr(addr),
.we(we),
.clk(clk),
.q(q)
);

initial begin
//Se inician todas las variables, se prueba 
clk=0; 
we=1;
data=0;
addr=32'd44;
#10 we=0; //Se desactiva el write enable, esto evita que se pueda escribir en la memoria
data=32'b01010101;
#10 we=1;//Se reactiva el write enable, hasta este momento se puede escribir en la memoria
data=32'd35;
#10 we=0;
#20 data=32'd99;
#5 we=1;
addr=32'd77;
#10 we=0;
addr=32'd44;

end
always #5 clk = clk + 1;
endmodule
