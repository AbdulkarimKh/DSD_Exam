module four_bit_adder (
    input logic [3:0] A,
    input logic [3:0] B,
    input logic Cin,
    output logic [3:0] Sum,
    output logic Cout
);
    assign {Cout, Sum} = A + B + Cin;
endmodule

module eight_bit_adder (
    input logic [7:0] A,
    input logic [7:0] B,
    input logic Cin,
    output logic [7:0] Sum,
    output logic Cout
);
    
    logic [3:0] Sum0, Sum1;
    wire temp;

    four_bit_adder adder0 (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .Sum(Sum0),
        .Cout(temp)
    );

    four_bit_adder adder1 (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(temp),
        .Sum(Sum1),
        .Cout(Cout)
    );

    assign Sum = {Sum1, Sum0};
endmodule
