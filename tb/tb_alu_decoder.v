`timescale 1ns/1ps

module tb_alu_decoder;
    // Testbench signals
    reg opb5;
    reg [2:0] funct3;
    reg funct7b5;
    reg [1:0] ALUOp;
    wire [2:0] ALUControl;

    // Instantiate the alu_decoder
    alu_decoder uut (
        .opb5(opb5),
        .funct3(funct3),
        .funct7b5(funct7b5),
        .ALUOp(ALUOp),
        .ALUControl(ALUControl)
    );

    // Task để dễ test nhiều case
    task test_case;
        input [1:0] tALUOp;
        input tOpb5;
        input [2:0] tFunct3;
        input tFunct7b5;
        begin
            ALUOp = tALUOp;
            opb5 = tOpb5;
            funct3 = tFunct3;
            funct7b5 = tFunct7b5;
            #10; // chờ 10ns
            $display("ALUOp=%b | opb5=%b | funct3=%b | funct7b5=%b => ALUControl=%b",
                     ALUOp, opb5, funct3, funct7b5, ALUControl);
        end 
    endtask

    initial begin
        $display("=== Start Testing alu_decoder ===");
        
        // Test ALUOp = 00 => addition
        test_case(2'b00, 0, 3'b000, 0);

        // Test ALUOp = 01 => subtraction
        test_case(2'b01, 0, 3'b000, 0);

        // Test ALUOp = 10 or 11 with funct3 variations
        test_case(2'b10, 0, 3'b000, 0); // ADD
        test_case(2'b10, 1, 3'b000, 1); // SUB (funct7b5 & opb5)

        test_case(2'b10, 0, 3'b001, 0); // SLL
        test_case(2'b10, 0, 3'b010, 0); // SLT
        test_case(2'b10, 0, 3'b100, 0); // XOR
        test_case(2'b10, 0, 3'b101, 0); // SRL
        test_case(2'b10, 0, 3'b110, 0); // OR
        test_case(2'b10, 0, 3'b111, 0); // AND
        
        // Default case
        test_case(2'b10, 0, 3'b011, 0); // undefined case

        $display("=== End Testing alu_decoder ===");
        $stop; // Kết thúc mô phỏng
    end

endmodule
