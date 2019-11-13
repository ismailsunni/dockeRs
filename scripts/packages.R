# Get list of packages from Spatial and SpatioTemporal view
# Load needed library
library("ctv")
setwd("/home/ismailsunni/dev/docker/dockeRs/scripts")

print("Get Spatial and SpatioTemporal packages list")
# 
# Get list of available packages
spatial_packages <- ctv:::.get_pkgs_from_ctv_or_repos("Spatial")[[1]]
spatiotemporal_packages <- ctv:::.get_pkgs_from_ctv_or_repos("SpatioTemporal")[[1]]

# Write list of package to file, for history
spatial_file <- file("spatial_packages.txt")
writeLines(spatial_packages, spatial_file)
close(spatial_file)

spatiotemporal_file <- file("spatiotemporal_packages.txt")
writeLines(spatiotemporal_packages, spatiotemporal_file)
close(spatiotemporal_file)
