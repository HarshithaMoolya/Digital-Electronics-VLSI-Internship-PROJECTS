`timescale 1ns/1ns

module fir_tb;

    reg        clk;
    reg        rst;
    reg  signed [7:0]  x_in;
    wire signed [15:0] y_out;

    fir_filter DUT(
        .clk  (clk),
        .rst  (rst),
        .x_in (x_in),
        .y_out(y_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, fir_tb);

        rst = 1;
        x_in = 0;
        #20;
        rst = 0;

        $display("============================================");
        $display("  Topic 4: FIR Filter - DSP Application    ");
        $display("  MATLAB Coefficients h=[11, 117, 117, 11] ");
        $display("  Fs=1000Hz Fc=100Hz Order=3               ");
        $display("============================================");
        $display("Time\tInput\tOutput");
        $display("--------------------------------------------");

        // Step Input Test
        $display("--- Step Input Test ---");
        x_in = 8'd10; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd10; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd10; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd10; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd10; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        // Impulse Input Test
        $display("--- Impulse Input Test ---");
        rst = 1; #10; rst = 0;

        x_in = 8'd10; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd0; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd0; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd0; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd0; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        // Ramp Input Test
        $display("--- Ramp Input Test ---");
        rst = 1; #10; rst = 0;

        x_in = 8'd2; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd4; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd6; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd8; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        x_in = 8'd10; #10;
        $display("%0t\t%0d\t%0d", $time, x_in, y_out);

        $display("--------------------------------------------");
        $display("  FIR Filter Performance Results:           ");
        $display("--------------------------------------------");
        $display("  Architecture: 4 multipliers + 3 adders    ");
        $display("  Area        : 159 LUTs,40 Registers,50 Slices ");
        $display("  Speed       : 10.774 ns critical path delay");
        $display("                Maximum Frequency = 93 MHz");
        $display("  Power       : 17.694 W total estimated power");
        $display("                Static Power = 0.359 W");
        $display("============================================");

        #20;
        $finish;
    end

endmodule