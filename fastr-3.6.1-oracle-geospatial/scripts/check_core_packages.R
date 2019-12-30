print("Checking Spatial and SpatioTemporal CORE packages completeness")

# Ger list of available packages
core_spatial_packages <- readLines("./core_spatial_packages.txt")
core_spatiotemporal_packages <- readLines("./core_spatiotemporal_packages.txt")

# Get current installed pcakges
installed_packages <- installed.packages()[ ,1]

core_spatial_not_installed <- setdiff(core_spatial_packages, installed_packages)
core_spatiotemporal_not_installed <- setdiff(core_spatiotemporal_packages, installed_packages)

if (length(core_spatial_not_installed) == 0){
    print("All Spatial R Core packages are installed.")
} else {
    print("Missing Spatial R Core packages are:")
    print(core_spatial_not_installed)
}

core_spatial_number_installed = length(core_spatial_packages) - length(core_spatial_not_installed)
print(paste("Installed core packages:", core_spatial_number_installed))
print(paste("Not installed core packages:", length(core_spatial_not_installed)))
print(paste("Total core packages:", length(core_spatial_packages)))
print(paste("Installed core percentage:", round(core_spatial_number_installed / length(core_spatial_packages) * 10000) / 100, "%"))

print("")

if (length(core_spatiotemporal_not_installed) == 0){
    print("All SpatioTemporal  R Core packages are installed.")
} else {
    print("Missing SpatioTemporal R Core packages are:")
    print(spatiotemporal_not_installed)
}

core_spatiotemporal_number_installed = length(core_spatiotemporal_packages) - length(core_spatiotemporal_not_installed)
print(paste("Installed core packages:", core_spatiotemporal_number_installed))
print(paste("Not installed core packages:", length(core_spatiotemporal_not_installed)))
print(paste("Total core packages:", length(core_spatiotemporal_packages)))
print(paste("Installed core percentage:", round(core_spatiotemporal_number_installed / length(core_spatiotemporal_packages) * 10000) / 100, "%"))
