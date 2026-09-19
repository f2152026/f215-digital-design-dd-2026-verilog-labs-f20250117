module tb;

    reg [1:0] t_A;
    reg [1:0] t_B;

    wire t_GT;
    wire t_LT;
    wire t_EQ;

    // Instantiate comparator
    comp2 DUT (
        .A(t_A),
        .B(t_B),
        .GT(t_GT),
        .LT(t_LT),
        .EQ(t_EQ)
    );

    // Waveform dump
    string vcd_file;

    initial begin
        if ($value$plusargs("vcd=%s", vcd_file)) begin
            $dumpfile(vcd_file);
            $dumpvars(0, DUT);
        end
    end

    // Test all 16 input combinations
    initial begin

        t_A = 2'b00; t_B = 2'b00; #5;
        t_A = 2'b00; t_B = 2'b01; #5;
        t_A = 2'b00; t_B = 2'b10; #5;
        t_A = 2'b00; t_B = 2'b11; #5;

        t_A = 2'b01; t_B = 2'b00; #5;
        t_A = 2'b01; t_B = 2'b01; #5;
        t_A = 2'b01; t_B = 2'b10; #5;
        t_A = 2'b01; t_B = 2'b11; #5;

        t_A = 2'b10; t_B = 2'b00; #5;
        t_A = 2'b10; t_B = 2'b01; #5;
        t_A = 2'b10; t_B = 2'b10; #5;
        t_A = 2'b10; t_B = 2'b11; #5;

        t_A = 2'b11; t_B = 2'b00; #5;
        t_A = 2'b11; t_B = 2'b01; #5;
        t_A = 2'b11; t_B = 2'b10; #5;
        t_A = 2'b11; t_B = 2'b11; #5;

        $finish;
    end

    // Display results
    initial begin
        $monitor($time,
                 " A=%b B=%b | GT=%b LT=%b EQ=%b",
                 t_A, t_B, t_GT, t_LT, t_EQ);
    end

endmodule