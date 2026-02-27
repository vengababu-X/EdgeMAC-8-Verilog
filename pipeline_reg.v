module pipeline_reg (
    input clk,
    input rst,
    input [15:0] data_in,
    output reg [15:0] data_out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        data_out <= 16'd0;
    else
        data_out <= data_in;
end

endmodule
