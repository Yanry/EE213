import sys
import re
from hspiceParse import read_trace
from signalProcess import *

GREEN = "\033[32m"
RED = "\033[31m"
YELLOW = "\033[33m"
RESET = "\033[0m"

def check_mac_function(trace,voh,vol):
	vih = vol+(voh-vol)*0.8
	vil = vol+(voh-vol)*0.2
	check_idx = get_signal_rise_idx(trace["v_clk"],vil)[1:]
	time = trace["TIME"]
	for idx in check_idx:
		try:
			multiplier_bits = convert_voltage_to_binary_multibits(get_signal_voltage_multibits(trace,"multiplier",48,idx-2),vih,vil)
			multiplicand_bits = convert_voltage_to_binary_multibits(get_signal_voltage_multibits(trace,"multiplicand",64,idx-2),vih,vil)
			result_bits = convert_voltage_to_binary_multibits(get_signal_voltage_multibits(trace,"result",10,idx-2),vih,vil)
		except NotConvertable as e:
			print "{}Signal cannot be converted to binary at t={}\nInfo: {}".format(RED,time[idx-2],e)
			print "Maybe the period is set too small{}".format(RESET)
			exit(-1)
		multiplier = [convert_binary_to_signed_integer(x) for x in [multiplier_bits[i:i+3] for i in range(0,48,3)]]
		multiplicand = [convert_binary_to_signed_integer(x) for x in [multiplicand_bits[i:i+4] for i in range(0,64,4)]]
		result = convert_binary_to_signed_integer(result_bits)

		# check correctness
		assert len(multiplicand) == len(multiplier)
		groundtruth = 0
		for m1,m2 in zip(multiplier,multiplicand):
			groundtruth = groundtruth + m1*m2
		if groundtruth != result:
			print "{}Wrong value at t={},groundtruth={},output={}.{}\n".format(RED,time[idx-2],groundtruth,result,RESET)
			exit(-1)
	print "{}MAC function check passed!{}".format(GREEN,RESET)

if __name__ == "__main__":
	traces = read_trace(sys.argv[1])
	check_mac_function(traces,0.7,0)