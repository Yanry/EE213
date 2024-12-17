import random
import sys

def generate_random_input(path,row_num,col_num,bit_width):
    f = open(path,"w+")
    content = []
    for row in range(row_num):
        row_content = [str(random.randint(0,1)) for i in range(col_num*bit_width)]
        row_content = "".join(row_content) + "\n"
        content.append(row_content)
    f.writelines(content)
    f.close()
        
if __name__ == "__main__":
    assert len(sys.argv) == 5, "Usage: python rand_input.py OUTPUT_FILE ROW_NUM COL_NUM BIT_WIDTH"
    file_path = sys.argv[1]
    row_num = int(sys.argv[2])
    col_num = int(sys.argv[3])
    bit_width = int(sys.argv[4])
    generate_random_input(file_path,row_num,col_num,bit_width)