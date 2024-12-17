import sys
import re
from hspiceParse import read_trace
from signalProcess import *

def is_equal(l1,l2):
	if len(l1) != len(l2):
		return False
	for l1_ele,l2_ele in zip(l1,l2):
		if l1_ele != l2_ele:
			return False
	return True

def check_sram_function(trace,voh,vol):
	GREEN = "\033[32m"
	RED = "\033[31m"
	RESET = "\033[0m"
	vih = vol+(voh-vol)*0.8
	vil = vol+(voh-vol)*0.2
	check_idx = get_signal_fall_idx(trace["v_prc"],vih)[1:]
	time = trace["TIME"]

	# simulate the sram writing and reading process
	sram = [["z"]*192]*32
	for idx in check_idx:
		try:
			sram_ren = convert_voltage_to_binary(get_signal_voltage(trace,"sram_ren",idx-1),vih,vil)
			sram_wen = convert_voltage_to_binary(get_signal_voltage(trace,"sram_wen",idx-1),vih,vil)
			sram_addr_binary = convert_voltage_to_binary_multibits(get_signal_voltage_multibits(trace,"addr",5,idx-1),vih,vil)
		except NotConvertable as e:
			print "{}Signal cannot be converted to binary at t={}\nInfo: {}".format(RED,time[idx-1],e)
			print "Maybe the period is set too small{}".format(RESET)
			exit(-1)
		sram_addr = convert_binary_to_unsigned_integer(sram_addr_binary)
		if sram_wen == 1:
			sram_write_data = convert_voltage_to_binary_multibits(get_signal_voltage_multibits(trace,"data",192,idx-1),vih,vil)
			sram[sram_addr] = sram_write_data
		elif sram_ren == 1:
			sram_read_data = convert_voltage_to_binary_multibits(get_signal_voltage_multibits(trace,"data_read",192,idx-1),vih,vil)
			if ("z" not in sram[sram_addr]) and (not is_equal(sram[sram_addr],sram_read_data)):
				print "{}Wrong data in SRAM at address={}.{}".format(RED,sram_addr,RESET)
				print "{}Correct data: {}.{}".format(GREEN,sram[sram_addr],RESET)
				print "{}Your data: {}.{}".format(RED,sram_read_data,RESET)
				exit(-1)
	print "{}SRAM function check passed!{}".format(GREEN,RESET)

if __name__ == "__main__":
	traces = read_trace(sys.argv[1])
	check_sram_function(traces,0.7,0)
