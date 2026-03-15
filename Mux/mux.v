// 32-Bit MUX
module mux #(parameter size = 32)(
    input [size-1:0]a,
    input [size-1:0]b,
    input sel,
    output [size-1:0]y
);

assign y = sel?b:a;
endmodule