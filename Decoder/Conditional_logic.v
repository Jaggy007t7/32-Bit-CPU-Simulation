`include "Dflipflop.v"
module Cond_Check(
    input [3:0]Cond,
    input [3:0]flags,     // This one is for condition.
    output [3:0]condx
);

wire neg,zero,carry,overflow,ge;
assign {neg,zero,carry,overflow,ge} = flags;
assign ge = ~(neg^overflow);

always @(*)begin 
    case(Cond)
        4'h0: condx= zero ;
        4'h1: condx= ~zero ;
        4'h2: condx= carry ;
        4'h3: condx= ~carry ;
        4'h4: condx=  neg;
        4'h5: condx=  ~neg;
        4'h6: condx=  overflow;
        4'h7: condx=  ~overflow;
        4'h8: condx=  carry & ~zero;
        4'h9: condx=  ~(carry & ~zero);
        4'hA: condx=  ge;
        4'hB: condx=  ~ge;
        4'hC: condx=  ~zero & ge;
        4'hD: condx=  ~(~zero & ge);
        4'hE: condx=  1'b1;
        default : condx = 1'bx;
endcase
end
endmodule


module condlogic(
    input clk, reset,
    input [3:0]Cond,
    input [3:0]alu_flags,
    input [1:0]flagW,
    input Pcs,
    input RegW,
    input Memw,
    output PCsrc,
    output regwrite,
    output Memwrite 
);

// Local wire; 
reg condx;
wire [1:0]Flagwrite;
wire [3:0]Flags;

// instantiation of D-ff;
flop #(.(width(2))) flagreg1(clk,Flagwrite[1],reset,alu_flags[3:2],flags[3:2]);
flop #(.(width(2))) flagreg2(clk,Flagwrite[0],reset,alu_flags[1:0],flags[1:0]);

// Logic:-
Cond_Check cc(Cond,flags,condx);
assign Flagwrite = flagW & {2{condx}}
assign regwrite = RegW & condx;
assign Memwrite = Memw & condx;
assign PCsrc = Pcs & condx;

endmodule
