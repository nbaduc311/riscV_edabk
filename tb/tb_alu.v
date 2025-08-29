`timescale 1ns/1ps

module tb_alu;
    // Testbench signals
    reg [31:0] SrcA, SrcB;
    reg [2:0] ALUControl;
    wire [31:0] ALUResult;
    wire Zero;

    // Instantiate the ALU module
    alu uut (
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    initial begin
        // Monitor output
        $monitor("Time=%0t | ALUControl=%b | SrcA=%d | SrcB=%d | ALUResult=%d | Zero=%b",
                 $time, ALUControl, SrcA, SrcB, ALUResult, Zero);

        // Test ADD
        SrcA = 10; SrcB = 5; ALUControl = 3'b000; #10;

        // Test SUB
        SrcA = 10; SrcB = 10; ALUControl = 3'b001; #10;

        // Test AND
        SrcA = 32'hF0F0F0F0; SrcB = 32'h0F0F0F0F; ALUControl = 3'b010; #10;

        // Test OR
        SrcA = 32'hAAAA5555; SrcB = 32'h5555AAAA; ALUControl = 3'b011; #10;

        // Test XOR
        SrcA = 32'h12345678; SrcB = 32'h87654321; ALUControl = 3'b100; #10;

        // Test LEFT SHIFT
        SrcA = 32'h00000001; SrcB = 3; ALUControl = 3'b101; #10;

        // Test RIGHT SHIFT
        SrcA = 32'h00000008; SrcB = 2; ALUControl = 3'b110; #10;

        // Test SLT
        SrcA = 5; SrcB = 10; ALUControl = 3'b111; #10;

        // Test Default
        SrcA = 0; SrcB = 0; ALUControl = 3'bxxx; #10;

        $stop;  // Kết thúc mô phỏng
    end

endmodule
