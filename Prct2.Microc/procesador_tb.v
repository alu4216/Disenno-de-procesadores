`timescale 1 ns / 10 ps
`include "memprog.v"
`include "microc.v"
`include "uc.v"
`include "alu.v"
`include "componentes.v"

module micro_tb;

//definiciones de las se�ales de test
  reg resett;
  reg clkt;	   	  
  wire[5:0] opcodet;       
  wire s_inct;		        
  wire s_inmt;
  wire we3t;
  wire [2:0]opt; 
  wire zt;
  wire fint;


microc micro(clkt,resett,s_inct,s_inmt,we3t,opt[2:0],zt,opcodet[5:0]); 
uc uc1(clkt,resett,zt,opcodet[5:0],s_inct,s_inmt,we3t,fint,opt[2:0]);

always
    begin
      clkt =1'b1;
      #30;
      clkt =1'b0;
      #30;
    end
    
  initial 
    begin
      
	resett=1'b1;
	#5;
	resett=1'b0; 
  end
    
  initial
    begin
      $monitor("tiempo=%0d clkt=%d resett=%d opcodet=%b s_inct=%d s_inmt=%d we3t=%d opt=%b zt=%d fin=%d",$time, clkt, resett, opcodet, s_inct, s_inmt, we3t, opt ,zt,fint);
      $dumpfile("microc.vcd");
      $dumpvars;
      
      #300
      
      $finish;
   end 
endmodule

    
