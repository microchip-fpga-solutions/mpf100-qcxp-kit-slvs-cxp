# Generate FPGA Array Data
## run_tool -name GENERATEPROGRAMMINGDATA
run_tool_wrapper "run_tool -name GENERATEPROGRAMMINGDATA"

                  
# Configure and generate Design Initialization Data and Memories
# The following can be configured:
#   - Design initialization source - sNVM/uPROM/SPI-Flash
#   - sNVM user clients
#   - uPROM user clients
#   - Fabric RAM initialization content
#   - SPI-Flash user clients
# Examples TBD
#
# Example for configuring user snvm clients 
# Note that if using relative path, the path to the mem file specified in the SNVM.cfg file is relative to the libero *.prjx file. So please adjust the path according to the project location and where the SNVM.cfg and mem files are located. 
configure_ram -cfg_file {./src/cfg/SNVM_SLVS_to_CXP.cfg} 

generate_design_initialization_data
    
configure_tool \
         -name {GENERATEPROGRAMMINGFILE} \
         -params {program_fabric:true} \
         -params {program_security:false} \
         -params {program_snvm:true} \
         -params {sanitize_snvm:false} 
		 
## run_tool -name GENERATEPROGRAMMINGFILE
run_tool_wrapper "run_tool -name GENERATEPROGRAMMINGFILE"

puts "Programmingfile generated successfully\n"

    
# Export Programming Job
# Programming job files can be imported in FlasPro Express standalone for programming the device
export_prog_job \
    -job_file_name {mpf_an4053_v2025p2_jb} \
    -export_dir ${PrjLocation}/designer/top/export \
    -bitstream_file_type {TRUSTED_FACILITY} \
    -bitstream_file_components {FABRIC SNVM} \
    -program_design 1 \
    -program_spi_flash 0 \
	-zeroization_likenew_action 0 \
    -zeroization_unrecoverable_action 0 \
    -include_plaintext_passkey 0 \
	-design_bitstream_format {PPD} \
    -prog_optional_procedures {} \
    -skip_recommended_procedures {} \
    -sanitize_snvm 0 
	
puts "Exported job file successfully\n"

puts "Full design flow passed execution\n"	