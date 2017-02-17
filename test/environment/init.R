#
# Illustrates getting environment variables at slug compilation time
#

myvar1 <- Sys.getenv('MYVAR1')
myvar2 <- Sys.getenv('MYVAR2')

print(paste("MYVAR1=", myvar1))
print(paste("MYVAR2=", myvar2))
