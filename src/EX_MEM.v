module EX_MEM (
    input wire clk, reset,
    input wire RegWriteE, MemWriteE,
    input wire [1:0] ResultSrcE,  

    output reg RegWriteM, MemWriteM,
    output reg [1:0] ResultSrcM,

    input wire [31:0] ALUResultE, WriteDataE, 
    input wire [4:0] RdE, 
    input wire [31:0] PCPlus4E,

    output reg [31:0] ALUResultM, WriteDataM,
    output reg [4:0] RdM, 
    output reg [31:0] PCPlus4M
);

    always @(posedge clk or posedge reset ) begin
        if (reset) begin
            ALUResultM <= 0;
            WriteDataM <= 0;
            RdM <= 0; 
            PCPlus4M <= 0;

            RegWriteM <= 0;
            MemWriteM <= 0;
            ResultSrcM <= 0;
        end
        else begin
            ALUResultM <= ALUResultE;
            WriteDataM <= WriteDataE;
            RdM <= RdE; 
            PCPlus4M <= PCPlus4E; 

            RegWriteM <= RegWriteE;
            MemWriteM <= MemWriteE;
            ResultSrcM <= ResultSrcE; 
        end
        
    end
endmodule