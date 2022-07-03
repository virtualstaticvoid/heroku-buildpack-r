verbose <- Sys.getenv('PACKAGE_INSTALL_VERBOSE', unset="0")
helpers.installPackages <- function(...) {
  package_list <- c(...)
  install_if_missing = function(p) {
    if (p %in% rownames(installed.packages()) == FALSE) {
      cat(paste("Installing", p, "...\n"))
      install.packages(p, clean=TRUE, quiet=(verbose != "1"))
    }
    else {
      cat(paste("Skipping already installed package:", p, "\n"))
    }
  }
  invisible(sapply(package_list, install_if_missing))
}
