import random
import sys
from signalProcess import *

def generate_random_weight(path,row_num,col_num,bit_width):
    f = open(path,"w+")
    content = []
    max_weight = 2**(bit_width-1) - 1
    min_weight = -max_weight
    for row in range(row_num):
        row_content = [random.randint(min_weight,max_weight) for i in range(col_num)]
        row_content = [convert_signed_integer_to_b32(x)[-bit_width:] for x in row_content]
        row_content = "".join(row_content) + "\n"
        content.append(row_content)
    f.writelines(content)
    f.close()
        
if __name__ == "__main__":
    assert len(sys.argv) == 5, "Usage: python rand_weight.py OUTPUT_FILE ROW_NUM COL_NUM BIT_WIDTH"
    file_path = sys.argv[1]
    row_num = int(sys.argv[2])
    col_num = int(sys.argv[3])
    bit_width = int(sys.argv[4])
    generate_random_weight(file_path,row_num,col_num,bit_width)