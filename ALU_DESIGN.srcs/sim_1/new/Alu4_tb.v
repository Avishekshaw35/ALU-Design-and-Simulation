//`timescale 1ns / 1ps
///////////////////////////////////////////////////////////
 module Alu4_tb;

   // Inputs
   reg [3:0] A;
   reg [3:0] B;
   reg [2:0] ALU_Sel;

   // Outputs
   wire [3:0] ALU_Result;

   // Instantiate the Unit Under Test (UUT)
   Alu4 dut ( 
       .A(A), 
       .B(B), 
       .ALU_Sel(ALU_Sel), 
       .ALU_Result(ALU_Result)
   );
   initial
   $monitor("%d A= %b B = %b ALU_Sel = %b ALU_Result = %b", $time, A, B, ALU_Sel, ALU_Result);
   
   initial begin
       // Apply inputs.
       A = 4'b0110;
       B = 4'b0010;
       ALU_Sel = 0; #100;
       ALU_Sel = 1; #100;
       ALU_Sel = 2; #100;
       ALU_Sel = 3; #100;
       ALU_Sel = 4; #100;
       ALU_Sel=  5; #100;
       ALU_Sel=  6; #100;
       ALU_Sel=  7; #100;
       ALU_Sel=  8; #100;
       ALU_Sel=  9; #100;
       ALU_Sel= 10; #100;
       ALU_Sel= 11; #100;
       ALU_Sel= 12; #100;
       //ALU_Sel = default; #100;
   end
     
endmodule
