module four_bit_adder (
    input logic [3:0] A,
    input logic [3:0] B,
    input logic Cin,
    output logic [3:0] Sum,
    output logic Cout
);
    assign {Cout, Sum} = A + B + Cin;
endmodule

module four_bit_multiplier (
    input logic [3:0] A,
    input logic [3:0] B,
    output logic [7:0] P
);
    logic [3:0] wire0, wire1, wire2, wire3;
    logic [3:0] sum0, sum1, sum2;
    logic carry0, carry1, carry2;

    assign wire0 = A[3:0] & {4{B[0]}};
    assign wire1 = A[3:0] & {4{B[1]}};
    assign wire2 = A[3:0] & {4{B[2]}};
    assign wire3 = A[3:0] & {4{B[3]}};

    four_bit_adder adder_1 (
        .A(wire1),
        .B({1'b0,wire0[3:1]}),
        .Cin(1'b0),
        .Sum(sum0),
        .Cout(carry0)
    );

    four_bit_adder adder_2 (
        .A({carry0, sum0[3:1]}),
        .B(wire2[3:0]),
        .Cin(1'b0),
        .Sum(sum1),
        .Cout(carry1)
    );

    four_bit_adder adder_3 (
        .A({carry1, sum1[3:1]}),
        .B(wire3[3:0]),
        .Cin(1'b0),
        .Sum(sum2),
        .Cout(carry2)
    );

    assign P = {carry2, sum2, sum1[0], sum0[0], wire0[0]};
endmodule
