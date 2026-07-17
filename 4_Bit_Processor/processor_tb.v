`timescale 1ns/1ns

module processor_tb;

reg clk;
reg [2:0] opcode;
reg [1:0] rd;
reg [1:0] rs;
reg [3:0] mem_addr;

wire [3:0] result;
wire [3:0] mem_out;

processor dut(
    .clk(clk),
    .opcode(opcode),
    .rd(rd),
    .rs(rs),
    .mem_addr(mem_addr),
    .result(result),
    .mem_out(mem_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    $display("------------------------------------------------");
    $display("Time\tOperation\tResult");
    $display("------------------------------------------------");

    // ADD : R0 + R1 = 2 + 5 = 7
    opcode = 3'b000;
    rd = 2'b00;
    rs = 2'b01;
    mem_addr = 0;
    #10;
    $display("%0t\tADD\t\t%0d",$time,result);

    // SUB : R1 - R2 = 5 - 3 = 2
    opcode = 3'b001;
    rd = 2'b01;
    rs = 2'b10;
    #10;
    $display("%0t\tSUB\t\t%0d",$time,result);

    // AND : R0 & R2 = 7 & 3 = 3
    opcode = 3'b010;
    rd = 2'b00;
    rs = 2'b10;
    #10;
    $display("%0t\tAND\t\t%0d",$time,result);

    // OR : R1 | R3 = 2 | 1 = 3
    opcode = 3'b011;
    rd = 2'b01;
    rs = 2'b11;
    #10;
    $display("%0t\tOR\t\t%0d",$time,result);

    // NOT : ~R0
    opcode = 3'b100;
    rd = 2'b00;
    rs = 2'b00;
    #10;
    $display("%0t\tNOT\t\t%0d",$time,result);

    // XOR : R0 ^ R3
    opcode = 3'b101;
    rd = 2'b00;
    rs = 2'b11;
    #10;
    $display("%0t\tXOR\t\t%0d",$time,result);

    // LOAD memory[1] -> R2
    opcode = 3'b110;
    rd = 2'b10;
    rs = 2'b00;
    mem_addr = 4'd1;
    #10;
    $display("%0t\tLOAD\t%0d",$time,result);

    // STORE R1 -> memory[5]
    opcode = 3'b111;
    rd = 2'b01;
    rs = 2'b00;
    mem_addr = 4'd5;
    #10;
    $display("%0t\tSTORE\t%0d",$time,result);

    #10;
    $finish;

end

endmodule