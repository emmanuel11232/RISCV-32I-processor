`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 01:58:19 PM
// Design Name: 
// Module Name: main_tb
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


module main_tb;
reg clk = 0;
reg rst = 0;

//wire [31:0]data_out;

main uut(
clk,
rst);


integer f = 0;
integer i = 0;
initial begin
  rst = 0;
  #1;
  rst = 1;
  clk = 0;
  #1;
  rst = 0;
  #325;
  f=$fopen("dump_memoria.txt","w");
  $fwrite(f, "Dirección   Valor\n"); 
      for (i = 0; i<256; i = i + 1)//Ciclo que recorre la Data Memory                 
      begin
          if (i%4 ==0 ) begin
          $fwrite(f, "0x%h  0x%h\n", i, uut.DataMemory1.ram[i]); //Escritura  
          end    
      end
    $fclose(f);
    $stop;

  $finish;

end
always #5 clk = clk + 1;

endmodule
