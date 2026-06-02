module cpu_top(
    input clk,
    input [31:0] instr
);

wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;
wire [31:0] imm;

wire RegWrite;
wire ALUSrc;
wire [2:0] ALUCtrl;

wire MemRead;
wire MemWrite;
wire MemToReg;

wire [31:0] rd1;
wire [31:0] rd2;

wire [31:0] alu_b;
wire [31:0] alu_result;

wire [31:0] mem_data;
wire [31:0] write_back;

decoder DEC(
    .instr(instr),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7),
    .imm(imm)
);

control CTRL(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),

    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .ALUCtrl(ALUCtrl),

    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg)
);

regfile RF(
    .clk(clk),
    .we(RegWrite),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(write_back),
    .rd1(rd1),
    .rd2(rd2)
);

assign alu_b =
    (ALUSrc) ? imm : rd2;

alu ALU(
    .a(rd1),
    .b(alu_b),
    .alu_ctrl(ALUCtrl),
    .result(alu_result)
);

dmem DMEM(
    .clk(clk),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .addr(alu_result),
    .write_data(rd2),
    .read_data(mem_data)
);

assign write_back =
    (MemToReg) ? mem_data :
                 alu_result;

endmodule