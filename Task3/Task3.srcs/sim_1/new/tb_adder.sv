module tb_eight_bit_adder;

    logic [7:0] A;
    logic [7:0] B;
    logic Cin;
    logic [7:0] Sum;
    logic Cout;

    eight_bit_adder dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        A = 8'b00000000; B = 8'b00000000; Cin = 1'b0; 
        #5;
        A = 8'b00000000; B = 8'b00000000; Cin = 1'b1; 
        #5;
        A = 8'b00000001; B = 8'b00000001; Cin = 1'b0; 
        #5;
        A = 8'b00000001; B = 8'b00000001; Cin = 1'b1; 
        #5;
        A = 8'b11111111; B = 8'b11111111; Cin = 1'b0; 
        #5;

        $finish;
    end

endmodule
