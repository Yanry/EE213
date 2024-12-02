import sys
import re

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

def extract_delay(trace,t_start,t_step,t_end,period,voh,vol):
	time_interval_idx = [0]
	interval_idx = 0
	green = "\033[32m"
	reset = "\033[0m"
	for idx,time in enumerate(trace["TIME"]):
		if time >= (interval_idx + 1) * period:
			time_interval_idx.append(idx)
			interval_idx = interval_idx + 1
		if time > t_end:
			break
	# extract the delay by finding the last time step in an interval that signal "s" pass through (voh+vol)/2	
	max_delay = 0
	for i in range(len(time_interval_idx)-1):
		interval_start_idx = time_interval_idx[i]
		interval_end_idx = time_interval_idx[i+1]
		pass_through_voltage = (voh+vol)/2
		interval_delay = 0
		for s_idx in range(6):
			signal_name = "v(s<{}>)".format(s_idx)
			signal_delay = 0
			for t_idx in range(interval_start_idx,interval_end_idx-1,1):
				cur_voltage = trace[signal_name][t_idx]
				next_voltage = trace[signal_name][t_idx+1]
				if (cur_voltage-pass_through_voltage)*(next_voltage-pass_through_voltage) <= 0:
					# linear interpolation
					p = abs(cur_voltage-pass_through_voltage) / abs(cur_voltage-next_voltage)
					signal_delay = p*trace["TIME"][t_idx+1] + (1-p)*trace["TIME"][t_idx] - trace["TIME"][interval_start_idx]
			interval_delay = max(signal_delay,interval_delay)
		max_delay = max(interval_delay,max_delay)
	print "{}Maximum Delay:{}{}".format(green,max_delay,reset)

monitor_signals = ("v(s<0>)","v(s<1>)","v(s<2>)","v(s<3>)","v(s<4>)","v(s<5>)","v(a<0>)","v(a<1>)","v(a<2>)","v(a<3>)","v(b<0>)","v(b<1>)","v(b<2>)")
trace = read_trace(sys.argv[1],monitor_signals)
extract_delay(trace,0,1e-12,128e-9,1e-9,0.7,0)
