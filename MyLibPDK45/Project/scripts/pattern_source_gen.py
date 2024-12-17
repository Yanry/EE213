import sys

def parse_pattern(pattern_file):
    f = open(pattern_file,"r")
    pattern_lines = f.readlines()
    pattern = []
    for line in pattern_lines:
        line = line.strip()
        if line == "":
            continue
        pattern.append(list(line))
    return pattern

class PatternSourceGenerator:
    def __init__(self,ckt_name,pattern_file,vhi="vdd_val",vlo=0,td=0,tr=0,tf=0,period="period"):
        self.ckt_name = ckt_name
        self.pattern = parse_pattern(pattern_file)
        self.vhi = vhi
        self.vlo = vlo
        self.td = td
        self.tr = tr
        self.tf = tf
        self.period = period

    def pin_list_to_str(self, pin_list):
        max_cols = 16
        pin_str = ''
        if len(pin_list) > max_cols:
            sep_pins = [pin_list[i:i+max_cols] for i in range(0, len(pin_list), max_cols)]
            pin_str_vec = [' '.join(pins) for pins in sep_pins]
            pin_str = '\n+ '.join(pin_str_vec)
        else:
            pin_str = ' '.join(pin_list)
        return pin_str

    def to_hspice_str(self, name):
        if isinstance(name,str):
            return "\'{}\'".format(name)
        return name
   
    def gen_source(self,out_file):
        # open file
        f = open(out_file,"w+")
        
        source_num = len(self.pattern[0]) 
        pattern_len = len(self.pattern)
        # write .subckt
        out_pins = ["out<{}>".format(i) for i in range(source_num)]
        pin_name = self.pin_list_to_str(out_pins)
        f.write(".subckt {} {}\n".format(self.ckt_name,pin_name))

        # write voltage source
        for idx in range(source_num):
            source_name = "vpat<{}>".format(idx)
            source_positive = "out<{}>".format(idx)
            source_pattern = "b{}".format(''.join([self.pattern[x][source_num-1-idx] for x in range(pattern_len)]))
            vhi = self.to_hspice_str(self.vhi)
            vlo = self.to_hspice_str(self.vlo)
            td = self.to_hspice_str(self.td)
            tr = self.to_hspice_str(self.tr)
            tf = self.to_hspice_str(self.tf)
            period = self.to_hspice_str(self.period)
            f.write("{} {} 0 PAT {} {} {} {} {} {} {} RB=1 R=0\n".format(source_name,source_positive,vhi,vlo,td,tr,tf,period,source_pattern))
        f.write(".ends {}\n".format(self.ckt_name))
        f.close()

if __name__=="__main__":
    assert len(sys.argv) == 4, "Usage: python pattern_source_gen.py INPUT_FILE OUTPUT_FILE CKT_NAME"
    pattern_file = sys.argv[1]
    out_file = sys.argv[2]
    ckt_name = sys.argv[3]
    gen = PatternSourceGenerator(ckt_name,pattern_file)
    gen.gen_source(out_file)
