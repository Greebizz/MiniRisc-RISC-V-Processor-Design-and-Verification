`timescale 1ns/1ps

module alu_tb;

reg [31:0] a;
reg [31:0] b;
reg [2:0] alu_ctrl;

wire [31:0] result;

alu uut(
    .a(a),
    .b(b),
    .alu_ctrl(alu_ctrl),
    .result(result)
);

initial begin

    a = 10;
    b = 20;

    alu_ctrl = 3'b000;
    #10;
    $display("ADD = %d", result);

    alu_ctrl = 3'b001;
    #10;
    $display("SUB = %d", result);

    alu_ctrl = 3'b010;
    #10;
    $display("AND = %d", result);

    alu_ctrl = 3'b011;
    #10;
    $display("OR  = %d", result);

    alu_ctrl = 3'b100;
    #10;
    $display("XOR = %d", result);

    alu_ctrl = 3'b101;
    #10;
    $display("SLT = %d", result);

    $finish;
end

endmodule