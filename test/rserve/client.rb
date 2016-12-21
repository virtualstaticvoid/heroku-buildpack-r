# gem install rserve-client

require 'rserve'

host = ARGV[0]
port = ARGV[1] || 80

conn = Rserve::Connection.new(:hostname => host, :port_number => port)
x = conn.eval('x <- rnorm(1)')
puts x.to_f

conn.close()
