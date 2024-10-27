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
  wire [5:0] sin_value;
  wire [6:0] index;
  wire [9:0] clock_div;
  wire [9:0] clock_ticks;
  wire n2_o;
  wire n3_o;
  wire [5:0] n4_o;
  localparam [7:0] n6_o = 8'b00000000;
  wire n9_o;
  wire [31:0] n10_o;
  wire n12_o;
  wire [31:0] n13_o;
  wire [31:0] n15_o;
  wire [5:0] n16_o;
  wire [5:0] n18_o;
  wire [5:0] n20_o;
  wire n25_o;
  wire n26_o;
  wire [30:0] n27_o;
  wire [31:0] n28_o;
  wire [31:0] n29_o;
  wire n30_o;
  wire n32_o;
  wire n34_o;
  wire [31:0] n35_o;
  wire [31:0] n36_o;
  wire n37_o;
  wire n39_o;
  wire n41_o;
  wire n42_o;
  wire n44_o;
  wire n49_o;
  wire [30:0] n50_o;
  wire [31:0] n51_o;
  wire [31:0] n53_o;
  wire [9:0] n54_o;
  wire [31:0] n55_o;
  wire [31:0] n56_o;
  wire n57_o;
  wire [31:0] n58_o;
  wire [31:0] n60_o;
  wire [9:0] n61_o;
  wire [9:0] n63_o;
  wire [31:0] n64_o;
  wire n66_o;
  wire [31:0] n67_o;
  wire n69_o;
  wire [31:0] n70_o;
  wire [31:0] n72_o;
  wire [6:0] n73_o;
  wire [6:0] n75_o;
  wire [6:0] n76_o;
  wire [6:0] n78_o;
  wire [6:0] n84_o;
  wire [9:0] n86_o;
  wire [9:0] n88_o;
  reg n94_q;
  reg [5:0] n95_q;
  reg [6:0] n97_q;
  reg [9:0] n98_q;
  reg [9:0] n99_q;
  wire [7:0] n100_o;
  wire n102_o;
  reg [5:0] n103_data; // mem_rd
  assign uo_out = n100_o;
  assign uio_oe = n6_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:40:12  */
  assign ref_in = n4_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:41:12  */
  assign pwm_out = n94_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:42:12  */
  assign counter = n95_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:43:12  */
  assign enable_pwm = n2_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:44:12  */
  assign breathe_state = n3_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:69:13  */
  assign sin_value = n103_data; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:70:13  */
  assign index = n97_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:72:13  */
  assign clock_div = n98_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:73:13  */
  assign clock_ticks = n99_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:77:24  */
  assign n2_o = ui_in[7];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:78:27  */
  assign n3_o = ui_in[6];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:79:20  */
  assign n4_o = ui_in[5:0];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:23  */
  assign n9_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:28  */
  assign n10_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:28  */
  assign n12_o = n10_o == 32'b00000000000000000000000000111111;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:94:40  */
  assign n13_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:94:40  */
  assign n15_o = n13_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:94:32  */
  assign n16_o = n15_o[5:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:17  */
  assign n18_o = n12_o ? 6'b000000 : n16_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:13  */
  assign n20_o = n9_o ? 6'b000000 : n18_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:23  */
  assign n25_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:107:34  */
  assign n26_o = ~breathe_state;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:25  */
  assign n27_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:54  */
  assign n28_o = {1'b0, n27_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:54  */
  assign n29_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:54  */
  assign n30_o = $signed(n28_o) >= $signed(n29_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:109:40  */
  assign n32_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:108:21  */
  assign n34_o = n30_o ? n32_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:35  */
  assign n35_o = {26'b0, sin_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:35  */
  assign n36_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:35  */
  assign n37_o = $signed(n35_o) >= $signed(n36_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:115:40  */
  assign n39_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:114:21  */
  assign n41_o = n37_o ? n39_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:107:17  */
  assign n42_o = n26_o ? n34_o : n41_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:13  */
  assign n44_o = n25_o ? 1'b0 : n42_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:22  */
  assign n49_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:33  */
  assign n50_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:32  */
  assign n51_o = {1'b0, n50_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:32  */
  assign n53_o = 32'b00000000000000000000000000001010 * n51_o; // smul
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:133:30  */
  assign n54_o = n53_o[9:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:134:32  */
  assign n55_o = {22'b0, clock_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:134:32  */
  assign n56_o = {22'b0, clock_div};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:134:32  */
  assign n57_o = $signed(n55_o) >= $signed(n56_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:137:48  */
  assign n58_o = {22'b0, clock_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:137:48  */
  assign n60_o = n58_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:137:36  */
  assign n61_o = n60_o[9:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:134:17  */
  assign n63_o = n57_o ? 10'b0000000000 : n61_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:139:32  */
  assign n64_o = {22'b0, clock_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:139:32  */
  assign n66_o = n64_o == 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:140:30  */
  assign n67_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:140:30  */
  assign n69_o = n67_o == 32'b00000000000000000000000001100011;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:143:40  */
  assign n70_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:143:40  */
  assign n72_o = n70_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:143:34  */
  assign n73_o = n72_o[6:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:140:21  */
  assign n75_o = n69_o ? 7'b0000000 : n73_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:139:17  */
  assign n76_o = n66_o ? n75_o : index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:146:34  */
  assign n78_o = 7'b1100011 - index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n84_o = n49_o ? 7'b0000000 : n76_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n86_o = n49_o ? 10'b0000000000 : n54_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n88_o = n49_o ? 10'b0000000000 : n63_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:103:9  */
  always @(posedge clk)
    n94_q <= n44_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:9  */
  always @(posedge clk)
    n95_q <= n20_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  always @(posedge clk)
    n97_q <= n84_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  always @(posedge clk)
    n98_q <= n86_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  always @(posedge clk)
    n99_q <= n88_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:9  */
  assign n100_o = {pwm_out, 7'b0000000};
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:14:9  */
  (* keep *) wire [5:0] n101[99:0] ; // memory
  assign n101[99] = 6'b000000;
  assign n101[98] = 6'b000000;
  assign n101[97] = 6'b000000;
  assign n101[96] = 6'b000001;
  assign n101[95] = 6'b000001;
  assign n101[94] = 6'b000010;
  assign n101[93] = 6'b000010;
  assign n101[92] = 6'b000011;
  assign n101[91] = 6'b000100;
  assign n101[90] = 6'b000101;
  assign n101[89] = 6'b000110;
  assign n101[88] = 6'b000111;
  assign n101[87] = 6'b001001;
  assign n101[86] = 6'b001010;
  assign n101[85] = 6'b001011;
  assign n101[84] = 6'b001101;
  assign n101[83] = 6'b001111;
  assign n101[82] = 6'b010000;
  assign n101[81] = 6'b010010;
  assign n101[80] = 6'b010100;
  assign n101[79] = 6'b010110;
  assign n101[78] = 6'b011000;
  assign n101[77] = 6'b011010;
  assign n101[76] = 6'b011100;
  assign n101[75] = 6'b011110;
  assign n101[74] = 6'b100000;
  assign n101[73] = 6'b100001;
  assign n101[72] = 6'b100011;
  assign n101[71] = 6'b100101;
  assign n101[70] = 6'b100111;
  assign n101[69] = 6'b101001;
  assign n101[68] = 6'b101011;
  assign n101[67] = 6'b101101;
  assign n101[66] = 6'b101111;
  assign n101[65] = 6'b110000;
  assign n101[64] = 6'b110010;
  assign n101[63] = 6'b110100;
  assign n101[62] = 6'b110101;
  assign n101[61] = 6'b110110;
  assign n101[60] = 6'b111000;
  assign n101[59] = 6'b111001;
  assign n101[58] = 6'b111010;
  assign n101[57] = 6'b111011;
  assign n101[56] = 6'b111100;
  assign n101[55] = 6'b111101;
  assign n101[54] = 6'b111101;
  assign n101[53] = 6'b111110;
  assign n101[52] = 6'b111110;
  assign n101[51] = 6'b111111;
  assign n101[50] = 6'b111111;
  assign n101[49] = 6'b111111;
  assign n101[48] = 6'b111111;
  assign n101[47] = 6'b111111;
  assign n101[46] = 6'b111110;
  assign n101[45] = 6'b111110;
  assign n101[44] = 6'b111101;
  assign n101[43] = 6'b111101;
  assign n101[42] = 6'b111100;
  assign n101[41] = 6'b111011;
  assign n101[40] = 6'b111010;
  assign n101[39] = 6'b111001;
  assign n101[38] = 6'b111000;
  assign n101[37] = 6'b110110;
  assign n101[36] = 6'b110101;
  assign n101[35] = 6'b110100;
  assign n101[34] = 6'b110010;
  assign n101[33] = 6'b110000;
  assign n101[32] = 6'b101111;
  assign n101[31] = 6'b101101;
  assign n101[30] = 6'b101011;
  assign n101[29] = 6'b101001;
  assign n101[28] = 6'b100111;
  assign n101[27] = 6'b100101;
  assign n101[26] = 6'b100011;
  assign n101[25] = 6'b100001;
  assign n101[24] = 6'b100000;
  assign n101[23] = 6'b011110;
  assign n101[22] = 6'b011100;
  assign n101[21] = 6'b011010;
  assign n101[20] = 6'b011000;
  assign n101[19] = 6'b010110;
  assign n101[18] = 6'b010100;
  assign n101[17] = 6'b010010;
  assign n101[16] = 6'b010000;
  assign n101[15] = 6'b001111;
  assign n101[14] = 6'b001101;
  assign n101[13] = 6'b001011;
  assign n101[12] = 6'b001010;
  assign n101[11] = 6'b001001;
  assign n101[10] = 6'b000111;
  assign n101[9] = 6'b000110;
  assign n101[8] = 6'b000101;
  assign n101[7] = 6'b000100;
  assign n101[6] = 6'b000011;
  assign n101[5] = 6'b000010;
  assign n101[4] = 6'b000010;
  assign n101[3] = 6'b000001;
  assign n101[2] = 6'b000001;
  assign n101[1] = 6'b000000;
  assign n101[0] = 6'b000000;
  always @(posedge clk)
    if (n102_o)
      n103_data <= n101[n78_o];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
  assign n102_o = ~n49_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:13  */
endmodule

