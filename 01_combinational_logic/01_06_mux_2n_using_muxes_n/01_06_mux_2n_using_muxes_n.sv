//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

    logic [3:0] d23, d123;
    logic sel2, sel1, sel0;
    assign sel2 = sel == 2;
    assign sel1 = sel == 1;
    assign sel0 = sel == 0;
    mux_2_1 muxd23 (
        .d1(d2),
        .d0(d3),
        .sel(sel2),
        .y(d23)
    );
    mux_2_1 muxd123 (
        .d1(d1),
        .d0(d23),
        .sel(sel1),
        .y(d123)
    );
    mux_2_1 muxd0123 (
        .d1(d0),
        .d0(d123),
        .sel(sel0),
        .y(y)
    );
endmodule
