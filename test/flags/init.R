print("Executing init.R")

print(c("BUILDPACK_DEBUG=", Sys.getenv('BUILDPACK_DEBUG', unset="--not-set--")))
print(c("PACKAGE_INSTALL_VERBOSE=", Sys.getenv('PACKAGE_INSTALL_VERBOSE', unset="--not-set--")))
