`timescale 10ns/1ns
`include "main.v"
module test;

    reg [15:0] mux;
    reg [3:0] sel;
    wire out;

    mux16to1 dut(.in(mux),.sel(sel),.out(out));

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        $monitor("Input = %b : Sel = %d : Output = %b",mux,sel,out);
        mux=16'h3f0a;
        sel=4'h0;
        #5
        sel=4'h6;
        #5
        sel=4'h1;
        #5
        sel=4'hc;
        #5
        $finish;
    end
endmodule
