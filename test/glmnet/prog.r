#
# Example R program
#

# taken from

library(glmnet)
data(QuickStartExample)
fit = glmnet(x, y)
print(fit)
