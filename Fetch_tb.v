module Fetch_tb;

reg clk = 0;
reg rst = 0;
reg [31:0] pc;

wire [31:0]data_out;

Fetch uut(
.pc(pc),
.clk(clk),
.rst(rst),
.data_out(data_out)
);

initial begin
  clk = 0;
  // Desactivar reset
  rst = 0;
  
  pc=32'd10;
  #5 pc=32'd42;
  #10 pc=32'd66;
  #10 pc=32'd70;
  #10 pc=32'd82;
  
end
always #5 clk = clk + 1;
endmodule
