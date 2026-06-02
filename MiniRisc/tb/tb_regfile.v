`timescale 1ns/1ps

module regfile_tb;

reg clk;
reg we;

reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;
reg [31:0] wd;

wire [31:0] rd1;
wire [31:0] rd2;

regfile uut(
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(wd),
    .rd1(rd1),
    .rd2(rd2)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    we = 1;

    rd = 5'd1;
    wd = 32'd10;

    #10;

    rd = 5'd2;
    wd = 32'd20;

    #10;

    rs1 = 5'd1;
    rs2 = 5'd2;

    #10;

    $display("x1=%d x2=%d", rd1, rd2);

    $finish;
end

endmodule