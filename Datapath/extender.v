// Extender is a piece of hardware that will extend it from 12 to 32 bit.
// It is based on the instruction set.
module extender(
    input [23:0]Instr,
    input [1:0]ImmSrc,
    output reg [31:0] ExtImm
);

parameter a=0,b=1,c=2;
always @(*)begin 
    case(ImmSrc)
        a: ExtImm = {24'b0,Instr[7:0]};
        b: ExtImm = {20'b0,Instr[11:0]};
        c: ExtImm = {{6{Instr[23]}}, Instr[23:0],2'b00};
        default: ExtImm = 32'bx;

    endcase
end

endmodule