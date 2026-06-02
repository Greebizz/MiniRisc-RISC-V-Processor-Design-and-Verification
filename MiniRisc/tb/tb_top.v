`timescale 1ns/1ps

module cpu_debug_tb;

reg clk;
reg [31:0] instr;

cpu_debug_top uut(
    .clk(clk),
    .instr(instr)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    // addi x1,x0,100
    instr = 32'h06400093;
    #10;

    // addi x3,x0,30
    instr = 32'h01E00193;
    #10;

    // sw x3,0(x1)
    instr = 32'h0030A023;
    #10;

    // lw x4,0(x1)
    instr = 32'h0000A203;
    #10;

    $display("x1 = %0d", uut.RF.regs[1]);
    $display("x3 = %0d", uut.RF.regs[3]);
    $display("x4 = %0d", uut.RF.regs[4]);

    $finish;

end

endmodule