`timescale 1ns / 1ps

module register_file(
    input clk, RegWrite,
    input [31:0] write_data,
    input [4:0] read_reg_1, read_reg_2, write_address,
    output [31:0] read_data_1, read_data_2
    );
    reg [31:0] register_file [0:31];
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            register_file[i] = 32'd0;
        end
    end
   assign read_data_1 = register_file[read_reg_1];
   assign read_data_2 = register_file[read_reg_2];
    always @ (posedge clk) begin
        if (RegWrite)
            register_file[write_address] <= write_data;
    end
endmodule