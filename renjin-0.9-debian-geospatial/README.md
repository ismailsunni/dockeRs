# Renjin 0.9 on Debian with R Geospatial Packages

Currently, it is not possible to install geospatial packages. For example:

1. `sf`
   - Not possible to install.
   - Status: http://packages.renjin.org/package/org.renjin.cran/sf
   - Problem
     ```
     This package cannot yet be used with Renjin it depends on other packages which are not available: units 0.6-3
     ```
2. `raster`
   - This package cannot yet be used with Renjin because there was a problem building the package using Renjin's toolchain.
   - Status: http://packages.renjin.org/package/org.renjin.cran/raster
   - Older version is compatible, but 70 of 169 tests are failed. See: http://packages.renjin.org/package/org.renjin.cran/raster/2.6-7

3. `sp`
    - This package can be loaded by Renjin but 29 out 65 tests failed.
    - Status: http://packages.renjin.org/package/org.renjin.cran/sp
