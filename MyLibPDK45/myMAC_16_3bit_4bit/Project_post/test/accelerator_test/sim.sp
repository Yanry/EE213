** 2-Layer MLP ACCELERATOR

** INCLUE MODEL LIBRARY
.INCLUDE "./trans_models/NMOS_VTL.inc"
.INCLUDE "./trans_models/PMOS_VTL.inc"

** INCLUDE SIMULATION CONFIGURATION
.INCLUDE "./test/accelerator_test/sim_config.sp"

** INCLUDE WEIGHT ROM
.INCLUDE "./test/accelerator_test/weight/weight_rom/mnist.sp"

** INCLUDE INPUT ROM
.INCLUDE "./test/accelerator_test/input/input_rom/input.sp"

** INCLUDE CONTROL & BUFFER & QUANTIZATION & PERIPHERY circuit
.INCLUDE "./test/accelerator_test/testbench.sp"

** INCLUDE TEST_BENCH_CIRCUIT inst
.INCLUDE "./test/accelerator_test/testbench_inst.sp"

** INCLUDE TOP inst
.INCLUDE "./test/inst/Combined_inst.sp"

.END
