import sys

class RomGenerator:
    inv_netlist = ".subckt xrom_weight_inv a z s=1\n" + \
                  "m1 z a vdd! vdd! PMOS_VTL L=50e-9 W='s*180e-9'\n" + \
                  "m0 z a 0 0 NMOS_VTL L=50e-9 W='s*90e-9'\n" + \
                  ".ends\n"

    and_netlist = ".subckt xrom_weight_and a b out s=1\n" + \
                   "m1 net16 a 0 0 NMOS_VTL L=50e-9 W='s*90e-9'\n" + \
                   "m0 z b net16 0 NMOS_VTL L=50e-9 W='s*90e-9'\n" + \
                   "m3 z b vdd! vdd! PMOS_VTL L=50e-9 W='s*90e-9'\n" + \
                   "m4 z a vdd! vdd! PMOS_VTL L=50e-9 W='s*90e-9'\n" + \
                   "xinv z out xrom_weight_inv\n" + \
                   ".ends\n"

    def __init__(self, in_file_name, out_file_name):
        self.input_file_name = in_file_name
        self.output_file_name = out_file_name
        self.col_num = 3*64
        self.addr_width = 5
        self.row_num = 2 ** self.addr_width
        self.vdd_name = "vdd!"
        self.gnd_name = "0"
        self.rom_content = [[False] * self.col_num for _ in range(self.row_num)]
    
    def write_netlist(self, content):
        content += '\n'
        max_cols = 16
        self.netlist_file.write(content)

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

    def add_resistor(self, t1, t2, res, id):
        res_str = "R{} {} {} {}".format(id, t1, t2, res)
        self.write_netlist(res_str)

    def add_nmos_inst(self, drain, gate, source, body, size, id):
        pin_str = "{} {} {} {}".format(drain, gate, source, body)
        nmos_str = "mn{} {} NMOS_VTL L=50e-9 W='{}*90e-9'".format(id, pin_str, size)
        self.write_netlist(nmos_str)

    def add_pmos_inst(self, drain, gate, source, body, size, id):
        pin_str = "{} {} {} {}".format(drain, gate, source, body)
        pmos_str = "mp{} {} PMOS_VTL L=50e-9 W='{}*90e-9'".format(id, pin_str, size)
        self.write_netlist(pmos_str)

    def add_inv_inst(self, in_pin, out_pin, size, id):
        pin_str = "{} {}".format(in_pin, out_pin)
        inv_str = "xrom_inv{} {} xrom_weight_inv s={}".format(id, pin_str, size)
        self.write_netlist(inv_str)
    
    def add_and_inst(self, a, b, out, size, id):
        pin_str = "{} {} {}".format(a, b, out)
        and_str = "xrom_and{} {} xrom_weight_and s={}".format(id, pin_str, size)
        self.write_netlist(and_str)
    
    def build_and_tree(self, node_out, node_in):
        if len(node_in) == 1:
            self.write_netlist("v_{} {} {} DC=0".format(node_out, node_out, node_in[0]))
        elif len(node_in) == 2:
            self.add_and_inst(node_in[0], node_in[1], node_out, 1, self.and_count)
            self.and_count += 1
        else:
            left_pin = "and{}_left_in".format(self.and_count)
            right_pin = "and{}_right_in".format(self.and_count)
            self.add_and_inst(left_pin, right_pin, node_out, 1, self.and_count)
            self.and_count += 1
            mid_idx = len(node_in) // 2
            self.build_and_tree(left_pin, node_in[:mid_idx])
            self.build_and_tree(right_pin, node_in[mid_idx:])

    def gen_and_tree(self):
        in_pin_list = ['a<{}>'.format(i) for i in range(self.addr_width)]
        out_pin_list = ['out']
        pin_str = self.pin_list_to_str(in_pin_list + out_pin_list)
        
        self.write_netlist(".subckt xrom_weight_and_tree {}".format(pin_str))
        self.and_count = 0
        self.build_and_tree('out', in_pin_list)
        self.write_netlist(".ends\n")
        return
    
    def add_and_tree_inst(self, in_list, out, id):
        pin_list = in_list + [out]
        pin_str = self.pin_list_to_str(pin_list)
        self.write_netlist("xrom_and_tree{} {} xrom_weight_and_tree".format(id, pin_str))
    
    def generate_basics(self):
        self.write_netlist(RomGenerator.inv_netlist)
        self.write_netlist(RomGenerator.and_netlist)
        self.gen_and_tree()
        return
    
    def generate_decoder(self):
        in_pin_list = ['a<{}>'.format(i) for i in range(self.addr_width)]
        out_pin_list = ['q<{}>'.format(i) for i in range(self.row_num)]
        pin_str = self.pin_list_to_str(in_pin_list + out_pin_list)
        self.write_netlist(".subckt xrom_weight_dec {}".format(pin_str))

        # Generate Inverse of Input
        for i in range(self.addr_width):
            self.add_inv_inst("a<{}>".format(i), "a_inv<{}>".format(i), 2, i)
        
        for row_idx in range(self.row_num):
            node_in = []
            idx_binary = format(row_idx, "0{}b".format(self.addr_width))
            idx_binary = idx_binary[::-1]
            for i in range(self.addr_width):
                if idx_binary[i] == '1':
                    node_in.append("a<{}>".format(i))
                else:
                    node_in.append("a_inv<{}>".format(i))
            self.add_and_tree_inst(node_in, 'q<{}>'.format(row_idx), row_idx)
        
        self.write_netlist(".ends\n")

    def generate_array(self):
        # Pin List
        in_pin_list = ['sel<{}>'.format(i) for i in range(self.row_num)]
        out_pin_list = ['out<{}>'.format(i) for i in range(self.col_num)]
        pin_str = self.pin_list_to_str(in_pin_list + out_pin_list)
        
        self.write_netlist(".subckt xrom_weight_array {}".format(pin_str))
        
        # Add Pull-Up Resistor
        for i in range(self.col_num):
            self.add_resistor(self.vdd_name, "col<{}>".format(i), 310000, i)
        
        # Bit Array
        for row_idx in range(self.row_num):
            for col_idx in range(self.col_num):
                content_col_idx = self.col_num - 1 - col_idx
                if self.rom_content[row_idx][content_col_idx]:
                    self.add_nmos_inst(
                        drain = "col<{}>".format(col_idx), 
                        gate = "sel<{}>".format(row_idx), 
                        source = self.gnd_name, 
                        body = self.gnd_name,
                        size = 1,
                        id = row_idx * self.col_num + col_idx
                    )
        # Output Buffer
        for i in range(self.col_num):
            self.add_inv_inst("col<{}>".format(i), "out<{}>".format(i), 1, i)

        self.write_netlist(".ends\n")
        return

    def read_content_file(self):
        lines = self.content_file.readlines()
        # Read Rom Content From txt File
        row_count = 0
        for frow_idx, raw_data_row in enumerate(lines):
            if row_count >= self.row_num: break
            col_count = 0
	    # Skip Blank line
            if not raw_data_row.strip():
		continue
            for fcol_idx, raw_data in enumerate(raw_data_row):
                if col_count >= self.col_num:
                    row_count += 1
                    break
                elif raw_data == '1':
                    self.rom_content[row_count][col_count] = True
                    col_count += 1
                elif raw_data == '0':
                    self.rom_content[row_count][col_count] = False
                    col_count += 1
                elif raw_data == '#' or raw_data == '\n' or raw_data == '':
                    if col_count > 0: row_count += 1
                    break
                elif raw_data == '_' or raw_data == ' ':
                    continue
                else:
                    print()
                    error_mesg = "Unsupported Character, line {} column {}!".format(frow_idx, fcol_idx)
		    print(raw_data)
                    print(error_mesg)
                    assert False
        self.total_inst_num = row_count

    def generate_rom(self):
        self.content_file = open(self.input_file_name, 'r')
        self.netlist_file = open(self.output_file_name, 'w')
        
        # Read Rom Content
        self.read_content_file()
        # generate subcircuits
        self.generate_basics()
        self.generate_decoder()
        self.generate_array()

        # generate toplevel circuits
        in_pin_list = ['addr<{}>'.format(i) for i in range(self.addr_width)]
        out_pin_list = ['weight<{}>'.format(i) for i in range(self.col_num)]
        word_line_list = ['wl<{}>'.format(i) for i in range(self.row_num)]

        pin_str = self.pin_list_to_str(in_pin_list + out_pin_list)
        self.write_netlist(".subckt xrom_weight {}".format(pin_str))

        dec_pin_str = self.pin_list_to_str(in_pin_list + word_line_list)
        array_pin_str = self.pin_list_to_str(word_line_list + out_pin_list)
        self.write_netlist("xrom_dec_inst {} xrom_weight_dec".format(dec_pin_str))
        self.write_netlist("xrom_array_inst {} xrom_weight_array".format(array_pin_str))
        self.write_netlist(".ends\n")

        # Close Files Opened
        self.content_file.close()
        self.netlist_file.close()
        return

if __name__ == "__main__":
    assert len(sys.argv) == 3, "Usage: python3 weight_rom_gen.py INPUT_FILE OUTPUT_FILE"
    infile_name = sys.argv[1]
    outfile_name = sys.argv[2]
    rom_gen = RomGenerator(infile_name, outfile_name)
    rom_gen.generate_rom()
    print(rom_gen.total_inst_num)

