`timescale 1ns/1ps
module tb();
    reg clk;
    reg reset;
    wire [31:0] WriteData, DataAdr;
    wire MemWrite;

    // Instantiate device to be tested
    top dut(clk, reset, WriteData, DataAdr, MemWrite);

    // Initialize test
    initial begin
        clk = 0;
        #20 reset = 1;
        #20 reset = 0;
    end

    // Generate clock to sequence tests
    always #10 clk = ~clk;

    // Check results
    always @(negedge clk) begin
        if (MemWrite) begin
            if (DataAdr === 100 && WriteData === 25) begin
                $display("Simulation succeeded");
                $stop;
            end else if (DataAdr !== 96) begin
                $display("Simulation failed");
                $stop;
            end
        end
    end
endmodule