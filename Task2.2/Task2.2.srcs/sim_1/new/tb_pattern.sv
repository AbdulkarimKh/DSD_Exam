module tb_pattern;
    logic clk;
    logic reset;
    logic en;
    logic [4:0] pattern;
    logic serial_in;
    logic pattern_match;

    pattern dut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .pattern(pattern),
        .serial_in(serial_in),
        .pattern_match(pattern_match)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 0;
        en = 0;
        pattern = 5'b10101;
        serial_in = 0;
        #10 reset = 1;

        #10 en = 1;
        #10 en = 0;
        
        serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 0;
        
        $finish;
    end
endmodule
