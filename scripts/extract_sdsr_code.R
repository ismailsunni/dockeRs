# Get all R code from Rmds
library("knitr")
baseurl = 'https://raw.githubusercontent.com/ismailsunni/sdsr/master/'
file_names <- c(
    '01-hello.Rmd',
    '02-Spaces.Rmd',
    '03-Geometries.Rmd',
    '04-Raster-Cube.Rmd',
    '05-GeomManipulations.Rmd',
    '06-Attributes.Rmd',
    '07-ReferenceSystems.Rmd',
    '08-Plotting.Rmd',
    '09-BasePlot.Rmd',
    '10-Ggplot2.Rmd',
    '11-Interactive.Rmd',
    '12-SummarizingGeoms.Rmd',
    '13-PointPattern.Rmd',
    '14-Manipulating.Rmd',
    '15-UpDownscaling.Rmd',
    '16-Geostatistics.Rmd',
    '17-Areal.Rmd',
    '18-SpatialRegression.Rmd',
    '19-Movement.Rmd',
    '20-STModelling.Rmd',
    '30-sp-raster.Rmd'
    # '98-rbascis.Rmd',
    # '99-references.Rmd'
)
# Create temp directory
dir.create(file.path("../temp"))
# Helper function to make it easier to run
purl_rmd<- function(name, prefix=baseurl) {
    full_name <- paste0(prefix, name)
    purl(full_name, output=substr(paste0('../temp/', name), 0, nchar(paste0('../temp/', name)) - 2))   
}
# Run for all file_names
lapply(file_names, purl_rmd)

# Merge the files to one R code.
r_files <- list.files("../temp", pattern="*R$")
print(r_files)
sdsr_file <- file("../test/sdsr.R", "w")
for (i in r_files){
    x <- readLines(paste0('../temp/', i))
    writeLines(x, sdsr_file)
}
close(sdsr_file)
# Remove temp directory
unlink("../temp", recursive = TRUE)
