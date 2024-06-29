`timescale 1ns / 1ps

module mux2test;
    reg [31:0] in1;
    reg [31:0] in2;
    reg s;
    wire [31:0] out;

    mux2To1 uut(
        .in1(in1),
        .in2(in2),
        .s(s),
        .out(out)
    );
    integer i;
    initial begin
        for (i=0;i<20;i=i+1) begin
            in1 = $random;
            in2 = $random;
            s = $random;
            #10
            $display("port 1 = %h, port 2 = %h, selector = %d, output = %h",in1,in2,s,out);
        end
    end
endmodule
