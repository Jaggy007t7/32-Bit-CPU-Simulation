module flop #(parameter width=8)
(
    input clk,enable,reset,   // Asynchronous reset.
    input [width-1:0]d,
    output reg [width-1:0]q 
);

always @(posedge clk or posedge clk)begin 
    if(reset)begin 
        q=8'b0;
    end
    else begin 
        if(enable)begin 
            q<=d;
        end
    end
end
endmodule