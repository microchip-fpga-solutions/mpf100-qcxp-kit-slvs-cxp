# Exporting Component Description of CoaXpress_TOP_C0 to TCL
# Family: PolarFire
# Part Number: MPF100T-1FCG484I
# Create and Configure the core component CoaXpress_TOP_C0
create_and_configure_core -core_vlnv "Microchip:SolutionCore:CoaXpress_TOP:$CoaXpress_TOPver" -component_name {CoaXpress_TOP_C0} -params {\
"g_CPU_PACKET_FIFO_WORDS:256"  \
"g_NUM_CON:4"  \
"g_SDP_PACKET_FIFO_WORDS:2048"  \
"g_SDW:128"  \
"g_SELECT:2"  \
"g_SNUM:1"   }
# Exporting Component Description of CoaXpress_TOP_C0 to TCL done
