// and_df.v
// Dataflow implementation of AND gate

module and_df (
    input A,
    input B,
    output Y
);

    assign Y = A & B;

endmodule