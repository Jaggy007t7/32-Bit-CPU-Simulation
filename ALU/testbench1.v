`timescale 1ns/1ns
module testbench;
reg [31:0]a,b;
reg [1:0]sel;
wire [31:0]result;
wire zero, negative, carry, overflow;
alu alu1(a,b,sel,result,zero,negative,overflow,carry);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,testbench);
    $monitor("time=%0t a=%d b=%d sel=%d result=%d", $time, a, b, sel, result);
end

initial begin 
// Initialize
    a = 32'd0;
    b = 32'd0;
    sel = 4'd0;

    // Test ADD
    #10 a = 32'd10; b = 32'd5;  sel = 4'd0;

    // Test SUB
    #10 a = 32'd20; b = 32'd8;  sel = 4'd1;

    // Test AND
    #10 a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; sel = 4'd2;

    // Test OR
    #10 a = 32'hAAAA5555; b = 32'h5555AAAA; sel = 4'd3;

    // Test XOR
    #10 a = 32'h12345678; b = 32'h87654321; sel = 4'd4;

    // Test SLT
    #10 a = 32'd5; b = 32'd10; sel = 4'd5;

    // Test Shift Left
    #10 a = 32'h00000001; b = 32'd4; sel = 4'd6;

    // Test Shift Right
    #10 a = 32'h00000010; b = 32'd2; sel = 4'd7;

    #10 $finish;

end
endmodule