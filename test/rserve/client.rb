# gem install rserve-client

require 'rserve'

host = ARGV[1]
conn = Rserve::Connection.new(:hostname => host, :port_number => 80)
x = conn.eval('x<-rnorm(1)')
conn.close()

puts x
