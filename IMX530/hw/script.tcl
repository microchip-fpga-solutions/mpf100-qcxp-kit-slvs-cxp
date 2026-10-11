###############################################################################################################################################
# © 2026 Microchip Technology Inc. and its subsidiaries
# All rights reserved.
# ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
# ACCORDANCE WITH THE MICROCHIP LICENSE AGREEMENT AND MUST BE APPROVED
# IN ADVANCE IN WRITING
##################################################################################################################################################
# Title        : script.tcl
# Description  : This is the top-level script, which creates the FPGA HW Project. 
#                It invokes all the below TCLs which are required to complete the FPGA design flow.
#         	      -- 1_create_design.tcl: Executes all the required core configuration TCLs with necessary user HDL files to generate the design.
#		          -- 2_constrain_design.tcl: Applies all the necessary constraints for the design.
#      		      -- 3_sim_flow.tcl : Imports the testbench, other required simulation files and simulates the design.
#		          -- 4_implement_design.tcl : Runs synthesis, place & route, and verify timing design flow steps.
#        		  -- 5_program_design.tcl : Creates and exports the programming job file.              
####################################################################################################################################################

# Call common.tcl which contains required cores with the versions numbers to run the TCL scripts
source ./common/common.tcl

# A common procedure to compute the runtime for each command run in Libero.
# Get tool name from the command
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

# Device-specific Variables
set die_eval {MPF100T}
set eval_package {FCG484}
set eval_part_range {IND}

 set Prjname "mpf_slvs_cxp_v2026p1_df"
 set PrjLocation "./$Prjname"

 #variable used in the design
 set SimTime 120us
 set Effort_Level false
 set Repair_Min_Delay true
 set Multi_Pass_Layout false


 # Remove existing project if present
 file delete -force ${PrjLocation}

# Proceed with creating the new project
new_project \
    -name "$Prjname" \
    -location "$PrjLocation" \
    -family "PolarFire" \
    -die $die_eval \
    -package $eval_package \
    -die_voltage "1.0" \
    -speed "-1" \
    -part_range $eval_part_range \
    -hdl "VERILOG" \
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

download_core -vlnv "Microchip:SolutionCore:CoaXpress_TOP:$CoaXpress_TOPver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Microchip:SolutionCore:SLVS_EC_RX:$SLVS_EC_RXver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:DirectCore:CorePCS:$CorePCSver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:SgCore:PF_DRI:$PF_DRIver" -location {www.microchip-ip.com/repositories/SgCore}

download_core -vlnv "Actel:DirectCore:CORERESET_PF:$CORERESET_PFver" -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv "Actel:SgCore:PF_INIT_MONITOR:$PF_INIT_MONITORver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_CCC:$PF_CCCver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_TX_PLL:$PF_TX_PLLver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SgCore:PF_XCVR_REF_CLK:$PF_XCVR_REF_CLKver" -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv "Actel:SystemBuilder:PF_XCVR_ERM:$PF_XCVR_ERMver" -location {www.microchip-ip.com/repositories/SgCore}


# Create design
source ./src/1_create_design.tcl

# Constrain design
source ./src/2_constrain_design.tcl

# Implement design
source ./src/4_implement_design.tcl

# Program design
source ./src/5_program_design.tcl


