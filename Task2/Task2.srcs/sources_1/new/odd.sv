module odd (
    input logic [7:0] register,
    output logic output1   
);

    always_comb begin
        output1 = ^register;
    end

endmodule
