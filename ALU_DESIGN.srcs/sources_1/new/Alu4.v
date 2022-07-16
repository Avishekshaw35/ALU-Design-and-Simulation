//`timescale 1ns / 1ps


module Alu4(A, B, ALU_Sel, CarryIn, ALU_Result, CarryOut);
        input [3:0] A,B;  // ALU 4-bit Inputs
        input [2:0] ALU_Sel;// ALU Selection
        input CarryIn; 
        output reg CarryOut; // Carry Out Flag
        output reg [3:0] ALU_Result;
        reg [4:0] tmp;
        
        always @(A or B or ALU_Sel or CarryIn)
        begin
           CarryOut = 0;
           case(ALU_Sel)
            0: // Addition
               begin
               ALU_Result = A + B ;
               tmp = {1'b0,A} + {1'b0,B};
               CarryOut = tmp[4]; // Carryout flag 
               end
            1: // Subtraction
               begin
               ALU_Result = A - B ;
               tmp = {1'b0,A} - {1'b0,B};
               CarryOut = tmp[4]; // Carryout flag 
               end 
            2: // Addition with carry in
               begin
               ALU_Result = A + B + CarryIn;
               tmp = {1'b0,A} + {1'b0,B} + CarryIn ;
               CarryOut = tmp[4]; // Carryout flag 
               end
             3: // Subtraction with borrow in
               begin
               ALU_Result = A - B - CarryIn;
               tmp = {1'b0,A} - {1'b0,B} - CarryIn ;
               CarryOut = tmp[4]; // Carryout flag 
               end  
            4: //  Logical and 
               ALU_Result = A & B;
            5: //  Logical or
               ALU_Result = A | B;
            6: //  Logical xor 
               ALU_Result = A ^ B;
            7: //  Logical nor
               ALU_Result = ~(A | B);
            8: // Logical nand 
               ALU_Result = ~(A & B);
            9: // Logical xnor
               ALU_Result = ~(A ^ B);        
            10: // Lesser comparison
               ALU_Result = (A<B)?4'd1:4'd0 ;   
            11: // Greater comparison
               ALU_Result = (A>B)?4'd1:4'd0 ;
            12: // Equal comparison   
                ALU_Result = (A==B)?4'd1:4'd0 ;
            default: ALU_Result = A + B ; 
            
           endcase
        end
    
    endmodule
    
    
    


