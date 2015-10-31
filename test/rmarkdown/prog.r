#
# Example R program
#

library('rmarkdown')

# render the test markdown file
rmarkdown::render("/app/test.Rmd")

# upload the output file so it can be picked up
# ...
