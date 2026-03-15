module(
    input clk,
    input [31:0]value,
    input [31:0]address,
    input write_enable,   //Control Signal
    output [31:0]stored_value
);
reg [31:0]memory[63:0];  // We are intended to write make2^32 locations but we wilmake only 64 locations.

always@(posedge clk)begin 
    if(write_enable)begin 
        memory[address[31:2]] = value; // Word aligned.
    end 
        stored_value = memory[address];
end
 assign stored_value = memory[address[31:2]];
endmodule