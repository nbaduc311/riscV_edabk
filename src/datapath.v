module datapath(
    input  wire clk, reset,
    input  wire [31:0] Instr,
    input  wire RegWrite,
    input  wire [1:0] ImmSrc,
    input  wire [2:0] ALUControl,
    input  wire [1:0] ResultSrc,
    input  wire PCSrc, ALUSrc,
    output wire Zero,
    output reg [31:0] PC,
    output wire [31:0] ALUResult, WriteData,
    input  wire [31:0] ReadData
);

    wire [31:0] PCNext, PCPlus4, PCTarget;
    wire [31:0] ImmExt;
    wire [31:0] SrcA, SrcB;
    wire [31:0] Result;


    always @(posedge clk or posedge reset) begin
        if (reset) PC <= 32'b0;
        else PC <= PCNext;
    end

    assign PCPlus4 = PC + 32'd4;
    assign PCTarget = PC + ImmExt;

    assign PCNext = (PCSrc) ? PCTarget : PCPlus4;

    // register file logic
    registerfile rf (
        .clk(clk), 
        .reg1(Instr[19:15]),
        .reg2(Instr[24:20]),
        .reg3(Instr[11:7]),
        .write_reg_enable(RegWrite), 
        .read_data2(WriteData),
        .read_data1(SrcA),
        .write_data_result(Result)
    );

    extend ext(Instr[31:7], ImmSrc, ImmExt);

    // ALU logic
    assign SrcB = (ALUSrc) ? ImmExt : WriteData;

    alu alu(
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    assign Result = (ResultSrc == 2'b00) ? ALUResult : 
                    (ResultSrc == 2'b01) ? ReadData : 
                    (ResultSrc == 2'b10) ? PCPlus4 : 
32'bx; // undefined

endmodule