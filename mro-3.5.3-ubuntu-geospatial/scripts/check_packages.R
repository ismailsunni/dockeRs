print("Checking Spatial and SpatioTemporal packages completeness")

# Ger list of available packages
spatial_packages <- readLines("./spatial_packages.txt")
spatiotemporal_packages <- readLines("./spatiotemporal_packages.txt")

# Get current installed pcakges
installed_packages <- installed.packages()[ ,1]

spatial_not_installed <- setdiff(spatial_packages, installed_packages)
spatiotemporal_not_installed <- setdiff(spatiotemporal_packages, installed_packages)

if (length(spatial_not_installed) == 0){
    print("All Spatial R packages are installed.")
} else {
    print("Missing Spatial R packages are:")
    print(spatial_not_installed)
    spatial_number_installed = length(spatial_packages) - length(spatial_not_installed)
    print(paste("Installed packages:", spatial_number_installed))
    print(paste("Not installed packages:", length(spatial_not_installed)))
    print(paste("Total packages:", length(spatial_packages)))
    print(paste("Installed percentage:", round(spatial_number_installed / length(spatial_packages) * 10000) / 100, "%"))
}

if (length(spatiotemporal_not_installed) == 0){
    print("All SpatioTemporal  R packages are installed.")
} else {
    print("Missing SpatioTemporal R packages are:")
    print(spatiotemporal_not_installed)
    spatiotemporal_number_installed = length(spatiotemporal_packages) - length(spatiotemporal_not_installed)
    print(paste("Installed packages:", spatiotemporal_number_installed))
    print(paste("Not installed packages:", length(spatiotemporal_not_installed)))
    print(paste("Total packages:", length(spatiotemporal_packages)))
    print(paste("Installed percentage:", round(spatiotemporal_number_installed / length(spatiotemporal_packages) * 10000) / 100, "%"))
}
