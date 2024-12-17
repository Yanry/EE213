** SRAM testbench

** INCLUE MODEL LIBRARY
.INCLUDE "./trans_models/NMOS_VTL.inc"
.INCLUDE "./trans_models/PMOS_VTL.inc"

** INCLUDE SIMULATION CONFIGURATION
.INCLUDE "./test/functional_test/SRAM_sim/sim_config.sp"

** INCLUDE TEST ROM
.INCLUDE "./test/functional_test/SRAM_sim/test_source.sp"

** INCLUDE TESTBENCH inst
.INCLUDE "./test/functional_test/SRAM_sim/testbench_inst.sp"

** INCLUDE SRAM inst
.INCLUDE "./test/inst/SRAM_inst.sp"

.END
