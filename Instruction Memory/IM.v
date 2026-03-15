// Instruction Memory

module imem(
    input [31:0]a;
    output [31:0]Intruction
);

reg [31:0]RAM[63:0]; // Ram has 64 enteries only and each entery is of 32 bit wide
initial begin 
    $readmemh("data.dat",RAM); // For storing data from .dat file to memory
end
assign Instruction = RAM[a[31:2]];

endmodule