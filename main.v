module mux2to1(in,sel,out);
    input [1:0] in;
    input sel;
    output out;
    assign out=sel?in[1]:in[0];
endmodule

module mux4to1(in,sel,out);
    input [3:0] in;
    input [1:0] sel;
    output out;
    wire [1:0] intemediate_out;
    mux2to1 mo(in[1:0],sel[0],intemediate_out[0]);
    mux2to1 m1(in[3:2],sel[0],intemediate_out[1]);
    mux2to1 m2(intemediate_out,sel[1],out);

endmodule

module mux16to1(in,sel,out);
    input [15:0] in;
    input [3:0] sel;
    output out;
    wire [3:0] intemediate_out;

    mux4to1 m0(in[3:0],sel[1:0],intemediate_out[0]);
    mux4to1 m1(in[7:4],sel[1:0],intemediate_out[1]);
    mux4to1 m2(in[11:8],sel[1:0],intemediate_out[2]);
    mux4to1 m3(in[15:12],sel[1:0],intemediate_out[3]);
    mux4to1 m4(intemediate_out,sel[3:2],out);
    
endmodule