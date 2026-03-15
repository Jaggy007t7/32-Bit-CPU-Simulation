module alu(
    input [31:0]a, // Input A.
    input [31:0]b, // Input B.
    input [1:0]sel,  // Select Input for operations to be performed.
    output reg [31:0]result,

    output wire zero,  // <-- Flags 
    output reg negative,
    output reg overflow,
    output reg carry
);

parameter A=0, B=1, c=2, d=3;
// (a) is for (and) operation.
// (b) is for (or) operation.
// (c) is for (addition) operation.
// (d) is for (Subtraction) operation.
initial begin 
    negative = 1'b0;
    overflow = 1'b0;
    carry = 1'b0;
end 

always @(*) begin 
    case(sel)
    A: begin 
        result = a&b;  // Bitwise and operation.
        carry = 1'b0;
        overflow = 1'b0;
    end

    B: begin 
        result = a|b;  // Bitwise or operation.
        carry = 1'b0;
        overflow = 1'b0;
    end

    c: begin 
        {carry,result} = a+b;
        overflow = carry;
    end

    d: begin 
        {carry,result} = a-b;   // Imprve the subtraction based on the signed and unsigned representation.
        overflow = carry;
    end 

    default: begin 
        result = 32'b0;
        carry = 1'b0;
        overflow = 1'b0;
    end
    endcase

end

assign zero = (result==32'b0)?1'b1:1'b0;


endmodule