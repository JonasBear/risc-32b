`timescale 1ns / 1ps

module mux2To1(
    input [31:0] in1,
    input [31:0] in2,
    output reg [31:0] out,
    input s
    );
    always @(*) begin 
        case(s)
        1'b0: out <= in1;
        1'b1: out <= in2;
        default: out <= 32'b0;
        endcase
    end
endmodule