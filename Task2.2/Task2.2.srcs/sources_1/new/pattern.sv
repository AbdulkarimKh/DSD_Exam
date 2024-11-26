module pattern (
    input logic clk,
    input logic reset,
    input logic en,
    input logic [4:0] pattern,
    input logic serial_in,
    output logic pattern_match
);
    logic [4:0] shift_reg;
    logic [4:0] pattern_reg;

    always @(posedge clk or negedge reset) begin
        if (~reset)
            shift_reg <= 5'b0;
        else if (en)
            pattern_reg <= pattern;
        else
            shift_reg <= {shift_reg[3:0], serial_in};
    end

    always @(posedge clk) begin
        if (shift_reg == pattern_reg)
            pattern_match <= 1'b1;
        else
            pattern_match <= 1'b0;
    end
endmodule
