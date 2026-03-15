`timescale 1ns/1ns

module testbench;
reg clk, reset;
reg [31:0]data_in;
wire [31:0]data_out;

flop flop1(data_in,clk,reset,data_out);

initial begin 
    $dumpfile("flop_testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
end
initial begin 
#0 reset=1'b1; data_in = 32'h67;
#7 reset=1'b0; 
#5 data_in = 32'h99;
#7 data_in = 32'd12;
#5 reset=1'b1;
#5 $finish;
end

endmodule