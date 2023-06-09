`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Este testbench tiene como objetivo, probar los diferentes saltos 
//a los que puede verse sometido el PC a la hora de 
//realizar un salto.
//////////////////////////////////////////////////////////////////////////////////


module NewPC_Testbench();

  reg [31:0] pc; //Entrada de valor atual de PC
  reg [31:0] immExt; //Entrada del inmediato extendido para realizar el salto
  wire [31:0] newpc; //Salida de la nueva dirección de PC

//Unidad de testeo
  NewPC NewPC_test (
    .pc(pc),
    .immExt(immExt),
    .newpc(newpc)
  );

  initial begin
  //Se inicializa el valor de PC en cero y el inmediato es 28, newpc = 28
    pc = 32'h0;
    immExt = 32'h28;
    
    #5;
    //Cambio en pc, newpc = 34 hexadecimal
    pc = 32'hc;
    
    #5;
    //Cambio en el inmediato, newpc=18 hexadecimal
    immExt = 32'hc;
    
    #5;
    $finish;

  end


endmodule


