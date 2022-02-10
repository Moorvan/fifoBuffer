module srFIFO(
  input        clock,
  input        reset,
  input  [3:0] io_dataIn,
  input        io_push,
  input        io_pop,
  output [3:0] io_dataOut,
  output       io_full,
  output       io_empty
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] memRegs [0:7]; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_1_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_1_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_1_data; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_3_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_3_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_3_data; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_5_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_5_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_5_data; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_7_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_7_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_7_data; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_9_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_9_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_9_data; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_11_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_11_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_11_data; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_13_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_13_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_13_data; // @[FIFOs.scala 52:20]
  wire  memRegs_io_dataOut_MPORT_en; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_io_dataOut_MPORT_addr; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_io_dataOut_MPORT_data; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_en; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_2_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_2_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_2_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_2_en; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_4_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_4_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_4_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_4_en; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_6_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_6_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_6_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_6_en; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_8_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_8_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_8_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_8_en; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_10_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_10_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_10_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_10_en; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_12_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_12_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_12_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_12_en; // @[FIFOs.scala 52:20]
  wire [3:0] memRegs_MPORT_14_data; // @[FIFOs.scala 52:20]
  wire [2:0] memRegs_MPORT_14_addr; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_14_mask; // @[FIFOs.scala 52:20]
  wire  memRegs_MPORT_14_en; // @[FIFOs.scala 52:20]
  reg [2:0] tailReg; // @[FIFOs.scala 54:24]
  reg  emptyReg; // @[FIFOs.scala 55:25]
  wire  _T = ~io_full; // @[FIFOs.scala 57:18]
  wire  _T_2 = ~emptyReg; // @[FIFOs.scala 62:10]
  wire [2:0] _tailReg_T_1 = tailReg + 3'h1; // @[FIFOs.scala 63:26]
  wire  _T_5 = tailReg == 3'h0; // @[FIFOs.scala 67:18]
  wire  _GEN_1 = tailReg == 3'h0 | emptyReg; // @[FIFOs.scala 67:27 68:16 55:25]
  wire [2:0] _tailReg_T_3 = tailReg - 3'h1; // @[FIFOs.scala 73:26]
  wire  _GEN_2 = _T_5 | _GEN_1; // @[FIFOs.scala 70:27 71:16]
  wire  _GEN_4 = io_pop & _T_2 ? _GEN_2 : emptyReg; // @[FIFOs.scala 55:25 66:34]
  wire  _GEN_25 = io_push & ~io_full ? 1'h0 : _GEN_4; // @[FIFOs.scala 57:28 65:14]
  assign memRegs_MPORT_1_en = io_push & _T;
  assign memRegs_MPORT_1_addr = 3'h6;
  assign memRegs_MPORT_1_data = memRegs[memRegs_MPORT_1_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_MPORT_3_en = io_push & _T;
  assign memRegs_MPORT_3_addr = 3'h5;
  assign memRegs_MPORT_3_data = memRegs[memRegs_MPORT_3_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_MPORT_5_en = io_push & _T;
  assign memRegs_MPORT_5_addr = 3'h4;
  assign memRegs_MPORT_5_data = memRegs[memRegs_MPORT_5_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_MPORT_7_en = io_push & _T;
  assign memRegs_MPORT_7_addr = 3'h3;
  assign memRegs_MPORT_7_data = memRegs[memRegs_MPORT_7_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_MPORT_9_en = io_push & _T;
  assign memRegs_MPORT_9_addr = 3'h2;
  assign memRegs_MPORT_9_data = memRegs[memRegs_MPORT_9_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_MPORT_11_en = io_push & _T;
  assign memRegs_MPORT_11_addr = 3'h1;
  assign memRegs_MPORT_11_data = memRegs[memRegs_MPORT_11_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_MPORT_13_en = io_push & _T;
  assign memRegs_MPORT_13_addr = 3'h0;
  assign memRegs_MPORT_13_data = memRegs[memRegs_MPORT_13_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_io_dataOut_MPORT_en = 1'h1;
  assign memRegs_io_dataOut_MPORT_addr = tailReg;
  assign memRegs_io_dataOut_MPORT_data = memRegs[memRegs_io_dataOut_MPORT_addr]; // @[FIFOs.scala 52:20]
  assign memRegs_MPORT_data = memRegs_MPORT_1_data;
  assign memRegs_MPORT_addr = 3'h7;
  assign memRegs_MPORT_mask = 1'h1;
  assign memRegs_MPORT_en = io_push & _T;
  assign memRegs_MPORT_2_data = memRegs_MPORT_3_data;
  assign memRegs_MPORT_2_addr = 3'h6;
  assign memRegs_MPORT_2_mask = 1'h1;
  assign memRegs_MPORT_2_en = io_push & _T;
  assign memRegs_MPORT_4_data = memRegs_MPORT_5_data;
  assign memRegs_MPORT_4_addr = 3'h5;
  assign memRegs_MPORT_4_mask = 1'h1;
  assign memRegs_MPORT_4_en = io_push & _T;
  assign memRegs_MPORT_6_data = memRegs_MPORT_7_data;
  assign memRegs_MPORT_6_addr = 3'h4;
  assign memRegs_MPORT_6_mask = 1'h1;
  assign memRegs_MPORT_6_en = io_push & _T;
  assign memRegs_MPORT_8_data = memRegs_MPORT_9_data;
  assign memRegs_MPORT_8_addr = 3'h3;
  assign memRegs_MPORT_8_mask = 1'h1;
  assign memRegs_MPORT_8_en = io_push & _T;
  assign memRegs_MPORT_10_data = memRegs_MPORT_11_data;
  assign memRegs_MPORT_10_addr = 3'h2;
  assign memRegs_MPORT_10_mask = 1'h1;
  assign memRegs_MPORT_10_en = io_push & _T;
  assign memRegs_MPORT_12_data = memRegs_MPORT_13_data;
  assign memRegs_MPORT_12_addr = 3'h1;
  assign memRegs_MPORT_12_mask = 1'h1;
  assign memRegs_MPORT_12_en = io_push & _T;
  assign memRegs_MPORT_14_data = io_dataIn;
  assign memRegs_MPORT_14_addr = 3'h0;
  assign memRegs_MPORT_14_mask = 1'h1;
  assign memRegs_MPORT_14_en = io_push & _T;
  assign io_dataOut = memRegs_io_dataOut_MPORT_data; // @[FIFOs.scala 77:14]
  assign io_full = tailReg == 3'h7; // @[FIFOs.scala 79:22]
  assign io_empty = emptyReg; // @[FIFOs.scala 78:12]
  always @(posedge clock) begin
    if (memRegs_MPORT_en & memRegs_MPORT_mask) begin
      memRegs[memRegs_MPORT_addr] <= memRegs_MPORT_data; // @[FIFOs.scala 52:20]
    end
    if (memRegs_MPORT_2_en & memRegs_MPORT_2_mask) begin
      memRegs[memRegs_MPORT_2_addr] <= memRegs_MPORT_2_data; // @[FIFOs.scala 52:20]
    end
    if (memRegs_MPORT_4_en & memRegs_MPORT_4_mask) begin
      memRegs[memRegs_MPORT_4_addr] <= memRegs_MPORT_4_data; // @[FIFOs.scala 52:20]
    end
    if (memRegs_MPORT_6_en & memRegs_MPORT_6_mask) begin
      memRegs[memRegs_MPORT_6_addr] <= memRegs_MPORT_6_data; // @[FIFOs.scala 52:20]
    end
    if (memRegs_MPORT_8_en & memRegs_MPORT_8_mask) begin
      memRegs[memRegs_MPORT_8_addr] <= memRegs_MPORT_8_data; // @[FIFOs.scala 52:20]
    end
    if (memRegs_MPORT_10_en & memRegs_MPORT_10_mask) begin
      memRegs[memRegs_MPORT_10_addr] <= memRegs_MPORT_10_data; // @[FIFOs.scala 52:20]
    end
    if (memRegs_MPORT_12_en & memRegs_MPORT_12_mask) begin
      memRegs[memRegs_MPORT_12_addr] <= memRegs_MPORT_12_data; // @[FIFOs.scala 52:20]
    end
    if (memRegs_MPORT_14_en & memRegs_MPORT_14_mask) begin
      memRegs[memRegs_MPORT_14_addr] <= memRegs_MPORT_14_data; // @[FIFOs.scala 52:20]
    end
    if (reset) begin // @[FIFOs.scala 54:24]
      tailReg <= 3'h0; // @[FIFOs.scala 54:24]
    end else if (io_push & ~io_full) begin // @[FIFOs.scala 57:28]
      if (~emptyReg) begin // @[FIFOs.scala 62:21]
        tailReg <= _tailReg_T_1; // @[FIFOs.scala 63:15]
      end
    end else if (io_pop & _T_2) begin // @[FIFOs.scala 66:34]
      if (!(_T_5)) begin // @[FIFOs.scala 70:27]
        tailReg <= _tailReg_T_3; // @[FIFOs.scala 73:15]
      end
    end
    emptyReg <= reset | _GEN_25; // @[FIFOs.scala 55:{25,25}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    memRegs[initvar] = _RAND_0[3:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tailReg = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  emptyReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module rbFIFO(
  input        clock,
  input        reset,
  input  [3:0] io_dataIn,
  input        io_push,
  input        io_pop,
  output [3:0] io_dataOut,
  output       io_full,
  output       io_empty
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] memRegs [0:7]; // @[FIFOs.scala 99:20]
  wire  memRegs_io_dataOut_MPORT_en; // @[FIFOs.scala 99:20]
  wire [2:0] memRegs_io_dataOut_MPORT_addr; // @[FIFOs.scala 99:20]
  wire [3:0] memRegs_io_dataOut_MPORT_data; // @[FIFOs.scala 99:20]
  wire [3:0] memRegs_MPORT_data; // @[FIFOs.scala 99:20]
  wire [2:0] memRegs_MPORT_addr; // @[FIFOs.scala 99:20]
  wire  memRegs_MPORT_mask; // @[FIFOs.scala 99:20]
  wire  memRegs_MPORT_en; // @[FIFOs.scala 99:20]
  reg [2:0] tailReg; // @[FIFOs.scala 100:24]
  reg [2:0] headReg; // @[FIFOs.scala 101:24]
  reg  emptyReg; // @[FIFOs.scala 102:25]
  wire  _T = ~io_full; // @[FIFOs.scala 104:18]
  wire [2:0] _headReg_T_1 = headReg + 3'h1; // @[FIFOs.scala 106:24]
  wire  _T_2 = ~emptyReg; // @[FIFOs.scala 108:23]
  wire [2:0] _tailReg_T_1 = tailReg + 3'h1; // @[FIFOs.scala 109:24]
  wire  _GEN_0 = _tailReg_T_1 == headReg | emptyReg; // @[FIFOs.scala 110:39 111:16 102:25]
  wire  _GEN_2 = io_pop & ~emptyReg ? _GEN_0 : emptyReg; // @[FIFOs.scala 102:25 108:34]
  wire  _GEN_9 = io_push & ~io_full ? 1'h0 : _GEN_2; // @[FIFOs.scala 104:28 107:14]
  assign memRegs_io_dataOut_MPORT_en = 1'h1;
  assign memRegs_io_dataOut_MPORT_addr = tailReg;
  assign memRegs_io_dataOut_MPORT_data = memRegs[memRegs_io_dataOut_MPORT_addr]; // @[FIFOs.scala 99:20]
  assign memRegs_MPORT_data = io_dataIn;
  assign memRegs_MPORT_addr = headReg;
  assign memRegs_MPORT_mask = 1'h1;
  assign memRegs_MPORT_en = io_push & _T;
  assign io_dataOut = memRegs_io_dataOut_MPORT_data; // @[FIFOs.scala 116:14]
  assign io_full = tailReg == headReg & _T_2; // @[FIFOs.scala 117:36]
  assign io_empty = emptyReg; // @[FIFOs.scala 115:12]
  always @(posedge clock) begin
    if (memRegs_MPORT_en & memRegs_MPORT_mask) begin
      memRegs[memRegs_MPORT_addr] <= memRegs_MPORT_data; // @[FIFOs.scala 99:20]
    end
    if (reset) begin // @[FIFOs.scala 100:24]
      tailReg <= 3'h0; // @[FIFOs.scala 100:24]
    end else if (!(io_push & ~io_full)) begin // @[FIFOs.scala 104:28]
      if (io_pop & ~emptyReg) begin // @[FIFOs.scala 108:34]
        tailReg <= _tailReg_T_1; // @[FIFOs.scala 109:13]
      end
    end
    if (reset) begin // @[FIFOs.scala 101:24]
      headReg <= 3'h0; // @[FIFOs.scala 101:24]
    end else if (io_push & ~io_full) begin // @[FIFOs.scala 104:28]
      headReg <= _headReg_T_1; // @[FIFOs.scala 106:13]
    end
    emptyReg <= reset | _GEN_9; // @[FIFOs.scala 102:{25,25}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    memRegs[initvar] = _RAND_0[3:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tailReg = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  headReg = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  emptyReg = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module compareFIFOs(
  input        clock,
  input        reset,
  input  [3:0] io_dataIn,
  input        io_push,
  input        io_pop
);
  wire  resetCounter_clk; // @[Formal.scala 10:36]
  wire  resetCounter_reset; // @[Formal.scala 10:36]
  wire [31:0] resetCounter_timeSinceReset; // @[Formal.scala 10:36]
  wire  resetCounter_notChaos; // @[Formal.scala 10:36]
  wire  srFIFO_clock; // @[FIFOs.scala 15:22]
  wire  srFIFO_reset; // @[FIFOs.scala 15:22]
  wire [3:0] srFIFO_io_dataIn; // @[FIFOs.scala 15:22]
  wire  srFIFO_io_push; // @[FIFOs.scala 15:22]
  wire  srFIFO_io_pop; // @[FIFOs.scala 15:22]
  wire [3:0] srFIFO_io_dataOut; // @[FIFOs.scala 15:22]
  wire  srFIFO_io_full; // @[FIFOs.scala 15:22]
  wire  srFIFO_io_empty; // @[FIFOs.scala 15:22]
  wire  rbFIFO_clock; // @[FIFOs.scala 16:22]
  wire  rbFIFO_reset; // @[FIFOs.scala 16:22]
  wire [3:0] rbFIFO_io_dataIn; // @[FIFOs.scala 16:22]
  wire  rbFIFO_io_push; // @[FIFOs.scala 16:22]
  wire  rbFIFO_io_pop; // @[FIFOs.scala 16:22]
  wire [3:0] rbFIFO_io_dataOut; // @[FIFOs.scala 16:22]
  wire  rbFIFO_io_full; // @[FIFOs.scala 16:22]
  wire  rbFIFO_io_empty; // @[FIFOs.scala 16:22]
  wire  _T_2 = ~reset; // @[FIFOs.scala 26:9]
  wire  _T_8 = ~srFIFO_io_empty; // @[FIFOs.scala 28:9]
  ResetCounter resetCounter ( // @[Formal.scala 10:36]
    .clk(resetCounter_clk),
    .reset(resetCounter_reset),
    .timeSinceReset(resetCounter_timeSinceReset),
    .notChaos(resetCounter_notChaos)
  );
  srFIFO srFIFO ( // @[FIFOs.scala 15:22]
    .clock(srFIFO_clock),
    .reset(srFIFO_reset),
    .io_dataIn(srFIFO_io_dataIn),
    .io_push(srFIFO_io_push),
    .io_pop(srFIFO_io_pop),
    .io_dataOut(srFIFO_io_dataOut),
    .io_full(srFIFO_io_full),
    .io_empty(srFIFO_io_empty)
  );
  rbFIFO rbFIFO ( // @[FIFOs.scala 16:22]
    .clock(rbFIFO_clock),
    .reset(rbFIFO_reset),
    .io_dataIn(rbFIFO_io_dataIn),
    .io_push(rbFIFO_io_push),
    .io_pop(rbFIFO_io_pop),
    .io_dataOut(rbFIFO_io_dataOut),
    .io_full(rbFIFO_io_full),
    .io_empty(rbFIFO_io_empty)
  );
  assign resetCounter_clk = clock; // @[Formal.scala 11:23]
  assign resetCounter_reset = reset; // @[Formal.scala 12:25]
  assign srFIFO_clock = clock;
  assign srFIFO_reset = reset;
  assign srFIFO_io_dataIn = io_dataIn; // @[FIFOs.scala 18:17]
  assign srFIFO_io_push = io_push; // @[FIFOs.scala 19:15]
  assign srFIFO_io_pop = io_pop; // @[FIFOs.scala 20:14]
  assign rbFIFO_clock = clock;
  assign rbFIFO_reset = reset;
  assign rbFIFO_io_dataIn = io_dataIn; // @[FIFOs.scala 22:17]
  assign rbFIFO_io_push = io_push; // @[FIFOs.scala 23:15]
  assign rbFIFO_io_pop = io_pop; // @[FIFOs.scala 24:14]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (resetCounter_notChaos & ~reset & ~(srFIFO_io_empty == rbFIFO_io_empty)) begin
          $fwrite(32'h80000002,"Assertion failed: \n    at Formal.scala:20 cassert(cond, msg)\n"); // @[FIFOs.scala 26:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & resetCounter_notChaos & _T_2 & ~(srFIFO_io_dataOut == rbFIFO_io_dataOut)) begin
          $fwrite(32'h80000002,"Assertion failed: \n    at Formal.scala:20 cassert(cond, msg)\n"); // @[FIFOs.scala 29:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock) begin
    //
    if (resetCounter_notChaos & ~reset) begin
      assert(srFIFO_io_empty == rbFIFO_io_empty); // @[FIFOs.scala 26:9]
    end
    //
    if (resetCounter_notChaos & _T_2) begin
      assert(1'h1); // @[FIFOs.scala 27:9]
    end
    //
    if (_T_8 & resetCounter_notChaos & _T_2) begin
      assert(srFIFO_io_dataOut == rbFIFO_io_dataOut); // @[FIFOs.scala 29:11]
    end
  end
endmodule
