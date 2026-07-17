
// Fs=1000Hz, Fc=100Hz, Order=3
// Original: h=[0.0416, 0.4584, 0.4584, 0.0416]
// Scaled x256: h=[11, 117, 117, 11]


module fir_filter(
    input  wire        clk,
    input  wire        rst,
    input  wire signed [7:0]  x_in,
    output reg  signed [15:0] y_out
);
    // MATLAB generated coefficients scaled by 256
    parameter signed [7:0] h0 = 8'd11;   // 0.0416 * 256
    parameter signed [7:0] h1 = 8'd117;  // 0.4584 * 256
    parameter signed [7:0] h2 = 8'd117;  // 0.4584 * 256
    parameter signed [7:0] h3 = 8'd11;   // 0.0416 * 256

    // Delay line shift register
    reg signed [7:0] x0, x1, x2, x3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x0    <= 8'd0;
            x1    <= 8'd0;
            x2    <= 8'd0;
            x3    <= 8'd0;
            y_out <= 16'd0;
        end
        else begin
            // Shift register
            x3 <= x2;
            x2 <= x1;
            x1 <= x0;
            x0 <= x_in;

            // FIR equation:
            // y[n] = h0*x[n] + h1*x[n-1] + h2*x[n-2] + h3*x[n-3]
            y_out <= (h0 * x_in) +
                     (h1 * x0)   +
                     (h2 * x1)   +
                     (h3 * x2);
        end
    end
endmodule