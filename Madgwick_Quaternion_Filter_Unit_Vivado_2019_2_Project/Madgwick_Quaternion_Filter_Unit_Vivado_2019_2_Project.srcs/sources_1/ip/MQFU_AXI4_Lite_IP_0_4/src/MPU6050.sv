//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2024 14:56:59
// Design Name: 
// Module Name: MPU6050
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "madgwickDefines.vh"


module MPU6050 (
    input wire signed [15:0] a_x_sens,
    input wire signed [15:0] a_y_sens,
    input wire signed [15:0] a_z_sens,
    input wire signed [15:0] w_x_sens,
    input wire signed [15:0] w_y_sens,
    input wire signed [15:0] w_z_sens,
    
    output reg signed [`ACC_WIDTH-1:0] a_x,
    output reg signed [`ACC_WIDTH-1:0] a_y,
    output reg signed [`ACC_WIDTH-1:0] a_z,
    output reg signed [`GYRO_WIDTH-1:0] w_x,
    output reg signed [`GYRO_WIDTH-1:0] w_y,
    output reg signed [`GYRO_WIDTH-1:0] w_z,

    // Debug outputs
    output wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_x_temp_debug,
    output wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_y_temp_debug,
    output wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_z_temp_debug,
    output wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_x_rounded_debug,
    output wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_y_rounded_debug,
    output wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_z_rounded_debug,
    output wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_x_temp_debug,
    output wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_y_temp_debug,
    output wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_z_temp_debug,
    output wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_x_rounded_debug,
    output wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_y_rounded_debug,
    output wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_z_rounded_debug
    );
    
    // ---- Process Accel data - Start ----
    
    wire signed [`ACC_SENS_COEFF_WIDTH-1:0] acc_sens_coeff;
    assign acc_sens_coeff = `ACC_SENS_COEFF_WIDTH'b`ACC_SENS_COEFF;
    
    wire signed [`ACC_SENS_COEFF_WIDTH+15:0] a_x_sens_pad;
    wire signed [`ACC_SENS_COEFF_WIDTH+15:0] a_y_sens_pad;
    wire signed [`ACC_SENS_COEFF_WIDTH+15:0] a_z_sens_pad;
    
    assign a_x_sens_pad = a_x_sens <<< `ACC_SENS_COEFF_WIDTH;
    assign a_y_sens_pad = a_y_sens <<< `ACC_SENS_COEFF_WIDTH;
    assign a_z_sens_pad = a_z_sens <<< `ACC_SENS_COEFF_WIDTH;
            
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_x_temp; 
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_y_temp; 
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] a_z_temp;
    
    assign a_x_temp = a_x_sens_pad * acc_sens_coeff;
    assign a_y_temp = a_y_sens_pad * acc_sens_coeff;
    assign a_z_temp = a_z_sens_pad * acc_sens_coeff;
    
    localparam ACC_INT_LSB_INDEX = `ACC_SENS_COEFF_WIDTH * 2;
    localparam ACC_INT_MSB_INDEX = ACC_INT_LSB_INDEX + `ACC_INT_WIDTH - 1;
    localparam ACC_FRACT_LSB_INDEX = ACC_INT_LSB_INDEX - `ACC_FRACT_WIDTH;
    
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+15:0] acc_round_const;
    assign acc_round_const = 1'b1 << (ACC_FRACT_LSB_INDEX - 1);
    
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_x_rounded;
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_y_rounded;
    wire signed [(`ACC_SENS_COEFF_WIDTH*2)+16:0] a_z_rounded;
    
    assign a_x_rounded = a_x_temp + acc_round_const;
    assign a_y_rounded = a_y_temp + acc_round_const;
    assign a_z_rounded = a_z_temp + acc_round_const;
    
    assign a_x = a_x_rounded[ACC_INT_MSB_INDEX:ACC_FRACT_LSB_INDEX];
    assign a_y = a_y_rounded[ACC_INT_MSB_INDEX:ACC_FRACT_LSB_INDEX];
    assign a_z = a_z_rounded[ACC_INT_MSB_INDEX:ACC_FRACT_LSB_INDEX];
    
    // ---- Process Accel data - End ----

    // ---- Process Gyro data - Start ----
    
    wire signed [`GYRO_SENS_COEFF_WIDTH-1:0] gyro_sens_coeff;
    assign gyro_sens_coeff = `GYRO_SENS_COEFF_WIDTH'b`GYRO_SENS_COEFF;
    
    wire signed [`GYRO_SENS_COEFF_WIDTH+15:0] w_x_sens_pad;
    wire signed [`GYRO_SENS_COEFF_WIDTH+15:0] w_y_sens_pad;
    wire signed [`GYRO_SENS_COEFF_WIDTH+15:0] w_z_sens_pad;
    
    assign w_x_sens_pad = w_x_sens <<< `GYRO_SENS_COEFF_WIDTH;
    assign w_y_sens_pad = w_y_sens <<< `GYRO_SENS_COEFF_WIDTH;
    assign w_z_sens_pad = w_z_sens <<< `GYRO_SENS_COEFF_WIDTH;
    
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_x_temp; 
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_y_temp; 
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] w_z_temp;
    
    assign w_x_temp = w_x_sens_pad * gyro_sens_coeff;
    assign w_y_temp = w_y_sens_pad * gyro_sens_coeff;
    assign w_z_temp = w_z_sens_pad * gyro_sens_coeff;
    
    localparam GYRO_INT_LSB_INDEX = `GYRO_SENS_COEFF_WIDTH * 2;
    localparam GYRO_INT_MSB_INDEX = GYRO_INT_LSB_INDEX + `GYRO_INT_WIDTH - 1;
    localparam GYRO_FRACT_LSB_INDEX = GYRO_INT_LSB_INDEX - `GYRO_FRACT_WIDTH;
    
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+15:0] gyro_round_const;
    assign gyro_round_const = 1'b1 << (GYRO_FRACT_LSB_INDEX - 1);
    
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_x_rounded;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_y_rounded;
    wire signed [(`GYRO_SENS_COEFF_WIDTH*2)+16:0] w_z_rounded;
    
    assign w_x_rounded = w_x_temp + gyro_round_const;
    assign w_y_rounded = w_y_temp + gyro_round_const;
    assign w_z_rounded = w_z_temp + gyro_round_const;

    assign w_x = w_x_rounded[GYRO_INT_MSB_INDEX:GYRO_FRACT_LSB_INDEX];
    assign w_y = w_y_rounded[GYRO_INT_MSB_INDEX:GYRO_FRACT_LSB_INDEX];
    assign w_z = w_z_rounded[GYRO_INT_MSB_INDEX:GYRO_FRACT_LSB_INDEX];
    
    // ---- Process Gyro data - End ----

    // Assign debug signals
    assign a_x_temp_debug = a_x_temp;
    assign a_y_temp_debug = a_y_temp;
    assign a_z_temp_debug = a_z_temp;
    assign a_x_rounded_debug = a_x_rounded;
    assign a_y_rounded_debug = a_y_rounded;
    assign a_z_rounded_debug = a_z_rounded;
    assign w_x_temp_debug = w_x_temp;
    assign w_y_temp_debug = w_y_temp;
    assign w_z_temp_debug = w_z_temp;
    assign w_x_rounded_debug = w_x_rounded;
    assign w_y_rounded_debug = w_y_rounded;
    assign w_z_rounded_debug = w_z_rounded;
    
endmodule

