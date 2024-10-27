module tt_um_tobimckellar_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path -- connect to ground
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  assign uio_oe = 8'b00000000;   // Connect uio_oe to ground
  assign uio_out = 8'b00000000;  // Connect uio_out to ground
  wire [5:0] ref_in;
  wire pwm_out;
  wire [5:0] counter;
  wire enable_pwm;
  wire breathe_state;
  reg [5:0] sin_value;
  reg [6:0] index;
  reg [9:0] clock_div;
  reg [9:0] clock_ticks;
  wire n6_o;
  wire n7_o;
  wire [5:0] n8_o;
  localparam [7:0] n10_o = 8'b00000000;
  wire n13_o;
  wire [5:0] n14_o;
  wire n16_o;
  wire [6:0] n17_o;
  wire [31:0] n19_o;
  wire [5:0] n20_o;
  wire [5:0] n22_o;
  wire [5:0] n24_o;
  wire n29_o;
  wire n30_o;
  wire [30:0] n31_o;
  wire [31:0] n32_o;
  wire [31:0] n33_o;
  wire n34_o;
  wire n36_o;
  wire n38_o;
  wire [31:0] n39_o;
  wire [31:0] n40_o;
  wire n41_o;
  wire n43_o;
  wire n45_o;
  wire n46_o;
  wire n48_o;
  wire n53_o;
  wire [30:0] n54_o;
  wire [31:0] n55_o;
  wire [31:0] n57_o;
  wire [9:0] n58_o;
  wire [31:0] n59_o;
  wire [31:0] n60_o;
  wire n61_o;
  wire [31:0] n62_o;
  wire [31:0] n64_o;
  wire [9:0] n65_o;
  wire [9:0] n67_o;
  wire [31:0] n68_o;
  wire n70_o;
  wire [31:0] n71_o;
  wire n73_o;
  wire [31:0] n74_o;
  wire [31:0] n76_o;
  wire [6:0] n77_o;
  wire [6:0] n79_o;
  wire [6:0] n80_o;
  wire [6:0] n82_o;
  wire [5:0] n86_o;
  wire [6:0] n88_o;
  wire [9:0] n89_o;
  wire [9:0] n91_o;
  reg n97_q;
  reg [5:0] n98_q;
  reg [5:0] n99_q;
  reg [6:0] n100_q;
  reg [9:0] n101_q;
  reg [9:0] n102_q;
  wire [7:0] n103_o;
  wire [5:0] n105_data; // mem_rd
  assign uo_out = n103_o;
  assign uio_oe = n10_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:40:12  */
  assign ref_in = n8_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:41:12  */
  assign pwm_out = n97_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:42:12  */
  assign counter = n98_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:43:12  */
  assign enable_pwm = n6_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:44:12  */
  assign breathe_state = n7_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:69:13  */
  always @*
    sin_value = n99_q; // (isignal)
  initial
    sin_value = 6'b000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:70:13  */
  always @*
    index = n100_q; // (isignal)
  initial
    index = 7'b0000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:72:13  */
  always @*
    clock_div = n101_q; // (isignal)
  initial
    clock_div = 10'b1001110110;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:73:13  */
  always @*
    clock_ticks = n102_q; // (isignal)
  initial
    clock_ticks = 10'b1001110110;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:77:24  */
  assign n6_o = ui_in[7];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:78:27  */
  assign n7_o = ui_in[6];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:79:20  */
  assign n8_o = ui_in[5:0];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:23  */
  assign n13_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:28  */
  assign n14_o = {counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:28  */
  assign n16_o = n14_o == 6'b111111;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:94:40  */
  assign n17_o = counter;  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:94:40  */
  assign n19_o = n17_o + 6'b000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:94:32  */
  assign n20_o = n19_o[5:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:17  */
  assign n22_o = n16_o ? 6'b000000 : n20_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:13  */
  assign n24_o = n13_o ? 6'b000000 : n22_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:23  */
  assign n29_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:107:34  */
  assign n30_o = ~breathe_state;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:25  */
  assign n31_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:54  */
  assign n32_o = {1'b0, n31_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:54  */
  assign n33_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:54  */
  assign n34_o = $signed(n32_o) >= $signed(n33_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:109:40  */
  assign n36_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:21  */
  assign n38_o = n34_o ? n36_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:35  */
  assign n39_o = {26'b0, sin_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:35  */
  assign n40_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:35  */
  assign n41_o = $signed(n39_o) >= $signed(n40_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:115:40  */
  assign n43_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:21  */
  assign n45_o = n41_o ? n43_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:107:17  */
  assign n46_o = n30_o ? n38_o : n45_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:13  */
  assign n48_o = n29_o ? 1'b0 : n46_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:22  */
  assign n53_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:132:33  */
  assign n54_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:132:32  */
  assign n55_o = {1'b0, n54_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:132:32  */
  assign n57_o = 32'b00000000000000000000000000001010 * n55_o; // smul
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:132:30  */
  assign n58_o = n57_o[9:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:32  */
  assign n59_o = {22'b0, clock_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:32  */
  assign n60_o = {22'b0, clock_div};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:32  */
  assign n61_o = $signed(n59_o) >= $signed(n60_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:136:48  */
  assign n62_o = {22'b0, clock_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:136:48  */
  assign n64_o = n62_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:136:36  */
  assign n65_o = n64_o[9:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:17  */
  assign n67_o = n61_o ? 10'b0000000000 : n65_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:138:32  */
  assign n68_o = {22'b0, clock_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:138:32  */
  assign n70_o = n68_o == 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:139:30  */
  assign n71_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:139:30  */
  assign n73_o = n71_o == 32'b00000000000000000000000001100011;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:142:40  */
  assign n74_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:142:40  */
  assign n76_o = n74_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:142:34  */
  assign n77_o = n76_o[6:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:139:21  */
  assign n79_o = n73_o ? 7'b0000000 : n77_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:138:17  */
  assign n80_o = n70_o ? n79_o : index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:145:34  */
  assign n82_o = 7'b1100011 - index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n86_o = n53_o ? sin_value : n105_data;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n88_o = n53_o ? 7'b0000000 : n80_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n89_o = n53_o ? clock_div : n58_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n91_o = n53_o ? 10'b0000000000 : n67_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:103:9  */
  always @(posedge clk)
    n97_q <= n48_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:9  */
  always @(posedge clk)
    n98_q <= n24_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  always @(posedge clk)
    n99_q <= n86_o;
  initial
    n99_q = 6'b000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  always @(posedge clk)
    n100_q <= n88_o;
  initial
    n100_q = 7'b0000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  always @(posedge clk)
    n101_q <= n89_o;
  initial
    n101_q = 10'b1001110110;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  always @(posedge clk)
    n102_q <= n91_o;
  initial
    n102_q = 10'b1001110110;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  assign n103_o = {pwm_out, 7'b0000000};
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:14:9  */
  wire [5:0] n104[99:0] ; // memory
  assign n104[99] = 6'b000000;
  assign n104[98] = 6'b000000;
  assign n104[97] = 6'b000000;
  assign n104[96] = 6'b000001;
  assign n104[95] = 6'b000001;
  assign n104[94] = 6'b000010;
  assign n104[93] = 6'b000010;
  assign n104[92] = 6'b000011;
  assign n104[91] = 6'b000100;
  assign n104[90] = 6'b000101;
  assign n104[89] = 6'b000110;
  assign n104[88] = 6'b000111;
  assign n104[87] = 6'b001001;
  assign n104[86] = 6'b001010;
  assign n104[85] = 6'b001011;
  assign n104[84] = 6'b001101;
  assign n104[83] = 6'b001111;
  assign n104[82] = 6'b010000;
  assign n104[81] = 6'b010010;
  assign n104[80] = 6'b010100;
  assign n104[79] = 6'b010110;
  assign n104[78] = 6'b011000;
  assign n104[77] = 6'b011010;
  assign n104[76] = 6'b011100;
  assign n104[75] = 6'b011110;
  assign n104[74] = 6'b100000;
  assign n104[73] = 6'b100001;
  assign n104[72] = 6'b100011;
  assign n104[71] = 6'b100101;
  assign n104[70] = 6'b100111;
  assign n104[69] = 6'b101001;
  assign n104[68] = 6'b101011;
  assign n104[67] = 6'b101101;
  assign n104[66] = 6'b101111;
  assign n104[65] = 6'b110000;
  assign n104[64] = 6'b110010;
  assign n104[63] = 6'b110100;
  assign n104[62] = 6'b110101;
  assign n104[61] = 6'b110110;
  assign n104[60] = 6'b111000;
  assign n104[59] = 6'b111001;
  assign n104[58] = 6'b111010;
  assign n104[57] = 6'b111011;
  assign n104[56] = 6'b111100;
  assign n104[55] = 6'b111101;
  assign n104[54] = 6'b111101;
  assign n104[53] = 6'b111110;
  assign n104[52] = 6'b111110;
  assign n104[51] = 6'b111111;
  assign n104[50] = 6'b111111;
  assign n104[49] = 6'b111111;
  assign n104[48] = 6'b111111;
  assign n104[47] = 6'b111111;
  assign n104[46] = 6'b111110;
  assign n104[45] = 6'b111110;
  assign n104[44] = 6'b111101;
  assign n104[43] = 6'b111101;
  assign n104[42] = 6'b111100;
  assign n104[41] = 6'b111011;
  assign n104[40] = 6'b111010;
  assign n104[39] = 6'b111001;
  assign n104[38] = 6'b111000;
  assign n104[37] = 6'b110110;
  assign n104[36] = 6'b110101;
  assign n104[35] = 6'b110100;
  assign n104[34] = 6'b110010;
  assign n104[33] = 6'b110000;
  assign n104[32] = 6'b101111;
  assign n104[31] = 6'b101101;
  assign n104[30] = 6'b101011;
  assign n104[29] = 6'b101001;
  assign n104[28] = 6'b100111;
  assign n104[27] = 6'b100101;
  assign n104[26] = 6'b100011;
  assign n104[25] = 6'b100001;
  assign n104[24] = 6'b100000;
  assign n104[23] = 6'b011110;
  assign n104[22] = 6'b011100;
  assign n104[21] = 6'b011010;
  assign n104[20] = 6'b011000;
  assign n104[19] = 6'b010110;
  assign n104[18] = 6'b010100;
  assign n104[17] = 6'b010010;
  assign n104[16] = 6'b010000;
  assign n104[15] = 6'b001111;
  assign n104[14] = 6'b001101;
  assign n104[13] = 6'b001011;
  assign n104[12] = 6'b001010;
  assign n104[11] = 6'b001001;
  assign n104[10] = 6'b000111;
  assign n104[9] = 6'b000110;
  assign n104[8] = 6'b000101;
  assign n104[7] = 6'b000100;
  assign n104[6] = 6'b000011;
  assign n104[5] = 6'b000010;
  assign n104[4] = 6'b000010;
  assign n104[3] = 6'b000001;
  assign n104[2] = 6'b000001;
  assign n104[1] = 6'b000000;
  assign n104[0] = 6'b000000;

  assign n105_data = n104[n82_o];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:145:34  */
endmodule

