import sys

def parse(s0, l0, v0):
    with open('config.json', 'r') as fin:
	list = fin.readlines()
    with open('config.json', 'w') as fout:
        for i in range(1, len(list)):
	    if 's0' in list[i]:
	        list[i] = '\t\"s0\": \"' + s0 + '\",\n'
	    if 'l0' in list[i]:
                list[i] = '\t\"l0\": \"' + l0 + '\",\n'
	    if 'v0' in list[i]:
                list[i] = '\t\"v0\": \"' + v0 + '\",\n'
            fout.write(list[i])
    
def analyze_log():
    with open() as flog:
	rob = sys.maxint
	for line in flog.readlines():
	    if line.startwith('p'):
		continue
	    else:
	        path = line.strip().split(',')
	        t = max(abs( float(path[2])-90)-4, abs(float(path[1]) -6.3)-12)
		if t < rob:
		    rob = t
    print rob


s0 = sys.argv[1]
l0 = sys.argv[2]
v0 = sys.argv[3]

parse(s0, l0, v0)
command = 'timeout `expr 20 + 10` wine64 ./dynamic_cost.exe 20 C'
os.system(command)
analyze_log()
