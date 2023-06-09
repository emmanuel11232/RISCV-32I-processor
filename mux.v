`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//El mux se encarga de dar en su salida los 
//datos que se encuentran conectados a la entrada 0 o a la entrada 1, 
//según lo que defina su selector lógico.
//////////////////////////////////////////////////////////////////////////////////


module mux (
  input [31:0] data0, //Datos conectados a la entrada 0
  input [31:0] data1, //Datos conectados a la entrada 1
  input sel, //Selector lógico, es 0 o 1
  output reg [31:0] out //Salida de datos seleccionados
);

  always @* begin //Para cualquier cambio en las entradas
    if (sel == 1'b0) begin //Si el selector lógico es 0
      out = data0; //Se define la salida como los datos de en la entrada 0
    end 
    else  begin //Si el selector lógico es 1
      out = data1; //Se define la salida como los datos de en la entrada 1
    end
  end
  
endmodule

