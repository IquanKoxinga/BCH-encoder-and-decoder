`timescale 1ns / 1ps


module multiplier(
        input [15:0] DinA,
        input [15:0] DinB,
        input enmultiply,
        output reg [15:0] POBA = 0
        );
        reg [30:0]middle=0;
        reg [4:0]i=0;
        reg [4:0]ii=0;
        reg [4:0]iii=30;
        always@( DinA or DinB )                       //       双循环求中间变量的系数
          begin
         // #1;
           middle=0;
                                         //加个延时试试
            for( i=0 ; i<=30 ; i=i+1 )
            begin
           
            if(i<=15)
              for(ii=0 ; ii<=i ; ii=ii+1)
                 begin
                  middle[i] = middle[i] ^ (DinA[ii] & DinB[i-ii]);
                 end
             
             else
             for(ii=0 ; ii<=30-i ;ii=ii+1)
             middle[i] = middle[i] ^ (DinA[i-15+ii] & DinB[15-ii]);
             end
          /*   
          end
          always@(negedge enmultiply)
          begin*/
             for(iii=30 ; iii>=16 ; iii=iii-1)                      //           将髙次的用低次的表示
                     begin
                         if(middle[iii]==1)
                         begin
                         middle[iii]=0;
                         middle[iii-11]=middle[iii-11]^1;
                         middle[iii-13]=middle[iii-13]^1;
                         middle[iii-14]=middle[iii-14]^1;
                         middle[iii-16]=middle[iii-16]^1;
                         
                         end
                         /*
                         else
                         begin
                         iii=iii-1;
                         end*/
                         
                     end      
    
          POBA=middle[15:0];
          end       
          
  
endmodule
