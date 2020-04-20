`timescale 1ns / 1ps



module decoder_try2_test;


reg reset;
reg type;

reg CLK;
reg R;    
wire dataenable;
wire dataout;
reg  mem [0:16199]; 
reg [16:0] inin ;
wire [191:0]bits;

topmodule uuttest(
     .R(R),
     .CLK(CLK),
     .C1(dataout)
    
    );


parameter PERIOD=10;



always 
 begin
 
   inin=inin+1;
   CLK=1'b0;
     #(PERIOD/2);
     R=mem[inin];         
     CLK=1'b1;
     #(PERIOD/2);

/*
    # (PERIOD/2)  CLK = ~CLK; 
    */
/*         reset=1;
     #(16200*PERIOD);
     */
 end
 
 
 
initial 
 begin
    CLK = 0;
      
    inin=0;
    type=0;
         
       
    
    
    $readmemh("C:/Users/Administrator/Desktop/myDataout.txt",mem,0,16199);
    
    //#(16200*PERIOD) $finish;
 
 
end     





endmodule