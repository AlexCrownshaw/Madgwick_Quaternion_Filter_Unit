// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jan  4 18:23:24 2025
// Host        : DESKTOP-U3T2UJ9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Dev/Madgwick_Quaternion_Filter_Unit/MQFU_MicroBlaze_SoC/MQFU_MicroBlaze_SoC.gen/sources_1/bd/MQFU_MicroBlaze/ip/MQFU_MicroBlaze_lmb_bram_0/MQFU_MicroBlaze_lmb_bram_0_sim_netlist.v
// Design      : MQFU_MicroBlaze_lmb_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MQFU_MicroBlaze_lmb_bram_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module MQFU_MicroBlaze_lmb_bram_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "MQFU_MicroBlaze_lmb_bram_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MQFU_MicroBlaze_lmb_bram_0_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59952)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
