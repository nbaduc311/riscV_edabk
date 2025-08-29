module alu(
    input wire [31:0] SrcA, SrcB,
    input wire [2:0] ALUControl,
    output reg [31:0] ALUResult,
    output reg Zero
);
    
    always @(SrcA or SrcB or ALUControl) begin
        case (ALUControl) 
            3'b000: ALUResult = SrcA + SrcB; // ADD
            3'b001: ALUResult = SrcA - SrcB; // SUBTRACT
            3'b010: ALUResult = SrcA & SrcB; // AND
            3'b011: ALUResult = SrcA | SrcB; // OR
            3'b100: ALUResult = SrcA ^ SrcB; // XOR
            3'b101: ALUResult = SrcA << SrcB; // LEFT SHIFT
            3'b110: ALUResult = SrcA >> SrcB; // RIGHT SHIFT
            3'b111: ALUResult = (SrcA < SrcB) ? 32'b1 : 32'b0; // SET LESS THAN
            default: ALUResult = 32'b0; // Default case
        endcase
        
        Zero = (ALUResult == 32'b0);
    end
    
endmodule
