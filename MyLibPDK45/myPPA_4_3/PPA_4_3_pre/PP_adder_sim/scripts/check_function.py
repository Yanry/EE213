import sys
import re

class NotConvertable(Exception):
	def __init__(self):
		pass
	def __str__(self):
		return ""

def to_float(exp):
	sign = 1
	if exp[0] == "-":
		sign = -1
	exponetial = int(exp[-3:])
	base = float("0"+exp[1:-4])
	return sign*base*10**exponetial

def read_trace(path,signals):
	total_signal_num = 0
	monitor_signal_idx_to_name = {}
	monitor_trace = {}
	with open(path,'r') as f:
		data = f.readlines()
	status = 0 # 0:read_header, 1:read_signal_name, 2:read_signal
	cur_signal_idx = 0
	count = 0
	for idx,line in enumerate(data):
		line =" ".join(line.split()).split()
		if status == 0:
			if line[0] == "TIME":
				status = 1
		if status == 1:
			for signal_name in line:
				# preprocess
				if signal_name != "TIME":
					signal_name = signal_name + ")"
				if signal_name == "TIME" or signal_name in signals:
					monitor_trace[signal_name] = []
					monitor_signal_idx_to_name[cur_signal_idx] = signal_name
				if "$&%#" in signal_name:
					# end of signal name
					status = 2
					total_signal_num = cur_signal_idx
					break
				cur_signal_idx = cur_signal_idx + 1;
		elif status == 2:
			# read signal value
			pattern = re.compile("[0|-]\.\d+E[\+|-]\d\d")
			values = pattern.findall(line[0])
			for v in values:
				if count in monitor_signal_idx_to_name.keys():
					monitor_trace[monitor_signal_idx_to_name[count]].append(to_float(v))
				count = count + 1
				if count >= total_signal_num:
					count = 0	
	return monitor_trace				

def get_signal_voltage(trace,name,bit_width,time_idx):
	value = [0]*bit_width
	for idx in range(bit_width):
		signal_name = "v({}<{}>)".format(name,idx)
		value[idx] = trace[signal_name][time_idx] 
	return value

def convert_voltage_to_binary(signal,vih,vil):
	result = [0]*len(signal)
	for idx,v in enumerate(signal):
		if v >= vih:
			result[idx] = 1
		elif v <= vil:
			result[idx] = 0
		else:
			print "value={}, vih={}, vil={}".format(v,vih,vil)
			raise NotConvertable
	return result

def convert_binary_to_integer(binary):
	sign = binary[-1]
	if sign == 1:
		# negative number
		inv_val_str = "".join([str(1-x) for x in binary[:-1]])
		return -(int(inv_val_str[::-1],2) + 1)
	elif sign == 0:
		# positive number
		inv_val_str = "".join([str(x) for x in binary[:-1]])
		return int(inv_val_str[::-1],2)	

def check_function(trace,t_start,t_step,t_end,period,vih,vil):
	time_interval_idx = [0]
	interval_idx = 0
	green = "\033[32m"
	red = "\033[31m"
	reset = "\033[0m"
	for idx,time in enumerate(trace["TIME"]):
		if time >= (interval_idx + 1) * period:
			time_interval_idx.append(idx)
			interval_idx = interval_idx + 1
		if time > t_end:
			break
	for t_idx in time_interval_idx[1:]:
		try:
			a = convert_voltage_to_binary(get_signal_voltage(trace,"a",4,t_idx-1),vil+(vih-vil)*0.85,vil+(vih-vil)*0.15)
			b = convert_voltage_to_binary(get_signal_voltage(trace,"b",3,t_idx-1),vil+(vih-vil)*0.85,vil+(vih-vil)*0.15)
			s = convert_voltage_to_binary(get_signal_voltage(trace,"s",6,t_idx-1),vil+(vih-vil)*0.85,vil+(vih-vil)*0.15)
		except NotConvertable:
			print "{}Faild to convert signal to binary at t={}, please check the function of your module{}".format(red,trace["TIME"][t_idx-1],reset)
			exit()
				
		int_a = convert_binary_to_integer(a)
		int_b = convert_binary_to_integer(b)
		int_s = convert_binary_to_integer(s)
		if int_a * int_b != int_s:
			print "{}Incorrect answer at t={}, a={}({}), b={}({}), s={}({}){}".format(red,trace["TIME"][t_idx-1],int_a,a,int_b,b,int_s,s,reset)
		else:
			#print "{}Correct answer at t={}, a={}({}), b={}({}), s={}({}){}".format(green,trace["TIME"][t_idx-1],int_a,a,int_b,b,int_s,s,reset)
			pass
		
monitor_signals = ("v(s<0>)","v(s<1>)","v(s<2>)","v(s<3>)","v(s<4>)","v(s<5>)","v(a<0>)","v(a<1>)","v(a<2>)","v(a<3>)","v(b<0>)","v(b<1>)","v(b<2>)")
traces = read_trace(sys.argv[1],monitor_signals)
check_function(traces,0,1e-12,128e-9,1e-9,0.7,0)
