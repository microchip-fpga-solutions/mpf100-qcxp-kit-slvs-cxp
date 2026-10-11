# Creating SmartDesign "PROC_SS"
set sd_name {PROC_SS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PSLVERR} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CXP_DEV_INT} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {S_CLK0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PENABLE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PSEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PWRITE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CXP_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rgb_gain_en_o} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PRDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RID} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_INITIATOR_APB_PWDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWID} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bgain_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ggain_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {hres_o} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rgain_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {vres_o} -port_direction {OUT} -port_range {[15:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_INITIATOR} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {master} -port_bif_mapping {\
"PADDR:APB_INITIATOR_APB_PADDR" \
"PSELx:APB_INITIATOR_APB_PSEL" \
"PENABLE:APB_INITIATOR_APB_PENABLE" \
"PWRITE:APB_INITIATOR_APB_PWRITE" \
"PRDATA:APB_INITIATOR_APB_PRDATA" \
"PWDATA:APB_INITIATOR_APB_PWDATA" \
"PREADY:APB_INITIATOR_APB_PREADY" \
"PSLVERR:APB_INITIATOR_APB_PSLVERR" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4mslave0_SLAVE0_AWID" \
"AWADDR:AXI4mslave0_SLAVE0_AWADDR" \
"AWLEN:AXI4mslave0_SLAVE0_AWLEN" \
"AWSIZE:AXI4mslave0_SLAVE0_AWSIZE" \
"AWBURST:AXI4mslave0_SLAVE0_AWBURST" \
"AWLOCK:AXI4mslave0_SLAVE0_AWLOCK" \
"AWCACHE:AXI4mslave0_SLAVE0_AWCACHE" \
"AWPROT:AXI4mslave0_SLAVE0_AWPROT" \
"AWQOS:AXI4mslave0_SLAVE0_AWQOS" \
"AWREGION:AXI4mslave0_SLAVE0_AWREGION" \
"AWVALID:AXI4mslave0_SLAVE0_AWVALID" \
"AWREADY:AXI4mslave0_SLAVE0_AWREADY" \
"WDATA:AXI4mslave0_SLAVE0_WDATA" \
"WSTRB:AXI4mslave0_SLAVE0_WSTRB" \
"WLAST:AXI4mslave0_SLAVE0_WLAST" \
"WVALID:AXI4mslave0_SLAVE0_WVALID" \
"WREADY:AXI4mslave0_SLAVE0_WREADY" \
"BID:AXI4mslave0_SLAVE0_BID" \
"BRESP:AXI4mslave0_SLAVE0_BRESP" \
"BVALID:AXI4mslave0_SLAVE0_BVALID" \
"BREADY:AXI4mslave0_SLAVE0_BREADY" \
"ARID:AXI4mslave0_SLAVE0_ARID" \
"ARADDR:AXI4mslave0_SLAVE0_ARADDR" \
"ARLEN:AXI4mslave0_SLAVE0_ARLEN" \
"ARSIZE:AXI4mslave0_SLAVE0_ARSIZE" \
"ARBURST:AXI4mslave0_SLAVE0_ARBURST" \
"ARLOCK:AXI4mslave0_SLAVE0_ARLOCK" \
"ARCACHE:AXI4mslave0_SLAVE0_ARCACHE" \
"ARPROT:AXI4mslave0_SLAVE0_ARPROT" \
"ARQOS:AXI4mslave0_SLAVE0_ARQOS" \
"ARREGION:AXI4mslave0_SLAVE0_ARREGION" \
"ARVALID:AXI4mslave0_SLAVE0_ARVALID" \
"ARREADY:AXI4mslave0_SLAVE0_ARREADY" \
"RID:AXI4mslave0_SLAVE0_RID" \
"RDATA:AXI4mslave0_SLAVE0_RDATA" \
"RRESP:AXI4mslave0_SLAVE0_RRESP" \
"RLAST:AXI4mslave0_SLAVE0_RLAST" \
"RVALID:AXI4mslave0_SLAVE0_RVALID" \
"RREADY:AXI4mslave0_SLAVE0_RREADY" \
"AWUSER:AXI4mslave0_SLAVE0_AWUSER" \
"WUSER:AXI4mslave0_SLAVE0_WUSER" \
"BUSER:AXI4mslave0_SLAVE0_BUSER" \
"ARUSER:AXI4mslave0_SLAVE0_ARUSER" \
"RUSER:AXI4mslave0_SLAVE0_RUSER" } 

# Add apb3_if2_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {apb3_if2} -instance_name {apb3_if2_0}
# Exporting Parameters of instance apb3_if2_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {apb3_if2_0} -params {\
"g_APB3_IF_DATA_WIDTH:32" \
"g_CONST_WIDTH:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {apb3_if2_0}
sd_update_instance -sd_name ${sd_name} -instance_name {apb3_if2_0}



# Add BIBUF_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_2}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_2:D} -value {GND}
sd_invert_pins -sd_name ${sd_name} -pin_names {BIBUF_2:E}



# Add BIBUF_3 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_3}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_3:D} -value {GND}
sd_invert_pins -sd_name ${sd_name} -pin_names {BIBUF_3:E}



# Add COREAHBTOAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAHBTOAPB3_C0} -instance_name {COREAHBTOAPB3_C0_0}



# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}



# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add COREAXITOAHBL_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXITOAHBL_C0} -instance_name {COREAXITOAHBL_C0_0}



# Add CoreGPIO_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_C0} -instance_name {CoreGPIO_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[31:10]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_OUT[31:10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[3:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[4:4]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_OUT[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[6:6]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_OUT[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[7:7]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_OUT[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_C0_0:GPIO_OUT} -pin_slices {[9:9]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_OUT[9:9]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreGPIO_C0_0:GPIO_IN} -value {GND}



# Add COREI2C_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_C0} -instance_name {COREI2C_C0_1}



# Add COREJTAGDEBUG_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREJTAGDEBUG_C0} -instance_name {COREJTAGDEBUG_C0_0}



# Add MIV_RV32_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32_C0} -instance_name {MIV_RV32_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_RV32_C0_0:MSYS_EI} -pin_slices {[1:1]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:EXT_RESETN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:JTAG_TDO_DR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_C0_0:TIME_COUNT_OUT}



# Add PF_SRAM_AHBL_AXI_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SRAM_AHBL_AXI_C0} -instance_name {PF_SRAM_AHBL_AXI_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:E" "COREI2C_C0_1:SCLO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:PAD" "CAM1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_2:Y" "COREI2C_C0_1:SCLI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_3:E" "COREI2C_C0_1:SDAO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_3:PAD" "CAM1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_3:Y" "COREI2C_C0_1:SDAI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RST" "CoreGPIO_C0_0:GPIO_OUT[8:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:HCLK" "COREAXI4INTERCONNECT_C0_0:ACLK" "COREAXITOAHBL_C0_0:ACLK" "COREAXITOAHBL_C0_0:HCLK" "COREI2C_C0_1:PCLK" "CoreGPIO_C0_0:PCLK" "MIV_RV32_C0_0:CLK" "PCLK" "PF_SRAM_AHBL_AXI_C0_0:HCLK" "apb3_if2_0:pclk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:HRESETN" "COREAXI4INTERCONNECT_C0_0:ARESETN" "COREAXITOAHBL_C0_0:ARESETN" "COREAXITOAHBL_C0_0:HRESETN" "COREI2C_C0_1:PRESETN" "CoreGPIO_C0_0:PRESETN" "MIV_RV32_C0_0:RESETN" "PF_SRAM_AHBL_AXI_C0_0:HRESETN" "RESETN" "apb3_if2_0:preset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:S_CLK0" "S_CLK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_1:INT" "MIV_RV32_C0_0:MSYS_EI[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TCK_0" "MIV_RV32_C0_0:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDI_0" "MIV_RV32_C0_0:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDO_0" "MIV_RV32_C0_0:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TMS_0" "MIV_RV32_C0_0:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TRSTN_0" "MIV_RV32_C0_0:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_DEV_INT" "MIV_RV32_C0_0:EXT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CXP_RST" "CoreGPIO_C0_0:GPIO_OUT[5:5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if2_0:rgb_gain_en_o" "rgb_gain_en_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_C0_0:GPIO_OUT[3:0]" "GPIO_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if2_0:bgain_o" "bgain_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if2_0:ggain_o" "ggain_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if2_0:hres_o" "hres_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if2_0:rgain_o" "rgain_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if2_0:vres_o" "vres_o" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_INITIATOR" "MIV_RV32_C0_0:APB_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave0" "COREAXI4INTERCONNECT_C0_0:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:AHBtarget" "COREAXITOAHBL_C0_0:AHB_MS_IF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:APBinitiator" "CoreAPB3_C0_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI3mslave1" "COREAXITOAHBL_C0_0:AXISlaveIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" "MIV_RV32_C0_0:AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREI2C_C0_1:APBslave" "CoreAPB3_C0_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave0" "CoreGPIO_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APBmslave2" "apb3_if2_0:BIF_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_C0_0:AHBL_M_TARGET" "PF_SRAM_AHBL_AXI_C0_0:AHBSlaveInterface" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "PROC_SS"
generate_component -component_name ${sd_name}
