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
  wire n4_o;
  wire n5_o;
  wire [5:0] n6_o;
  localparam [7:0] n8_o = 8'b00000000;
  wire n11_o;
  wire [31:0] n12_o;
  wire n14_o;
  wire [31:0] n15_o;
  wire [31:0] n17_o;
  wire [5:0] n18_o;
  wire [5:0] n20_o;
  wire [5:0] n22_o;
  wire n27_o;
  wire n28_o;
  wire [30:0] n29_o;
  wire [31:0] n30_o;
  wire [31:0] n31_o;
  wire n32_o;
  wire n34_o;
  wire n36_o;
  wire [31:0] n37_o;
  wire [31:0] n38_o;
  wire n39_o;
  wire n41_o;
  wire n43_o;
  wire n44_o;
  wire n46_o;
  reg [31:0] sin_ref_clock_ticks;
  wire n53_o;
  wire [30:0] n54_o;
  wire [31:0] n55_o;
  wire [31:0] n57_o;
  wire n58_o;
  wire [31:0] n60_o;
  wire [31:0] n62_o;
  wire n64_o;
  wire [31:0] n65_o;
  wire n67_o;
  wire [31:0] n68_o;
  wire [31:0] n70_o;
  wire [6:0] n71_o;
  wire [6:0] n73_o;
  wire [6:0] n74_o;
  wire [6:0] n76_o;
  wire [5:0] n80_o;
  wire [6:0] n82_o;
  wire [31:0] n84_o;
  reg [31:0] n91_q;
  reg n92_q;
  reg [5:0] n93_q;
  reg [5:0] n94_q;
  reg [6:0] n95_q;
  wire [7:0] n96_o;
  wire [5:0] n98_data; // mem_rd
  assign uo_out = n96_o;
  assign uio_oe = n8_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:40:12  */
  assign ref_in = n6_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:41:12  */
  assign pwm_out = n92_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:42:12  */
  assign counter = n93_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:43:12  */
  assign enable_pwm = n4_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:44:12  */
  assign breathe_state = n5_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:69:13  */
  always @*
    sin_value = n94_q; // (isignal)
  initial
    sin_value = 6'b000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:70:13  */
  always @*
    index = n95_q; // (isignal)
  initial
    index = 7'b0000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:74:24  */
  assign n4_o = ui_in[7];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:75:27  */
  assign n5_o = ui_in[6];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:76:20  */
  assign n6_o = ui_in[5:0];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:85:23  */
  assign n11_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:28  */
  assign n12_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:28  */
  assign n14_o = n12_o == 32'b00000000000000000000000000111111;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:40  */
  assign n15_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:40  */
  assign n17_o = n15_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:91:32  */
  assign n18_o = n17_o[5:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:17  */
  assign n20_o = n14_o ? 6'b000000 : n18_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:85:13  */
  assign n22_o = n11_o ? 6'b000000 : n20_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:101:23  */
  assign n27_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:34  */
  assign n28_o = ~breathe_state;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:105:25  */
  assign n29_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:105:54  */
  assign n30_o = {1'b0, n29_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:105:54  */
  assign n31_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:105:54  */
  assign n32_o = $signed(n30_o) >= $signed(n31_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:106:40  */
  assign n34_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:105:21  */
  assign n36_o = n32_o ? n34_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:35  */
  assign n37_o = {26'b0, sin_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:35  */
  assign n38_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:35  */
  assign n39_o = $signed(n37_o) >= $signed(n38_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:112:40  */
  assign n41_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:21  */
  assign n43_o = n39_o ? n41_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:17  */
  assign n44_o = n28_o ? n36_o : n43_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:101:13  */
  assign n46_o = n27_o ? 1'b0 : n44_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:124:18  */
  always @*
    sin_ref_clock_ticks = n91_q; // (isignal)
  initial
    sin_ref_clock_ticks = 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:22  */
  assign n53_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:130:33  */
  assign n54_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:130:32  */
  assign n55_o = {1'b0, n54_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:130:32  */
  assign n57_o = 32'b00000000000000000000000000001010 * n55_o; // smul
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:131:32  */
  assign n58_o = $signed(sin_ref_clock_ticks) > $signed(n57_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:134:48  */
  assign n60_o = sin_ref_clock_ticks + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:131:17  */
  assign n62_o = n58_o ? 32'b00000000000000000000000000000000 : n60_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:136:32  */
  assign n64_o = n62_o == 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:137:30  */
  assign n65_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:137:30  */
  assign n67_o = n65_o == 32'b00000000000000000000000001100011;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:140:40  */
  assign n68_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:140:40  */
  assign n70_o = n68_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:140:34  */
  assign n71_o = n70_o[6:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:137:21  */
  assign n73_o = n67_o ? 7'b0000000 : n71_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:136:17  */
  assign n74_o = n64_o ? n73_o : index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:143:34  */
  assign n76_o = 7'b1100011 - index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:13  */
  assign n80_o = n53_o ? sin_value : n98_data;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:13  */
  assign n82_o = n53_o ? 7'b0000000 : n74_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:127:13  */
  assign n84_o = n53_o ? sin_ref_clock_ticks : n62_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:9  */
  always @(posedge clk)
    n91_q <= n84_o;
  initial
    n91_q = 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:100:9  */
  always @(posedge clk)
    n92_q <= n46_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:84:9  */
  always @(posedge clk)
    n93_q <= n22_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:9  */
  always @(posedge clk)
    n94_q <= n80_o;
  initial
    n94_q = 6'b000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:9  */
  always @(posedge clk)
    n95_q <= n82_o;
  initial
    n95_q = 7'b0000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:9  */
  assign n96_o = {pwm_out, 7'b0000000};
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:14:9  */
  reg [5:0] n97[99:0] ; // memory
  initial begin
    n97[99] = 6'b000000;
    n97[98] = 6'b000000;
    n97[97] = 6'b000000;
    n97[96] = 6'b000001;
    n97[95] = 6'b000001;
    n97[94] = 6'b000010;
    n97[93] = 6'b000010;
    n97[92] = 6'b000011;
    n97[91] = 6'b000100;
    n97[90] = 6'b000101;
    n97[89] = 6'b000110;
    n97[88] = 6'b000111;
    n97[87] = 6'b001001;
    n97[86] = 6'b001010;
    n97[85] = 6'b001011;
    n97[84] = 6'b001101;
    n97[83] = 6'b001111;
    n97[82] = 6'b010000;
    n97[81] = 6'b010010;
    n97[80] = 6'b010100;
    n97[79] = 6'b010110;
    n97[78] = 6'b011000;
    n97[77] = 6'b011010;
    n97[76] = 6'b011100;
    n97[75] = 6'b011110;
    n97[74] = 6'b100000;
    n97[73] = 6'b100001;
    n97[72] = 6'b100011;
    n97[71] = 6'b100101;
    n97[70] = 6'b100111;
    n97[69] = 6'b101001;
    n97[68] = 6'b101011;
    n97[67] = 6'b101101;
    n97[66] = 6'b101111;
    n97[65] = 6'b110000;
    n97[64] = 6'b110010;
    n97[63] = 6'b110100;
    n97[62] = 6'b110101;
    n97[61] = 6'b110110;
    n97[60] = 6'b111000;
    n97[59] = 6'b111001;
    n97[58] = 6'b111010;
    n97[57] = 6'b111011;
    n97[56] = 6'b111100;
    n97[55] = 6'b111101;
    n97[54] = 6'b111101;
    n97[53] = 6'b111110;
    n97[52] = 6'b111110;
    n97[51] = 6'b111111;
    n97[50] = 6'b111111;
    n97[49] = 6'b111111;
    n97[48] = 6'b111111;
    n97[47] = 6'b111111;
    n97[46] = 6'b111110;
    n97[45] = 6'b111110;
    n97[44] = 6'b111101;
    n97[43] = 6'b111101;
    n97[42] = 6'b111100;
    n97[41] = 6'b111011;
    n97[40] = 6'b111010;
    n97[39] = 6'b111001;
    n97[38] = 6'b111000;
    n97[37] = 6'b110110;
    n97[36] = 6'b110101;
    n97[35] = 6'b110100;
    n97[34] = 6'b110010;
    n97[33] = 6'b110000;
    n97[32] = 6'b101111;
    n97[31] = 6'b101101;
    n97[30] = 6'b101011;
    n97[29] = 6'b101001;
    n97[28] = 6'b100111;
    n97[27] = 6'b100101;
    n97[26] = 6'b100011;
    n97[25] = 6'b100001;
    n97[24] = 6'b100000;
    n97[23] = 6'b011110;
    n97[22] = 6'b011100;
    n97[21] = 6'b011010;
    n97[20] = 6'b011000;
    n97[19] = 6'b010110;
    n97[18] = 6'b010100;
    n97[17] = 6'b010010;
    n97[16] = 6'b010000;
    n97[15] = 6'b001111;
    n97[14] = 6'b001101;
    n97[13] = 6'b001011;
    n97[12] = 6'b001010;
    n97[11] = 6'b001001;
    n97[10] = 6'b000111;
    n97[9] = 6'b000110;
    n97[8] = 6'b000101;
    n97[7] = 6'b000100;
    n97[6] = 6'b000011;
    n97[5] = 6'b000010;
    n97[4] = 6'b000010;
    n97[3] = 6'b000001;
    n97[2] = 6'b000001;
    n97[1] = 6'b000000;
    n97[0] = 6'b000000;
    end
  assign n98_data = n97[n76_o];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:143:34  */
endmodule

