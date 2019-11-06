library("sysreqs")
library("sf")
getwd()
spatial_packages <- readLines("./scripts/spatial_packages.txt")
spatiotemporal_packages <- readLines("./scripts/spatiotemporal_packages.txt")
all_packages = sort(unique(c(spatial_packages, spatiotemporal_packages)))
unused_package = c('lgcp')
all_packages = setdiff(all_packages, unused_package)
# spatial_packages
# spatiotemporal_packages

# manually set platform
platform = "linux-x86_64-ubuntu-gcc"

# dep <- sysreqs(desc = file.path(path.package(package = "sf"), "DESCRIPTION"), platform=platform)
# Initialization
all_deps = c()
failed_packages = c()
i = 0
for (p in all_packages){
    i = i + 1
    print(paste0("[",  i, "/", length(all_packages), "] ", p))
    tryCatch(
        {
            library(p, character.only=TRUE)
            dep <- sysreqs(desc = file.path(path.package(package = p), "DESCRIPTION"), platform=platform)
            print(paste0("Number of dep: ", length(dep)))
            print(paste0("Number of unique dep: ", length(unique(dep))))
            # print(sort(dep))
            all_deps <- c(all_deps, dep)
            # print(all_deps)
        },
        error=function(error_message) {
            # message("This is my custom message.")
            message("And below is the error message from R:")
            message(error_message)
            failed_packages = c(failed_packages, p)
            return(NA)
        }
    )
    if (i %% 10 == 0){
        # Write result cache here
        print("Writing cache")
        all_deps <- sort(unique(all_deps))
        dep_file_cache <- file(paste0("./scripts/", platform, "deps-cache.txt"))
        writeLines(all_deps, dep_file_cache)
        close(dep_file_cache)

        # Failed packages
        if (length(failed_packages) > 0){
            failed_packages_file <- file(paste0("./scripts/", platform, "failed-packages.txt"))
            writeLines(failed_packages, failed_packages_file)
            close(failed_packages_file)
        } else {
            print("No failed packages till now")
        }
    }
    
}
all_deps <- sort(unique(all_deps))
print(paste0("Total dep : ", length(all_deps)))

# print(all_deps)
# Write list of package to file, for history
dep_file <- file(paste0("./scripts/", platform, "deps.txt"))
writeLines(all_deps, dep_file)
close(dep_file)