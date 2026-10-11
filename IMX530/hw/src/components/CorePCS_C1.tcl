# Exporting Component Description of CorePCS_C1 to TCL
# Family: PolarFire
# Part Number: MPF100T-1FCG484I
# Create and Configure the core component CorePCS_C1
create_and_configure_core -core_vlnv "Actel:DirectCore:CorePCS:$CorePCSver" -component_name {CorePCS_C1} -params {\
"COMMA_DETECT_SEL:1"  \
"EPCS_DWIDTH:80"  \
"LANE_MODE:0"  \
"NO_OF_COMMAS:1"  \
"PROG_COMMA_EN:1"  \
"SHIFT_EN:false"   }
# Exporting Component Description of CorePCS_C1 to TCL done
