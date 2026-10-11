source ./common/common.tcl

proc run_tool_wrapper { cmd } {
  regexp {run_tool\s+-name\s+\{*(\w*)\}*} $cmd full1 tool;
  puts "Starting $tool command";
  set full_cmd "time \{ $cmd \}";
  set TIME_start [clock seconds];
  set runtime [ eval $full_cmd ];
  set TIME_taken [expr [clock seconds] - $TIME_start];
  puts "\nRUNTIME:$tool=$TIME_taken secs\n";
  set runtime_secs [ expr [lindex $runtime 0]/1000000 ];
  puts "\nRUNTIME_bytime:$tool=$runtime_secs secs\n";
}

set die_eval {MPF100T}
set eval_package {FCG484}
set eval_part_range {IND}

# Device Selection

# Variables used in the design
#set SimTime 200ns
set Prjname "mpf_slvs_cxp_v2026p1_df"
set PrjLocation "./$Prjname"

#variable used in the design
 set SimTime 120us
 set Effort_Level false
 set Repair_Min_Delay true
 set Multi_Pass_Layout false


# Remove existing project if present
file delete -force ${PrjLocation}

# Create new project
new_project \
    -name       "$Prjname" \
    -location   "$PrjLocation" \
    -family     "PolarFire" \
    -die        "$die_eval" \
    -package    "$eval_package" \
    -speed      "-1" \
    -part_range "$eval_part_range" \
	-hdl        "VERILOG" \
	-adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0}
	
	puts "Project created successfully"

# Core Downloads
download_core -vlnv "Actel:DirectCore:COREAHBTOAPB3:$COREAHBTOAPB3ver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreAPB3:$CoreAPB3ver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREAXI4INTERCONNECT:$COREAXI4INTERCONNECTver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREAXITOAHBL:$COREAXITOAHBLver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CoreGPIO:$CoreGPIOver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREI2C:$COREI2Cver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:COREJTAGDEBUG:$COREJTAGDEBUGver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microsemi:MiV:MIV_RV32:$MIV_RV32ver" -location {www.microchip-ip.com/repositories/DirectCore}

download_core -vlnv "Actel:SystemBuilder:PF_SRAM_AHBL_AXI:$PF_SRAM_AHBL_AXIver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Microchip:SolutionCore:CoaXpress_TOP:$CoaXpress_TOPver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microchip:SolutionCore:SLVS_EC_RX:$SLVS_EC_RXver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CorePCS:$CorePCSver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:SgCore:PF_DRI:$PF_DRIver" -location {www.microchip-ip.com/repositories/SgCore}

download_core -vlnv "Actel:DirectCore:CORERESET_PF:$CORERESET_PFver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:SgCore:PF_INIT_MONITOR:$PF_INIT_MONITORver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_CCC:$PF_CCCver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_TX_PLL:$PF_TX_PLLver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_XCVR_REF_CLK:$PF_XCVR_REF_CLKver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SystemBuilder:PF_XCVR_ERM:$PF_XCVR_ERMver" -location {www.microchip-ip.com/repositories/SgCore"



# Turning block mode on
#project_settings -block_mode 1

# Create design
source ./src/1_create_design.tcl

# Constrain design
source ./src/2_constrain_design.tcl

# Simulation flow
#source ./src/3_sim_flow.tcl

# Implement design
source ./src/4_implement_design.tcl

# Program design
source ./src/5_program_design.tcl
