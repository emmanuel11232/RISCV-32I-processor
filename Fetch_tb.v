module Fetch_tb;
////////////////////////////////////////////////////////////////////////////////
//En este testbench revisa la memoria de instrucciones encargada del Fetch, 
//Esta carga los datos de un archivo en las diferentes direcciones de memoria
//Se revisan varias direcciones para comprobar su correcta carga y lectura
//No se revisan todas ya que todas tienen la misma lógica
///////////////////////////////////////////////////////////////////////////////
 //Inputs
reg clk = 0; //Reloj
reg rst = 0; //Reset
  reg [31:0] pc; //Dirección de memoria para intrucción
//Outputs
  wire [31:0]data_out; //Datos en dirección indicada

Fetch uut(
.pc(pc),
.clk(clk),
.rst(rst),
.data_out(data_out)
);

initial begin
  clk = 0;
  //Se revisan diferentes direcciones de memoria;
  //Para el archivo de instrucciones usado se espera:
  pc=32'd0; //fe010113
  #5 pc=32'd4; //00812e23
  #10 pc=32'd8; //02010413
  #10 pc=32'd12; //0000b7b7
  #10 pc=32'd16; //bcd78793
  #10;
  $finish;
  
end
always #5 clk = clk + 1;
endmodule
