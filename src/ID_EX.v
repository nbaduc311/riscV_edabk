module ID_EX (
    input wire clk, reset, clear,
    input wire RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcAD,
    input wire [1:0] ALUSrcBD,
    input wire [1:0] ResultSrcD, 
    input wire [3:0] ALUControlD,
    input wire PCJalrD,
    
    output reg RegWriteE, MemWriteE, JumpE, BranchE,  ALUSrcAE,
    output reg [1:0] ALUSrcBE,
    output reg [1:0] ResultSrcE,
    output reg [3:0] ALUControlE,
    output reg PCJalrE ,

    input wire [31:0] RD1D, RD2D, PCD, 
    input wire [4:0] Rs1D, Rs2D, RdD, 
    input wire [31:0] ImmExtD, PCPlus4D,

    output reg [31:0] RD1E, RD2E, PCE, 
    output reg [4:0] Rs1E, Rs2E, RdE, 
    output reg [31:0] ImmExtE, PCPlus4E
);

    always @(posedge clk or posedge reset ) begin
        if (reset) begin
            RegWriteE <= 0;
            MemWriteE <= 0;
            JumpE <= 0;
            BranchE <= 0; 
            ALUSrcAE <= 0;
            ALUSrcBE <= 0;
            ResultSrcE <= 0;
            ALUControlE <= 0;     
            PCJalrE <= 0;    

            RD1E <= 0;
            RD2E <= 0;
            PCE <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            RdE <= 0;
            ImmExtE <= 0;
            PCPlus4E <= 0; 
        end

        else if (clear) begin
            RegWriteE <= 0;
            MemWriteE <= 0;
            JumpE <= 0;
            BranchE <= 0; 
            ALUSrcAE <= 0;
            ALUSrcBE <= 0;
            ResultSrcE <= 0;
            ALUControlE <= 0;    
            PCJalrE <= 0;	

            RD1E <= 0;
            RD2E <= 0;
            PCE <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            RdE <= 0;
            ImmExtE <= 0;
            PCPlus4E <= 0;		
        end
        
        else begin
            RegWriteE <= RegWriteD;
            MemWriteE <= MemWriteD;
            JumpE <= JumpD;
            BranchE <= BranchD; 
            ALUSrcAE <= ALUSrcAD;
            ALUSrcBE <= ALUSrcBD;
            ResultSrcE <= ResultSrcD;
            ALUControlE <= ALUControlD;  
            PCJalrE <= PCJalrD; 
                
            RD1E <= RD1D;
            RD2E <= RD2D;
            PCE <= PCD;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            RdE <= RdD;
            ImmExtE <= ImmExtD;
            PCPlus4E <= PCPlus4D;
        end
    end
  
endmodule


    