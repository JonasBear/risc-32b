`timescale 1ns / 1ps

module mux4test;
    reg [31:0] in1;
    reg [31:0] in2;
    reg [31:0] in3;
    reg [31:0] in4;
    reg [1:0] s;
    wire [31:0] out;

    mux4To1 uut(
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .s(s),
        .out(out)
    );
    integer i;
    initial begin
        for (i=0;i<20;i=i+1) begin
            in1 = $random;
            in2 = $random;
            in3 = $random;
            in4 = $random;
            s = $random;
            #10
            $display("port 1 = %h, port 2 = %h, port 3 = %h, port 4 = %h, selector = %d, output = %h",in1,in2,in3,in4,s,out);
        end
    end
endmodule
