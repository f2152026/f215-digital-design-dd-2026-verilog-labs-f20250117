module tb;

    reg [3:0] t_a;
    reg [3:0] t_b;
    reg t_op;

    wire [3:0] t_result;

    // Instantiate ALU
    alu DUT (
        .a(t_a),
        .b(t_b),
        .op(t_op),
        .result(t_result)
    );

    // Waveform dump
    string vcd_file;

    initial begin
        if ($value$plusargs("vcd=%s", vcd_file)) begin
            $dumpfile(vcd_file);
            $dumpvars(0, DUT);
        end
    end

    // Test addition and subtraction
    initial begin

        // Addition
        t_a = 4'd5;
        t_b = 4'd3;
        t_op = 1'b0;
        #10;

        // Addition
        t_a = 4'd7;
        t_b = 4'd2;
        t_op = 1'b0;
        #10;

        // Subtraction
        t_a = 4'd5;
        t_b = 4'd3;
        t_op = 1'b1;
        #10;

        // Subtraction
        t_a = 4'd9;
        t_b = 4'd4;
        t_op = 1'b1;
        #10;

        $finish;
    end

    // Display results
    initial begin
        $monitor($time,
                 " a=%d b=%d op=%b | result=%d",
                 t_a, t_b, t_op, t_result);
    end

endmodule