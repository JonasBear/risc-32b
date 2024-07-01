`timescale 1ns / 1ps

module sign_and_zero_extend(
    input [15:0] imm16,
    input sz,
    output reg [31:0] out
    );
    always @(*) begin
    case (sz)
    0: out <= $unsigned(imm16);
    1: out <= $signed(imm16);
    endcase
    end
endmodule