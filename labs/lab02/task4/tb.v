// tb.v
// Testbench for AND gate implementations

module tb;

    reg t_A;
    reg t_B;

    wire y_df;
    wire y_beh_before;
    wire y_beh_intra;

    // Instantiate all three implementations
    and_df U1 (
        .A(t_A),
        .B(t_B),
        .Y(y_df)
    );

    and_beh_before U2 (
        .A(t_A),
        .B(t_B),
        .Y(y_beh_before)
    );

    and_beh_intra U3 (
        .A(t_A),
        .B(t_B),
        .Y(y_beh_intra)
    );

    // Waveform dump
    string vcd_file;

    initial begin
        if ($value$plusargs("vcd=%s", vcd_file)) begin
            $dumpfile(vcd_file);
            $dumpvars(0, U1);
            $dumpvars(0, U2);
            $dumpvars(0, U3);
        end
    end

    // Apply all input combinations
    initial begin
        t_A = 0; t_B = 0;
        #10;

        t_A = 0; t_B = 1;
        #10;

        t_A = 1; t_B = 0;
        #10;

        t_A = 1; t_B = 1;
        #10;

        $finish;
    end

    // Display outputs
    initial begin
        $monitor($time,
                 " A=%b B=%b | DF=%b BEFORE=%b INTRA=%b",
                 t_A, t_B, y_df, y_beh_before, y_beh_intra);
    end

endmodule