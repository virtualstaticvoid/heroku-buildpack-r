#
# Example R program to installed package from local path
#

install.packages("./localpkgs/Rstem_0.4-1.tar.gz", repos=NULL, type="source")
install.packages("tm", dependencies = TRUE)
install.packages("./localpkgs/sentiment_0.2.tar.gz", repos=NULL, type="source")
