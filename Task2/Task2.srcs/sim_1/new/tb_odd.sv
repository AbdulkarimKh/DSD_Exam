module tb_odd;

    logic [7:0] register;  
    logic output1;      

    odd dut (
        .register(register),
        .output1(output1)
    );

    initial begin
        register = 8'b00000000;
        #10;
        register = 8'b10000000;
        #10;
        register = 8'b00000001;
        #10;
        register = 8'b00000011;
        #10;
        register = 8'b11000000;
        #10;
        register = 8'b11111111;
        #10;
        $finish;
    end

endmodule
