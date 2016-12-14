require 'sinatra'
require 'fileutils'

# prevent RinRuby from attempting to initialize, as
# the R executable needs to be overriddden
# see https://github.com/virtualstaticvoid/rinruby/blob/master/lib/rinruby.rb#L789
R = :nil

require 'rinruby'

# initialize R interface, setting the "chroot" executable for R
RInterface = RinRuby.new(:executable => "fakechroot fakeroot chroot /app/.root /usr/bin/R")

# root page
get '/' do

  sample_size = 10

  html = "<html>"
  html += "<head><title>R Code Test From A Ruby Sinatra Web Application</title></head>"
  html += "<body>"

  html += "<p>Running R code...</p>"

  begin

    RInterface.eval "x <- rnorm(#{sample_size})"
    RInterface.eval "sdx <- sd(x)"

    html += "<p>Succeeded running R code</p>"
    html += "<pre>x = #{RInterface.x}</pre>"
    html += "<pre>sd(x) = #{RInterface.sdx}</pre>"
    html += "<img src=\"plot.png\"></img>"

  rescue => e
    html += "<p>Failed running R code...</p>"
    html += "<p>#{e.message}</p>"
  end

  html += "</html>"

end

get '/plot.png' do

  file = Tempfile.new('plot')
  filename = File.basename(file.path)

  # small issue here, since R is running within the chroot
  # the file paths will be different, so a mapping between
  # the host and the chroot is required, using a symlink
  # into the chroot will work
  FileUtils.ln_s(file.path, "/app/.root/app/#{filename}")

  code = <<-RCODE
    png("/app/#{filename}", width=600, height=600)
    plot(1:5,1:5)
    dev.off()
  RCODE
  RInterface.eval(code)

  send_file file.path, :type => :png

  file.close
  file.unlink

end
