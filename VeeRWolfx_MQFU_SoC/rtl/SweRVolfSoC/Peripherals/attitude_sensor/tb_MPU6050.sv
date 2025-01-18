`timescale 1ns / 1ps

`include "madgwickDefines.vh"

module MPU6050_tb;

    // Inputs
    reg signed [15:0] a_x_sens;
    reg signed [15:0] a_y_sens;
    reg signed [15:0] a_z_sens;
    reg signed [15:0] w_x_sens;
    reg signed [15:0] w_y_sens;
    reg signed [15:0] w_z_sens;

    // Outputs
    wire signed [`ACC_WIDTH-1:0] a_x;
    wire signed [`ACC_WIDTH-1:0] a_y;
    wire signed [`ACC_WIDTH-1:0] a_z;
    wire signed [`GYRO_WIDTH-1:0] w_x;
    wire signed [`GYRO_WIDTH-1:0] w_y;
    wire signed [`GYRO_WIDTH-1:0] w_z;

    // Debug Outputs
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_x_temp_debug;
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_y_temp_debug;
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_z_temp_debug;
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_x_rounded_debug;
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_y_rounded_debug;
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_z_rounded_debug;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_x_temp_debug;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_y_temp_debug;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_z_temp_debug;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_x_rounded_debug;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_y_rounded_debug;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_z_rounded_debug;

    // Instantiate the Device Under Test (DUT)
    MPU6050 uut (
        .a_x_sens(a_x_sens), 
        .a_y_sens(a_y_sens), 
        .a_z_sens(a_z_sens), 
        .w_x_sens(w_x_sens), 
        .w_y_sens(w_y_sens), 
        .w_z_sens(w_z_sens), 
        .a_x(a_x), 
        .a_y(a_y), 
        .a_z(a_z), 
        .w_x(w_x), 
        .w_y(w_y), 
        .w_z(w_z), 
        .a_x_temp_debug(a_x_temp_debug), 
        .a_y_temp_debug(a_y_temp_debug), 
        .a_z_temp_debug(a_z_temp_debug), 
        .a_x_rounded_debug(a_x_rounded_debug), 
        .a_y_rounded_debug(a_y_rounded_debug), 
        .a_z_rounded_debug(a_z_rounded_debug), 
        .w_x_temp_debug(w_x_temp_debug), 
        .w_y_temp_debug(w_y_temp_debug), 
        .w_z_temp_debug(w_z_temp_debug), 
        .w_x_rounded_debug(w_x_rounded_debug), 
        .w_y_rounded_debug(w_y_rounded_debug), 
        .w_z_rounded_debug(w_z_rounded_debug)
    );

    initial begin
        // Initialize Inputs
        a_x_sens = 16'b1111101101110111; // Example input
        a_y_sens = 16'b1110011100010000; // Example input
        a_z_sens = 16'b0000001111001100; // Example input
        w_x_sens = 16'b1111110000110000; // Example input
        w_y_sens = 16'b0000011110001100; // Example input
        w_z_sens = 16'b1100001111111110; // Example input

        // Wait for a few time units and observe the results
        #100;
        
        // You can modify inputs to observe different behaviors and debug outputs
        a_x_sens = 16'b0000111100001111;
        w_x_sens = 16'b1001100110011001;

        #100;

        // End simulation
        $finish;
    end
    
    // Monitor the signals
    initial begin
        $monitor("Time: %0dns, a_x_sens: %0d, a_x_temp_debug: %0d, a_x_rounded_debug: %0d, a_x: %0d", 
                  $time, a_x_sens, a_x_temp_debug, a_x_rounded_debug, a_x);
        $monitor("Time: %0dns, w_x_sens: %0d, w_x_temp_debug: %0d, w_x_rounded_debug: %0d, w_x: %0d", 
                  $time, w_x_sens, w_x_temp_debug, w_x_rounded_debug, w_x);
    end

endmodule
