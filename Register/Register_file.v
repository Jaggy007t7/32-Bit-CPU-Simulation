module regfile(
    input clk,
    input WE3, // Write enable (Control Signal)
    input [3:0]A1,
    input [3:0]A2, // 2 - 4 Bit read data addresses 
    input [3:0]A3, // Address for write data.
    input [31:0]WD3, R15,
    output reg [31:0]read_data1,
    output reg [31:0]read_data2
);

reg [31:0]memory[14:0];   // Only 15 locations for storing becase 16th location is R15.



always @(posedge clk)begin 
    if(WE3 == 1'b1)begin 
        memory[A3] = WD3;
    end
    read_data1 = (A1 == 4'b1111)?R15:memory[A1];
    read_data2 = (A2 == 4'b1111)?R15:memory[A2];
end

endmodule