`timescale 1ns / 1ps

module alu(input [31:0] A, B,
           input [3:0]  ALUOp,
           output reg [31:0] R,
           output reg ALUz,
           output reg C,
           output reg V);


//AND 0000, OR 0001, add 0010, sub 0110, slt 0111 (A<B)?1:0, NOR 1100


parameter [3:0] AND = 4'b0000, OR = 'b0001, add = 4'b0010, sub = 4'b0110, slt = 4'b0111, NOR = 4'b1100; 
  always@(*) begin

    case (ALUOp)

		  AND: R = A & B;
      OR: R = A ^ B;
      add: begin
        {C,R} = A + B;
        if (( A[31] == B[31]) && (R[31] != A[31] )) V=1; 
        else V = 0;
      end
      sub: begin
        {C,R} = A - B;
        if (( A[31] != B[31] ) && ( R[31] != A[31] )) V=1;
        else V = 0;
      end
      slt: begin 
        if (A<B) R = 32'b0;
        else R = 32'b1;
      end
      NOR: R = ~ ( A ^ B );

    endcase

    if (R==32'b0) ALUz=1;
    else ALUz=0;

  end
endmodule