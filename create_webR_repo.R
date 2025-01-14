# Docker startup:
# docker run -it --rm -v ${PWD}/output:/output -w /output ghcr.io/r-wasm/webr:main R

install.packages("pak")
pak::pak("r-wasm/rwasm")

library(rwasm)

oldopt = options(
  repos = c(
         runiverse = "https://tidyverse.r-universe.dev",
		 jsonlite = 'https://jeroen.r-universe.dev',
		 data.table = 'https://rdatatable.r-universe.dev',
		 hexbin = 'https://edzer.r-universe.dev',
		 Hmisc = 'https://harrelfe.r-universe.dev',
         cloud = "https://cloud.r-project.org",
         wasm = 'https://repo.r-wasm.org'
    )
)

pak::meta_update()


# rwasm::add_pkg("resourcecode",dependencies=TRUE)
# rwasm::add_pkg("Resourcecode-project/r-resourcecodedata")
rwasm::add_pkg(c("jsonlite","dplyr","ggplot2","hexbin"), dependencies = NA)


rwasm::make_vfs_library(compress = TRUE,strip = c("demo", "doc", "examples", "help", "html", "include", "tests", "vignette"))
