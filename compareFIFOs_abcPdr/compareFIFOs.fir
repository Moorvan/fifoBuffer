circuit compareFIFOs :
  extmodule ResetCounter :
    input clk : Clock
    input reset : UInt<1>
    output timeSinceReset : UInt<32>
    output notChaos : UInt<1>
    defname = ResetCounter

  module srFIFO :
    input clock : Clock
    input reset : Reset
    output io : { flip dataIn : UInt<4>, flip push : UInt<1>, flip pop : UInt<1>, dataOut : UInt<4>, full : UInt<1>, empty : UInt<1>}

    cmem memRegs : UInt<4> [8] @[FIFOs.scala 52:20]
    reg tailReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[FIFOs.scala 54:24]
    reg emptyReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[FIFOs.scala 55:25]
    node _T = eq(io.full, UInt<1>("h0")) @[FIFOs.scala 57:18]
    node _T_1 = and(io.push, _T) @[FIFOs.scala 57:16]
    when _T_1 : @[FIFOs.scala 57:28]
      infer mport MPORT = memRegs[UInt<3>("h7")], clock @[FIFOs.scala 59:14]
      infer mport MPORT_1 = memRegs[UInt<3>("h6")], clock @[FIFOs.scala 59:28]
      MPORT <= MPORT_1 @[FIFOs.scala 59:18]
      infer mport MPORT_2 = memRegs[UInt<3>("h6")], clock @[FIFOs.scala 59:14]
      infer mport MPORT_3 = memRegs[UInt<3>("h5")], clock @[FIFOs.scala 59:28]
      MPORT_2 <= MPORT_3 @[FIFOs.scala 59:18]
      infer mport MPORT_4 = memRegs[UInt<3>("h5")], clock @[FIFOs.scala 59:14]
      infer mport MPORT_5 = memRegs[UInt<3>("h4")], clock @[FIFOs.scala 59:28]
      MPORT_4 <= MPORT_5 @[FIFOs.scala 59:18]
      infer mport MPORT_6 = memRegs[UInt<3>("h4")], clock @[FIFOs.scala 59:14]
      infer mport MPORT_7 = memRegs[UInt<2>("h3")], clock @[FIFOs.scala 59:28]
      MPORT_6 <= MPORT_7 @[FIFOs.scala 59:18]
      infer mport MPORT_8 = memRegs[UInt<2>("h3")], clock @[FIFOs.scala 59:14]
      infer mport MPORT_9 = memRegs[UInt<2>("h2")], clock @[FIFOs.scala 59:28]
      MPORT_8 <= MPORT_9 @[FIFOs.scala 59:18]
      infer mport MPORT_10 = memRegs[UInt<2>("h2")], clock @[FIFOs.scala 59:14]
      infer mport MPORT_11 = memRegs[UInt<1>("h1")], clock @[FIFOs.scala 59:28]
      MPORT_10 <= MPORT_11 @[FIFOs.scala 59:18]
      infer mport MPORT_12 = memRegs[UInt<1>("h1")], clock @[FIFOs.scala 59:14]
      infer mport MPORT_13 = memRegs[UInt<1>("h0")], clock @[FIFOs.scala 59:28]
      MPORT_12 <= MPORT_13 @[FIFOs.scala 59:18]
      infer mport MPORT_14 = memRegs[UInt<1>("h0")], clock @[FIFOs.scala 61:12]
      MPORT_14 <= io.dataIn @[FIFOs.scala 61:16]
      node _T_2 = eq(emptyReg, UInt<1>("h0")) @[FIFOs.scala 62:10]
      when _T_2 : @[FIFOs.scala 62:21]
        node _tailReg_T = add(tailReg, UInt<1>("h1")) @[FIFOs.scala 63:26]
        node _tailReg_T_1 = tail(_tailReg_T, 1) @[FIFOs.scala 63:26]
        tailReg <= _tailReg_T_1 @[FIFOs.scala 63:15]
      emptyReg <= UInt<1>("h0") @[FIFOs.scala 65:14]
    else :
      node _T_3 = eq(emptyReg, UInt<1>("h0")) @[FIFOs.scala 66:23]
      node _T_4 = and(io.pop, _T_3) @[FIFOs.scala 66:21]
      when _T_4 : @[FIFOs.scala 66:34]
        node _T_5 = eq(tailReg, UInt<1>("h0")) @[FIFOs.scala 67:18]
        when _T_5 : @[FIFOs.scala 67:27]
          emptyReg <= UInt<1>("h1") @[FIFOs.scala 68:16]
        node _T_6 = eq(tailReg, UInt<1>("h0")) @[FIFOs.scala 70:18]
        when _T_6 : @[FIFOs.scala 70:27]
          emptyReg <= UInt<1>("h1") @[FIFOs.scala 71:16]
        else :
          node _tailReg_T_2 = sub(tailReg, UInt<1>("h1")) @[FIFOs.scala 73:26]
          node _tailReg_T_3 = tail(_tailReg_T_2, 1) @[FIFOs.scala 73:26]
          tailReg <= _tailReg_T_3 @[FIFOs.scala 73:15]
    infer mport io_dataOut_MPORT = memRegs[tailReg], clock @[FIFOs.scala 77:24]
    io.dataOut <= io_dataOut_MPORT @[FIFOs.scala 77:14]
    io.empty <= emptyReg @[FIFOs.scala 78:12]
    node _io_full_T = eq(tailReg, UInt<3>("h7")) @[FIFOs.scala 79:22]
    io.full <= _io_full_T @[FIFOs.scala 79:11]

  module rbFIFO :
    input clock : Clock
    input reset : Reset
    output io : { flip dataIn : UInt<4>, flip push : UInt<1>, flip pop : UInt<1>, dataOut : UInt<4>, full : UInt<1>, empty : UInt<1>}

    cmem memRegs : UInt<4> [8] @[FIFOs.scala 99:20]
    reg tailReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[FIFOs.scala 100:24]
    reg headReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[FIFOs.scala 101:24]
    reg emptyReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[FIFOs.scala 102:25]
    node _T = eq(io.full, UInt<1>("h0")) @[FIFOs.scala 104:18]
    node _T_1 = and(io.push, _T) @[FIFOs.scala 104:16]
    when _T_1 : @[FIFOs.scala 104:28]
      infer mport MPORT = memRegs[headReg], clock @[FIFOs.scala 105:12]
      MPORT <= io.dataIn @[FIFOs.scala 105:22]
      node _headReg_T = add(headReg, UInt<1>("h1")) @[FIFOs.scala 106:24]
      node _headReg_T_1 = tail(_headReg_T, 1) @[FIFOs.scala 106:24]
      headReg <= _headReg_T_1 @[FIFOs.scala 106:13]
      emptyReg <= UInt<1>("h0") @[FIFOs.scala 107:14]
    else :
      node _T_2 = eq(emptyReg, UInt<1>("h0")) @[FIFOs.scala 108:23]
      node _T_3 = and(io.pop, _T_2) @[FIFOs.scala 108:21]
      when _T_3 : @[FIFOs.scala 108:34]
        node _tailReg_T = add(tailReg, UInt<1>("h1")) @[FIFOs.scala 109:24]
        node _tailReg_T_1 = tail(_tailReg_T, 1) @[FIFOs.scala 109:24]
        tailReg <= _tailReg_T_1 @[FIFOs.scala 109:13]
        node _T_4 = add(tailReg, UInt<1>("h1")) @[FIFOs.scala 110:19]
        node _T_5 = tail(_T_4, 1) @[FIFOs.scala 110:19]
        node _T_6 = eq(_T_5, headReg) @[FIFOs.scala 110:26]
        when _T_6 : @[FIFOs.scala 110:39]
          emptyReg <= UInt<1>("h1") @[FIFOs.scala 111:16]
    io.empty <= emptyReg @[FIFOs.scala 115:12]
    infer mport io_dataOut_MPORT = memRegs[tailReg], clock @[FIFOs.scala 116:24]
    io.dataOut <= io_dataOut_MPORT @[FIFOs.scala 116:14]
    node _io_full_T = eq(tailReg, headReg) @[FIFOs.scala 117:23]
    node _io_full_T_1 = eq(emptyReg, UInt<1>("h0")) @[FIFOs.scala 117:38]
    node _io_full_T_2 = and(_io_full_T, _io_full_T_1) @[FIFOs.scala 117:36]
    io.full <= _io_full_T_2 @[FIFOs.scala 117:11]

  module compareFIFOs :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip dataIn : UInt<4>, flip push : UInt<1>, flip pop : UInt<1>}

    inst resetCounter of ResetCounter @[Formal.scala 10:36]
    resetCounter.notChaos is invalid
    resetCounter.timeSinceReset is invalid
    resetCounter.reset is invalid
    resetCounter.clk is invalid
    resetCounter.clk <= clock @[Formal.scala 11:23]
    resetCounter.reset <= reset @[Formal.scala 12:25]
    inst srFIFO of srFIFO @[FIFOs.scala 15:22]
    srFIFO.clock <= clock
    srFIFO.reset <= reset
    inst rbFIFO of rbFIFO @[FIFOs.scala 16:22]
    rbFIFO.clock <= clock
    rbFIFO.reset <= reset
    srFIFO.io.dataIn <= io.dataIn @[FIFOs.scala 18:17]
    srFIFO.io.push <= io.push @[FIFOs.scala 19:15]
    srFIFO.io.pop <= io.pop @[FIFOs.scala 20:14]
    rbFIFO.io.dataIn <= io.dataIn @[FIFOs.scala 22:17]
    rbFIFO.io.push <= io.push @[FIFOs.scala 23:15]
    rbFIFO.io.pop <= io.pop @[FIFOs.scala 24:14]
    node _T = eq(srFIFO.io.empty, rbFIFO.io.empty) @[FIFOs.scala 26:23]
    when resetCounter.notChaos : @[FIFOs.scala 26:9]
      node _T_1 = bits(reset, 0, 0) @[FIFOs.scala 26:9]
      node _T_2 = eq(_T_1, UInt<1>("h0")) @[FIFOs.scala 26:9]
      when _T_2 : @[FIFOs.scala 26:9]
        assert(clock, _T, UInt<1>("h1"), "") : assert @[FIFOs.scala 26:9]
        node _T_3 = eq(_T, UInt<1>("h0")) @[FIFOs.scala 26:9]
        when _T_3 : @[FIFOs.scala 26:9]
          printf(clock, UInt<1>("h1"), "Assertion failed: \n    at Formal.scala:20 cassert(cond, msg)\n") : printf @[FIFOs.scala 26:9]
    node _T_4 = eq(srFIFO.io.full, srFIFO.io.full) @[FIFOs.scala 27:22]
    when resetCounter.notChaos : @[FIFOs.scala 27:9]
      node _T_5 = bits(reset, 0, 0) @[FIFOs.scala 27:9]
      node _T_6 = eq(_T_5, UInt<1>("h0")) @[FIFOs.scala 27:9]
      when _T_6 : @[FIFOs.scala 27:9]
        assert(clock, _T_4, UInt<1>("h1"), "") : assert_1 @[FIFOs.scala 27:9]
        node _T_7 = eq(_T_4, UInt<1>("h0")) @[FIFOs.scala 27:9]
        when _T_7 : @[FIFOs.scala 27:9]
          printf(clock, UInt<1>("h1"), "Assertion failed: \n    at Formal.scala:20 cassert(cond, msg)\n") : printf_1 @[FIFOs.scala 27:9]
    node _T_8 = eq(srFIFO.io.empty, UInt<1>("h0")) @[FIFOs.scala 28:9]
    when _T_8 : @[FIFOs.scala 28:24]
      node _T_9 = eq(srFIFO.io.dataOut, rbFIFO.io.dataOut) @[FIFOs.scala 29:27]
      when resetCounter.notChaos : @[FIFOs.scala 29:11]
        node _T_10 = bits(reset, 0, 0) @[FIFOs.scala 29:11]
        node _T_11 = eq(_T_10, UInt<1>("h0")) @[FIFOs.scala 29:11]
        when _T_11 : @[FIFOs.scala 29:11]
          assert(clock, _T_9, UInt<1>("h1"), "") : assert_2 @[FIFOs.scala 29:11]
          node _T_12 = eq(_T_9, UInt<1>("h0")) @[FIFOs.scala 29:11]
          when _T_12 : @[FIFOs.scala 29:11]
            printf(clock, UInt<1>("h1"), "Assertion failed: \n    at Formal.scala:20 cassert(cond, msg)\n") : printf_2 @[FIFOs.scala 29:11]

