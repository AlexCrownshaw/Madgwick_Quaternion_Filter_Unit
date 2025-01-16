`timescale 1ns / 1ps

`include "madgwickDefines.vh"
`include "test_vectors.svh"


`define CTRL_REG_ADDR 32'h0
`define AX_REG_ADDR 32'h4
`define AY_REG_ADDR 32'hC
`define AZ_REG_ADDR 32'h10
`define WX_REG_ADDR 32'h14
`define WY_REG_ADDR 32'h18
`define WZ_REG_ADDR 32'h1C
`define QW_REG_ADDR 32'h20
`define QX_REG_ADDR 32'h24
`define QY_REG_ADDR 32'h28
`define QZ_REG_ADDR 32'h2C


module tb_MQFU_AXI4_Lite_IP_v1_0;

    import axi_vip_pkg::*;
    import axi4_lite_m_vip_0_pkg::*;

    // Clock and reset
    reg aclk;
    reg aresetn;
    
    // Attitude Quaternion outputs
    reg [`Q_WIDTH-1:0] q_w, q_x, q_y, q_z;

    // AXI VIP signals
    wire [31:0] m_axi_awaddr;
    wire [2:0]  m_axi_awprot;
    wire        m_axi_awvalid;
    wire        m_axi_awready;
    wire [31:0] m_axi_wdata;
    wire [3:0]  m_axi_wstrb;
    wire        m_axi_wvalid;
    wire        m_axi_wready;
    wire [1:0]  m_axi_bresp;
    wire        m_axi_bvalid;
    wire        m_axi_bready;
    wire [31:0] m_axi_araddr;
    wire [2:0]  m_axi_arprot;
    wire        m_axi_arvalid;
    wire        m_axi_arready;
    wire [31:0] m_axi_rdata;
    wire [1:0]  m_axi_rresp;
    wire        m_axi_rvalid;
    wire        m_axi_rready;

    // Interrupt signal
    reg done;
    wire inta;

    // AXI VIP master agent
    axi4_lite_m_vip_0_mst_t agent;

    // Instantiate DUT
    MQFU_AXI4_Lite_IP #(
        .C_S_AXI_DATA_WIDTH(32),
        .C_S_AXI_ADDR_WIDTH(6)
    ) dut (
        .s_axi_aclk(aclk),
        .s_axi_aresetn(aresetn),
        .s_axi_awaddr(m_axi_awaddr[5:0]),
        .s_axi_awprot(m_axi_awprot),
        .s_axi_awvalid(m_axi_awvalid),
        .s_axi_awready(m_axi_awready),
        .s_axi_wdata(m_axi_wdata),
        .s_axi_wstrb(m_axi_wstrb),
        .s_axi_wvalid(m_axi_wvalid),
        .s_axi_wready(m_axi_wready),
        .s_axi_bresp(m_axi_bresp),
        .s_axi_bvalid(m_axi_bvalid),
        .s_axi_bready(m_axi_bready),
        .s_axi_araddr(m_axi_araddr[5:0]),
        .s_axi_arprot(m_axi_arprot),
        .s_axi_arvalid(m_axi_arvalid),
        .s_axi_arready(m_axi_arready),
        .s_axi_rdata(m_axi_rdata),
        .s_axi_rresp(m_axi_rresp),
        .s_axi_rvalid(m_axi_rvalid),
        .s_axi_rready(m_axi_rready),
        .inta_o(inta)
    );

    // Instantiate AXI-Lite Master VIP
    axi4_lite_m_vip_0 axi_vip (
        .aclk(aclk),
        .aresetn(aresetn),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awready(m_axi_awready),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wvalid(m_axi_wvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_arready(m_axi_arready),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_rready(m_axi_rready)
    );

    // Clock generation
    always #5 aclk = ~aclk; // 100 MHz clock
    
    integer i;

    // Test sequence
    initial begin
        // Initialize clock and reset
        aclk = 0;
        aresetn = 0;
        done <= 0;
        #20;
        aresetn = 1;

        // Create the AXI VIP agent
        agent = new("master vip agent", axi_vip.inst.IF);
        agent.start_master();

        // Enable MQFU and inta
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`CTRL_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(32'h9)
        );
        
        for (i = 0; i < `NUM_ELEMENTS; i = i + 1) begin
            @ (posedge aclk);
            
            write_inputs(
                AX_TEST_VECTOR[i],
                AY_TEST_VECTOR[i],
                AZ_TEST_VECTOR[i],
                WX_TEST_VECTOR[i],
                WY_TEST_VECTOR[i],
                WZ_TEST_VECTOR[i]
                );
            @ (posedge aclk);
            
            set_start();
            @ (posedge aclk);
            
            while(!done) begin
                @ (posedge aclk);
                read_done();
            end
            
            @ (posedge aclk);
            read_outputs();
            
            @ (posedge aclk);
            clear_start();
            done <= 0;
        end
        
        agent.wait_drivers_idle(); // Wait for the driver to finish

        // End simulation
        $finish;
    end
    
    task set_start;
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`CTRL_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(32'hB)
        );
        
        agent.wait_drivers_idle();
    endtask
    
    task clear_start;
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`CTRL_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(32'h9)
        );
        
        agent.wait_drivers_idle();
    endtask
    
    task read_done;
        single_read_transaction_api(
            "single_read",
            .id(0),              
            .addr(`CTRL_REG_ADDR),
            .len(0),           
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR)
        );
        
        wait(m_axi_rvalid && m_axi_rready);
        done <= m_axi_rdata[2]; 
        
        agent.wait_drivers_idle();
    endtask
    
    task write_inputs(
        input signed [`ACC_WIDTH-1:0] a_x,
        input signed [`ACC_WIDTH-1:0] a_y,
        input signed [`ACC_WIDTH-1:0] a_z,
        input signed [`ACC_WIDTH-1:0] w_x,
        input signed [`ACC_WIDTH-1:0] w_y,
        input signed [`ACC_WIDTH-1:0] w_z
    );
        
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`AX_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(a_x)
        );
        
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`AY_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(a_y)
        );
        
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`AZ_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(a_z)
        );
        
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`WX_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(w_x)
        );
        
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`WY_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(w_y)
        );
        
        single_write_transaction_api(
            "single_write",
            .id(0),               
            .addr(`WZ_REG_ADDR), 
            .len(0),             
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR),
            .data(w_z)
        );
        
        agent.wait_drivers_idle();
        
    endtask
    
    task read_outputs;
        
        single_read_transaction_api(
            "single_read",
            .id(0),              
            .addr(`QW_REG_ADDR),
            .len(0),           
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR)
        );
        
        agent.wait_drivers_idle();        
        
        single_read_transaction_api(
            "single_read",
            .id(0),              
            .addr(`QX_REG_ADDR),
            .len(0),           
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR)
        );
        
        agent.wait_drivers_idle();
        
        single_read_transaction_api(
            "single_read",
            .id(0),              
            .addr(`QY_REG_ADDR),
            .len(0),           
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR)
        );
        
        agent.wait_drivers_idle();        
        
        single_read_transaction_api(
            "single_read",
            .id(0),              
            .addr(`QZ_REG_ADDR),
            .len(0),           
            .size(xil_axi_size_t'(xil_clog2(32/8))),
            .burst(XIL_AXI_BURST_TYPE_INCR)
        );
        
        agent.wait_drivers_idle();
        
    endtask

    // Task: Single Write Transaction
    task automatic single_write_transaction_api ( 
        input string                     name,
        input xil_axi_uint               id, 
        input xil_axi_ulong              addr,
        input xil_axi_len_t              len, 
        input xil_axi_size_t             size,
        input xil_axi_burst_t            burst,
        input bit [32:0]                 data
    );
    
        axi_transaction wr_trans;
        wr_trans = agent.wr_driver.create_transaction(name);
        wr_trans.set_write_cmd(addr, burst, id, len, size);
        wr_trans.set_data_block(data);
        agent.wr_driver.send(wr_trans);   
        
    endtask

    // Task: Single Read Transaction
    task automatic single_read_transaction_api ( 
        input string                     name,
        input xil_axi_uint               id, 
        input xil_axi_ulong              addr,
        input xil_axi_len_t              len, 
        input xil_axi_size_t             size,
        input xil_axi_burst_t            burst
    );
    
        axi_transaction rd_trans;
        rd_trans = agent.rd_driver.create_transaction(name);
        rd_trans.set_read_cmd(addr, burst, id, len, size);
        agent.rd_driver.send(rd_trans);   
        
    endtask

endmodule
