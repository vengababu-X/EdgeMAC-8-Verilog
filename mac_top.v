module mac_top (
    input clk,
    input rst,
    input enable,
    input clear,
    input [7:0] a,
    input [7:0] b,
    output [15:0] result,
    output overflow
);

wire [15:0] product;
wire [15:0] piped_product;

multiplier u1 (
    .a(a),
    .b(b),
    .product(product)
);

pipeline_reg u2 (
    .clk(clk),
    .rst(rst),
    .data_in(product),
    .data_out(piped_product)
);

accumulator u3 (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .clear(clear),
    .data_in(piped_product),
    .acc_out(result),
    .overflow(overflow)
);

endmodule
