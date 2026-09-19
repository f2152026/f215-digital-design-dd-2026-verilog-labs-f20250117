// tb.v
// Starter testbench template -- YOU complete this file.
//
// Goal: apply all 8 combinations of I0, I1, S (5 time units apart) to DUT
// and observe the output. Fill in every TODO below.

module tb;

    reg I0;
    reg I1;
    reg S;
    wire Y;

    // Instantiate DUT
    DUT uut (
        .I0(I0),
        .I1(I1),
        .S(S),
        .Y(Y)
    );

    initial begin

        // Test 1: S = 0, output should be I0
        I0 = 1'b0;
        I1 = 1'b1;
        S = 1'b0;
        #10;

        // Test 2: S = 0, output should be I0
        I0 = 1'b1;
        I1 = 1'b0;
        S = 1'b0;
        #10;

        // Test 3: S = 1, output should be I1
        I0 = 1'b0;
        I1 = 1'b1;
        S = 1'b1;
        #10;

        // Test 4: S = 1, output should be I1
        I0 = 1'b1;
        I1 = 1'b0;
        S = 1'b1;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | I0=%b I1=%b S=%b | Y=%b",
                 $time, I0, I1, S, Y);
    end

endmodule