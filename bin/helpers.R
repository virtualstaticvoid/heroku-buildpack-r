helpers.installPackages <- function(...) {
  package_list <- c(...)
  install_if_missing = function(p) {
    if (p %in% rownames(installed.packages()) == FALSE) {
      install.packages(p, clean=TRUE)
    }
    else {
      cat(paste("Skipping already installed package:", p, "\n"))
    }
  }
  invisible(sapply(package_list, install_if_missing))
}
