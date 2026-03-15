`timescale 1ns/1ns

module testbench;
reg [31:0]a,b;
wire [31:0]sum;

adder add1(a,b,sum);
initial begin 
    $dumpfile("adder_testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
#0 a=32'h36; b = 32'h37;
#5 a=32'h3; b = 32'h7;
#5 $finish;
end
endmodule