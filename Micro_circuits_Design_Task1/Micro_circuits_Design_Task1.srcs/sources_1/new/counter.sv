module counter #()(
  input logic reset,
  input logic [7:0] incounter,
  input logic clk,
  output logic [7:0] outcounter
    );
  initial
  outcounter = 8'b0;

    always @(posedge clk or negedge reset) begin
    if (~reset) 
        outcounter <= 8'b0; 
    else 
        outcounter <=  outcounter + 1'b1;
end
endmodule