import sys
import re
from hspiceParse import read_trace
from signalProcess import *

GREEN = "\033[32m"
RED = "\033[31m"
YELLOW = "\033[33m"
RESET = "\033[0m"

def check_accelerator_function(trace,voh,vol):
	vih = vol+(voh-vol)*0.8
	vil = vol+(voh-vol)*0.2
	check_idx = get_signal_rise_idx(trace["v_clk"],vil)
	ready_trace = trace["v_ready"]
	time = trace["TIME"]
	ready_idx = []
	for idx in check_idx:
		if ready_trace[idx] >= vih:
			ready_idx.append(idx)
	assert len(ready_idx) >= 2
	print "{}Inference finished in {}s.{}".format(GREEN,time[ready_idx[1]]-time[ready_idx[0]],RESET)
	result_binary = convert_voltage_to_binary_multibits(get_signal_voltage_multibits(trace,"result",256,ready_idx[1]),vih,vil)
	result_int = [convert_binary_to_signed_integer(result_binary[idx:idx+4]) for idx in range(0,255,4)]
	last_layer_out = result_int[:10]
	print "{}Last layer output: {}.{}".format(GREEN,last_layer_out,RESET)
	print "{}Classification result: {}.{}".format(YELLOW,last_layer_out.index(max(last_layer_out)),RESET)

if __name__ == "__main__":
	traces = read_trace(sys.argv[1])
	check_accelerator_function(traces,0.7,0)
