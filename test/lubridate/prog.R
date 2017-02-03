#
# Example R program
# https://cran.r-project.org/web/packages/lubridate/index.html
#

library(lubridate)

x <- ymd("2012-03-26")
am(x)
pm(x)


span <- interval(ymd("2009-01-01"), ymd("2009-08-01")) #interval
as.duration(span)
as.duration(10) # numeric
dur <- duration(hours = 10, minutes = 6)
as.numeric(dur, "hours")
as.numeric(dur, "minutes")


diff <- make_difftime(days = 31) #difftime
as.interval(diff, ymd("2009-01-01"))
as.interval(diff, ymd("2009-02-01"))
dur <- duration(days = 31) #duration
as.interval(dur, ymd("2009-01-01"))
as.interval(dur, ymd("2009-02-01"))
per <- period(months = 1) #period
as.interval(per, ymd("2009-01-01"))
as.interval(per, ymd("2009-02-01"))
as.interval(3600, ymd("2009-01-01"))

