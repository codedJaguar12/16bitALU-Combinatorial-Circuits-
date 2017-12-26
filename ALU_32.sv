module ALU_32 (iA, iB ,ctrl, oCarry,oZero, out);    
input [16:0] iA,iB;
output [16:0] out;
input ctrl;
output oCarry,oZero;
reg [16:0] out;
reg oCarry;
reg oZero;
always@* begin 
        case(ctrl)
            4'b0: out=iA&iB;
            4'b0001: out=iA|iB;
            4'b0010: {oCarry ,out}=iA+iB;
            4'b0011: out= ~(iA | iB);    
            4'b0100: 
            begin 
                if(iA==iB)
                    out=16'b1;
            end  
            4'b0101: out=iA-iB;  
            4'b0110:    
            begin 
                if(iA<iB)
                    out=16'b1;
                else
                    out=16'b0;
                end
            4'b0111:   out=iA*iB;     
            4'b1000: out=iA/iB;        
        endcase
        end
        always@(out)
           begin
               if(out==0)
                   oZero=1;
            end
endmodule
