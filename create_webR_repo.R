# Docker startup:
# docker run -it --rm -v ${PWD}/output:/output -w /output ghcr.io/r-wasm/webr:main R

install.packages("pak")
pak::pak("r-wasm/rwasm")

library(rwasm)

oldopt = options(
  repos = c(
         CRAN = "https://cran.rstudio.com",
         packman = "https://packagemanager.posit.co/cran/__linux__/noble/latest",
         runiverse = "https://resourcecode-project.r-universe.dev",
         cloud = "https://cloud.r-project.org",
         wasm = 'https://repo.r-wasm.org'
    )
)

pak::meta_update()


rwasm::add_pkg("resourcecode",dependencies=TRUE)
rwasm::add_pkg("Resourcecode-project/r-resourcecodedata")
rwasm::add_pkg("ggplot2")
rwasm::add_pkg("hexbin")
rwasm::add_pkg("openair")

rwasm::make_vfs_library(compress = TRUE,strip = c("demo, doc, examples, help, html, include, tests, vignette"))
