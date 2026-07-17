module processor(
    input clk,
    input [2:0] opcode,
    input [1:0] rd,
    input [1:0] rs,
    input [3:0] mem_addr,
    output reg [3:0] result,
    output [3:0] mem_out
);

    // ==========================
    // Register File
    // ==========================
    reg [3:0] R [0:3];

    // ==========================
    // Data Memory
    // ==========================
    reg [3:0] memory [0:15];

    assign mem_out = memory[mem_addr];

    initial begin
        // Register initialization
        R[0] = 4'd2;
        R[1] = 4'd5;
        R[2] = 4'd3;
        R[3] = 4'd1;

        // Memory initialization
        memory[0] = 4'd7;
        memory[1] = 4'd9;
        memory[2] = 4'd4;

        memory[3] = 4'd0;
        memory[4] = 4'd0;
        memory[5] = 4'd0;
        memory[6] = 4'd0;
        memory[7] = 4'd0;
        memory[8] = 4'd0;
        memory[9] = 4'd0;
        memory[10] = 4'd0;
        memory[11] = 4'd0;
        memory[12] = 4'd0;
        memory[13] = 4'd0;
        memory[14] = 4'd0;
        memory[15] = 4'd0;
    end

    // ==========================
    // Control Unit + ALU + Memory
    // ==========================
    always @(posedge clk) begin

        case(opcode)

            // ADD
            3'b000: begin
                R[rd] <= R[rd] + R[rs];
                result <= R[rd] + R[rs];
            end

            // SUB
            3'b001: begin
                R[rd] <= R[rd] - R[rs];
                result <= R[rd] - R[rs];
            end

            // AND
            3'b010: begin
                R[rd] <= R[rd] & R[rs];
                result <= R[rd] & R[rs];
            end

            // OR
            3'b011: begin
                R[rd] <= R[rd] | R[rs];
                result <= R[rd] | R[rs];
            end

            // NOT
            3'b100: begin
                R[rd] <= ~R[rd];
                result <= ~R[rd];
            end

            // XOR
            3'b101: begin
                R[rd] <= R[rd] ^ R[rs];
                result <= R[rd] ^ R[rs];
            end

            // LOAD
            3'b110: begin
                R[rd] <= memory[mem_addr];
                result <= memory[mem_addr];
            end

            // STORE
            3'b111: begin
                memory[mem_addr] <= R[rd];
                result <= R[rd];
            end

            default: begin
                result <= 4'b0000;
            end

        endcase
    end

endmodule