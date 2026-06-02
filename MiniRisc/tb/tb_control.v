`timescale 1ns/1ps

module control_tb;

reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;

wire RegWrite;
wire ALUSrc;
wire [2:0] ALUCtrl;

control uut(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .ALUCtrl(ALUCtrl)
);

initial begin

    // ADDI
    opcode = 7'b0010011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #10;

    $display("\nADDI");
    $display("RegWrite=%b ALUSrc=%b ALUCtrl=%b",
             RegWrite, ALUSrc, ALUCtrl);

    // ADD
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #10;

    $display("\nADD");
    $display("RegWrite=%b ALUSrc=%b ALUCtrl=%b",
             RegWrite, ALUSrc, ALUCtrl);

    // SUB
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0100000;
    #10;

    $display("\nSUB");
    $display("RegWrite=%b ALUSrc=%b ALUCtrl=%b",
             RegWrite, ALUSrc, ALUCtrl);

    // AND
    opcode = 7'b0110011;
    funct3 = 3'b111;
    funct7 = 7'b0000000;
    #10;

    $display("\nAND");
    $display("RegWrite=%b ALUSrc=%b ALUCtrl=%b",
             RegWrite, ALUSrc, ALUCtrl);

    // OR
    opcode = 7'b0110011;
    funct3 = 3'b110;
    funct7 = 7'b0000000;
    #10;

    $display("\nOR");
    $display("RegWrite=%b ALUSrc=%b ALUCtrl=%b",
             RegWrite, ALUSrc, ALUCtrl);

    // XOR
    opcode = 7'b0110011;
    funct3 = 3'b100;
    funct7 = 7'b0000000;
    #10;

    $display("\nXOR");
    $display("RegWrite=%b ALUSrc=%b ALUCtrl=%b",
             RegWrite, ALUSrc, ALUCtrl);

    // SLT
    opcode = 7'b0110011;
    funct3 = 3'b010;
    funct7 = 7'b0000000;
    #10;

    $display("\nSLT");
    $display("RegWrite=%b ALUSrc=%b ALUCtrl=%b",
             RegWrite, ALUSrc, ALUCtrl);

    $finish;

end

endmodule