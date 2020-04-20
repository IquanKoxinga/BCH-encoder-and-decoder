`timescale 1ns / 1ps



module BM(    
        input CLK,                            // 第二步的时钟应该在第一步之后
        //input enerror,           2019.05.25       暂时先不用了， 换成一个寄存器 在初始化之后控制
        
        input enableBM,
        
        input [15:0] S1,                           //2019.05.26
        input  [15:0] S2,
        input  [15:0] S3,
        input  [15:0] S4,
        input [15:0] S5,
        input [15:0] S6,
        input [15:0] S7,
        input [15:0] S8,
        input [15:0] S9,
        input [15:0] S10,
        input [15:0] S11,
        input [15:0] S12,
        input [15:0] S13,     
        input [15:0] S14,
        input [15:0] S15,
        input [15:0] S16,
        input [15:0] S17,
        input [15:0] S18,
        input [15:0] S19,
        input [15:0] S20,
        input [15:0] S21,
        input [15:0] S22,
        input [15:0] S23,

        
        
        output reg enablechian=0,                       // 等于1的时候启动chian
        output reg  [15:0] miu0=1,
        output  reg [15:0] miu1=0,
        output reg [15:0] miu2=0,
        output reg [15:0] miu3=0,
        output reg [15:0] miu4=0,
        output reg [15:0] miu5=0,
        output reg [15:0] miu6=0,
        output reg [15:0] miu7=0,
        output reg [15:0] miu8=0,
        output reg [15:0] miu9=0,
        output reg [15:0] miu10=0,
        output reg [15:0] miu11=0,
        output reg [15:0] miu12=0
        );
        reg [15:0] miu [0:12];
        reg [15:0] lambda [1:13];
        reg [15:0] S [1:23];
        reg [15:0] T [0:12];           //zai initial begin 
        reg [15:0] gamma=1;
        reg [4:0] l [0:12];
        
        reg enerror=0;
       
        reg [4:0] k=0;
        reg [15:0] delta=0;   
        reg [3:0]looperofT=0;
        reg [3:0]t=12;
        
        wire [15:0] POBA0;
        wire [15:0] POBA1;           //存储有限域乘法器结果     //2019.05.26  reg改为wire
        wire [15:0] POBA2;
        wire [15:0] POBA3;
        wire [15:0] POBA4;
        wire [15:0] POBA5;
        wire [15:0] POBA6;
        wire [15:0] POBA7;
        wire [15:0] POBA8;
        wire [15:0] POBA9;
        wire [15:0] POBA10;
        wire [15:0] POBA11;
        wire [15:0] POBA12;
        
        wire [15:0] POBA00;
        wire [15:0] POBA01;
        wire [15:0] POBA02;
        wire [15:0] POBA03;
        wire [15:0] POBA04;
        wire [15:0] POBA05;
        wire [15:0] POBA06;
        wire [15:0] POBA07;
        wire [15:0] POBA08;
        wire [15:0] POBA09;
        wire [15:0] POBA010;
        wire [15:0] POBA011;
        wire [15:0] POBA012;
        
        wire [15:0] POBA000;
        wire [15:0] POBA001;
        wire [15:0] POBA002;
        wire [15:0] POBA003;
        wire [15:0] POBA004;
        wire [15:0] POBA005;
        wire [15:0] POBA006;
        wire [15:0] POBA007;
        wire [15:0] POBA008;
        wire [15:0] POBA009;
        wire [15:0] POBA0010;
        wire [15:0] POBA0011;
        wire [15:0] POBA0012;
        
       

  
multiplier uut_bm_0(.DinA(T[0]), .DinB(miu[0]),  .enmultiply(1),     .POBA(POBA0)  );
multiplier uut_bm_1(.DinA(T[1]), .DinB(miu[1]),  .enmultiply(1),     .POBA(POBA1)  );
multiplier uut_bm_2(.DinA(T[2]), .DinB(miu[2]),  .enmultiply(1),     .POBA(POBA2)  );  
multiplier uut_bm_3(.DinA(T[3]), .DinB(miu[3]),  .enmultiply(1),     .POBA(POBA3)  );  
multiplier uut_bm_4(.DinA(T[4]), .DinB(miu[4]),  .enmultiply(1),     .POBA(POBA4)  );
multiplier uut_bm_5(.DinA(T[5]), .DinB(miu[5]),  .enmultiply(1),     .POBA(POBA5)  );
multiplier uut_bm_6(.DinA(T[6]), .DinB(miu[6]),  .enmultiply(1),     .POBA(POBA6)  );
multiplier uut_bm_7(.DinA(T[7]), .DinB(miu[7]),  .enmultiply(1),     .POBA(POBA7)  );
multiplier uut_bm_8(.DinA(T[8]), .DinB(miu[8]),  .enmultiply(1),     .POBA(POBA8)  );
multiplier uut_bm_9(.DinA(T[9]), .DinB(miu[9]),  .enmultiply(1),     .POBA(POBA9)  );
multiplier uut_bm_10(.DinA(T[10]), .DinB(miu[10]),  .enmultiply(1),     .POBA(POBA10)  );
multiplier uut_bm_11(.DinA(T[11]), .DinB(miu[11]),  .enmultiply(1),     .POBA(POBA11)  );
multiplier uut_bm_12(.DinA(T[12]), .DinB(miu[12]),  .enmultiply(1),     .POBA(POBA12)  );

multiplier uut_bm_00(.DinA(delta), .DinB(0),  .enmultiply(1),     .POBA(POBA00)  );
multiplier uut_bm_01(.DinA(delta), .DinB(lambda[1]),  .enmultiply(1),     .POBA(POBA01)  );
multiplier uut_bm_02(.DinA(delta), .DinB(lambda[2]),  .enmultiply(1),     .POBA(POBA02)  );
multiplier uut_bm_03(.DinA(delta), .DinB(lambda[3]),  .enmultiply(1),     .POBA(POBA03)  );
multiplier uut_bm_04(.DinA(delta), .DinB(lambda[4]),  .enmultiply(1),     .POBA(POBA04)  );
multiplier uut_bm_05(.DinA(delta), .DinB(lambda[5]),  .enmultiply(1),     .POBA(POBA05)  );
multiplier uut_bm_06(.DinA(delta), .DinB(lambda[6]),  .enmultiply(1),     .POBA(POBA06)  );
multiplier uut_bm_07(.DinA(delta), .DinB(lambda[7]),  .enmultiply(1),     .POBA(POBA07)  );
multiplier uut_bm_08(.DinA(delta), .DinB(lambda[8]),  .enmultiply(1),     .POBA(POBA08)  );
multiplier uut_bm_09(.DinA(delta), .DinB(lambda[9]),  .enmultiply(1),     .POBA(POBA09)  );
multiplier uut_bm_010(.DinA(delta), .DinB(lambda[10]),  .enmultiply(1),     .POBA(POBA010)  );  
multiplier uut_bm_011(.DinA(delta), .DinB(lambda[11]),  .enmultiply(1),     .POBA(POBA011)  );  
multiplier uut_bm_012(.DinA(delta), .DinB(lambda[12]),  .enmultiply(1),     .POBA(POBA012)  );

multiplier uut_bm_000(.DinA(gamma), .DinB(miu[0]),  .enmultiply(1),     .POBA(POBA000)  );        
multiplier uut_bm_001(.DinA(gamma), .DinB(miu[1]),  .enmultiply(1),     .POBA(POBA001)  );        
multiplier uut_bm_002(.DinA(gamma), .DinB(miu[2]),  .enmultiply(1),     .POBA(POBA002)  );        
multiplier uut_bm_003(.DinA(gamma), .DinB(miu[3]),  .enmultiply(1),     .POBA(POBA003)  );        
multiplier uut_bm_004(.DinA(gamma), .DinB(miu[4]),  .enmultiply(1),     .POBA(POBA004)  );     
multiplier uut_bm_005(.DinA(gamma), .DinB(miu[5]),  .enmultiply(1),     .POBA(POBA005)  );     
multiplier uut_bm_006(.DinA(gamma), .DinB(miu[6]),  .enmultiply(1),     .POBA(POBA006)  );     
multiplier uut_bm_007(.DinA(gamma), .DinB(miu[7]),  .enmultiply(1),     .POBA(POBA007)  );     
multiplier uut_bm_008(.DinA(gamma), .DinB(miu[8]),  .enmultiply(1),     .POBA(POBA008)  );     
multiplier uut_bm_009(.DinA(gamma), .DinB(miu[9]),  .enmultiply(1),     .POBA(POBA009)  );     
multiplier uut_bm_0010(.DinA(gamma), .DinB(miu[10]),  .enmultiply(1),     .POBA(POBA0010)  );    
multiplier uut_bm_0011(.DinA(gamma), .DinB(miu[11]),  .enmultiply(1),     .POBA(POBA0011)  );     
multiplier uut_bm_0012(.DinA(gamma), .DinB(miu[12]),  .enmultiply(1),     .POBA(POBA0012)  );     

     
        
        
        
        always@(posedge enableBM)
        begin
        miu[0]=miu0;
        miu[1]=miu1;
        miu[2]=miu2;
        miu[3]=miu3;
        miu[4]=miu4;
        miu[5]=miu5;
        miu[6]=miu6;
        miu[7]=miu7;
        miu[8]=miu8;
        miu[9]=miu9;
        miu[10]=miu10;
        miu[11]=miu11;
        miu[12]=miu12;
        
        
        lambda[1]=1;
        lambda[2]=0;
        lambda[3]=0;
        lambda[4]=0;
        lambda[5]=0;
        lambda[6]=0;
        lambda[7]=0;
        lambda[8]=0;
        lambda[9]=0;
        lambda[10]=0;
        lambda[11]=0;
        lambda[12]=0;
        lambda[13]=0;
        
        
        S[1]=S1;             //将输入的校正子存起来
        S[2]=S2;   
        S[3]=S3;   
        S[4]=S4;   
        S[5]=S5;   
        S[6]=S6;   
        S[7]=S7;   
        S[8]=S8;   
        S[9]=S9;   
        S[10]=S10;   
        S[11]=S11;   
        S[12]=S12;   
        S[13]=S13;   
        S[14]=S14;   
        S[15]=S15;   
        S[16]=S16;   
        S[17]=S17;   
        S[18]=S18;   
        S[19]=S19;   
        S[20]=S20;   
        S[21]=S21;   
        S[22]=S22;   
        S[23]=S23; 
        enerror<=1;
        T[0]=S[1];                               //initiallize
        l[0]=0;    
        
        
                        //补充初始化的值
        end
        
   /*     always@(posedge enerror)
        begin
        
               T[0]=S[1];                               //initiallize
               l[0]=0;                               //initiallize
        
        end        
    */   
        
        always@(posedge CLK)
        if(enerror==1)
              begin
               if ( k<=2*t)                      //双循环       //2019.05.27新改动，之前k做了一个for循环for(k=0,k<=2*t,k=k+1)，这次用if，循环靠clk来进行
               begin
                   /*for( looperofT=0 ; looperofT<=l[k] ; looperofT=looperofT+1 )      begin
                              delta=delta^POBA1;                      //delta的计算过程，先循环再模二加
                              end
                      */
                   delta=POBA0^POBA1^POBA2^POBA3^POBA4^POBA5^POBA6^POBA7^POBA8^POBA9^POBA10^POBA11^POBA12;
                  // #2;           20190528
                   miu[0]<=POBA00^POBA000;            //更新miu多项式的系数
                   miu[1]<=POBA01^POBA001;
                   miu[2]<=POBA02^POBA002;
                   miu[3]<=POBA03^POBA003;
                   miu[4]<=POBA04^POBA004;
                   miu[5]<=POBA05^POBA005;
                   miu[6]<=POBA06^POBA006;
                   miu[7]<=POBA07^POBA007;
                   miu[8]<=POBA08^POBA008;
                   miu[9]<=POBA09^POBA009;
                   miu[10]<=POBA010^POBA0010;
                   miu[11]<=POBA011^POBA0011;
                   miu[12]<=POBA012^POBA0012;
                   
                   
               if((delta!==0)&&(2*l[k]<=k))
                        begin
                        //下面几行需要更新lambda的系数，for循环     2019.05.28
                        for (looperofT=0; looperofT<=t ; looperofT=looperofT+1)
                        begin
                        lambda[looperofT+1]<=miu[looperofT];
                        end
                        l[k+1]=k+1-l[k];
                        gamma=delta;
                        
                        end
                else
                        begin      
                        //下面几行需要更新lambda的系数，for循环     2019.05.28
                        for (looperofT=1; looperofT<=t ; looperofT=looperofT+1)
                        begin
                        lambda[looperofT+1]<=lambda[looperofT];                        
                        end
                        lambda[1]=0;
                        
                        l[k+1]=l[k];
                        gamma=gamma;
                        end
                        
                    T[12]<=T[11];
                    T[11]<=T[10];
                    T[10]<=T[9];
                    T[9]<=T[8];
                    T[8]<=T[7];
                    T[7]<=T[6];
                    T[6]<=T[5];
                    T[5]<=T[4];
                    T[4]<=T[3];
                    T[3]<=T[2];
                    T[2]<=T[1];
                    T[1]<=T[0];
                    T[0]<=S[k+1];
                       
               
                           
                 /*  for( looperofT=l[k] ; looperofT>=1 ; looperofT=looperofT-1 )    //     gengxin T shuzu   for( looperofT=1 ; looperofT<=l[k] ; looperofT=looperofT+1 )
                              begin
                              T[looperofT]<=T[looperofT-1];
                              
                              end   */
                  //  T[0]=S[k+1];   
                   end
                   
                   k=k+1;                       //2019.05.27
                   
               if (k==2*t+1)
               begin
               miu0=miu[0];
               miu1=miu[1];
               miu2=miu[2];
               miu3=miu[3];
               miu4=miu[4];
               miu5=miu[5];
               miu6=miu[6];
               miu7=miu[7];
               miu8=miu[8];
               miu9=miu[9];
               miu10=miu[10];
               miu11=miu[11];
               miu12=miu[12];
               
               enablechian=1;                                //等一会再变，避免与clk同时变化
               end//43              最后的输出是miu[k]                     
        end
endmodule

