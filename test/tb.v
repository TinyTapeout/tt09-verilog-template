`default_nettype none
`timescale 1ns / 1ps

module tb;

  // Inputs and Outputs
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Clock period definition
  parameter CLK_PERIOD = 10000;  // 10 kHz clock in nanoseconds

  // Instantiate the Unit Under Test (UUT)
  tt_um_tobimckellar_top uut (
      .ui_in   (ui_in),    // Dedicated inputs
      .uo_out  (uo_out),   // Dedicated outputs
      .uio_in  (uio_in),   // IOs: Input path
      .uio_out (uio_out),  // IOs: Output path
      .uio_oe  (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena     (ena),      // always enabled
      .clk     (clk),      // clock
      .rst_n   (rst_n)     // reset_n - low to reset
  );

  // Clock generation
  initial begin
    clk = 1'b0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
  end

  // Reset logic
  initial begin
    rst_n = 1'b0;
    #5000;  // Hold reset low for 5 us
    rst_n = 1'b1;
  end

  // Simulation signals and initial conditions
  initial begin
    ena = 1'b1;          // Enable module
    ui_in = 8'b00000000; // Initialize all inputs to 0
    uio_in = 8'b00000000; // uio_in connected to ground

    // Initialize VCD waveform dumping
    $dumpfile("tb_tt_um_tobimckellar_top.vcd");
    $dumpvars(0, tb);

    // Stimulus process
    #10000;               // Wait 10 us
    ui_in[5:0] = 6'd6;    // Set ref to 6 (~10% duty cycle)
    ui_in[6] = 1'b0;      // Breathe state off
    ui_in[7] = 1'b0;      // PWM disable

    #1000000;             // Wait 1000 us
    if (uo_out[7] !== 1'b0) $display("Test 1 failed: uo_out(7) should be '0' when PWM is disabled.");

    ui_in[7] = 1'b1;      // Enable PWM
    #5000000;             // Wait 5 ms

    ui_in[6] = 1'b1;      // Enable breathing mode
    #5000000;             // Wait 5 ms

    ui_in[5:0] = 6'd1;    // Change PWM duty cycle to 1
    #5000000;             // Wait 5 ms

    ui_in[5:0] = 6'd2;    // Change PWM duty cycle to 2
    #5000000;             // Wait 5 ms

    ui_in[5:0] = 6'd16;   // Change PWM duty cycle to 16
    #5000000;             // Wait 5 ms

    ui_in[5:0] = 6'd32;   // Change PWM duty cycle to 32
    #5000000;             // Wait 5 ms

    ui_in[7] = 1'b0;      // Disable PWM
    #500000;              // Wait 500 us

    if (uo_out[7] !== 1'b0) $display("Test 2 failed: uo_out(7) should be '0' when enable_pwm is '0'.");

    #100000;              // End simulation after extra delay
    $finish;
  end

endmodule
