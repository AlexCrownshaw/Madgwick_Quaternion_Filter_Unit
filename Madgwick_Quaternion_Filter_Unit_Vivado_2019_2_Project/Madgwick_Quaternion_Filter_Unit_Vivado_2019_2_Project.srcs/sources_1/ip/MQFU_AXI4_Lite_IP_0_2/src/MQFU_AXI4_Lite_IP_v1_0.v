`timescale 1 ns / 1 ps

`include "madgwickDefines.vh"


module MQFU_AXI4_Lite_IP_v1_0 #(
    // Users to add parameters here

    // User parameters ends
    // Do not modify the parameters beyond this line


    // Parameters of Axi Slave Bus Interface S_AXI
    parameter integer C_S_AXI_DATA_WIDTH	= 32,
    parameter integer C_S_AXI_ADDR_WIDTH	= 6
)
(
    // Users to add ports here
    
    output reg inta_o,
    
    // User ports ends
    // Do not modify the ports beyond this line


    // Ports of Axi Slave Bus Interface S_AXI
    input wire  s_axi_aclk,
    input wire  s_axi_aresetn,
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
    input wire [2 : 0] s_axi_awprot,
    input wire  s_axi_awvalid,
    output wire  s_axi_awready,
    input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
    input wire  s_axi_wvalid,
    output wire  s_axi_wready,
    output wire [1 : 0] s_axi_bresp,
    output wire  s_axi_bvalid,
    input wire  s_axi_bready,
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
    input wire [2 : 0] s_axi_arprot,
    input wire  s_axi_arvalid,
    output wire  s_axi_arready,
    output wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
    output wire [1 : 0] s_axi_rresp,
    output wire  s_axi_rvalid,
    input wire  s_axi_rready
);

    // Instantiation of Axi Bus Interface S_AXI
    wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg7;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg8;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg9;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg10;
	
    wire enable;
    wire start;
    reg  done;
    wire int_en;
	
    MQFU_AXI4_Lite_IP_v1_0_S_AXI # ( 
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
    ) MQFU_AXI4_Lite_IP_v1_0_S_AXI_inst (
        .S_AXI_ACLK(s_axi_aclk),
        .S_AXI_ARESETN(s_axi_aresetn),
        .S_AXI_AWADDR(s_axi_awaddr),
        .S_AXI_AWPROT(s_axi_awprot),
        .S_AXI_AWVALID(s_axi_awvalid),
        .S_AXI_AWREADY(s_axi_awready),
        .S_AXI_WDATA(s_axi_wdata),
        .S_AXI_WSTRB(s_axi_wstrb),
        .S_AXI_WVALID(s_axi_wvalid),
        .S_AXI_WREADY(s_axi_wready),
        .S_AXI_BRESP(s_axi_bresp),
        .S_AXI_BVALID(s_axi_bvalid),
        .S_AXI_BREADY(s_axi_bready),
        .S_AXI_ARADDR(s_axi_araddr),
        .S_AXI_ARPROT(s_axi_arprot),
        .S_AXI_ARVALID(s_axi_arvalid),
        .S_AXI_ARREADY(s_axi_arready),
        .S_AXI_RDATA(s_axi_rdata),
        .S_AXI_RRESP(s_axi_rresp),
        .S_AXI_RVALID(s_axi_rvalid),
        .S_AXI_RREADY(s_axi_rready),
        .slv_reg0_o(slv_reg0),
        .slv_reg1_o(slv_reg1),
        .slv_reg2_o(slv_reg2),
        .slv_reg3_o(slv_reg3),
        .slv_reg4_o(slv_reg4),
        .slv_reg5_o(slv_reg5),
        .slv_reg6_o(slv_reg6),
        .slv_reg7_o(slv_reg7),
        .slv_reg8_o(slv_reg8),
        .slv_reg9_o(slv_reg9),
        .slv_reg10_o(slv_reg10),
        .enable(enable),
        .start(start),
        .done(done),
        .int_en(int_en)
    );

	// Add user logic here
	
	wire [7:0] ctrl;    
    assign ctrl = slv_reg0[7:0];
    
    wire [`ACC_WIDTH-1:0] a_x, a_y, a_z;
    wire [`GYRO_WIDTH-1:0] w_x, w_y, w_z;
    reg  [`Q_WIDTH-1:0] q_w, q_x, q_y, q_z;
    
    assign slv_reg7 = q_w;
    assign slv_reg8 = q_x;
    assign slv_reg9 = q_y;
    assign slv_reg10 = q_z;

    generate  
        if (`PROC_SENS_DATA) begin
            reg signed [15:0] a_x_sens, a_y_sens, a_z_sens;
            reg signed [15:0] w_x_sens, w_y_sens, w_z_sens;
        
            MPU6050 imu (
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
                .w_z(w_z)
            );
        end else begin
            assign a_x = slv_reg1;
            assign a_y = slv_reg2;
            assign a_z = slv_reg3;
            assign w_x = slv_reg4;
            assign w_y = slv_reg5;
            assign w_z = slv_reg6;
        end
    endgenerate
    
    reg rst_n_madgwick;
    reg valid_in_madgwick;
    wire ready_in_madgwick;
    wire valid_out_madgwick;
    reg ready_out_madgwick;
    
    madgwick madgwick_inst (
        .clk(clk),
        .rst_n(rst_n_madgwick),
        .valid_in(valid_in_madgwick),
        .ready_in(ready_in_madgwick),
        .a_x(a_x),
        .a_y(a_y),
        .a_z(a_z),
        .w_x(w_x),
        .w_y(w_y),
        .w_z(w_z),
        .valid_out(valid_out_madgwick),
        .ready_out(ready_out_madgwick),
        .q_w_norm_output(q_w),
        .q_x_norm_output(q_x),
        .q_y_norm_output(q_y),
        .q_z_norm_output(q_z)
    );
    
    // ---- Madgwick control path - Start ----
    
    reg start;
    reg done;
    
    localparam IDLE            = 3'b000;
    localparam PROC_SENS_DATA  = 3'b001;
    localparam START           = 3'b010;
    localparam WAIT_FOR_RESULT = 3'b011;
    localparam DONE            = 3'b100;

    reg [2:0] state, next_state;
    
    always @(posedge clk) begin
        if (!s_axi_aresetn) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end
    
    always @ (*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (start) begin
                    if (`PROC_SENS_DATA) begin
                        next_state = PROC_SENS_DATA;
                    end else begin
                        next_state = START;
                    end
                end
            end
            PROC_SENS_DATA: begin
                next_state = START;
            end
            START: begin
                if (valid_in_madgwick && ready_in_madgwick) next_state = WAIT_FOR_RESULT;
            end
            WAIT_FOR_RESULT: begin
                if (valid_out_madgwick && ready_out_madgwick) next_state = DONE;
            end
            DONE: begin
                if (done && !start) next_state = IDLE;
            end
        endcase
    end
    
    always @ (posedge clk) begin
        if (!s_axi_aresetn || !enable) begin
            done <= 1'b0;   // Reset control signals
        
            rst_n_madgwick <= 'b0;  // Reset madgwick module
            valid_in_madgwick <= 'b0;
            ready_out_madgwick <= 'b0;
        end else begin
            rst_n_madgwick <= 'b1;  // De-assert madgwick rst_n flag
        
            case (state)
                IDLE: begin
                    done <= 1'b0;
                end
                START: begin
                    valid_in_madgwick <= 1'b1;
                end
                WAIT_FOR_RESULT: begin
                    valid_in_madgwick <= 1'b0;
                    ready_out_madgwick <= 1'b1;
                end
                DONE: begin
                    ready_out_madgwick <= 1'b0;
                    done <= 1'b1;
                end
            endcase
        end
    end
    
    // ---- Madgwick control path - End ----
    
    // ---- Interrupt signal driver - Start ----
    
    reg int_enable;    
    reg done_delay;
    reg int_pulse;
    
    always @ (posedge clk) begin
        if (!s_axi_aresetn) begin
            done_delay <= 0;
            int_pulse <= 0;
        end else begin
            done_delay <= done;
            int_pulse <= done & ~done_delay;
        end
    end
    
    always @ (posedge clk) begin
        if (!s_axi_aresetn) begin
            inta_o <= 0;
        end else if (int_enable & int_pulse) begin
            inta_o <= 1'b1;
        end else begin
            inta_o <= 1'b0;
        end
    end
    
    // ---- Interrupt signal driver - End ----
    
	// User logic ends
	
endmodule
