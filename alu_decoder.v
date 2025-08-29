module alu_decoder(
    input  wire       opb5,
    input  wire [2:0] funct3,
    input  wire       funct7b5,
    input  wire [1:0] ALUOp,
    output reg [2:0] ALUControl
);

    wire RtypeSub;
    assign RtypeSub = funct7b5 & opb5; // TRUE for R-type subtract

    always @(ALUOp or funct3 or RtypeSub) begin
        case (ALUOp)
            2'b00: ALUControl = 3'b000; // addition
            2'b01: ALUControl = 3'b001; // subtraction
            2'b10: begin
                case (funct3) // R-type or I-type ALU
                    3'b000: begin
                        if (RtypeSub) ALUControl = 3'b001; // sub
                        else ALUControl = 3'b000; // add, addi
                    end
                    3'b001: ALUControl = 3'b101; // sll, slli
                    3'b010: ALUControl = 3'b111; // slt, slti   
                    3'b100: ALUControl = 3'b100; // xor, xori  
                    3'b101: ALUControl = 3'b110; // srl, srli
                    3'b110: ALUControl = 3'b011; // or, ori
                    3'b111: ALUControl = 3'b010; // and, andi

                    // Add other cases for funct3 as needed
                    default: ALUControl = 3'bxxx; // undefined???
                endcase
            end
            default: ALUControl = 3'bxxx; // undefined???
        endcase
    end
endmodule