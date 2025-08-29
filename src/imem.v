module imem(
    input wire [31:0] a,
    output wire [31:0] rd
);
    reg [31:0] RAM[63:0];
    
    initial begin
        $readmemh("C:/Users/Hi/Desktop/riscv/single_cycle/src/riscvtest.txt", RAM);
    end
    
    assign rd = RAM[a[31:2]]; // word aligned
endmodule