`timescale 1ns / 1ps

module traffic_light_tb();
    reg clk=1;
    reg rst;
    reg en;
    wire [2:0]state_out;
    
    traffic_light uut(.clk(clk),.rst(rst),.en(en),.state_out(state_out));
    
    always begin
        clk=~clk;#0.5;
    end
    
    initial begin
        $monitor("ENABLE=%0b,STATE:%3b",en,state_out);
        
        rst=0;en=0;#1;
        rst=1;
        @(posedge clk);
        en=1;
        
        
    end
endmodule
