# pip install pyRserve

import pyRserve
import sys

host = sys.argv[1]
port = 80

if len(sys.argv) > 2:
	port = sys.argv[2]

conn = pyRserve.connect(host=host, port=int(port))
x = conn.eval('x <- rnorm(1)')
print(x)

conn.close()
