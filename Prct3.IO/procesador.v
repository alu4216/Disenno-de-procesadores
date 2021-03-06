
module procesador(input wire clk,input wire reset,input wire [7:0] datos_inA,input wire [7:0] datos_inB,input wire [7:0] datos_inC,input wire [7:0] datos_inD);

//definiciones de las señales de test
	   	  
  wire[5:0] opcode;       
  wire s_inc;		        
  wire s_inm;
  wire we3;
  wire [2:0]op; 
  wire z;
  wire fin;

//Señales de la parte de IO
  wire s_r;
  wire [1:0] s_e;
  wire s_mux5;
  wire we_s_r_1;
  wire we_s_r_2;
  wire we_s_r_3;
  wire we_s_r_4;

//Señales de intrucciones optativas

  wire s_rel;
  
//intanciasión del camino de datos y de la uc
microc micro(clk,reset,s_inc,s_inm,we3t,op[2:0],s_r,s_e[1:0],s_mux5,we_s_r_1,
we_s_r_2,we_s_r_3,we_s_r_4,datos_inA[7:0],datos_inB[7:0],datos_inC[7:0],datos_inD[7:0],s_rel,z,opcode[5:0]); 
uc uc1(clk,reset,z,opcode[5:0],s_r,s_e[1:0],s_mux5,we_s_r_1,
	we_s_r_2,we_s_r_3,we_s_r_4,s_inc,s_inm,we3,fin,op[2:0],s_rel);
	
initial
  begin
    $monitor("tiempo=%0d clkt=%d resett=%d opcodet=%b s_inct=%d s_inmt=%d we3t=%d opt=%b zt=%d fin=%d",$time,clk,reset,opcode,s_inc, s_inm,we3,op,z,fin);
  end
	
endmodule
