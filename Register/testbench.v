`timescale 1ns/1ns
module testbench;
reg clk;
reg WE3; 
reg [3:0]A1;
reg [3:0]A2; 
reg [3:0]A3; 
reg [31:0]WD3;
reg [31:0]R15;
wire [31:0]rd1;
wire [31:0]rd2;

regfile regfile1(clk,WE3,A1,A2,A3,WD3,R15,rd1,rd2);
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
#0 WE3=1'b0; A3 = 4'b0011;  A1=4'b1010; A2=4'b1100; WD3=32'h13;
#6 WE3=1'b1; WD3=32'h31;
#1 A3 = 4'b1100;
#20 $finish;
end

endmodule 

// Almost working
