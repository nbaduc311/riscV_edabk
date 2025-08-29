`timescale 1ns/1ps

module imem_tb;

    // Declare signals to connect to the imem module's ports
    reg  [31:0] a_tb;
    wire [31:0] rd_tb;

    // Instantiate the imem module
    imem imem_instance (
        .a(a_tb),
        .rd(rd_tb)
    );

    // Initial block to apply test vectors
    initial begin
        // ----------------------------------------------------
        // Test 1: Read address 0
        // The first instruction should be at memory location 0x00
        a_tb = 32'h00000000;
        #10; // Wait for a short time for the combinational logic to propagate
        $display("Time: %0t | Address: 0x%h | Read Data: 0x%h", $time, a_tb, rd_tb);

        // ----------------------------------------------------
        // Test 2: Read address 4
        // The second instruction should be at memory location 0x04
        a_tb = 32'h00000004;
        #10;
        $display("Time: %0t | Address: 0x%h | Read Data: 0x%h", $time, a_tb, rd_tb);

        // ----------------------------------------------------
        // Test 3: Read an unaligned address
        // The module uses word-alignment (a[31:2]), so reading 0x01 will
        // still access the data at index 0
        a_tb = 32'h00000008;
        #10;
        $display("Time: %0t | Address: 0x%h | Read Data: 0x%h (should be same as address 0)", $time, a_tb, rd_tb);

        // ----------------------------------------------------
        // Test 4: Read a higher address
        // Assuming your 'riscvtest.txt' has enough instructions
        a_tb = 32'h0000000C;
        #10;
        $display("Time: %0t | Address: 0x%h | Read Data: 0x%h", $time, a_tb, rd_tb);

        // End the simulation
        #10;
        $finish;
    end

    // Optional: Add a monitor to display changes in a or rd
    initial begin
        $monitor("Time: %0t | Monitor: Address changes to 0x%h", $time, a_tb);
    end

endmodule