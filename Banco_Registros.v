`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Se define un conjunto de 32 registros de propósito general, numerados del 
// x0 al x31. Estos registros son de 32 bits de ancho y se utilizan para almacenar datos
// temporales, direcciones de memoria y resultados intermedios durante la ejecución de
// instrucciones.
//
// 
//////////////////////////////////////////////////////////////////////////////////


module Banco_Registros(
input clk, //Relog del sistema
input RegWriteEn, //Señal para permitir escritura en registros
input [4:0]read_r1,//Registro a leer 1
input [4:0]read_r2,//Registro a leer 2
input [4:0]rd,     //Registro a escribir
input [31:0]data,  //Datos a escribir en registro
input rst,         //Reset
output [31:0]data_r1,//Registro leído
output [31:0]data_r2 //Registro leído
);


//Instanciación de todos los registros a usar
reg [31:0]out_r1;
reg [31:0]out_r2;
reg [31:0]x0;
reg [31:0]x1;
reg [31:0]x2;
reg [31:0]x3;
reg [31:0]x4;
reg [31:0]x5;
reg [31:0]x6;
reg [31:0]x7;
reg [31:0]x8;
reg [31:0]x9;
reg [31:0]x10;
reg [31:0]x11;
reg [31:0]x12;
reg [31:0]x13;
reg [31:0]x14;
reg [31:0]x15;
reg [31:0]x16;
reg [31:0]x17;
reg [31:0]x18;
reg [31:0]x19;
reg [31:0]x20;
reg [31:0]x21;
reg [31:0]x22;
reg [31:0]x23;
reg [31:0]x24;
reg [31:0]x25;
reg [31:0]x26;
reg [31:0]x27;
reg [31:0]x28;
reg [31:0]x29;
reg [31:0]x30;
reg [31:0]x31;

//Se asignan todos los wires necesarios para cada registro
wire [31:0] x0_w = 32'b0; //Se asigna al registro 0 el valor de 0 
wire [31:0] x1_w   = x1;
wire [31:0] x2_w   = x2;
wire [31:0] x3_w   = x3;
wire [31:0] x4_w   = x4;
wire [31:0] x5_w   = x5;
wire [31:0] x6_w   = x6;
wire [31:0] x7_w   = x7;
wire [31:0] x8_w   = x8;
wire [31:0] x9_w   = x9;
wire [31:0] x10_w  = x10;
wire [31:0] x11_w  = x11;
wire [31:0] x12_w  = x12;
wire [31:0] x13_w  = x13;
wire [31:0] x14_w  = x14;
wire [31:0] x15_w  = x15;
wire [31:0] x16_w  = x16;
wire [31:0] x17_w  = x17;
wire [31:0] x18_w  = x18;
wire [31:0] x19_w  = x19;
wire [31:0] x20_w  = x20;
wire [31:0] x21_w  = x21;
wire [31:0] x22_w  = x22;
wire [31:0] x23_w  = x23;
wire [31:0] x24_w  = x24;
wire [31:0] x25_w  = x25;
wire [31:0] x26_w  = x26;
wire [31:0] x27_w  = x27;
wire [31:0] x28_w  = x28;
wire [31:0] x29_w  = x29;
wire [31:0] x30_w  = x30;
wire [31:0] x31_w  = x31;

always @(posedge clk, posedge rst) //Siempre que haya un reset o una señal positiva del reloj
    if (rst) begin
    //Si se da un reset se reinician todos los registros
        x0  <=32'd0;
        x1  <=32'd0;
        x2  <=32'd100; //Esto se realiza para poder acceder a lugares de memoria correctos
        x3  <=32'd0;
        x4  <=32'd0;
        x5  <=32'd0;
        x6  <=32'd0;
        x7  <=32'd0;
        x8  <=32'd0;
        x9  <=32'd0;
        x10 <=32'd0;
        x11 <=32'd0;
        x12 <=32'd0;
        x13 <=32'd0;
        x14 <=32'd0;
        x15 <=32'd0;
        x16 <=32'd0;
        x17 <=32'd0;
        x18 <=32'd0;
        x19 <=32'd0;
        x20 <=32'd0;
        x21 <=32'd0;
        x22 <=32'd0;
        x23 <=32'd0;
        x24 <=32'd0;
        x25 <=32'd0;
        x26 <=32'd0;
        x27 <=32'd0;
        x28 <=32'd0;
        x29 <=32'd0;
        x30 <=32'd0;
        x31 <=32'd0;
    end
    else
    begin
    if (RegWriteEn) begin 
    //Si se activa la señal para escritura, se asignan los datos leídos al registro seleccionado por rd
        if (rd==5'd1)  x1<=data;
        if (rd==5'd2)  x2<=data;
        if (rd==5'd3)  x3<=data;
        if (rd==5'd4)  x4<=data;
        if (rd==5'd5)  x5<=data;
        if (rd==5'd6)  x6<=data;
        if (rd==5'd7)  x7<=data;
        if (rd==5'd8)  x8<=data;
        if (rd==5'd9)  x9<=data;
        if (rd==5'd10) x10<=data;
        if (rd==5'd11) x11<=data;
        if (rd==5'd12) x12<=data;
        if (rd==5'd13) x13<=data;
        if (rd==5'd14) x14<=data;
        if (rd==5'd15) x15<=data;
        if (rd==5'd16) x16<=data;
        if (rd==5'd17) x17<=data;
        if (rd==5'd18) x18<=data;
        if (rd==5'd19) x19<=data;
        if (rd==5'd20) x20<=data;
        if (rd==5'd21) x21<=data;
        if (rd==5'd22) x22<=data;
        if (rd==5'd23) x23<=data;
        if (rd==5'd24) x24<=data;
        if (rd==5'd25) x25<=data;
        if (rd==5'd26) x26<=data;
        if (rd==5'd27) x27<=data;
        if (rd==5'd28) x28<=data;
        if (rd==5'd29) x29<=data;
        if (rd==5'd30) x30<=data;
        if (rd==5'd31) x31<=data;
    end
    end

always @(read_r1,read_r2) begin
    case(read_r1)
    //Se guarda el registro indicado por read_r1 en el registro out_r1
    5'd0 : assign out_r1=x0_w;
    5'd1 : assign out_r1=x1;
    5'd2 : assign out_r1=x2;
    5'd3 : assign out_r1=x3;
    5'd4 : assign out_r1=x4;
    5'd5 : assign out_r1=x5;
    5'd6 : assign out_r1=x6;
    5'd7 : assign out_r1=x7;
    5'd8 : assign out_r1=x8;
    5'd9 : assign out_r1=x9;
    5'd10 : assign out_r1=x10;
    5'd11 : assign out_r1=x11;
    5'd12 : assign out_r1=x12;
    5'd13 : assign out_r1=x13;
    5'd14 : assign out_r1=x14;
    5'd15 : assign out_r1=x15;
    5'd16 : assign out_r1=x16;
    5'd17 : assign out_r1=x17;
    5'd18 : assign out_r1=x18;
    5'd19 : assign out_r1=x19;
    5'd20 : assign out_r1=x20;
    5'd21 : assign out_r1=x21;
    5'd22 : assign out_r1=x22;
    5'd23 : assign out_r1=x23;
    5'd24 : assign out_r1=x24;
    5'd25 : assign out_r1=x25;
    5'd26 : assign out_r1=x26;
    5'd27 : assign out_r1=x27;
    5'd28 : assign out_r1=x28;
    5'd29 : assign out_r1=x29;
    5'd30 : assign out_r1=x30;
    5'd31 : assign out_r1=x31;
    default: out_r1=32'd0;
    endcase
    case(read_r2)
    //Se guarda el registro indicado por read_r2 en el registro out_r2
    5'd0 : assign out_r2=x0_w;
    5'd1 : assign out_r2=x1;
    5'd2 : assign out_r2=x2;
    5'd3 : assign out_r2=x3;
    5'd4 : assign out_r2=x4;
    5'd5 : assign out_r2=x5;
    5'd6 : assign out_r2=x6;
    5'd7 : assign out_r2=x7;
    5'd8 : assign out_r2=x8;
    5'd9 : assign out_r2=x9;
    5'd10 : assign out_r2=x10;
    5'd11 : assign out_r2=x11;
    5'd12 : assign out_r2=x12;
    5'd13 : assign out_r2=x13;
    5'd14 : assign out_r2=x14;
    5'd15 : assign out_r2=x15;
    5'd16 : assign out_r2=x16;
    5'd17 : assign out_r2=x17;
    5'd18 : assign out_r2=x18;
    5'd19 : assign out_r2=x19;
    5'd20 : assign out_r2=x20;
    5'd21 : assign out_r2=x21;
    5'd22 : assign out_r2=x22;
    5'd23 : assign out_r2=x23;
    5'd24 : assign out_r2=x24;
    5'd25 : assign out_r2=x25;
    5'd26 : assign out_r2=x26;
    5'd27 : assign out_r2=x27;
    5'd28 : assign out_r2=x28;
    5'd29 : assign out_r2=x29;
    5'd30 : assign out_r2=x30;
    5'd31 : assign out_r2=x31;
    default: out_r2=32'd0;
    endcase
end
//A la salida se le asigna el valor del registro out_r1 y out_r2 respectivamente
assign data_r1=out_r1;
assign data_r2=out_r2;
endmodule
