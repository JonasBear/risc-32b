`timescale 1ns / 1ps

module mux4To1(
    input [31:0] in1, in2, in3, in4,
    input [1:0] s,
    output reg [31:0] out
    );
    always @(s) begin
        case (s)
        2'b 00: out <= in1;
        2'b 01: out <= in2;
        2'b 10: out <= in3;
        2'b 11: out <= in4;
        default: out <= 0;
        endcase
    end
endmodule