`timescale 1ns / 1ps



module chian(
    
        input clkofchian,       // 第三步的时钟要在第二步的结束之后才行
        input [16199:0] Cfront,
        input enablechian,
        
        input [15:0]miu0,
        input [15:0]miu1,
        input [15:0]miu2,
        input [15:0]miu3,
        input [15:0]miu4,
        input [15:0]miu5,
        input [15:0]miu6,
        input [15:0]miu7,
        input [15:0]miu8,
        input [15:0]miu9,
        input [15:0]miu10,
        input [15:0]miu11,
        input [15:0]miu12,
        output reg decodefinal
        
        
        );
        
         
        reg [15:0] miuofchian [0:12];
        reg [16199:0] C1;
        reg [16:0]counterofchian=0;
        reg bitdelay1=0;
        
        reg [15:0] alpha1=765;
        reg [15:0] alpha2=21989;
        reg [15:0] alpha3=6993;
        reg [15:0] alpha4=43958;
        reg [15:0] alpha5=58766;
        reg [15:0] alpha6=14296;
        reg [15:0] alpha7=30521;
        reg [15:0] alpha8=48082;
        reg [15:0] alpha9=55953;
        reg [15:0] alpha10=26604;
        reg [15:0] alpha11=35053;
        reg [15:0] alpha12=51721;
        
        reg [15:0] A;
        
        wire [15:0] inisigma1;                //有限域乘法    //2019.05.26 由reg改为wire
        wire [15:0] inisigma2;
        wire [15:0] inisigma3;
        wire [15:0] inisigma4;
        wire [15:0] inisigma5;
        wire [15:0] inisigma6;
        wire [15:0] inisigma7;
        wire [15:0] inisigma8;
        wire [15:0] inisigma9;
        wire [15:0] inisigma10;
        wire [15:0] inisigma11;
        wire [15:0] inisigma12;                    

        
                    reg [15:0] sigma1;                //有限域乘法
                    reg [15:0] sigma2;
                    reg [15:0] sigma3;
                    reg [15:0] sigma4;
                    reg [15:0] sigma5;
                    reg [15:0] sigma6;
                    reg [15:0] sigma7;
                    reg [15:0] sigma8;
                    reg [15:0] sigma9;
                    reg [15:0] sigma10;
                    reg [15:0] sigma11;
                    reg [15:0] sigma12;
                    
                    
                    wire [15:0] regsigma1;                //有限域乘法       //2019.05.26 由reg 改为 wire
                    wire [15:0] regsigma2;
                    wire [15:0] regsigma3;
                    wire [15:0] regsigma4;
                    wire [15:0] regsigma5;
                    wire [15:0] regsigma6;
                    wire [15:0] regsigma7;
                    wire [15:0] regsigma8;
                    wire [15:0] regsigma9;
                    wire [15:0] regsigma10;
                    wire [15:0] regsigma11;
                    wire [15:0] regsigma12;

        
        
      /*下面这一段也是希望在子模块里面再调用子模块，和BM模块一样*/
             multiplier  uutmultiplypractice1(   .DinA(miuofchian[1]),   .DinB(alpha1),   .enmultiply(1),    .POBA(inisigma1)  );           //将sigma初始化，使用有限域乘法算alpha和miu的积
             multiplier  uutmultiplypractice2(   .DinA(miuofchian[2]),   .DinB(alpha2),   .enmultiply(1),    .POBA(inisigma2)  );
             multiplier  uutmultiplypractice3(   .DinA(miuofchian[3]),   .DinB(alpha3),   .enmultiply(1),    .POBA(inisigma3)  );
             multiplier  uutmultiplypractice4(   .DinA(miuofchian[4]),   .DinB(alpha4),   .enmultiply(1),    .POBA(inisigma4)  );
             multiplier  uutmultiplypractice5(   .DinA(miuofchian[5]),   .DinB(alpha5),   .enmultiply(1),    .POBA(inisigma5)  );
             multiplier  uutmultiplypractice6(   .DinA(miuofchian[6]),   .DinB(alpha6),   .enmultiply(1),    .POBA(inisigma6)  );
             multiplier  uutmultiplypractice7(   .DinA(miuofchian[7]),   .DinB(alpha7),   .enmultiply(1),    .POBA(inisigma7)  );
             multiplier  uutmultiplypractice8(   .DinA(miuofchian[8]),   .DinB(alpha8),   .enmultiply(1),    .POBA(inisigma8)  );
             multiplier  uutmultiplypractice9(   .DinA(miuofchian[9]),   .DinB(alpha9),   .enmultiply(1),    .POBA(inisigma9)  );
             multiplier  uutmultiplypractice10(   .DinA(miuofchian[10]),   .DinB(alpha10),   .enmultiply(1),    .POBA(inisigma10)  );
             multiplier  uutmultiplypractice11(   .DinA(miuofchian[11]),   .DinB(alpha11),   .enmultiply(1),    .POBA(inisigma11)  );
             multiplier  uutmultiplypractice12(   .DinA(miuofchian[12]),   .DinB(alpha12),   .enmultiply(1),    .POBA(inisigma12)  );
             
             
             multiplier  uutinside1(   .DinA(sigma1),   .DinB(alpha1),   .enmultiply(1),    .POBA(regsigma1)  );               // 在有限域乘法器的输出给到一个寄存器
             multiplier  uutinside2(   .DinA(sigma2),   .DinB(alpha2),   .enmultiply(1),    .POBA(regsigma2)  );               // 每到周期开始的时候再将它付给sigma
             multiplier  uutinside3(   .DinA(sigma3),   .DinB(alpha3),   .enmultiply(1),    .POBA(regsigma3)  );               // 从而可以更新sigma
             multiplier  uutinside4(   .DinA(sigma4),   .DinB(alpha4),   .enmultiply(1),    .POBA(regsigma4)  );
             multiplier  uutinside5(   .DinA(sigma5),   .DinB(alpha5),   .enmultiply(1),    .POBA(regsigma5)  );
             multiplier  uutinside6(   .DinA(sigma6),   .DinB(alpha6),   .enmultiply(1),    .POBA(regsigma6)  );
             multiplier  uutinside7(   .DinA(sigma7),   .DinB(alpha7),   .enmultiply(1),    .POBA(regsigma7)  );
             multiplier  uutinside8(   .DinA(sigma8),   .DinB(alpha8),   .enmultiply(1),    .POBA(regsigma8)  );
             multiplier  uutinside9(   .DinA(sigma9),   .DinB(alpha9),   .enmultiply(1),    .POBA(regsigma9)  );
             multiplier  uutinside10(   .DinA(sigma10),   .DinB(alpha10),   .enmultiply(1),    .POBA(regsigma10)  );
             multiplier  uutinside11(   .DinA(sigma11),   .DinB(alpha11),   .enmultiply(1),    .POBA(regsigma11)  );
             multiplier  uutinside12(   .DinA(sigma12),   .DinB(alpha12),   .enmultiply(1),    .POBA(regsigma12)  );        

             
             
             always@(posedge enablechian) 
             begin 
               C1=Cfront; 
            
               
               miuofchian[0]=miu0;
               miuofchian[1]=miu1;
               miuofchian[2]=miu2;
               miuofchian[3]=miu3;
               miuofchian[4]=miu4;
               miuofchian[5]=miu5;
               miuofchian[6]=miu6;
               miuofchian[7]=miu7;
               miuofchian[8]=miu8;
               miuofchian[9]=miu9;
               miuofchian[10]=miu10;
               miuofchian[11]=miu11;
               miuofchian[12]=miu12;
               
               bitdelay1<=1;               
               /*
                           sigma1=inisigma1;                //有限域乘法
                           sigma2=inisigma2;
                           sigma3=inisigma3;
                           sigma4=inisigma4;
                           sigma5=inisigma5;
                           sigma6=inisigma6;
                           sigma7=inisigma7;
                           sigma8=inisigma8;
                           sigma9=inisigma9;
                           sigma10=inisigma10;
                           sigma11=inisigma11;
                           sigma12=inisigma12;
               */
             end
             
             always@(posedge bitdelay1)
             begin
             sigma1=inisigma1;                //有限域乘法
             sigma2=inisigma2;
             sigma3=inisigma3;
             sigma4=inisigma4;
             sigma5=inisigma5;
             sigma6=inisigma6;
             sigma7=inisigma7;
             sigma8=inisigma8;
             sigma9=inisigma9;
             sigma10=inisigma10;
             sigma11=inisigma11;
             sigma12=inisigma12;
     
             end
             
            
        always@(posedge clkofchian)
        if ( (bitdelay1==1)&&(enablechian==1))
           begin
            if(counterofchian<=16200)
            begin
              counterofchian=counterofchian+1;
              
              //下面这一段也是希望在子模块里面再调用子模块，和前面BM模块一样，用***表示有限域乘法器
              sigma1=regsigma1;  // multiplier_0  uutmultiplyloop1(   .DinA(miu1),   .DinB(alpha1),   .enmultiply(1),    .POBA(sigma1)  );  用有限域乘法器，之后再改
              sigma2=regsigma2;
              sigma3=regsigma3;
              sigma4=regsigma4;
              sigma5=regsigma5;
              sigma6=regsigma6;
              sigma7=regsigma7;
              sigma8=regsigma8;
              sigma9=regsigma9;
              sigma10=regsigma10;
              sigma11=regsigma11;
              sigma12=regsigma12;
              
              
              A=miuofchian[0]^sigma1^sigma2^sigma3^sigma4^sigma5^sigma6^sigma7^sigma8^sigma9^sigma10^sigma11^sigma12;
                             if(A==0)
                              C1[counterofchian-1]=1^C1[counterofchian-1];
                              if (counterofchian<=16008)
                              decodefinal=C1[counterofchian-1];
              end
              
              
             
             
             
           end
        
        
        
    
endmodule