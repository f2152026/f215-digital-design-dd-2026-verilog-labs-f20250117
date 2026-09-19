// and_beh_before.v
// Behavioral implementation with delay before assignment

module and_beh_before (
    input A,
    input B,
    output reg Y
);

    always @(*) begin
        #2 Y = A & B;
    end

endmodule