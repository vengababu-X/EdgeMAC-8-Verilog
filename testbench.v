`timescale 1ns/1ps

module mac_tb;

reg clk;
reg rst;
reg enable;
reg clear;
reg [7:0] a;
reg [7:0] b;

wire [15:0] result;
wire overflow;

mac_top uut (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .clear(clear),
    .a(a),
    .b(b),
    .result(result),
    .overflow(overflow)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    enable = 0;
    clear = 0;
    #10 rst = 0;

    enable = 1;

    a = 8'd5;  b = 8'd3;   #10;
    a = 8'd2;  b = 8'd4;   #10;
    a = 8'd10; b = 8'd10;  #10;

    clear = 1; #10;
    clear = 0;

    a = 8'd15; b = 8'd2;   #10;

    $finish;
end

endmodule
