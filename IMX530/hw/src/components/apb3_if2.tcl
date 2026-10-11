# Exporting core apb3_if2 to TCL
# Exporting Create HDL core command for module apb3_if2
create_hdl_core -file {hdl/apb_wrapper2.vhd} -module {apb3_if2} -library {work} -package {}
# Exporting BIF information of  HDL core command for module apb3_if2
hdl_core_add_bif -hdl_core_name {apb3_if2} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {\
"PADDR:paddr_i" \
"PSELx:psel_i" \
"PENABLE:penable_i" \
"PWRITE:pwrite_i" \
"PRDATA:prdata_o" \
"PWDATA:pwdata_i" \
"PREADY:pready_o" \
"PSLVERR:pslverr_o" }
