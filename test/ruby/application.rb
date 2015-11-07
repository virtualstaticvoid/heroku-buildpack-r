require 'sinatra'
require 'rinruby'

# root page
get '/' do

  sample_size = 10

  html = "<html>"
  html += "<head><title>R Code Test</title></head>"
  html += "<body>"

  html += "<p>Running R code...</p>"

  begin

    R.eval "x <- rnorm(#{sample_size})"
    R.eval "sdx <- sd(x)"

    html += "<p>Succeeded running R code</p>"
    html += "<pre>x = #{R.x}</pre>"
    html += "<pre>sd(x) = #{R.sdx}</pre>"

  rescue => e
    html += "<p>Failed running R code...</p>"
    html += "<p>#{e.message}</p>"
  end

  html += "</html>"

end
