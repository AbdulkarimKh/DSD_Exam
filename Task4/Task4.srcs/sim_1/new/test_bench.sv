module tb_four_bit_multiplier;

    logic [3:0] A, B;
    logic [7:0] P;

    four_bit_multiplier dut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        A = 4'b0000; B = 4'b0001;
        #10;
        A = 4'b0001; B = 4'b0010;
        #10;
        A = 4'b0111; B = 4'b0111;
        #10;
        A = 4'b1111; B = 4'b1111;
        #10;

        $finish;
    end

endmodule
