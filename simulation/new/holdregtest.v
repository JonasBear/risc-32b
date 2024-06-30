`timescale 1ns / 1ps

module holding_register_test;
    reg [31:0] in;
    reg clk, reset, write;
    wire [31:0] out;
    holding_register uut(
        .in(in),
        .out(out),
        .write(write),
		.clk(clk), 
		.reset(reset)
    );
    integer i;
    always
	#5 clk = ~clk;
    initial begin
        clk = 1'b0;
        #100
        reset <= 1;
        for (i=0;i<10;i=i+1) begin
            in = $random;
            write = $random%2;
            reset = $random%2;
            #10
            $display("input = %h, write = %b, reset = %b, output = %h",in,write,reset,out);
        end
    end

endmodule