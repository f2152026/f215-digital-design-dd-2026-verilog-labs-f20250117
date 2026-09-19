// 2-bit unsigned magnitude comparator.
// Exactly one of GT, LT, EQ should be 1 for any input combination.

module comp2 (
    input [1:0] A,
    input [1:0] B,
    output GT,
    output LT,
    output EQ
);

    assign EQ = (A == B);
    assign GT = (A > B);
    assign LT = (A < B);

endmodule