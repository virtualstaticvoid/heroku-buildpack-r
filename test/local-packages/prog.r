#
# Example R program
#

library("Rnlminb2")

# Feasible Start Solution:
start = c(10, 10)

# Objective Function: x^2 + y^2
fun <- function(x) sum(x^2)

# Bounds: -100 <= x,y <= 100
par.lower = c(-100, -100)
par.upper = c(100, 100)

# Equality Constraints: x*y = 2
eqFun <- list(
 function(x) x[1]*x[2])
eqFun.bound = 2

# Solution: x = c(sqrt(2), sqrt(2)), f(x) = 4
result <- nlminb2NLP(
  par = start,
  fun = fun,
  par.lower = par.lower,
  par.upper = par.upper,
  eqFun = eqFun,
  eqFun.bound = eqFun.bound
)

print(result)
