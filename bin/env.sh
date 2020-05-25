# set path for testing within docker container
export PATH="/app/R/lib/R/bin:/app/tcltk/bin:/app/pandoc/bin:$PATH"

# resolve R libs
export LD_LIBRARY_PATH="/app/R/lib/R/lib:/app/tcltk/lib"

# set user site library
export R_LIBS_USER="/app/R/site-library"

# path for pandoc
export RSTUDIO_PANDOC=/app/pandoc/bin

# default language
export LANG=${LANG:-C.UTF-8}

# default timezone
export TZ=${TZ:-UTC}

# metadata
