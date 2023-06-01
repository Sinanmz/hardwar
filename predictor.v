module predictor(input wire request, result, clk, taken, output reg prediction);
    reg [1:0] state = 2'b11;
    always @(posedge clk) begin
        if (request == 1'b1) begin
            if (state >= 2'b10) begin
                prediction <= 1'b1;
            end
            else begin
                prediction <= 1'b0;
            end
        end
        else if (result == 1'b1) begin
            if (taken && state!= 2'b11) begin
                state <= state+1;
            end
            if(!taken && state!=2'b00) begin
                state <= state-1;
            end
        end
    end

endmodule