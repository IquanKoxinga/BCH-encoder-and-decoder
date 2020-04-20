`timescale 1ns / 1ps



`timescale 1ns / 1ps



module topmodule(
     input R,
     input CLK,
     output  C1  //2019.05.26   reg改为wire
    
    );
    
    wire enableBM;     // 16200个周期后，该值为1，控制BM启动
    
    reg reset;
    wire enerror;
     wire [15:0] S1;    //校正子寄存器。          //2019.05.26由reg改为wire
              wire [15:0] S2;
              wire [15:0] S3;
              wire [15:0] S4;
              wire [15:0] S5;
              wire [15:0] S6;
              wire [15:0] S7;
              wire [15:0] S8;
              wire [15:0] S9;
              wire [15:0] S10;
              wire [15:0] S11;
              wire [15:0] S12;
              wire [15:0] S13;     
              wire [15:0] S14;
              wire [15:0] S15;
              wire [15:0] S16;
              wire [15:0] S17;
              wire [15:0] S18;
              wire [15:0] S19;
              wire [15:0] S20;
              wire [15:0] S21;
              wire [15:0] S22;
              wire [15:0] S23;
             // reg [15:0] S [1:23];    2019.05.26   先不要它了
    
    wire [16199:0] Cfront;
    
    Syndrome uut1(    
            .R(R),
            .CLK(CLK),     //         
            .reset(reset),
            .Cfront(Cfront) ,
      //      .enerror(enerror),            
            .S1(S1),
            .S2(S2),
            .S3(S3),
            .S4(S4),
            .S5(S5),
            .S6(S6),
            .S7(S7),
            .S8(S8),
            .S9(S9),
            .S10(S10),
            .S11(S11),
            .S12(S12),
            .S13(S13),
            .S14(S14),
            .S15(S15),
            .S16(S16),
            .S17(S17),
            .S18(S18),
            .S19(S19),
            .S20(S20),
            .S21(S21),
            .S22(S22),
            .S23(S23),
            .enableBM(enableBM)          
             );
             

                                      wire  [15:0] miu0;
                                      wire  [15:0] miu1;
                                      wire  [15:0] miu2;
                                      wire  [15:0] miu3;
                                      wire  [15:0] miu4;
                                      wire  [15:0] miu5;
                                      wire  [15:0] miu6;
                                      wire  [15:0] miu7;
                                      wire  [15:0] miu8;
                                      wire  [15:0] miu9;
                                      wire  [15:0] miu10;
                                      wire  [15:0] miu11;
                                      wire  [15:0] miu12;
  
wire enablechian;  
  
BM uut2(   
                                      .CLK(CLK),        //第二步的时钟应该在第一步之后，不应该直接接clk
                                   //   .enerror(enerror),
                                      .enableBM(enableBM),
                                      
                                                  .S1(S1),
                                                  .S2(S2),
                                                  .S3(S3),
                                                  .S4(S4),
                                                  .S5(S5),
                                                  .S6(S6),
                                                  .S7(S7),
                                                  .S8(S8),
                                                  .S9(S9),
                                                  .S10(S10),
                                                  .S11(S11),
                                                  .S12(S12),
                                                  .S13(S13),
                                                  .S14(S14),
                                                  .S15(S15),
                                                  .S16(S16),
                                                  .S17(S17),
                                                  .S18(S18),
                                                  .S19(S19),
                                                  .S20(S20),
                                                  .S21(S21),
                                                  .S22(S22),
                                                  .S23(S23),
                                                  
                                                  .miu0(miu0),
                                                  .miu1(miu1),
                                                  .miu2(miu2),
                                                  .miu3(miu3),
                                                  .miu4(miu4),
                                                  .miu5(miu5),
                                                  .miu6(miu6),
                                                  .miu7(miu7),
                                                  .miu8(miu8),
                                                  .miu9(miu9),
                                                  .miu10(miu10),
                                                  .miu11(miu11),
                                                  .miu12(miu12),
                                                  
                                                  .enablechian(enablechian)
                                                  
                                        ); 
                                        
                                        
             
 chian uut3(
                                                .clkofchian(CLK), 
                                                .Cfront(Cfront),
                                                .enablechian(enablechian),       
                                                
                                                .miu0(miu0),
                                                .miu1(miu1),
                                                .miu2(miu2),
                                                .miu3(miu3),
                                                .miu4(miu4),
                                                .miu5(miu5),
                                                .miu6(miu6),
                                                .miu7(miu7),
                                                .miu8(miu8),
                                                .miu9(miu9),
                                                .miu10(miu10),
                                                .miu11(miu11),
                                                .miu12(miu12),
                                                .decodefinal(C1)
                                                
                                                
                                                );

 
             
             
endmodule
