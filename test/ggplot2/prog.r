#
# Example R program
#

# example from http://www.cookbook-r.com/Graphs/Bar_and_line_graphs_(ggplot2)/

library(ggplot2)

dataframe <- data.frame(time=factor(c("Lunch", "Dinner"), levels = c("Lunch", "Dinner")), total_bill = c(14.89, 17.23))

plot = ggplot(data=dataframe, aes(x=time, y=total_bill)) + geom_bar(stat="identity")

filename <- tempfile(fileext='.png')

ggsave(filename=filename, height=5, width=15, type="cairo", plot)

# TODO: store output file somewhere persistent. E.g. S3

print(filename)
