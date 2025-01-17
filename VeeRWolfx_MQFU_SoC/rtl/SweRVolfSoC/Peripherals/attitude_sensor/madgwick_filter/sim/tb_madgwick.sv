`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2024 11:07:11
// Design Name: 
// Module Name: madgwick_tb
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
`include "test_vectors.svh"


module madgwick_tb;

    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period (100MHz)
    end

    // ---- Input/Output signals - Start ----
    
    reg rst_n;
    reg valid_in;
    wire ready_in;
    reg signed [`ACC_WIDTH-1:0] a_x;
    reg signed [`ACC_WIDTH-1:0] a_y;
    reg signed [`ACC_WIDTH-1:0] a_z;
    reg signed [`GYRO_WIDTH-1:0] w_x;
    reg signed [`GYRO_WIDTH-1:0] w_y;
    reg signed [`GYRO_WIDTH-1:0] w_z;
    wire valid_out;
    reg ready_out;
    wire signed [`Q_WIDTH-1:0] q_w_norm_output;
    wire signed [`Q_WIDTH-1:0] q_x_norm_output;
    wire signed [`Q_WIDTH-1:0] q_y_norm_output;
    wire signed [`Q_WIDTH-1:0] q_z_norm_output;
    
    // ---- Input/Output signals - End ----

    // ---- Debug signals - Start ----
    
    wire signed [`Q_HALF_WIDTH-1:0] q_w_half;    // Pre-compute
    wire signed [`Q_HALF_WIDTH-1:0] q_x_half;
    wire signed [`Q_HALF_WIDTH-1:0] q_y_half;
    wire signed [`Q_HALF_WIDTH-1:0] q_z_half;
    wire signed [`Q_TWO_WIDTH-1:0] q_w_two;
    wire signed [`Q_TWO_WIDTH-1:0] q_x_two;
    wire signed [`Q_TWO_WIDTH-1:0] q_y_two;
    wire signed [`Q_TWO_WIDTH-1:0] q_z_two;
    
    wire signed [`JACOBIAN_WIDTH-1:0] j_11_24; // Jacobian
    wire signed [`JACOBIAN_WIDTH-1:0] j_12_23;
    wire signed [`JACOBIAN_WIDTH-1:0] j_13_22;
    wire signed [`JACOBIAN_WIDTH-1:0] j_14_21;
    wire signed [`JACOBIAN_WIDTH:0] j_32;
    wire signed [`JACOBIAN_WIDTH:0] j_33;

    wire signed [`ACC_WIDTH-1:0] a_x_norm;  // Acc Norm
    wire signed [`ACC_WIDTH-1:0] a_y_norm;
    wire signed [`ACC_WIDTH-1:0] a_z_norm;
    wire signed [(`ACC_WIDTH+`ACC_MAG_SQR_WIDTH)-1:0] a_x_norm_temp;
    wire signed [(`ACC_WIDTH+`ACC_MAG_SQR_WIDTH)-1:0] a_y_norm_temp;
    wire signed [(`ACC_WIDTH+`ACC_MAG_SQR_WIDTH)-1:0] a_z_norm_temp;
    wire [`ACC_MAG_SQR_WIDTH-1:0] data_in_invSqrtAccNorm;
    wire valid_in_invSqrtAccNorm;
    wire ready_in_invSqrtAccNorm;
    
    wire signed [`ACC_MAG_SQR_WIDTH-1:0] data_out_invSqrtAccNorm;
    wire valid_out_invSqrtAccNorm;
    wire ready_out_invSqrtAccNorm;
    wire start_acc_vec_norm;
    wire done_acc_vec_norm;

    wire signed [`Q_DOT_WIDTH-1:0] q_dot_w; // q_dot
    wire signed [`Q_DOT_WIDTH-1:0] q_dot_x;
    wire signed [`Q_DOT_WIDTH-1:0] q_dot_y;
    wire signed [`Q_DOT_WIDTH-1:0] q_dot_z;
    wire signed [`Q_HALF_WIDTH-1:0] q_w_half_q_dot;
    wire signed [`Q_HALF_WIDTH-1:0] q_x_half_q_dot;
    wire signed [`Q_HALF_WIDTH-1:0] q_y_half_q_dot;
    wire signed [`Q_HALF_WIDTH-1:0] q_z_half_q_dot;
    wire signed [`Q_HALF_WIDTH:0] q_w_half_q_dot_rounded;
    wire signed [`Q_HALF_WIDTH:0] q_x_half_q_dot_rounded;
    wire signed [`Q_HALF_WIDTH:0] q_y_half_q_dot_rounded;
    wire signed [`Q_HALF_WIDTH:0] q_z_half_q_dot_rounded;
    wire start_q_dot;
    wire done_q_dot;
    
    wire signed [`OBJ_FUNC_WIDTH-1:0] f1;    // Obj func
    wire signed [`OBJ_FUNC_WIDTH-1:0] f2;
    wire signed [`OBJ_FUNC_WIDTH:0] f3;
    wire signed [`Q_TWO_WIDTH-1:0] q_w_two_obj_func;
    wire signed [`Q_TWO_WIDTH-1:0] q_x_two_obj_func;
    wire signed [`Q_TWO_WIDTH-1:0] q_y_two_obj_func;
    wire signed [`Q_WIDTH+`Q_TWO_WIDTH-1:0] a_x_norm_obj_func;
    wire signed [`Q_WIDTH+`Q_TWO_WIDTH-1:0] a_y_norm_obj_func;
    wire signed [`Q_WIDTH+`Q_TWO_WIDTH-1:0] a_z_norm_obj_func;
    wire signed [`OBJ_FUNC_WIDTH-1:0] one_obj_func;
    wire start_obj_func;
    wire done_obj_func;
    
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_w;    // Err grad
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_x;
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_y;
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_z;
    wire signed [(`OBJ_FUNC_WIDTH+`JACOBIAN_WIDTH+1)-1:0] q_hat_dot_w_temp;
    wire signed [(`OBJ_FUNC_WIDTH+`JACOBIAN_WIDTH+1)+1:0] q_hat_dot_x_temp;
    wire signed [(`OBJ_FUNC_WIDTH+`JACOBIAN_WIDTH+1)+2:0] q_hat_dot_y_temp;
    wire signed [(`OBJ_FUNC_WIDTH+`JACOBIAN_WIDTH+1)-1:0] q_hat_dot_z_temp;
    wire start_err_grad;
    wire done_err_grad;
    
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_w_norm; // Err grad norm 
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_x_norm; 
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_y_norm; 
    wire signed [`Q_HAT_DOT_WIDTH-1:0] q_hat_dot_z_norm; 
    wire signed [(`Q_HAT_DOT_WIDTH+`Q_HAT_DOT_MAG_SQR_WIDTH)-1:0] q_hat_dot_w_norm_temp;
    wire signed [(`Q_HAT_DOT_WIDTH+`Q_HAT_DOT_MAG_SQR_WIDTH)-1:0] q_hat_dot_x_norm_temp;
    wire signed [(`Q_HAT_DOT_WIDTH+`Q_HAT_DOT_MAG_SQR_WIDTH)-1:0] q_hat_dot_y_norm_temp;
    wire signed [(`Q_HAT_DOT_WIDTH+`Q_HAT_DOT_MAG_SQR_WIDTH)-1:0] q_hat_dot_z_norm_temp;
    wire [(`Q_HAT_DOT_WIDTH*2)+2:0] q_hat_dot_mag_sqr;
    wire start_err_grad_norm;
    wire done_err_grad_norm;
    
    wire [`BETA_WIDTH-1:0] beta;    // Quat int
    wire [`DELTA_T_WIDTH-1:0] delta_t;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)-1:0] q_dot_w_quat_int;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)-1:0] q_dot_x_quat_int;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)-1:0] q_dot_y_quat_int;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)-1:0] q_dot_z_quat_int;
    wire signed [`Q_INT_WIDTH+(`DELTA_T_FRACT_WIDTH*2)-1:0] q_w_quat_int;
    wire signed [`Q_INT_WIDTH+(`DELTA_T_FRACT_WIDTH*2)-1:0] q_x_quat_int;
    wire signed [`Q_INT_WIDTH+(`DELTA_T_FRACT_WIDTH*2)-1:0] q_y_quat_int;
    wire signed [`Q_INT_WIDTH+(`DELTA_T_FRACT_WIDTH*2)-1:0] q_z_quat_int;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_WIDTH+1:0] q_w_temp;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_WIDTH+1:0] q_x_temp;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_WIDTH+1:0] q_y_temp;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_WIDTH+1:0] q_z_temp;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_FRACT_WIDTH+1:0] q_round_const;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_FRACT_WIDTH+2:0] q_w_rounded;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_FRACT_WIDTH+2:0] q_x_rounded;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_FRACT_WIDTH+2:0] q_y_rounded;
    wire signed [`Q_DOT_INT_WIDTH+(`BETA_FRACT_WIDTH*2)+`DELTA_T_FRACT_WIDTH+2:0] q_z_rounded;
    wire signed [`Q_WIDTH-1:0] q_w;
    wire signed [`Q_WIDTH-1:0] q_x;
    wire signed [`Q_WIDTH-1:0] q_y;
    wire signed [`Q_WIDTH-1:0] q_z;
    wire start_quat_int;
    wire done_quat_int;
    
    wire signed [`Q_WIDTH-1:0] q_w_norm;    // Quat norm
    wire signed [`Q_WIDTH-1:0] q_x_norm;
    wire signed [`Q_WIDTH-1:0] q_y_norm;
    wire signed [`Q_WIDTH-1:0] q_z_norm;
    wire signed [(`Q_WIDTH+`Q_MAG_SQR_WIDTH)-1:0] q_w_norm_temp;
    wire signed [(`Q_WIDTH+`Q_MAG_SQR_WIDTH)-1:0] q_x_norm_temp;
    wire signed [(`Q_WIDTH+`Q_MAG_SQR_WIDTH)-1:0] q_y_norm_temp;
    wire signed [(`Q_WIDTH+`Q_MAG_SQR_WIDTH)-1:0] q_z_norm_temp;
    wire start_quat_norm;
    wire done_quat_norm;
    
    // ---- Debug signals - End ----
    
    madgwick dut (
    
        // ---- Input/Output signals inst - Start ----
        
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(valid_in),
        .ready_in(ready_in),
        .a_x(a_x),
        .a_y(a_y),
        .a_z(a_z),
        .w_x(w_x),
        .w_y(w_y),
        .w_z(w_z),
        .valid_out(valid_out),
        .ready_out(ready_out),
        .q_w_norm_output(q_w_norm_output),
        .q_x_norm_output(q_x_norm_output),
        .q_y_norm_output(q_y_norm_output),
        .q_z_norm_output(q_z_norm_output)
        
        // ---- Input/Output signals inst - End ----

        // ---- Debug signals inst - Start ----
        
            ,.q_w_half_debug(q_w_half),   // Pre-compute
            .q_x_half_debug(q_x_half),
            .q_y_half_debug(q_y_half),
            .q_z_half_debug(q_z_half),
            .q_w_two_debug(q_w_two),
            .q_x_two_debug(q_x_two),
            .q_y_two_debug(q_y_two),
            .q_z_two_debug(q_z_two)
            
            ,.j_11_24_debug(j_11_24),  // Jacobian
            .j_12_23_debug(j_12_23),
            .j_13_22_debug(j_13_22),
            .j_14_21_debug(j_14_21),
            .j_32_debug(j_32),
            .j_33_debug(j_33)
            
            ,.a_x_norm_debug(a_x_norm),   // Acc norm
            .a_y_norm_debug(a_y_norm),
            .a_z_norm_debug(a_z_norm),
            .a_x_norm_temp_debug(a_x_norm_temp),
            .a_y_norm_temp_debug(a_y_norm_temp),
            .a_z_norm_temp_debug(a_z_norm_temp),
            .data_in_invSqrtAccNorm_debug(data_in_invSqrtAccNorm),
            .valid_in_invSqrtAccNorm_debug(valid_in_invSqrtAccNorm),
            .ready_in_invSqrtAccNorm_debug(ready_in_invSqrtAccNorm),
            .data_out_invSqrtAccNorm_debug(data_out_invSqrtAccNorm),
            .valid_out_invSqrtAccNorm_debug(valid_out_invSqrtAccNorm),
            .ready_out_invSqrtAccNorm_debug(ready_out_invSqrtAccNorm)
            ,.start_acc_vec_norm_debug(start_acc_vec_norm),
            .done_acc_vec_norm_debug(done_acc_vec_norm)
        
            ,.q_dot_w_debug(q_dot_w),  // q_dot
            .q_dot_x_debug(q_dot_x),
            .q_dot_y_debug(q_dot_y),
            .q_dot_z_debug(q_dot_z),
            .q_w_half_q_dot_debug(q_w_half_q_dot),
            .q_x_half_q_dot_debug(q_x_half_q_dot),
            .q_y_half_q_dot_debug(q_y_half_q_dot),
            .q_z_half_q_dot_debug(q_z_half_q_dot),
            .q_w_half_q_dot_rounded_debug(q_w_half_q_dot_rounded),
            .q_x_half_q_dot_rounded_debug(q_x_half_q_dot_rounded),
            .q_y_half_q_dot_rounded_debug(q_y_half_q_dot_rounded),
            .q_z_half_q_dot_rounded_debug(q_z_half_q_dot_rounded),
            .start_q_dot_debug(start_q_dot), 
            .done_q_dot_debug(done_q_dot)
            
            ,.f1_debug(f1),   // Obj func
            .f2_debug(f2),
            .f3_debug(f3),
            .q_w_two_obj_func_debug(q_w_two_obj_func),
            .q_x_two_obj_func_debug(q_x_two_obj_func),
            .q_y_two_obj_func_debug(q_y_two_obj_func),
            .a_x_norm_obj_func_debug(a_x_norm_obj_func),
            .a_y_norm_obj_func_debug(a_y_norm_obj_func),
            .a_z_norm_obj_func_debug(a_z_norm_obj_func),
            .one_obj_func_debug(one_obj_func),
            .start_obj_func_debug(start_obj_func),
            .done_obj_func_debug(done_obj_func)
            
            ,.q_hat_dot_w_debug(q_hat_dot_w), // Err grad
            .q_hat_dot_x_debug(q_hat_dot_x),
            .q_hat_dot_y_debug(q_hat_dot_y),
            .q_hat_dot_z_debug(q_hat_dot_z),
            .q_hat_dot_w_temp_debug(q_hat_dot_w_temp),
            .q_hat_dot_x_temp_debug(q_hat_dot_x_temp),
            .q_hat_dot_y_temp_debug(q_hat_dot_y_temp),
            .q_hat_dot_z_temp_debug(q_hat_dot_z_temp),
            .start_err_grad_debug(start_err_grad),
            .done_err_grad_debug(done_err_grad)
            
            ,.q_hat_dot_w_norm_debug(q_hat_dot_w_norm),   // Err grad norm
            .q_hat_dot_x_norm_debug(q_hat_dot_x_norm),
            .q_hat_dot_y_norm_debug(q_hat_dot_y_norm),
            .q_hat_dot_z_norm_debug(q_hat_dot_z_norm),
            .q_hat_dot_w_norm_temp_debug(q_hat_dot_w_norm_temp),
            .q_hat_dot_x_norm_temp_debug(q_hat_dot_x_norm_temp),
            .q_hat_dot_y_norm_temp_debug(q_hat_dot_y_norm_temp),
            .q_hat_dot_z_norm_temp_debug(q_hat_dot_z_norm_temp),
            .q_hat_dot_mag_sqr_debug(q_hat_dot_mag_sqr),
            .start_err_grad_norm_debug(start_err_grad_norm),
            .done_err_grad_norm_debug(done_err_grad_norm)
            
            ,.beta_debug(beta),   // Quat int
            .delta_t_debug(delta_t),
            .q_dot_w_quat_int_debug(q_dot_w_quat_int),
            .q_dot_x_quat_int_debug(q_dot_x_quat_int),
            .q_dot_y_quat_int_debug(q_dot_y_quat_int),
            .q_dot_z_quat_int_debug(q_dot_z_quat_int),
            .q_w_quat_int_debug(q_w_quat_int),
            .q_x_quat_int_debug(q_x_quat_int),
            .q_y_quat_int_debug(q_y_quat_int),
            .q_z_quat_int_debug(q_z_quat_int),
            .q_w_temp_debug(q_w_temp),
            .q_x_temp_debug(q_x_temp),
            .q_y_temp_debug(q_y_temp),
            .q_z_temp_debug(q_z_temp),
            .q_round_const_debug(q_round_const),
            .q_w_rounded_debug(q_w_rounded),
            .q_x_rounded_debug(q_x_rounded),
            .q_y_rounded_debug(q_y_rounded),
            .q_z_rounded_debug(q_z_rounded),
            .q_w_debug(q_w),
            .q_x_debug(q_x),
            .q_y_debug(q_y),
            .q_z_debug(q_z),
            .start_quat_int_debug(start_quat_int),
            .done_quat_int_debug(done_quat_int)
            
            ,.q_w_norm_debug(q_w_norm),   // Quat norm
            .q_x_norm_debug(q_x_norm),
            .q_y_norm_debug(q_y_norm),
            .q_z_norm_debug(q_z_norm),
            .q_w_norm_temp_debug(q_w_norm_temp),
            .q_x_norm_temp_debug(q_x_norm_temp),
            .q_y_norm_temp_debug(q_y_norm_temp),
            .q_z_norm_temp_debug(q_z_norm_temp),
            .start_quat_norm_debug(start_quat_norm),
            .done_quat_norm_debug(done_quat_norm)
        
        // ---- Debug signals inst - End ----
    );
    
    integer file;
    integer i;

    initial begin
//        $system("cd");
        file = $fopen("behavioral_sim_data.txt", "w");
        $fwrite(file, "q_w,q_x,q_y,q_z\n");

        // Init
        rst_n = 0;
        valid_in = 1'b0;
        a_x = `ACC_WIDTH'b0;
        a_y = `ACC_WIDTH'b0;
        a_z = `ACC_WIDTH'b0;
        w_x = `GYRO_WIDTH'b0;
        w_y = `GYRO_WIDTH'b0;
        w_z = `GYRO_WIDTH'b0;
        ready_out = 1'b0;
        #25 rst_n = 1;
        
        for (i = 0; i < `NUM_ELEMENTS; i = i + 1) begin
            @ (posedge clk);
                        
            a_x = AX_TEST_VECTOR[i];
            a_y = AY_TEST_VECTOR[i];
            a_z = AZ_TEST_VECTOR[i];
            w_x = WX_TEST_VECTOR[i];
            w_y = WY_TEST_VECTOR[i];
            w_z = WZ_TEST_VECTOR[i];
            
            valid_in = 1'b1;
            wait (valid_in && ready_in);
            @ (posedge clk);
            valid_in = 1'b0;
            ready_out = 1'b1;
            wait(valid_out && ready_out);
            @ (posedge clk);
            ready_out = 1'b0;
            
            // Print to console
            $display("%0d,%0d,%0d,%0d", $unsigned(q_w_norm_output), $unsigned(q_x_norm_output), $unsigned(q_y_norm_output), $unsigned(q_z_norm_output));
            
            // Write to file
            $fwrite(file, "%0d,%0d,%0d,%0d\n", $unsigned(q_w_norm_output), $unsigned(q_x_norm_output), $unsigned(q_y_norm_output), $unsigned(q_z_norm_output));
        end

        // Close the file
        $fclose(file);
    end
    
endmodule
