`timescale 1ns / 1ps

module zero_extend(
    input [15:0] imm16,
    output [31:0] out
    );
    assign out = $unsigned(imm16);
endmodule