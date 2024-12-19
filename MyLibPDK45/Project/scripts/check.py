import sys

if __name__ == "__main__":
	print(sys.argv[0])
	f = open(sys.argv[1])
	l = f.readline()  # 1st line contains string w/ # of variables
	l = f.readline()
	l = f.readline()
	l = f.readline()
	print(l[0:4])