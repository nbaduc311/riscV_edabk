module IMem_IW (
    input wire clk, reset,
    input wire [31:0] ALUResultM, ReadDataM,  
    input wire [4:0] RdM, 
    input wire [31:0] PCPlus4M,

    output reg [31:0] ALUResultW, ReadDataW,
    output reg [4:0] RdW, 
    output reg [31:0] PCPlus4W,

    input wire RegWriteM, 
    input wire [1:0] ResultSrcM, 

    output reg RegWriteW, 
    output reg [1:0] ResultSrcW
);

    always @(posedge clk or posedge reset) begin 
        if (reset) begin
            ALUResultW <= 0;
            ReadDataW <= 0;
            RdW <= 0; 
            PCPlus4W <= 0;

            RegWriteW <= 0;
            ResultSrcW <= 0;
        end
        else begin
            ALUResultW <= ALUResultM;
            ReadDataW <= ReadDataM;      
            RdW <= RdM; 
            PCPlus4W <= PCPlus4M;      

            RegWriteW <= RegWriteM;
            ResultSrcW <= ResultSrcM;  
        end
    end

endmodule