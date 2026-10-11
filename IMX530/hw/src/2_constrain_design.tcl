# -------------------------------------------------------------------------------------------
# Link Netlist optimization constraints (FDC/NDC) and associate constraints to Synthesis tool
#   - FDC contains SynplifyPro attribute / constraints
#   - NDC contains Libero netlist optimization attributes / constraints
# Below is an example
#create_links \
    -net_fdc {./src/constraints/net_fdc_constraints.fdc}
#organize_tool_files -tool {SYNTHESIZE} \
    -file {./src/constraints/net_fdc_constraints.fdc} \
    -module {top::work} \
    -input_type {constraint}
#create_links \
    -ndc {./src/constraints/ndc_constraints.ndc}
#organize_tool_files -tool {SYNTHESIZE} \
    -file ${PrjLocation}/constraints/ndc_constraints.ndc \
    -module {top::work} \
    -input_type {constraint}

# -------------------------------------------------------------------------------------------
# Link I/O constraints (PDC) and associate constraints to Place and route tool
    
import_files -io_pdc {./src/constraints/io_constraints.pdc}
 
# -------------------------------------------------------------------------------------------
# Link Floorplanning constraints (PDC) and associate constraints to Place and route tool
# Below is an example
import_files -fp_pdc {./src/constraints/fp_constraints.pdc}

# -------------------------------------------------------------------------------------------
# Derive SDC constraints from the design and the configured cores generated constraints
derive_constraints_sdc

# -------------------------------------------------------------------------------------------
# Link user SDC constraints (not expressed by the derived constraints)
# and optionally associate to Synthesis, Place and Route and Timing Verification as needed
# Below is an example
import_files -sdc {./src/constraints/timing_user_constraints.sdc}
organize_tool_files -tool {SYNTHESIZE} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -module {top::work} \
    -input_type {constraint}
organize_tool_files -tool {PLACEROUTE} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -file ${PrjLocation}/constraint/timing_user_constraints.sdc \
    -file ${PrjLocation}/constraint/io/io_constraints.pdc \
    -file ${PrjLocation}/constraint/fp/fp_constraints.pdc \
    -module {top::work} \
    -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -file ${PrjLocation}/constraint/timing_user_constraints.sdc \
    -module {top::work} \
    -input_type {constraint}

## run_tool -name {CONSTRAINT_MANAGEMENT}
run_tool_wrapper "run_tool -name {CONSTRAINT_MANAGEMENT}"

save_project
puts "Imported and derived constraints successfully\n"
