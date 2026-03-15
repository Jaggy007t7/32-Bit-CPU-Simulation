`include "adder.v"
`include "alu.v"
`include "D_flop.v"
`include "extender.v"
`include "mux.v"

module data_path(
    input clk,
    input reset,
    input [31:0]instr,
    input [31:0]read_data,

    // Input control signals:-
    input [1:0]Regsrc,
    input [1:0]ImmSrc,
    input PCsrc,
    input AluSrc,
    input [1:0]Alu_control,
    input Reg_write,
    input MemToReg,


    output reg [31:0]alu_result,
    output reg [31:0]write_data,
    output reg [31:0]PC,
    output reg [3:0]alu_flags
);


wire [31:0]result,PcPlus4,PcPlus8,PCin, PCout;
wire [31:0]Ext_imm,RD1,RD2;
wire [31:0]SrcA,SrcB;     // Here RD1=SrcA;

// ALU logic;
mux #(.size(32))ALUmux(RD2,Ext_imm,ALUSrc,SrcB);
alu alu1(SrcA,SrcB,Alu_control,alu_result,alu_flags);

// Extender logic;
wire [23:0]Instr;
extender Ext(Instr,ImmSrc,Ext_imm);  // check for Instr

// Internal cicuit logic;
adder adder1(PCout,  ,PcPlus4);
adder adder2(PcPlus4, ,PcPlus8);

// PC logic;
mux #(.size(32))PCmux(PcPlus4,result,PCsrc,PCin);
D_flop d_flop(PCin,clk,reset,PCout);

endmodule