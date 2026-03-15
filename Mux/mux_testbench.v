`timescale 1ns/1ns

module testbench;
reg [31:0]a,b;
reg sel;
wire [31:0]y;

mux mux1(a,b,sel,y);

initial begin 
    $dumpfile("mux_testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
// Initial values;
a=32'h0; b=32'h0; sel=1'b0;

#5 a=32'h23; b=32'h12;
#5 sel=1'b1;
#5 sel=1'b0;
#5 $finish;

end
endmodule