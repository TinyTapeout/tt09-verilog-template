module tt_um_tobimckellar_top
  (input  [7:0] ui_in,
   input  [7:0] uio_in,
   input  [7:0] uio_out,
   input  ena,
   input  clk,
   input  rst_n,
   output [7:0] uo_out,
   output [7:0] uio_oe);
  wire [5:0] ref_in;
  wire pwm_out;
  wire [5:0] counter;
  wire enable_pwm;
  wire breathe_state;
  wire [5:0] triangle_value;
  wire count_up;
  wire [9:0] clock_divisor;
  wire [9:0] clock_divisor_ticks;
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
  wire n36_o;
  wire n38_o;
  wire n39_o;
  wire n41_o;
  wire n43_o;
  wire n44_o;
  wire [31:0] n45_o;
  wire [31:0] n46_o;
  wire n47_o;
  wire n49_o;
  wire n51_o;
  wire n52_o;
  wire n54_o;
  wire n59_o;
  wire [30:0] n60_o;
  wire [31:0] n61_o;
  wire [31:0] n63_o;
  wire [9:0] n64_o;
  wire [31:0] n65_o;
  wire [31:0] n66_o;
  wire n67_o;
  wire [31:0] n68_o;
  wire [31:0] n70_o;
  wire [9:0] n71_o;
  wire [31:0] n73_o;
  wire n75_o;
  wire n76_o;
  wire [31:0] n77_o;
  wire n79_o;
  wire n80_o;
  wire n81_o;
  wire n82_o;
  wire n83_o;
  wire n84_o;
  wire [31:0] n85_o;
  wire [31:0] n87_o;
  wire [5:0] n88_o;
  wire [31:0] n89_o;
  wire [31:0] n91_o;
  wire [5:0] n92_o;
  wire [5:0] n93_o;
  wire [5:0] n94_o;
  wire n95_o;
  wire [9:0] n97_o;
  wire [5:0] n100_o;
  wire n102_o;
  wire [9:0] n104_o;
  wire [9:0] n106_o;
  reg n115_q;
  reg [5:0] n116_q;
  reg [5:0] n117_q;
  reg n118_q;
  reg [9:0] n119_q;
  reg [9:0] n120_q;
  wire [7:0] n122_o;
  assign uo_out = n122_o;
  assign uio_oe = n6_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:40:12  */
  assign ref_in = n4_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:41:12  */
  assign pwm_out = n115_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:42:12  */
  assign counter = n116_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:43:12  */
  assign enable_pwm = n2_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:44:12  */
  assign breathe_state = n3_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:47:12  */
  assign triangle_value = n117_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:48:12  */
  assign count_up = n118_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:50:12  */
  assign clock_divisor = n119_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:51:12  */
  assign clock_divisor_ticks = n120_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:56:24  */
  assign n2_o = ui_in[7];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:57:27  */
  assign n3_o = ui_in[6];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:58:20  */
  assign n4_o = ui_in[5:0];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:67:23  */
  assign n9_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:70:28  */
  assign n10_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:70:28  */
  assign n12_o = n10_o == 32'b00000000000000000000000000111111;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:73:40  */
  assign n13_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:73:40  */
  assign n15_o = n13_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:73:32  */
  assign n16_o = n15_o[5:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:70:17  */
  assign n18_o = n12_o ? 6'b000000 : n16_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:67:13  */
  assign n20_o = n9_o ? 6'b000000 : n18_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:83:23  */
  assign n25_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:86:34  */
  assign n26_o = ~breathe_state;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:25  */
  assign n27_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:54  */
  assign n28_o = {1'b0, n27_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:54  */
  assign n29_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:54  */
  assign n30_o = $signed(n28_o) > $signed(n29_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:88:40  */
  assign n32_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:21  */
  assign n34_o = n30_o ? n32_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:92:31  */
  assign n36_o = ref_in == 6'b111111;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:93:40  */
  assign n38_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:92:21  */
  assign n39_o = n36_o ? n38_o : n34_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:95:31  */
  assign n41_o = ref_in == 6'b000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:96:40  */
  assign n43_o = 1'b0 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:95:21  */
  assign n44_o = n41_o ? n43_o : n39_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:99:40  */
  assign n45_o = {26'b0, triangle_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:99:40  */
  assign n46_o = {26'b0, counter};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:99:40  */
  assign n47_o = $signed(n45_o) > $signed(n46_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:100:44  */
  assign n49_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:99:21  */
  assign n51_o = n47_o ? n49_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:86:17  */
  assign n52_o = n26_o ? n44_o : n51_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:83:13  */
  assign n54_o = n25_o ? 1'b0 : n52_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:112:22  */
  assign n59_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:119:37  */
  assign n60_o = {25'b0, ref_in};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:119:36  */
  assign n61_o = {1'b0, n60_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:119:36  */
  assign n63_o = 32'b00000000000000000000000000001010 * n61_o; // smul
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:119:34  */
  assign n64_o = n63_o[9:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:120:40  */
  assign n65_o = {22'b0, clock_divisor_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:120:40  */
  assign n66_o = {22'b0, clock_divisor};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:120:40  */
  assign n67_o = $signed(n65_o) < $signed(n66_o);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:121:64  */
  assign n68_o = {22'b0, clock_divisor_ticks};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:121:64  */
  assign n70_o = n68_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:121:44  */
  assign n71_o = n70_o[9:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:41  */
  assign n73_o = {26'b0, triangle_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:41  */
  assign n75_o = n73_o == 32'b00000000000000000000000000111110;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:55  */
  assign n76_o = count_up & n75_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:94  */
  assign n77_o = {26'b0, triangle_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:94  */
  assign n79_o = n77_o == 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:111  */
  assign n80_o = ~count_up;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:98  */
  assign n81_o = n80_o & n79_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:75  */
  assign n82_o = n76_o | n81_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:37  */
  assign n83_o = ~count_up;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:21  */
  assign n84_o = n82_o ? n83_o : count_up;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:129:58  */
  assign n85_o = {26'b0, triangle_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:129:58  */
  assign n87_o = n85_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:129:43  */
  assign n88_o = n87_o[5:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:131:58  */
  assign n89_o = {26'b0, triangle_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:131:58  */
  assign n91_o = n89_o - 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:131:43  */
  assign n92_o = n91_o[5:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:128:21  */
  assign n93_o = count_up ? n88_o : n92_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:120:17  */
  assign n94_o = n67_o ? triangle_value : n93_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:120:17  */
  assign n95_o = n67_o ? count_up : n84_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:120:17  */
  assign n97_o = n67_o ? n71_o : 10'b0000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:112:13  */
  assign n100_o = n59_o ? 6'b000000 : n94_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:112:13  */
  assign n102_o = n59_o ? 1'b1 : n95_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:112:13  */
  assign n104_o = n59_o ? 10'b0000000000 : n64_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:112:13  */
  assign n106_o = n59_o ? 10'b0000000000 : n97_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:82:9  */
  always @(posedge clk)
    n115_q <= n54_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:66:9  */
  always @(posedge clk)
    n116_q <= n20_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:9  */
  always @(posedge clk)
    n117_q <= n100_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:9  */
  always @(posedge clk)
    n118_q <= n102_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:9  */
  always @(posedge clk)
    n119_q <= n104_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:9  */
  always @(posedge clk)
    n120_q <= n106_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:9  */
  assign n122_o = {pwm_out, 7'b0000000};
endmodule

