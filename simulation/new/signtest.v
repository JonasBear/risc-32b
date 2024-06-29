`timescale 1ns / 1ps

module signtest;
    reg [15:0] imm16;
    wire [31:0] out;
    sign_extend uut(
        .imm16(imm16),
        .out(out)
    );
    integer i;
    initial begin
        for (i=0;i<10;i=i+1) begin
            imm16 = $random;
            #100
            $display("imm16 = %b, signextended = %b",imm16,out);
        end
    end
endmodule
