FUNC_TEST_DIR := ./test/functional_test
ACCE_TEST_DIR := ./test/accelerator_test
SCRIPTS_DIR := ./scripts
HSPICE_FLAG := -hpp -mt 4

GREEN := \e[32m
RED := \e[31m
RESET := \e[0m

VERBOSE := 0
ifeq ($(VERBOSE),1)
	HSPICE_FLAG := $(HSPICE_FLAG) -d
endif

# SRAM test
sram_check: $(FUNC_TEST_DIR)/SRAM_sim/simfiles/sim.tr0
	@echo -e "$(GREEN)Check SRAM functionality...$(RESET)"
	@python $(SCRIPTS_DIR)/check_sram_function.py $(FUNC_TEST_DIR)/SRAM_sim/simfiles/sim.tr0

$(FUNC_TEST_DIR)/SRAM_sim/simfiles/sim.tr0 sram_sim:
	@echo -e "$(GREEN)Generate test source...$(RESET)"
	@python $(SCRIPTS_DIR)/rand_input.py $(FUNC_TEST_DIR)/SRAM_sim/test.txt 32 64 3
	@python $(SCRIPTS_DIR)/pattern_source_gen.py $(FUNC_TEST_DIR)/SRAM_sim/test.txt $(FUNC_TEST_DIR)/SRAM_sim/test_source.sp input_src
	@echo -e "$(GREEN)Running SRAM simulation...$(RESET)"
	@hspice -i $(FUNC_TEST_DIR)/SRAM_sim/sram_sim.sp -o $(FUNC_TEST_DIR)/SRAM_sim/simfiles/sim $(HSPICE_FLAG)

# MAC test
mac_check: $(FUNC_TEST_DIR)/MAC_sim/simfiles/sim.tr0
	@echo -e "$(GREEN)Check MAC functionality...$(RESET)"
	@python $(SCRIPTS_DIR)/check_mac_function.py $(FUNC_TEST_DIR)/MAC_sim/simfiles/sim.tr0

$(FUNC_TEST_DIR)/MAC_sim/simfiles/sim.tr0 mac_sim:
	@echo -e "$(GREEN)Generate test source...$(RESET)"
	@python $(SCRIPTS_DIR)/rand_weight.py $(FUNC_TEST_DIR)/MAC_sim/test_multiplier.txt 2 2 3
	@python $(SCRIPTS_DIR)/rand_input.py $(FUNC_TEST_DIR)/MAC_sim/test_multiplicand.txt 2 2 4
	@python $(SCRIPTS_DIR)/pattern_source_gen.py $(FUNC_TEST_DIR)/MAC_sim/test_multiplier.txt $(FUNC_TEST_DIR)/MAC_sim/test_source_multiplier.sp multiplier_src
	@python $(SCRIPTS_DIR)/pattern_source_gen.py $(FUNC_TEST_DIR)/MAC_sim/test_multiplicand.txt $(FUNC_TEST_DIR)/MAC_sim/test_source_multiplicand.sp multiplicand_src
	@echo -e "$(GREEN)Running MAC simulation...$(RESET)"
	@hspice -i $(FUNC_TEST_DIR)/MAC_sim/mac_sim.sp -o $(FUNC_TEST_DIR)/MAC_sim/simfiles/sim $(HSPICE_FLAG)

# Accelerator test
accelerator_check: $(ACCE_TEST_DIR)/simfiles/sim.tr0
	@echo -e "$(GREEN)Check accelerator functionality...$(RESET)"
	@python $(SCRIPTS_DIR)/check_accelerator_function.py $(ACCE_TEST_DIR)/simfiles/sim.tr0

$(ACCE_TEST_DIR)/simfiles/sim.tr0 accelerator_sim:
	@echo -e "$(GREEN)Running accelerator simulation$(RESET)"
	@hspice -i $(ACCE_TEST_DIR)/sim.sp -o $(ACCE_TEST_DIR)/simfiles/sim $(HSPICE_FLAG)

# Clean simulation files
clean:
	@rm $(FUNC_TEST_DIR)/SRAM_sim/simfiles/*.*
	@rm $(FUNC_TEST_DIR)/MAC_sim/simfiles/*.*
	@rm $(ACCE_TEST_DIR)/simfiles/*.*
