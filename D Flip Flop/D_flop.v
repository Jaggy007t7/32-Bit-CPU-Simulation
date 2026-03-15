// 32-Bit D Flip Flop;

module flop(
    input [31:0]data_in,
    input clk,
    input reset, //asynchronous reset
    output reg [31:0]data_out
);

always @(posedge clk or posedge reset)begin 
    if(reset == 1'b1)begin 
        data_out = 32'b0;
    end
    else begin 
        data_out<=data_in;
    end
end

endmodule