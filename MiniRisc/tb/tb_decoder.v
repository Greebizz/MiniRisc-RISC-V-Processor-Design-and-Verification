`timescale 1ns/1ps

module decoder_tb;

reg [31:0] instr;

wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;
wire [31:0] imm;

decoder uut(
    .instr(instr),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7),
    .imm(imm)
);

initial begin

    instr = 32'h00A00093;

    #10;

    $display("opcode=%b", opcode);
    $display("rd=%d", rd);
    $display("rs1=%d", rs1);
    $display("imm=%d", imm);

    $finish;

end

endmodule