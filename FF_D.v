`timescale 1ns / 1ps

module FF_D	(
    input wire clk, reset,
    input wire [31:0]d,
    output reg [31:0] q
);

always@(posedge clk, posedge reset) // always se ejecuta con un cambio positovo de clk o reset
    if (reset) // reset tiene prioridad por lo que se pregunta primero
        q<=32'b0; // reset
    else
        q<=d; // funcionamiento normal ffd
endmodule
