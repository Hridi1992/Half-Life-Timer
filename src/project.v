/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.

  assign uio_out = 0;
  assign uio_oe  = 0;
   //assign ui_in[6:5] = 2'b00;
   // assign uo_out[7:4] = 4'b0000;
    assign uo_out[7:4] = 4'b0000;
    
    wire [6:0] hridi;
    assign hridi = uio_in[7:1];
    wire [1:0] zach;
    assign zach = ui_in[6:5];

  // List all unused inputs to prevent warnings
    wire _unused = &{ena, 1'b0, rst_n, 1'b0};

    tt_um_halflife top(
        .clk(clk),
        .rst(rst_n),
        .up(ui_in[4]),
        .down(ui_in[7]),
        .load(uio_in[0]),
        .in(ui_in[3:0]),
        .out(uo_out[3:0])
    )

        ;
        
endmodule
