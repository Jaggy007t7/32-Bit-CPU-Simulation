module decoder(
    input [1:0]op,
    input [3:0]rd,
    input [5:0]funct,
    output reg [1:0]flagW,
    output reg Pcs, RegW, Memw,
    output reg MemtoReg, ALUSrc,
    output reg [1:0]Immsrc, Regsrc, Alu_control
);

// Internal connections;
reg Branch, ALUOp;
reg [9:0]controls;


// Main Decoder.

always @(*)begin 
    casex(op)
        2'b00:begin    
            if(funct[5])begin 
                controls=10'b0001001001; // Immediate Data Processing.
            end
            else begin 
                controls=10'0000001001; // Data-Processing register.
            end

        end

        2'b01:begin 
            if(funct[0]) controls = 10'b0001001001; // LDR - Load to register.
            else  controls = 10'b0011010100;       // STR - Store to register.
 
        end
        
        // B
        2'b10:begin 
            controls = 10'b1001100010;
        end

        // Unimplemented
        default: controls = 10'bx;
    endcase
end 



// ALU - Decoder;
parameter And=0; Or=1; add=2; Sub=3;
always @(*)begin 
    if(ALUOp)begin 
        case(funct[4:1])
            And: Alu_control=2'b00;
            Or: Alu_control=2'b01;
            add: Alu_control=2'b10;
            sub: Alu_control=2'b11;
            default: Alu_control=2'bx; //Unimplemented
        endcase

        // Flag values using truth table:-
        flagW[1] = funct[0];
        flagW = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
    end
    else begin 
        Alu_control = 2'b00;  // And operation for non DP instructions.
        flagW = 2'b00;        
    end
end

// From truth table;
assign PCS  = ((Rd == 4'b1111)&RegW) | Branch;

endmodule