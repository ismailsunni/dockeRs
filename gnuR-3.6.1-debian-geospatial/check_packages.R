# Load needed library
library("ctv")

print("Checking Spatial and SpatioTemporal packages completeness")

# Ger list of available packages
spatial_packages <- ctv:::.get_pkgs_from_ctv_or_repos("Spatial")[[1]]
spatiotemporal_packages <- ctv:::.get_pkgs_from_ctv_or_repos("SpatioTemporal")[[1]]

# Get current installed pcakges
installed_packages <- installed.packages()[ ,1]

spatial_not_installed <- setdiff(spatial_packages, installed_packages)
spatiotemporal_not_installed <- setdiff(spatiotemporal_packages, installed_packages)

if (length(spatial_not_installed) == 0){
    print("All Spatial R packages are installed.")
} else {
    print("Missing Spatial R packages are: .")
    print(spatial_not_installed)
}

if (length(spatiotemporal_not_installed) == 0){
    print("All SpatioTemporal  R packages are installed.")
} else {
    print("Missing SpatioTemporal R packages are:")
    print(spatiotemporal_not_installed)
}
