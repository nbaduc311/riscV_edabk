module registerfile (
    input wire clk,
    input wire [4:0] reg1, reg2, reg3,
    input wire write_reg_enable,
    input wire [31:0] write_data_result,
    output wire [31:0] read_data1, read_data2
);
    
    reg [31:0] registers [31:0];
    
    // Read operation (combinational)
    assign read_data1 = (reg1 != 0) ? registers[reg1] : 32'b0;
    assign read_data2 = (reg2 != 0) ? registers[reg2] : 32'b0;

    // Write operation (synchronous)
    always @(posedge clk) begin
        if (write_reg_enable) registers[reg3] <= write_data_result;
    end
    
endmodule