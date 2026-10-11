 file copy -force "./src/softconsole/miv-rv32i-cxp-device.hex" "./$Prjname/miv-rv32i-cxp-device.hex"


#Importing and Linking all the HDL source files and folders used in the design
import_files -library work -hdl_source ./src/hdl/pix_mapping.v
import_files -library work -hdl_source ./src/hdl/word_alignment.v
import_files -library work -hdl_source ./src/hdl/apb_wrapper2.vhd
import_files -library work -hdl_source ./src/hdl/bayer_rgb_gain.v
import_files -library work -hdl_source ./src/hdl/slvs_frame_end_gen.v


# Appended from _recursive.tcl
#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
build_design_hierarchy

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source ./src/components/apb3_if2.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source ./src/components/CORERESET_PF_C1.tcl 
source ./src/components/CoaXpress_TOP_C0.tcl 
source ./src/components/CorePCS_C1.tcl 
source ./src/components/PF_CCC_C0.tcl 
source ./src/components/PF_TX_PLL_C0.tcl 
source ./src/components/PF_XCVR_ERM_C0.tcl 
source ./src/components/PF_XCVR_REF_CLK_C0.tcl 
source ./src/components/CXP_DEVICE_TOP.tcl 
source ./src/components/CorePCS_C0.tcl 
source ./src/components/PF_CCC_C1.tcl 
source ./src/components/SLVS_EC_RX_C0.tcl 
source ./src/components/IMX_TOP.tcl 
source ./src/components/PF_DRI_C0.tcl 
source ./src/components/PF_INIT_MONITOR_C0.tcl 
source ./src/components/COREAHBTOAPB3_C0.tcl 
source ./src/components/COREAXI4INTERCONNECT_C0.tcl 
source ./src/components/COREAXITOAHBL_C0.tcl 
source ./src/components/COREI2C_C0.tcl 
source ./src/components/COREJTAGDEBUG_C0.tcl 
source ./src/components/CoreAPB3_C0.tcl 
source ./src/components/CoreGPIO_C0.tcl 
source ./src/components/MIV_RV32_C0.tcl 
source ./src/components/PF_SRAM_AHBL_AXI_C0.tcl 
source ./src/components/PROC_SS.tcl 
source ./src/components/top.tcl 
build_design_hierarchy

# Set top level module
set_root  -module {top::work}

build_design_hierarchy 
save_project
puts "Design generated successfully\n"
