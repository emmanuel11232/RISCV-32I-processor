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
/*
Las entradas de este módulo corresponden al clk y al reset. El clock varía cada 5 ns y el reset únicamente se activa al iniciar las pruebas para definir un estado inicial en los registros.
*/

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

/*
Los resultados esperado por instrucción son:
Instrucción 0: en x2 queda guardado un 68.
Instrucción 4: en el espacio de memoria 68 se guardó 0.
Instrucción 8: En x8 queda guardado un 100.
Instrucción C: se guarda 45056 en el registro 15.
Instrucción 10: se guarda en el registro 15 el valor de 43981 que es 45056-1075.
Instrucción 14: en la dirección 32 se guarda 43981.
Instrucción 18: guarda un 2 en el registro 15.
Instrucción 1c: guarda en la dirección 28 un 2.
Instrucción 20: guarda en la dirección 40 un 0.
Instrucción 24: guarda en la dirección 36 un 0.
Instrucción 28: pc pasa a 44 (hex).
Instrucción 44: carga un cero en el registro 14.
Instrucción 48: carga un dos en el registro 15.
Instrucción 4c: en este caso el x14 y el x15 tienen cero y dos respectivamente, por lo que brinca a 2c. 
Instrucción 2c: carga un cero en el registro 15.
Instrucción 30: el registro 15 queda con un 3.
Instrucción 34: guarda en la dirección 80 un 3.
Instrucción 38: carga un cero en el registro 15.
Instrucción 3c: el registro 15 ahora contiene un 1.
Instrucción 40: guarda en la dirección 76 un 1.
Instrucción 44: carga un 1 en el registro 14.
Instrucción 48: carga un dos en el registro 15.
Instrucción 4c: en este caso el x14 y el x15 tienen 1 y dos respectivamente, por lo que brinca a 2c. 
Instrucción 2c: carga un 3 en el registro 15.
Instrucción 30: el registro 15 queda con un 6.
Instrucción 34: guarda en la dirección 80 un 6.
Instrucción 38: carga un 1 en el registro 15.
Instrucción 3c: el registro 15 ahora contiene un 2.
Instrucción 40: guarda en la dirección 76 un 2.
Instrucción 44: carga un 2 en el registro 14.
Instrucción 48: carga un dos en el registro 15.
Instrucción 4c: en este caso el x14 y el x15 tienen dos y dos respectivamente, por lo que NO brinca a 2c. 
Instrucción 50: guarda un 0 en el registro 15.
*/
