module control(
    input  [6:0] opcode,
    input  [2:0] funct3,
    input  [6:0] funct7,

    output reg RegWrite,
    output reg ALUSrc,
    output reg [2:0] ALUCtrl,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg
);

always @(*) begin

    RegWrite = 0;
    ALUSrc   = 0;
    ALUCtrl  = 3'b000;

    MemRead  = 0;
    MemWrite = 0;
    MemToReg = 0;

    case(opcode)

        // LW
        7'b0000011: begin
            RegWrite = 1;
            ALUSrc   = 1;
            MemRead  = 1;
            MemToReg = 1;
            ALUCtrl  = 3'b000;
        end

        // SW
        7'b0100011: begin
            ALUSrc   = 1;
            MemWrite = 1;
            ALUCtrl  = 3'b000;
        end

        // ADDI
        7'b0010011: begin
            RegWrite = 1;
            ALUSrc   = 1;
            ALUCtrl  = 3'b000;
        end

        // R-Type
        7'b0110011: begin

            RegWrite = 1;

            case(funct3)

                3'b000: begin
                    if(funct7 == 7'b0000000)
                        ALUCtrl = 3'b000; // ADD
                    else if(funct7 == 7'b0100000)
                        ALUCtrl = 3'b001; // SUB
                end

                3'b111: ALUCtrl = 3'b010; // AND
                3'b110: ALUCtrl = 3'b011; // OR
                3'b100: ALUCtrl = 3'b100; // XOR
                3'b010: ALUCtrl = 3'b101; // SLT

            endcase
        end

    endcase

end

endmodule