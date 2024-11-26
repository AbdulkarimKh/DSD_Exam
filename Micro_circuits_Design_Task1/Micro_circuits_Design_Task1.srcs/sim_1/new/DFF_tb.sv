module tb_Overflow;

    logic [7:0] D;
    logic clk, clr_n;
    logic overflow;
    logic [7:0] Q;

    overflow dut1(
        .clk(clk),
        .reset(clr_n),
        .D(D),
        .Q(Q),
        .overflow(overflow)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        clr_n = 0;
        D = 8'b0;

        #10 clr_n = 1;
        #10 D = 8'b01111111;
        #10 D = 8'b10000000;
        #10 D = 8'b10000001;
        #10 D = 8'b00000000;
        #10 D = 8'b11111111;
        #50 $finish;
    end
endmodule
