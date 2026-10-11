# Configure and run Synthesis
configure_tool -name {SYNTHESIZE} \
    -params {ACTIVE_IMPLEMENTATION:synthesis} \
    -params {AUTO_COMPILE_POINT:false} \
    -params {BLOCK_MODE:false} \
    -params {BLOCK_PLACEMENT_CONFLICTS:ERROR} \
    -params {BLOCK_ROUTING_CONFLICTS:LOCK} \
    -params {CDC_MIN_NUM_SYNC_REGS:2} \
    -params {CDC_REPORT:true} \
    -params {CLOCK_ASYNC:800} \
    -params {CLOCK_DATA:5000} \
    -params {CLOCK_GATE_ENABLE:false} \
    -params {CLOCK_GATE_ENABLE_THRESHOLD_GLOBAL:1000} \
    -params {CLOCK_GATE_ENABLE_THRESHOLD_ROW:100} \
    -params {CLOCK_GLOBAL:2} \
    -params {PA4_GB_COUNT:24} \
    -params {PA4_GB_MAX_RCLKINT_INSERTION:16} \
    -params {PA4_GB_MIN_GB_FANOUT_TO_USE_RCLKINT:1000} \
    -params {RAM_OPTIMIZED_FOR_POWER:0} \
    -params {RETIMING:false} \
    -params {ROM_TO_LOGIC:true} \
    -params {SEQSHIFT_TO_URAM:1} \
    -params {SYNPLIFY_OPTIONS:} \
    -params {SYNPLIFY_TCL_FILE:} \
	
## run_tool -name SYNTHESIZE
run_tool_wrapper "run_tool -name SYNTHESIZE
"

puts "Synthesize completed successfully\n"
                  
# Configure and run Place and Route for max timing optimization
# In this phase, the goal is to meet max timing requirements
# Recommendations:
#   - Start with regular effort (EFFORT_LEVEL:false)
#   - Try high effort (EFFORT_LEVEL:true) if timing is not met with regular effort
#   - If you are still not meeting timing, consider optimizing your RTL next
#   - Do not run multi-pass unless absolutely necessary and the design is close to completion
#   - Do not run Min-delay-repair until max timing has been met
configure_tool -name {PLACEROUTE} \
-params {DELAY_ANALYSIS:MAX} \
-params EFFORT_LEVEL:$Effort_Level \
-params {GB_DEMOTION:true} \
-params {INCRPLACEANDROUTE:false} \
-params {IOREG_COMBINING:false} \
-params {MULTI_PASS_CRITERIA:VIOLATIONS} \
-params MULTI_PASS_LAYOUT:$Multi_Pass_Layout \
-params {NUM_MULTI_PASSES:5} \
-params {PDPR:false} \
-params {RANDOM_SEED:0} \
-params REPAIR_MIN_DELAY:$Repair_Min_Delay \
-params {REPLICATION:false} \
-params {SLACK_CRITERIA:WORST_SLACK} \
-params {SPECIFIC_CLOCK:} \
-params {START_SEED_INDEX:90} \
-params {STOP_ON_FIRST_PASS:false} \
-params {TDPR:true}\

    
## run_tool -name PLACEROUTE
run_tool_wrapper "run_tool -name PLACEROUTE
"

puts "Placeroute completed successfully\n"
    
# Configure and run Timing Verification
# Notes: 
#   You should enable all corners for final timing sign-off
#   If you want to know that there are violations or not, just enable the *TIMING_VIOLATIONS* options. You will not get detailed timing reports in that case
configure_tool -name {VERIFYTIMING} \
-params {CONSTRAINTS_COVERAGE:1} \
-params {FORMAT:XML} \
-params {MAX_EXPANDED_PATHS_TIMING:1} \
-params {MAX_EXPANDED_PATHS_VIOLATION:0} \
-params {MAX_PARALLEL_PATHS_TIMING:1} \
-params {MAX_PARALLEL_PATHS_VIOLATION:1} \
-params {MAX_PATHS_INTERACTIVE_REPORT:1000} \
-params {MAX_PATHS_TIMING:5} \
-params {MAX_PATHS_VIOLATION:20} \
-params {MAX_TIMING_FAST_HV_LT:1} \
-params {MAX_TIMING_MULTI_CORNER:1} \
-params {MAX_TIMING_SLOW_LV_HT:1} \
-params {MAX_TIMING_SLOW_LV_LT:1} \
-params {MAX_TIMING_VIOLATIONS_FAST_HV_LT:1} \
-params {MAX_TIMING_VIOLATIONS_MULTI_CORNER:1} \
-params {MAX_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
-params {MAX_TIMING_VIOLATIONS_SLOW_LV_LT:1} \
-params {MIN_TIMING_FAST_HV_LT:1} \
-params {MIN_TIMING_MULTI_CORNER:1} \
-params {MIN_TIMING_SLOW_LV_HT:1} \
-params {MIN_TIMING_SLOW_LV_LT:1} \
-params {MIN_TIMING_VIOLATIONS_FAST_HV_LT:1} \
-params {MIN_TIMING_VIOLATIONS_MULTI_CORNER:1} \
-params {MIN_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
-params {MIN_TIMING_VIOLATIONS_SLOW_LV_LT:1} \
-params {SLACK_THRESHOLD_VIOLATION:0.0} \
-params {SMART_INTERACTIVE:1} \

## run_tool -name VERIFYTIMING
run_tool_wrapper "run_tool -name VERIFYTIMING
"

puts "Verifytiming completed successfully\n"

save_project
