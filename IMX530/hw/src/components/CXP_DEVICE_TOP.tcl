# Creating SmartDesign "CXP_DEVICE_TOP"
set sd_name {CXP_DEVICE_TOP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_ARVALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_AWVALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_BREADY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_RREADY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_WVALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK50MHZ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL0_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL1_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL2_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL3_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PIX_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PIX_RSTN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RSTN_I} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_ARREADY_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_AWREADY_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_BVALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_RVALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_WREADY_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INT_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_CLK_R_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_CLK_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_READY_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_READY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_VAL_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_VAL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_CLK_R_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_CLK_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_READY_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_READY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_VAL_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_VAL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_CLK_R_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_CLK_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_READY_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_READY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_VAL_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_VAL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_INTERRUPT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_CLK_R_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_CLK_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_READY_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_READY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_VAL_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_VAL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {OUT0_FABCLK_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_RXREADY} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_ARADDR_I} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_AWADDR_I} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_WDATA_I} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FRAME_START_I} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_CTRL} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_WDATA} -port_direction {IN} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LINE_DATA_I} -port_direction {IN} -port_range {[255:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LINE_DVAL_I} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_BRESP_O} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_RDATA_O} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF_RRESP_O} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_RX_DATA_0} -port_direction {OUT} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE0_RX_DATA} -port_direction {OUT} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE_LANE1_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_RX_DATA_0} -port_direction {OUT} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE1_RX_DATA} -port_direction {OUT} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE_LANE2_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_RX_DATA_0} -port_direction {OUT} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE2_RX_DATA} -port_direction {OUT} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE_LANE3_DRI_RDATA} -port_direction {OUT} -port_range {[32:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_RX_DATA_0} -port_direction {OUT} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LANE3_RX_DATA} -port_direction {OUT} -port_range {[39:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {TxPLL_DRI} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:DRI_CLK" \
"DRI_ARST_N:DRI_ARST_N" \
"DRI_CTRL:DRI_CTRL" \
"DRI_RDATA:DRI_RDATA" \
"DRI_WDATA:DRI_WDATA" \
"DRI_INTERRUPT:DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4Lite_Target_IF} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4Lite_Target_IF_AWADDR_I" \
"AWVALID:AXI4Lite_Target_IF_AWVALID_I" \
"AWREADY:AXI4Lite_Target_IF_AWREADY_O" \
"WDATA:AXI4Lite_Target_IF_WDATA_I" \
"WVALID:AXI4Lite_Target_IF_WVALID_I" \
"WREADY:AXI4Lite_Target_IF_WREADY_O" \
"BRESP:AXI4Lite_Target_IF_BRESP_O" \
"BVALID:AXI4Lite_Target_IF_BVALID_O" \
"BREADY:AXI4Lite_Target_IF_BREADY_I" \
"ARADDR:AXI4Lite_Target_IF_ARADDR_I" \
"ARVALID:AXI4Lite_Target_IF_ARVALID_I" \
"ARREADY:AXI4Lite_Target_IF_ARREADY_O" \
"RDATA:AXI4Lite_Target_IF_RDATA_O" \
"RRESP:AXI4Lite_Target_IF_RRESP_O" \
"RVALID:AXI4Lite_Target_IF_RVALID_O" \
"RREADY:AXI4Lite_Target_IF_RREADY_I" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {LANE0_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE0_DRI_CLK" \
"DRI_ARST_N:LANE0_DRI_ARST_N" \
"DRI_CTRL:LANE0_DRI_CTRL" \
"DRI_RDATA:LANE0_DRI_RDATA" \
"DRI_WDATA:LANE0_DRI_WDATA" \
"DRI_INTERRUPT:LANE0_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {LANE1_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE1_DRI_SLAVE_LANE1_DRI_CLK" \
"DRI_ARST_N:LANE1_DRI_SLAVE_LANE1_DRI_ARST_N" \
"DRI_CTRL:LANE1_DRI_SLAVE_LANE1_DRI_CTRL" \
"DRI_RDATA:LANE1_DRI_SLAVE_LANE1_DRI_RDATA" \
"DRI_WDATA:LANE1_DRI_SLAVE_LANE1_DRI_WDATA" \
"DRI_INTERRUPT:LANE1_DRI_SLAVE_LANE1_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {LANE2_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE2_DRI_SLAVE_LANE2_DRI_CLK" \
"DRI_ARST_N:LANE2_DRI_SLAVE_LANE2_DRI_ARST_N" \
"DRI_CTRL:LANE2_DRI_SLAVE_LANE2_DRI_CTRL" \
"DRI_RDATA:LANE2_DRI_SLAVE_LANE2_DRI_RDATA" \
"DRI_WDATA:LANE2_DRI_SLAVE_LANE2_DRI_WDATA" \
"DRI_INTERRUPT:LANE2_DRI_SLAVE_LANE2_DRI_INTERRUPT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {LANE3_DRI_SLAVE} -port_bif_vlnv {Actel:busdef.dri:PF_DRI:1.0} -port_bif_role {slave} -port_bif_mapping {\
"DRI_CLK:LANE3_DRI_SLAVE_LANE3_DRI_CLK" \
"DRI_ARST_N:LANE3_DRI_SLAVE_LANE3_DRI_ARST_N" \
"DRI_CTRL:LANE3_DRI_SLAVE_LANE3_DRI_CTRL" \
"DRI_RDATA:LANE3_DRI_SLAVE_LANE3_DRI_RDATA" \
"DRI_WDATA:LANE3_DRI_SLAVE_LANE3_DRI_WDATA" \
"DRI_INTERRUPT:LANE3_DRI_SLAVE_LANE3_DRI_INTERRUPT" } 

# Add AND4_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_0}



# Add AND4_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_1}



# Add AND4_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_2}



# Add AND4_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_3}



# Add AND4_4 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_4}



# Add CoaXpress_TOP_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoaXpress_TOP_C0} -instance_name {CoaXpress_TOP_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoaXpress_TOP_C0_0:HSDC0_REQ_TX_R_TRIGGER_I} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoaXpress_TOP_C0_0:HSDC0_REQ_TX_F_TRIGGER_I} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoaXpress_TOP_C0_0:HSDC0_TRIGGER_SRC_I} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoaXpress_TOP_C0_0:LSUC0_RX_F_TRIGGER_IND_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoaXpress_TOP_C0_0:LSUC0_RX_R_TRIGGER_IND_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoaXpress_TOP_C0_0:LSUC0_RX_F_TRIGGER_DELAY_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoaXpress_TOP_C0_0:LSUC0_RX_R_TRIGGER_DELAY_O}



# Add CorePCS_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C1} -instance_name {CorePCS_C1_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_0:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_0:EPCS_PWRDN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_0:EPCS_TXOOB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_0:EPCS_TxVAL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_0:INVALID_K}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_0:FORCE_DISP} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_0:DISP_SEL} -value {GND}



# Add CorePCS_C1_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C1} -instance_name {CorePCS_C1_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_1:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_1:EPCS_PWRDN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_1:EPCS_TXOOB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_1:EPCS_TxVAL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_1:INVALID_K}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_1:FORCE_DISP} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_1:DISP_SEL} -value {GND}



# Add CorePCS_C1_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C1} -instance_name {CorePCS_C1_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_2:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_2:EPCS_PWRDN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_2:EPCS_TXOOB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_2:EPCS_TxVAL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_2:INVALID_K}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_2:FORCE_DISP} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_2:DISP_SEL} -value {GND}



# Add CorePCS_C1_3 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C1} -instance_name {CorePCS_C1_3}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_3:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_3:EPCS_PWRDN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_3:EPCS_TXOOB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_3:EPCS_TxVAL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C1_3:INVALID_K}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_3:FORCE_DISP} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C1_3:DISP_SEL} -value {GND}



# Add CORERESET_PF_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C1} -instance_name {CORERESET_PF_C1_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:PLL_POWERDOWN_B}



# Add CORERESET_PF_C1_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C1} -instance_name {CORERESET_PF_C1_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_1:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_1:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_1:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_1:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_1:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_1:PLL_POWERDOWN_B}



# Add CORERESET_PF_C1_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C1} -instance_name {CORERESET_PF_C1_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:PLL_POWERDOWN_B}



# Add CORERESET_PF_C1_3 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C1} -instance_name {CORERESET_PF_C1_3}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_3:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_3:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_3:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_3:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_3:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_3:PLL_POWERDOWN_B}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_TX_PLL_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C0} -instance_name {PF_TX_PLL_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_TX_PLL_C0_0:PLL_LOCK}



# Add PF_XCVR_ERM_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_ERM_C0} -instance_name {PF_XCVR_ERM_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE1_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE1_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE2_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE2_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE3_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE3_RX_BYPASS_DATA}



# Add PF_XCVR_ERM_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_ERM_C1} -instance_name {PF_XCVR_ERM_C1_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE0_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE0_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE1_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE1_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE2_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE2_RX_BYPASS_DATA}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_IDLE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C1_0:LANE3_RX_BYPASS_DATA}



# Add PF_XCVR_REF_CLK_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C0} -instance_name {PF_XCVR_REF_CLK_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:A" "LANE0_RX_READY" "PF_XCVR_ERM_C0_0:LANE0_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:B" "LANE1_RX_READY" "PF_XCVR_ERM_C0_0:LANE1_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:C" "LANE2_RX_READY" "PF_XCVR_ERM_C0_0:LANE2_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:D" "LANE3_RX_READY" "PF_XCVR_ERM_C0_0:LANE3_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:Y" "AND4_3:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_1:A" "LANE0_RX_VAL" "PF_XCVR_ERM_C0_0:LANE0_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_1:B" "LANE1_RX_VAL" "PF_XCVR_ERM_C0_0:LANE1_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_1:C" "LANE2_RX_VAL" "PF_XCVR_ERM_C0_0:LANE2_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_1:D" "LANE3_RX_VAL" "PF_XCVR_ERM_C0_0:LANE3_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_1:Y" "AND4_3:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_2:A" "LANE0_RX_READY_0" "PF_XCVR_ERM_C1_0:LANE0_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_2:B" "LANE1_RX_READY_0" "PF_XCVR_ERM_C1_0:LANE1_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_2:C" "LANE2_RX_READY_0" "PF_XCVR_ERM_C1_0:LANE2_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_2:D" "LANE3_RX_READY_0" "PF_XCVR_ERM_C1_0:LANE3_RX_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_2:Y" "AND4_3:C" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_3:D" "AND4_4:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_3:Y" "XCVR_RXREADY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_4:A" "LANE0_RX_VAL_0" "PF_XCVR_ERM_C1_0:LANE0_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_4:B" "LANE1_RX_VAL_0" "PF_XCVR_ERM_C1_0:LANE1_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_4:C" "LANE2_RX_VAL_0" "PF_XCVR_ERM_C1_0:LANE2_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_4:D" "LANE3_RX_VAL_0" "PF_XCVR_ERM_C1_0:LANE3_RX_VAL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK50MHZ" "PF_CCC_C0_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:CLK" "CoaXpress_TOP_C0_0:TX0_CLK_I" "CorePCS_C1_0:EPCS_TxCLK" "PF_XCVR_ERM_C0_0:LANE0_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:FABRIC_RESET_N" "CoaXpress_TOP_C0_0:TX0_RSTN_I" "CorePCS_C1_0:EPCS_TxRSTn" "CorePCS_C1_0:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:FPGA_POR_N" "CORERESET_PF_C1_1:FPGA_POR_N" "CORERESET_PF_C1_2:FPGA_POR_N" "CORERESET_PF_C1_3:FPGA_POR_N" "FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:INIT_DONE" "CORERESET_PF_C1_1:INIT_DONE" "CORERESET_PF_C1_2:INIT_DONE" "CORERESET_PF_C1_3:INIT_DONE" "INIT_DONE" "PF_XCVR_ERM_C0_0:LANE0_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE0_PMA_ARST_N" "PF_XCVR_ERM_C0_0:LANE1_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE1_PMA_ARST_N" "PF_XCVR_ERM_C0_0:LANE2_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE2_PMA_ARST_N" "PF_XCVR_ERM_C0_0:LANE3_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE3_PMA_ARST_N" "PF_XCVR_ERM_C1_0:LANE0_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE0_PMA_ARST_N" "PF_XCVR_ERM_C1_0:LANE1_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE1_PMA_ARST_N" "PF_XCVR_ERM_C1_0:LANE2_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE2_PMA_ARST_N" "PF_XCVR_ERM_C1_0:LANE3_PCS_ARST_N" "PF_XCVR_ERM_C1_0:LANE3_PMA_ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:PLL_LOCK" "PF_XCVR_ERM_C0_0:LANE0_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_1:CLK" "CoaXpress_TOP_C0_0:TX1_CLK_I" "CorePCS_C1_1:EPCS_TxCLK" "PF_XCVR_ERM_C0_0:LANE1_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_1:FABRIC_RESET_N" "CoaXpress_TOP_C0_0:TX1_RSTN_I" "CorePCS_C1_1:EPCS_TxRSTn" "CorePCS_C1_1:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_1:PLL_LOCK" "PF_XCVR_ERM_C0_0:LANE1_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_2:CLK" "CoaXpress_TOP_C0_0:TX2_CLK_I" "CorePCS_C1_2:EPCS_TxCLK" "PF_XCVR_ERM_C0_0:LANE2_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_2:FABRIC_RESET_N" "CoaXpress_TOP_C0_0:TX2_RSTN_I" "CorePCS_C1_2:EPCS_TxRSTn" "CorePCS_C1_2:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_2:PLL_LOCK" "PF_XCVR_ERM_C0_0:LANE2_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_3:CLK" "CoaXpress_TOP_C0_0:TX3_CLK_I" "CorePCS_C1_3:EPCS_TxCLK" "PF_XCVR_ERM_C0_0:LANE3_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_3:FABRIC_RESET_N" "CoaXpress_TOP_C0_0:TX3_RSTN_I" "CorePCS_C1_3:EPCS_TxRSTn" "CorePCS_C1_3:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_3:PLL_LOCK" "PF_XCVR_ERM_C0_0:LANE3_TX_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:FRAME_START_I" "FRAME_START_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:INT_O" "INT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:LINE_DVAL_I" "LINE_DVAL_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:LSUC_CLK125_I" "OUT0_FABCLK_0" "PF_CCC_C0_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:LSUC_SERIAL0_DATA_I" "LSUC_SERIAL0_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:LSUC_SERIAL1_DATA_I" "LSUC_SERIAL1_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:LSUC_SERIAL2_DATA_I" "LSUC_SERIAL2_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:LSUC_SERIAL3_DATA_I" "LSUC_SERIAL3_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:OS_CLK250_I" "PF_CCC_C0_0:OUT1_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:PIX_CLK_I" "PIX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:PIX_RSTN_I" "PIX_RSTN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:RSTN_I" "RSTN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "PF_XCVR_ERM_C0_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N_0" "PF_XCVR_ERM_C1_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "PF_XCVR_ERM_C0_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P_0" "PF_XCVR_ERM_C1_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RX_CLK_R" "PF_XCVR_ERM_C0_0:LANE0_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RX_CLK_R_0" "PF_XCVR_ERM_C1_0:LANE0_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "PF_XCVR_ERM_C0_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "PF_XCVR_ERM_C0_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N" "PF_XCVR_ERM_C0_0:LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N_0" "PF_XCVR_ERM_C1_0:LANE1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P" "PF_XCVR_ERM_C0_0:LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P_0" "PF_XCVR_ERM_C1_0:LANE1_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RX_CLK_R" "PF_XCVR_ERM_C0_0:LANE1_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RX_CLK_R_0" "PF_XCVR_ERM_C1_0:LANE1_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_N" "PF_XCVR_ERM_C0_0:LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_P" "PF_XCVR_ERM_C0_0:LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_N" "PF_XCVR_ERM_C0_0:LANE2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_N_0" "PF_XCVR_ERM_C1_0:LANE2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_P" "PF_XCVR_ERM_C0_0:LANE2_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RXD_P_0" "PF_XCVR_ERM_C1_0:LANE2_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RX_CLK_R" "PF_XCVR_ERM_C0_0:LANE2_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RX_CLK_R_0" "PF_XCVR_ERM_C1_0:LANE2_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_N" "PF_XCVR_ERM_C0_0:LANE2_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_TXD_P" "PF_XCVR_ERM_C0_0:LANE2_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_N" "PF_XCVR_ERM_C0_0:LANE3_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_N_0" "PF_XCVR_ERM_C1_0:LANE3_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_P" "PF_XCVR_ERM_C0_0:LANE3_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RXD_P_0" "PF_XCVR_ERM_C1_0:LANE3_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RX_CLK_R" "PF_XCVR_ERM_C0_0:LANE3_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RX_CLK_R_0" "PF_XCVR_ERM_C1_0:LANE3_RX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_N" "PF_XCVR_ERM_C0_0:LANE3_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_TXD_P" "PF_XCVR_ERM_C0_0:LANE3_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:PLL_LOCK_0" "PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C0_0:REF_CLK" "PF_XCVR_REF_CLK_C0_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_ERM_C0_0:LANE0_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C0_0:LANE1_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C0_0:LANE2_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C0_0:LANE3_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C1_0:LANE0_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C1_0:LANE1_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C1_0:LANE2_CDR_REF_CLK_FAB" "PF_XCVR_ERM_C1_0:LANE3_CDR_REF_CLK_FAB" "PF_XCVR_REF_CLK_C0_0:FAB_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC0_TX_DATA_O" "CorePCS_C1_0:TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC0_TX_K_O" "CorePCS_C1_0:TX_K_CHAR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC1_TX_DATA_O" "CorePCS_C1_1:TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC1_TX_K_O" "CorePCS_C1_1:TX_K_CHAR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC2_TX_DATA_O" "CorePCS_C1_2:TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC2_TX_K_O" "CorePCS_C1_2:TX_K_CHAR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC3_TX_DATA_O" "CorePCS_C1_3:TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:HSDC3_TX_K_O" "CorePCS_C1_3:TX_K_CHAR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoaXpress_TOP_C0_0:LINE_DATA_I" "LINE_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C1_0:EPCS_TxDATA" "PF_XCVR_ERM_C0_0:LANE0_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C1_1:EPCS_TxDATA" "PF_XCVR_ERM_C0_0:LANE1_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C1_2:EPCS_TxDATA" "PF_XCVR_ERM_C0_0:LANE2_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C1_3:EPCS_TxDATA" "PF_XCVR_ERM_C0_0:LANE3_TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RX_DATA" "PF_XCVR_ERM_C0_0:LANE0_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RX_DATA_0" "PF_XCVR_ERM_C1_0:LANE0_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RX_DATA" "PF_XCVR_ERM_C0_0:LANE1_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RX_DATA_0" "PF_XCVR_ERM_C1_0:LANE1_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RX_DATA" "PF_XCVR_ERM_C0_0:LANE2_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RX_DATA_0" "PF_XCVR_ERM_C1_0:LANE2_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RX_DATA" "PF_XCVR_ERM_C0_0:LANE3_RX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RX_DATA_0" "PF_XCVR_ERM_C1_0:LANE3_RX_DATA" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4Lite_Target_IF" "CoaXpress_TOP_C0_0:AXI4Lite_Target_IF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_DRI_SLAVE" "PF_XCVR_ERM_C0_0:LANE0_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_DRI_SLAVE" "PF_XCVR_ERM_C0_0:LANE1_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_DRI_SLAVE" "PF_XCVR_ERM_C0_0:LANE2_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_DRI_SLAVE" "PF_XCVR_ERM_C0_0:LANE3_DRI_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C0_0:CLKS_TO_XCVR" "PF_XCVR_ERM_C0_0:CLKS_FROM_TXPLL_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C0_0:TxPLL_DRI" "TxPLL_DRI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "CXP_DEVICE_TOP"
generate_component -component_name ${sd_name}
