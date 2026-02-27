module accumulator (
    input clk,
    input rst,
    input enable,
    input clear,
    input [15:0] data_in,
    output reg [15:0] acc_out,
    output reg overflow
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        acc_out <= 16'd0;
        overflow <= 1'b0;
    end
    else if (clear) begin
        acc_out <= 16'd0;
        overflow <= 1'b0;
    end
    else if (enable) begin
        {overflow, acc_out} <= acc_out + data_in;
    end
end

endmodule
