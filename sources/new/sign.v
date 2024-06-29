`timescale 1ns / 1ps

module sign_extend(
    input [15:0] imm16,
    output [31:0] out
    );
    assign out = $signed(imm16);
endmodule