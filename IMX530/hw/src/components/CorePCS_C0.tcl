# Exporting Component Description of CorePCS_C0 to TCL
# Family: PolarFire
# Part Number: MPF100T-1FCG484I
# Create and Configure the core component CorePCS_C0
create_and_configure_core -core_vlnv "Actel:DirectCore:CorePCS:$CorePCSver" -component_name {CorePCS_C0} -params {\
"COMMA_DETECT_SEL:0"  \
"EPCS_DWIDTH:40"  \
"LANE_MODE:1"  \
"NO_OF_COMMAS:1"  \
"PROG_COMMA_EN:1"  \
"SHIFT_EN:false"   }
# Exporting Component Description of CorePCS_C0 to TCL done
