`timescale 1ns/1ps

module alutestbench;
reg signed [31:0] A;
reg signed [31:0] B;
reg [3:0] ALUOp;
wire signed [31:0] R;
wire ALUz;
wire V;
wire C;
alu uut(
.A(A),
.B(B),
.ALUOp(ALUOp),
.R(R),
.ALUz(ALUz),
.V(V),
.C(C)
);
integer i;
parameter [3:0] AND = 4'b0000, OR = 'b0001, add = 4'b0010, sub = 4'b0110, slt = 4'b0111, NOR = 4'b1100;
initial begin
    clk = 1'b0;
for (i=0;i<100;i=i+1) begin 
        A = $random;
        B = $random;
        ALUOp = $random;
        #10;
    case(ALUOp)
        AND: begin
            $display("A=%h, B=%h, A&B=%h, ",A,B,R); 
            $display("ALUz=%d ",ALUz);
        end
        OR: begin
            $display("A=%h, B=%h, A|B=%h, ",A,B,R); 
            $display("ALUz=%d ",ALUz);
        end
        add: begin
            $display("A=%d, B=%d, A+B=%d, V=%d",A,B,R,V); 
            if (V==1) $display("Had Overflow");
            else $display("OK");
            $display("ALUz=%d ",ALUz);
        end
        sub: begin
            $display("A=%d, B=%d, A-B=%d, V=%d",A,B,R,V); 
            if (V==1) $display("Had Overflow");
            else $display("OK");
            $display("ALUz=%d ",ALUz);
        end
        slt: begin
            $display("A=%d, B=%d, ALUz=%d ",A,B,ALUz);
            if (ALUz==0) $display("A<B");
            else $display("A not greater than B");
        end
        NOR: begin 
            $display("A=%h, B=%h, ~(A|B)=%h ",A,B,R);
            $display("ALUz=%d",ALUz);
        end
    endcase
end

end

endmodule 