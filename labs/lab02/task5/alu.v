module alu (
    input [3:0] a,
    input [3:0] b,
    input op, // 0 = add, 1 = sub
    output reg [3:0] result
);

    reg [3:0] b_inv;
    reg [3:0] b_twos;

    always @(a, b, op) begin
        case (op)

            1'b0: begin
                // Addition
                result = a + b;
            end

            1'b1: begin
                // Subtraction using two's complement
                b_inv = ~b;
                b_twos = b_inv + 1;
                result = a + b_twos;
            end

        endcase
    end

endmodule