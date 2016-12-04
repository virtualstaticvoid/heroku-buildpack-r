#
# Example R program
#

library(glmnet)
data(QuickStartExample)
fit = glmnet(x, y)
print(fit)
