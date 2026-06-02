module dmem(
    input clk,
    input MemWrite,
    input MemRead,

    input [31:0] addr,
    input [31:0] write_data,

    output [31:0] read_data
);

reg [31:0] mem [0:31];

integer i;

initial begin
    for(i=0;i<32;i=i+1)
        mem[i] = 0;
end

always @(posedge clk)
begin
    if(MemWrite)
        mem[addr[31:2]] <= write_data;
end

assign read_data =
    (MemRead) ? mem[addr[31:2]]
              : 32'd0;

endmodule