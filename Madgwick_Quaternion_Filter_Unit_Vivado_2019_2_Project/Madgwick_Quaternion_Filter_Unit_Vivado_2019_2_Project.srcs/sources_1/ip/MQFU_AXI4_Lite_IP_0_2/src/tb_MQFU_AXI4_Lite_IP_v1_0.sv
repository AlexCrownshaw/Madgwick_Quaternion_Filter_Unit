`timescale 1ns / 1ps

module tb_MQFU_AXI4_Lite_IP_v1_0;
    import axi_vip_pkg::*;
    import axi4_lite_m_vip_0_axi_vip_mst_0_pkg::*;

    // Clock and reset
    reg aclk;
    reg aresetn;

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
    wire inta;

    // AXI VIP master agent
    ex_sim_axi_vip_mst_0_mst_t agent;

    // Instantiate DUT
    MQFU_AXI4_Lite_IP_v1_0 #(
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

    // Test sequence
    initial begin
        // Initialize clock and reset
        aclk = 0;
        aresetn = 0;
        #20;
        aresetn = 1;

        // Create the AXI VIP agent
        agent = new("master vip agent", axi_vip.inst.IF);
        agent.start_master();

        // Perform a single write transaction
        single_write_transaction_api(
            "single_write",
            .id(0),               // ID for the transaction
            .addr(32'h00000004),  // Write address
            .len(0),              // Burst length (0 for AXI4-Lite)
            .size(3),             // Data size (3 -> 32 bits)
            .burst(XIL_AXI_BURST_TYPE_INCR), // Burst type (incremental)
            .data(64'hDEADBEEF)   // Write data
        );

        // Perform a single read transaction
        single_read_transaction_api(
            "single_read",
            .id(0),               // ID for the transaction
            .addr(32'h00000004),  // Read address
            .len(0),              // Burst length (0 for AXI4-Lite)
            .size(3),             // Data size (3 -> 32 bits)
            .burst(XIL_AXI_BURST_TYPE_INCR) // Burst type (incremental)
        );

        agent.wait_drivers_idle(); // Wait for the driver to finish

        // End simulation
        $finish;
    end

    // Task: Single Write Transaction
    task automatic single_write_transaction_api ( 
        input string                     name,
        input xil_axi_uint               id, 
        input xil_axi_ulong              addr,
        input xil_axi_len_t              len, 
        input xil_axi_size_t             size,
        input xil_axi_burst_t            burst,
        input bit [63:0]                 data
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
