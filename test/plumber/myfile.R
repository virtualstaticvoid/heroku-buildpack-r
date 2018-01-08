# taken from example on https://www.rplumber.io/

#* @get /mean
normalMean <- function(samples=10){
  data <- rnorm(samples)
  mean(data)
}

#* @param a
#* @param b
#* @post /sum
addTwo <- function(a, b){
  as.numeric(a) + as.numeric(b)
}

#* @param spec
#* @get /plot
#* @png
function(spec){
  myData <- iris
  title <- "All Species"

  if (!missing(spec)){
    title <- paste0("Only the '", spec, "' Species")
    myData <- subset(iris, Species == spec)
  }

  plot(myData$Sepal.Length, myData$Petal.Length,
       main=title, xlab="Sepal Length", ylab="Petal Length")
}
