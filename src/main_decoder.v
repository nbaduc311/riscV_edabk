module main_decoder(
    input  wire [6:0] op,
    output wire [1:0] ResultSrc,
    output wire       MemWrite,
    output wire       Branch, ALUSrc,
    output wire       RegWrite, Jump,
    output wire [1:0] ImmSrc,
    output wire [1:0] ALUOp
);
               
    reg [10:0] controls;

    assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp, Jump} = controls;

    always @(op) begin
        case(op)
            // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump

            // Load (I type) lw
            7'b0000011: controls = 11'b1_00_1_0_01_0_00_0;
            // Store (S type) sw
            7'b0100011: controls = 11'b0_01_1_1_00_0_00_0;
            // R type add, sub, and, or, sll, srl, slt
            7'b0110011: controls = 11'b1_xx_0_0_00_0_10_0;
            // Branch (B type) beq
            7'b1100011: controls = 11'b0_10_0_0_00_1_01_0;
            // I type addi, andi, ori, xori, slli, srli, slti
            7'b0010011: controls = 11'b1_00_1_0_00_0_10_0; 
            // jal
            7'b1101111: controls = 11'b1_11_0_0_10_0_00_1;
            default:    controls = 11'bx_xx_x_x_xx_x_xx_x; // ???
        endcase
    end
endmodule
