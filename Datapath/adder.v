// 32-Bit Adder
module adder(
    input [31:0]a,
    input [31:0]b,
    output [31:0]sum
);
wire carry;
assign {carry,sum} = a+b;
endmodule