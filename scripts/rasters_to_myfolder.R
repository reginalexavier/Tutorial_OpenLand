library(raster)
library(here)


# baixando o raster multi-camada SaoLourencoBasin e torná-lo disponivel no ambiente R
url <- "https://zenodo.org/record/3685230/files/SaoLourencoBasin.rda?download=1"

temp <- tempfile()
download.file(url, temp, mode = "wb") # downloading the SaoLourencoBasin dataset
load(temp)

SaoLourencoBasin

raster::writeRaster(raster::brick(SaoLourencoBasin),
                    filename = here("raw_tif", names(SaoLourencoBasin)), 
                    format = "GTiff", 
                    datatype = 'INT1U',
                    overwrite = TRUE,
                    progress = "text",
                    bylayer = TRUE,
                    suffix = "names"
                    )


unlink(temp)
rm(SaoLourencoBasin)
