# Creating SmartDesign "top"
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK50MHZ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_N_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P_0_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RXD_P_0} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL0_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL1_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL2_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LSUC_SERIAL3_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USR_RESET} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLVS_EC_RSTN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLVS_EC_XCE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLVS_EC_XMASTER} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {LED} -port_direction {OUT} -port_range {[3:0]}


sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLVS_EC_XCE} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLVS_EC_XMASTER} -value {GND}
# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add bayer_rgb_gain_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {bayer_rgb_gain} -hdl_file {hdl\bayer_rgb_gain.v} -instance_name {bayer_rgb_gain_0}



# Add CORERESET_PF_C1_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C1} -instance_name {CORERESET_PF_C1_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:PLL_LOCK} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_2:PLL_POWERDOWN_B}



# Add CXP_DEVICE_TOP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CXP_DEVICE_TOP} -instance_name {CXP_DEVICE_TOP_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CXP_DEVICE_TOP_0:PLL_LOCK_0}



# Add IMX_TOP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IMX_TOP} -instance_name {IMX_TOP_0}



# Add PF_DRI_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DRI_C0} -instance_name {PF_DRI_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:PINTERRUPT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:PTIMEOUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:BUSERROR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_DRI_C0_0:PSTRB} -value {VCC}



# Add PF_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_INIT_MONITOR_C0} -instance_name {PF_INIT_MONITOR_C0_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {PF_INIT_MONITOR_C0_0} -pin_names {"SRAM_INIT_DONE" "PCIE_INIT_DONE" "USRAM_INIT_DONE" "SRAM_INIT_FROM_SPI_DONE" "USRAM_INIT_FROM_SNVM_DONE" "USRAM_INIT_FROM_UPROM_DONE" "USRAM_INIT_FROM_SPI_DONE" "SRAM_INIT_FROM_SNVM_DONE" "SRAM_INIT_FROM_UPROM_DONE" "XCVR_INIT_DONE" "AUTOCALIB_DONE" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:AUTOCALIB_DONE}



# Add PROC_SS_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PROC_SS} -instance_name {PROC_SS_0}



# Add slvs_frame_end_gen_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {slvs_frame_end_gen} -hdl_file {hdl\slvs_frame_end_gen.v} -instance_name {slvs_frame_end_gen_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {slvs_frame_end_gen_0:hres_i} -value {0001010011000000}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {slvs_frame_end_gen_0:vres_i} -value {0001001000111111}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "CORERESET_PF_C1_2:FABRIC_RESET_N" "PF_DRI_C0_0:PRESETN" "PROC_SS_0:RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "PROC_SS_0:CXP_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "CXP_DEVICE_TOP_0:RSTN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_SCL" "PROC_SS_0:CAM1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_SDA" "PROC_SS_0:CAM1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK50MHZ" "CORERESET_PF_C1_2:CLK" "CXP_DEVICE_TOP_0:CLK50MHZ" "PF_DRI_C0_0:PCLK" "PROC_SS_0:PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_2:EXT_RST_N" "USR_RESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_2:FPGA_POR_N" "CXP_DEVICE_TOP_0:FPGA_POR_N" "PF_INIT_MONITOR_C0_0:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_2:INIT_DONE" "CXP_DEVICE_TOP_0:INIT_DONE" "IMX_TOP_0:ARST_N" "PF_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:FRAME_START_I" "bayer_rgb_gain_0:frame_start_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:INT_O" "PROC_SS_0:CXP_DEV_INT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RXD_N" "LANE0_RXD_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RXD_N_0" "LANE0_RXD_N_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RXD_P" "LANE0_RXD_P_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RXD_P_0" "LANE0_RXD_P_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_CLK_R" "IMX_TOP_0:LANE0_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_CLK_R_0" "IMX_TOP_0:LANE4_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_READY" "IMX_TOP_0:LANE0_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_READY_0" "IMX_TOP_0:LANE4_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_VAL" "IMX_TOP_0:LANE0_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_VAL_0" "IMX_TOP_0:LANE4_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_TXD_N" "LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_TXD_P" "LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RXD_N" "LANE1_RXD_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RXD_N_0" "LANE1_RXD_N_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RXD_P" "LANE1_RXD_P_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RXD_P_0" "LANE1_RXD_P_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_CLK_R" "IMX_TOP_0:LANE1_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_CLK_R_0" "IMX_TOP_0:LANE5_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_READY" "IMX_TOP_0:LANE1_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_READY_0" "IMX_TOP_0:LANE5_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_VAL" "IMX_TOP_0:LANE1_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_VAL_0" "IMX_TOP_0:LANE5_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_TXD_N" "LANE1_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_TXD_P" "LANE1_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RXD_N" "LANE2_RXD_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RXD_N_0" "LANE2_RXD_N_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RXD_P" "LANE2_RXD_P_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RXD_P_0" "LANE2_RXD_P_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_CLK_R" "IMX_TOP_0:LANE2_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_CLK_R_0" "IMX_TOP_0:LANE6_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_READY" "IMX_TOP_0:LANE2_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_READY_0" "IMX_TOP_0:LANE6_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_VAL" "IMX_TOP_0:LANE2_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_VAL_0" "IMX_TOP_0:LANE6_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_TXD_N" "LANE2_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_TXD_P" "LANE2_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RXD_N" "LANE3_RXD_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RXD_N_0" "LANE3_RXD_N_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RXD_P" "LANE3_RXD_P_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RXD_P_0" "LANE3_RXD_P_0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_CLK_R" "IMX_TOP_0:LANE3_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_CLK_R_0" "IMX_TOP_0:LANE7_RX_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_READY" "IMX_TOP_0:LANE3_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_READY_0" "IMX_TOP_0:LANE7_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_VAL" "IMX_TOP_0:LANE3_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_VAL_0" "IMX_TOP_0:LANE7_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_TXD_N" "LANE3_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_TXD_P" "LANE3_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LINE_DVAL_I" "bayer_rgb_gain_0:line_valid_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LSUC_SERIAL0_DATA_I" "LSUC_SERIAL0_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LSUC_SERIAL1_DATA_I" "LSUC_SERIAL1_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LSUC_SERIAL2_DATA_I" "LSUC_SERIAL2_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LSUC_SERIAL3_DATA_I" "LSUC_SERIAL3_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:OUT0_FABCLK_0" "PROC_SS_0:S_CLK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:PIX_CLK_I" "IMX_TOP_0:OUT0_FABCLK_0" "bayer_rgb_gain_0:clk" "slvs_frame_end_gen_0:clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:PIX_RSTN_I" "IMX_TOP_0:FABRIC_RESET_N" "bayer_rgb_gain_0:rst_n" "slvs_frame_end_gen_0:resetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:XCVR_RXREADY" "IMX_TOP_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX_TOP_0:FRAME_VALID_O" "slvs_frame_end_gen_0:frame_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX_TOP_0:LINE_VALID_O" "slvs_frame_end_gen_0:line_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:CAM1_RST" "SLVS_EC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:rgb_gain_en_o" "bayer_rgb_gain_0:enable" "bayer_rgb_gain_0:gamma_enable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"bayer_rgb_gain_0:frame_start" "slvs_frame_end_gen_0:frame_end_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"bayer_rgb_gain_0:line_valid" "slvs_frame_end_gen_0:line_valid_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_DATA" "IMX_TOP_0:L0_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_RX_DATA_0" "IMX_TOP_0:L4_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_DATA" "IMX_TOP_0:L1_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_RX_DATA_0" "IMX_TOP_0:L5_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_DATA" "IMX_TOP_0:L2_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_RX_DATA_0" "IMX_TOP_0:L6_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_DATA" "IMX_TOP_0:L3_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_RX_DATA_0" "IMX_TOP_0:L7_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LINE_DATA_I" "bayer_rgb_gain_0:data_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX_TOP_0:DATA_OUT_O" "bayer_rgb_gain_0:data_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED" "PROC_SS_0:GPIO_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:bgain_o" "bayer_rgb_gain_0:gain_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:ggain_o" "bayer_rgb_gain_0:gain_g" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SS_0:rgain_o" "bayer_rgb_gain_0:gain_r" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:AXI4Lite_Target_IF" "PROC_SS_0:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE0_DRI_SLAVE" "PF_DRI_C0_0:Q0_LANE0_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE1_DRI_SLAVE" "PF_DRI_C0_0:Q0_LANE1_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE2_DRI_SLAVE" "PF_DRI_C0_0:Q0_LANE2_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:LANE3_DRI_SLAVE" "PF_DRI_C0_0:Q0_LANE3_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEVICE_TOP_0:TxPLL_DRI" "PF_DRI_C0_0:Q0_TXPLL_SSC_DRI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DRI_C0_0:APBS" "PROC_SS_0:APB_INITIATOR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "top"
generate_component -component_name ${sd_name}
