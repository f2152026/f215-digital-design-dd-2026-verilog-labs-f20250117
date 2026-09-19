// and_beh_intra.v
// Behavioral implementation with intra-assignment delay

module and_beh_intra (
    input A,
    input B,
    output reg Y
);

    always @(*) begin
        Y = #2 (A & B);
    end

endmodule