import sys


def myexec(x):
    return -x*x-5*x

x = float(sys.argv[1])
print str(myexec(x))

