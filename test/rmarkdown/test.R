#
# Example R program
#

library('rmarkdown')

# render the test markdown file
rmarkdown::render("test.Rmd")

cat("\nSuccess\n")
