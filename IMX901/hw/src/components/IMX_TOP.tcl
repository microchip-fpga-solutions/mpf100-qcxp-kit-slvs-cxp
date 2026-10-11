# Creating SmartDesign "IMX_TOP"
set sd_name {IMX_TOP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_READY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RX_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_READY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RX_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_READY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE2_RX_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_READY_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE3_RX_VALID_I} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {FABRIC_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FRAME_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LINE_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {OUT0_FABCLK_0} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {L0_EPCS_RxDATA} -port_direction {IN} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L1_EPCS_RxDATA} -port_direction {IN} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L2_EPCS_RxDATA} -port_direction {IN} -port_range {[39:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L3_EPCS_RxDATA} -port_direction {IN} -port_range {[39:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {dout} -port_direction {OUT} -port_range {[127:0]}


# Add CorePCS_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C0} -instance_name {CorePCS_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0:EPCS_PWRDN}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0:EPCS_RxVAL} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0:EPCS_RxIDLE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0:EPCS_RxERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0:ALIGNED}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0:CODE_ERR_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0:B_CERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0:RD_ERR}



# Add CorePCS_C0_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C0} -instance_name {CorePCS_C0_0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:EPCS_PWRDN}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:EPCS_RxVAL} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:EPCS_RxIDLE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:EPCS_RxERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:ALIGNED}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:CODE_ERR_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:B_CERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_0:RD_ERR}



# Add CorePCS_C0_0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C0} -instance_name {CorePCS_C0_0_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:EPCS_PWRDN}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:EPCS_RxVAL} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:EPCS_RxIDLE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:EPCS_RxERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:ALIGNED}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:CODE_ERR_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:B_CERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_1:RD_ERR}



# Add CorePCS_C0_0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CorePCS_C0} -instance_name {CorePCS_C0_0_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:EPCS_READY} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:EPCS_PWRDN}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:EPCS_RxVAL} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:EPCS_RxIDLE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:EPCS_RxERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:ALIGNED}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:CODE_ERR_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:B_CERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CorePCS_C0_0_2:RD_ERR}



# Add CORERESET_PF_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C1} -instance_name {CORERESET_PF_C1_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:FPGA_POR_N} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:PLL_POWERDOWN_B}



# Add PF_CCC_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C1} -instance_name {PF_CCC_C1_0}



# Add pix_mapping_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {pix_mapping} -hdl_file {hdl\pix_mapping.v} -instance_name {pix_mapping_0}



# Add SLVS_EC_RX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SLVS_EC_RX_C0} -instance_name {SLVS_EC_RX_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SLVS_EC_RX_C0_0:EBD_VALID_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SLVS_EC_RX_C0_0:HEADER_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SLVS_EC_RX_C0_0:LANE0_FSM_STATE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SLVS_EC_RX_C0_0:LANE1_FSM_STATE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SLVS_EC_RX_C0_0:LANE2_FSM_STATE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {SLVS_EC_RX_C0_0:LANE3_FSM_STATE_O}



# Add word_alignment_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {word_alignment} -hdl_file {hdl\word_alignment.v} -instance_name {word_alignment_0}



# Add word_alignment_0_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {word_alignment} -hdl_file {hdl\word_alignment.v} -instance_name {word_alignment_0_0}



# Add word_alignment_0_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {word_alignment} -hdl_file {hdl\word_alignment.v} -instance_name {word_alignment_0_1}



# Add word_alignment_0_2 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {word_alignment} -hdl_file {hdl\word_alignment.v} -instance_name {word_alignment_0_2}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARST_N" "CORERESET_PF_C1_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:CLK" "OUT0_FABCLK_0" "PF_CCC_C1_0:OUT0_FABCLK_0" "SLVS_EC_RX_C0_0:PIXEL_CLOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:EXT_RST_N" "EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:FABRIC_RESET_N" "CorePCS_C0_0:EPCS_RxRSTn" "CorePCS_C0_0:RESET_N" "CorePCS_C0_0:WA_RSTn" "CorePCS_C0_0_0:EPCS_RxRSTn" "CorePCS_C0_0_0:RESET_N" "CorePCS_C0_0_0:WA_RSTn" "CorePCS_C0_0_1:EPCS_RxRSTn" "CorePCS_C0_0_1:RESET_N" "CorePCS_C0_0_1:WA_RSTn" "CorePCS_C0_0_2:EPCS_RxRSTn" "CorePCS_C0_0_2:RESET_N" "CorePCS_C0_0_2:WA_RSTn" "FABRIC_RESET_N" "SLVS_EC_RX_C0_0:ARST_N" "word_alignment_0:RESETN_I" "word_alignment_0_0:RESETN_I" "word_alignment_0_1:RESETN_I" "word_alignment_0_2:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:PLL_LOCK" "PF_CCC_C1_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0:EPCS_RxCLK" "LANE3_RX_CLK_I" "SLVS_EC_RX_C0_0:LANE3_RX_CLK_I" "word_alignment_0_2:CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_0:EPCS_RxCLK" "LANE1_RX_CLK_I" "SLVS_EC_RX_C0_0:LANE1_RX_CLK_I" "word_alignment_0_0:CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_1:EPCS_RxCLK" "LANE2_RX_CLK_I" "SLVS_EC_RX_C0_0:LANE2_RX_CLK_I" "word_alignment_0_1:CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_2:EPCS_RxCLK" "LANE0_RX_CLK_I" "PF_CCC_C1_0:REF_CLK_0" "SLVS_EC_RX_C0_0:LANE0_RX_CLK_I" "word_alignment_0:CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FRAME_VALID_O" "SLVS_EC_RX_C0_0:FRAME_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RX_READY_I" "SLVS_EC_RX_C0_0:LANE0_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RX_VALID_I" "SLVS_EC_RX_C0_0:LANE0_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RX_READY_I" "SLVS_EC_RX_C0_0:LANE1_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RX_VALID_I" "SLVS_EC_RX_C0_0:LANE1_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RX_READY_I" "SLVS_EC_RX_C0_0:LANE2_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE2_RX_VALID_I" "SLVS_EC_RX_C0_0:LANE2_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RX_READY_I" "SLVS_EC_RX_C0_0:LANE3_RX_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE3_RX_VALID_I" "SLVS_EC_RX_C0_0:LANE3_RX_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LINE_VALID_O" "SLVS_EC_RX_C0_0:LINE_VALID_O" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0:EPCS_RxDATA" "L3_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0:RX_DATA" "word_alignment_0_2:Data_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0:RX_K_CHAR" "word_alignment_0_2:K_CHAR_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_0:EPCS_RxDATA" "L1_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_0:RX_DATA" "word_alignment_0_0:Data_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_0:RX_K_CHAR" "word_alignment_0_0:K_CHAR_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_1:EPCS_RxDATA" "L2_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_1:RX_DATA" "word_alignment_0_1:Data_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_1:RX_K_CHAR" "word_alignment_0_1:K_CHAR_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_2:EPCS_RxDATA" "L0_EPCS_RxDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_2:RX_DATA" "word_alignment_0:Data_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CorePCS_C0_0_2:RX_K_CHAR" "word_alignment_0:K_CHAR_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:DATA_OUT_O" "pix_mapping_0:din" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE0_8b10b_RX_K_I" "word_alignment_0:K_CHAR_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE0_RX_DATA_I" "word_alignment_0:Data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE1_8b10b_RX_K_I" "word_alignment_0_0:K_CHAR_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE1_RX_DATA_I" "word_alignment_0_0:Data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE2_8b10b_RX_K_I" "word_alignment_0_1:K_CHAR_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE2_RX_DATA_I" "word_alignment_0_1:Data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE3_8b10b_RX_K_I" "word_alignment_0_2:K_CHAR_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLVS_EC_RX_C0_0:LANE3_RX_DATA_I" "word_alignment_0_2:Data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dout" "pix_mapping_0:dout" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "IMX_TOP"
generate_component -component_name ${sd_name}
