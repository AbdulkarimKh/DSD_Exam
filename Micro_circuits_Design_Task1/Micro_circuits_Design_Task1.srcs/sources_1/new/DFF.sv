module overflow(
    input logic clk,           
    input logic reset,
    input logic [7:0] D,
    output logic [7:0] Q,
    output logic overflow
);    

    assign overflow = Q[7] & ~D[7];

    always_ff @(posedge clk or negedge reset) begin
        if (~reset) begin
            Q <= 8'b0;
        end else begin
            Q <= D;      
        end
    end

endmodule
