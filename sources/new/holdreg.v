`timescale 1ns / 1ps

module holding_register(
    input reset, clk, write,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] content;
    assign out = content;
    always @(posedge clk) begin
        if (reset==1) content <= 32'b0;
        else if (write==1) content <= in;
    end

endmodule