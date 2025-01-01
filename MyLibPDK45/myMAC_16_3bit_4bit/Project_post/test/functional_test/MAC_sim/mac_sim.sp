** MAC testbench

** INCLUE MODEL LIBRARY
.INCLUDE "./trans_models/NMOS_VTL.inc"
.INCLUDE "./trans_models/PMOS_VTL.inc"

** INCLUDE SIMULATION CONFIGURATION
.INCLUDE "./test/functional_test/MAC_sim/sim_config.sp"

** INCLUDE MULTIPLIER SOURCE
.INCLUDE "./test/functional_test/MAC_sim/test_source_multiplier.sp"

** INCLUDE MULTIPLICAND SOURCE
.INCLUDE "./test/functional_test/MAC_sim/test_source_multiplicand.sp"

** INCLUDE TESTBENCH inst
.INCLUDE "./test/functional_test/MAC_sim/testbench_inst.sp"

** INCLUDE SRAM inst
.INCLUDE "./test/inst/MAC_inst.sp"

.END
