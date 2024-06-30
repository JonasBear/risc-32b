`timescale 1ns/1ps

module data_memory(
    input [31:0] WriteData,
    input [31:0] Address,
    input MemWrite, Clk,
    output [31:0] MemData
    );
    reg [31:0] mem_contents [31:0];
    integer i;
    assign MemData= mem_contents[Address];
    always @(posedge Clk) begin
        if(MemWrite) mem_contents[Address] <= #5 WriteData;
    end
endmodule