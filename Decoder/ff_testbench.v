`timescale 1ns/1ns

module testbench;
reg clk,reset,enable;
reg [7:0]d;
wire [7:0]q;

flop ff(clk,enable,reset,d,q);

initial begin 
clk = 1'b0;
forever begin 
    #5 clk = ~clk;
end
end

initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
#0 reset=1'b1; d=8'haa;enable=1'b0;
#6 reset=1'b0;
#2 enable=1'b1;
#5 d = 8'hcc;
#10 $finish;


end

endmodule