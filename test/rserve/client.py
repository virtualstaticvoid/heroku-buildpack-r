# pip install pyRserve

import pyRserve
import sys

host = sys.argv[1:][0]
conn = pyRserve.connect(host=host, port=80)
x = conn.eval('x<-rnorm(1)')
conn.close()

print(x)
