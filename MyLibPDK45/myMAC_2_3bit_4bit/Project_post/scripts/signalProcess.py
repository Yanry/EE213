class NotConvertable(Exception): 
	def __init__(self,value,vih,vil):
		self.value = value
		self.vih = vih
		self.vil = vil
	def __str__(self):
		return "value={},vih={},vil={}".format(self.value,self.vih,self.vil)

def get_signal_voltage_multibits(trace,name,bit_width,time_idx):
	value = [0]*bit_width
	for idx in range(bit_width):
		signal_name = "v_{}<{}>".format(name,idx)
		value[idx] = trace[signal_name][time_idx] 
	return value

def get_signal_voltage(trace,name,time_idx):
	signal_name = "v_{}".format(name)
	return trace[signal_name][time_idx] 

def convert_voltage_to_binary_multibits(signal,vih,vil):
	result = [0]*len(signal)
	for idx,v in enumerate(signal):
		if v >= vih:
			result[idx] = 1
		elif v <= vil:
			result[idx] = 0
		else:
			raise NotConvertable(v,vih,vil)
	return result

def convert_voltage_to_binary(v,vih,vil):
	result = 0
	if v >= vih:
		result = 1
	elif v <= vil:
		result = 0
	else:
		raise NotConvertable(v,vih,vil)
	return result

def convert_binary_to_signed_integer(binary):
	sign = binary[-1]
	if sign == 1:
		# negative number
		inv_val_str = "".join([str(1-x) for x in binary[:-1]])
		return -(int(inv_val_str[::-1],2) + 1)
	elif sign == 0:
		# positive number
		inv_val_str = "".join([str(x) for x in binary[:-1]])
		return int(inv_val_str[::-1],2)	

def convert_binary_to_unsigned_integer(binary):
	inv_val_str = "".join([str(x) for x in binary])
	return int(inv_val_str[::-1],2)

def convert_signed_integer_to_b32(i):
	# in 2's-complement
	sign = (i >=0 )
 	result = ""
	if sign:
		result = "{0:0>32b}".format(i)
	else:
		result = bin(i & 0b11111111111111111111111111111111)[2:]
	return result

def get_signal_rise_idx(signal,vil):
	rise_idx = []
	for idx in range(len(signal[:-1])):
		if signal[idx] < vil and signal[idx+1] > vil:
			rise_idx.append(idx)
	return rise_idx

def get_signal_fall_idx(signal,vih):
	fall_idx = []
	for idx in range(len(signal[:-1])):
		if signal[idx] > vih and signal[idx+1] < vih:
			fall_idx.append(idx)
	return fall_idx