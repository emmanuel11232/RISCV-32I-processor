`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Este testbench tiene como objetivo probar los diferentes
// cambios a los que se puede ver sometido el mux, cambiando
// los valores de sus entradas o el valor
// lógico del selector
//////////////////////////////////////////////////////////////////////////////////

//Unidad de testeo
module mux_Testbench();
  reg [31:0] data0, data1; //Datos conectados a la entrada 0 y a la entrada 1
  reg sel;  //Selector lógico, es 0 o 1
  wire [31:0] out; //Salida de datos seleccionados

//Unidad de testeo
  mux mux_test (

    .data0(data0),
    .data1(data1),
    .sel(sel),
    .out(out)
  );

  initial begin
  //Se inicializan los valores conectados a las entradas 1 y 0.
    data0 = 32'b00000000000000000000000000000001;
    data1 = 32'b11111111111111111111111111111110;
    sel = 1'b0; //Se selecciona la entrada 0, salida es 1
    
    #10;
    sel = 1'b1; //Cambio en el selector, la salida es -2 decimal con signo
    
    #10;
    data1 = 32'b00000000000000000000000000000010;  //Cambio en el dato 1, la salida es 2 decimal
    
    #10;
    $finish;
  end

endmodule

