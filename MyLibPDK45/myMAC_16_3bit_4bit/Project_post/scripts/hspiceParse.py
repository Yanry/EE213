"""
Author: Raphael Gonzalez (RAffA), Mathew Spencer
github: RaffaGonzo

Copyright 2021 Raphael Gonzalez, Mathew Spencer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""
import sys
import re

def to_float(exp):
    if "-." in exp:
        exp.replace("-.","-0.",1)
    return float(exp)


def divide_str_equal(s,n):
    str_len = len(s)
    substr_num = str_len // n
    result = []
    for i in range(substr_num-1):
        result.append(s[i*n:(i+1)*n])
    result.append(s[(substr_num-1)*n:])
    return result

def read_trace(path):
    ## Preamble part of header
    f = open(path)
    l = f.readline()  # 1st line contains string w/ # of variables
    nauto = int(l[0:4])
    nprobe = int(l[4:8])
    nsweepparam = int(l[8:12])
    l = f.readline()  # 2nd and 3rd lines are copyright and stuff
    l = f.readline()
    ndataset = int(l.split()[-1])  # 3rd line ends with the number of data sets

    ## Number and name part of header
    l = f.readline()  # 4th line+ useful, but may be wrapped
    while l.find('$&%#') == -1:
        l = l + f.readline()
    l = l.replace('\n', '')
    simparams = l.split()[:-1]  # Throw away terminator string
    datatypes = simparams[0:nauto + nprobe]  # NOTUSED
    varnames = simparams[nauto + nprobe:2 * (nauto + nprobe)]
    paramnames = simparams[2 * (nauto + nprobe):]

    # Transform varnames and paramnames
    varnames = [x.partition('(')[0] if x.startswith('x') else x for x in varnames]
    varnames = [x.replace('(', '_') for x in varnames]
    varnames = [x.replace('.', '_') for x in varnames]
    varnames = [x.replace(':', '_') for x in varnames]
    paramnames = [x.replace(':', '_') for x in paramnames]
    paramnames = ['param_' + x for x in paramnames]

    # Read data block
    lines = f.readlines()
    total_lines = len(lines)
    all_sweep_results = [""]*6*len(lines)
    start = 0
    for idx,line in enumerate(lines):
        line = line.strip()
        values = [to_float(x) for x in divide_str_equal(line,13)]
        line_len = len(values)
        all_sweep_results[start:start+line_len] = values
        start = start + line_len
        if idx % (total_lines // 10) == 0 :
            print "Reading trace file: {:.1%}".format(float(idx) / total_lines)

    f.close()
    # Store signals in a dict
    signals = {name:[] for name in varnames}
    for name_idx,name in enumerate(varnames):
        signals[name] = all_sweep_results[name_idx::len(varnames)]
    return signals

def measure_file_read(measure_file):
    """Reads a measure file and resturns a dict keyed on the names of the columns
    with values that are a list of results"""
    f = open(measure_file)
    l = f.readline().strip()  # 1st line auto generated
    param_count = int(l.split('PARAM_COUNT=')[-1].strip())
    l = f.readline().strip()  # 2nd line is the comment
    l = f.readline().strip()  # 3rd line starts var names, last is alter#
    while (l.find('alter#') == -1):
        l = l + ' ' + f.readline().strip()
    l = l.replace('#', '')
    varnames = l.split()
    varnum = len(varnames)
    measure_result = {name: [] for name in varnames}
    l = f.readline().strip()  # 4th line starts data clumps to EOF

    while l:
        vals = l.split()
        if len(vals) != varnum:  # accumulate results over multiple lines
            l = l + ' ' + f.readline().strip()
        else:  # then write to measure dict
            for name, val in zip(varnames, vals):
                if val == 'failed':  # skip over failed measures
                    val = 0  # silent failures are the best kind!
                measure_result[name].append([float(val)])  # todo that I added [] to make the lists 2D not sure if necessary
            l = f.readline().strip()
    f.close()
    return measure_result

if __name__ == "__main__":
    sigs = read_trace(sys.argv[1])