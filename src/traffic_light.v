`timescale 1ns / 1ps

module traffic_light(
    input clk,rst,en,
    output wire [2:0]state_out
    );
    
    parameter [2:0] OFF =3'b000;
    parameter [2:0] RED =3'b001;
    parameter [2:0] YELLOW =3'b010;
    parameter [2:0] GREEN =3'b100;
    
    reg [5:0] t;
    reg clr_t;
    reg [2:0]state;
    reg [2:0] next_state;
    
    always @(*) begin
        next_state=OFF;
        
        case(state) 
            OFF     :   if(en==1'b1) begin
                            next_state=RED;
                        end
                        else begin
                            next_state=OFF;
                            clr_t=1'b1;
                        end
                        
            RED     :   if((en==1'b1) && (t==6'd30)) begin
                            next_state=YELLOW;
                            clr_t=1'b1;
                        end
                        else if(en==1'b0)begin
                            next_state=OFF;
                            clr_t=1'b1;
                        end
                        else if((en==1'b1) && (t<6'd30)) begin
                            next_state=RED;
                            clr_t=1'b0;
                        end
                       
            YELLOW  :   if((en==1'b1) && (t==6'd10)) begin
                            next_state=GREEN;
                            clr_t=1'b1;
                        end
                        else if(en==1'b0) begin
                            next_state=OFF;
                            clr_t=1'b1;
                        end
                        else if((en==1'b1) && (t<6'd10)) begin
                            next_state=YELLOW;
                            clr_t=1'b0;
                        end
                        
             GREEN  :   if((en==1'b1) && (t==6'd40)) begin
                            next_state=RED;
                            clr_t=1'b1;
                        end
                        else if(en==1'b0) begin
                            next_state=OFF;
                            clr_t=1'b1;
                        end
                        else if((en==1'b1) && (t<6'd40)) begin
                            next_state=GREEN;
                            clr_t=1'b0;
                        end
                        
            default :   if(en==1'b0) begin
                            next_state=OFF;
                            clr_t=1'b1;
                        end
        endcase
    end
    
    always @(posedge clk or negedge rst) begin
        if(!rst)
            state<=OFF;
        else
            state<=next_state;
    end
    assign state_out=state;
    
    always @(posedge clk or negedge rst) begin
        if((clr_t==1'b0) && ((state==RED) || (state==YELLOW) || (state==GREEN))) begin
            t<=t+6'd1;
        end
        else if((clr_t==1'b1) || (state==OFF)) begin
            t<=6'd0;
        end
    end
              
    
    
endmodule                                    
