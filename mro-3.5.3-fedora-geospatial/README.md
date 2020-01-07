# MRO 3.5.3 on Fedora with Geospatial packages

You can build it manually using this command from the current directory:

`make build-dockeRs`

Or pull from docker hub

`make pull-dockeRs`

Or run R from the docker image

`make run-dockeRs`

Or run package completeness

`make check-dockeRs`

## Uninstalled packages

### Spatial Packages

```R
[1] "Missing Spatial R packages are:"
 [1] "AMOEBA"         "areal"          "CARBayes"       "cartogram"     
 [5] "cartography"    "DCluster"       "geogrid"        "geojsonio"     
 [9] "geospt"         "ggsn"           "GWmodel"        "HSAR"          
[13] "latticeDensity" "lwgeom"         "mapedit"        "mapview"       
[17] "OasisR"         "OpenStreetMap"  "ows4R"          "PBSmapping"    
[21] "PBSmodelling"   "PReMiuM"        "qualmap"        "quickmapr"     
[25] "rnaturalearth"  "RPyGeo"         "RQGIS"          "sf"            
[29] "smerc"          "spacom"         "SpatialEpi"     "spatialprobit" 
[33] "spatialreg"     "spatsurv"       "spcosa"         "spdep"         
[37] "sphet"          "splm"           "spmoran"        "stars"         
[41] "stplanr"        "tidycensus"     "tigris"         "tmap"          
[1] "Installed packages: 150"
[1] "Not installed packages: 44"
[1] "Total packages: 194"
[1] "Installed percentage: 77.32 %"
```

### Spatiotemporal Packages

```R
[1] "Missing SpatioTemporal R packages are:"
 [1] "amt"            "anipaths"       "AtmRay"         "bsam"          
 [5] "CARBayesST"     "caribou"        "crawl"          "EMbC"          
 [9] "eyelinker"      "eyetracking"    "eyetrackingR"   "FLightR"       
[13] "foieGras"       "gazepath"       "lgcp"           "marcher"       
[17] "mdftracks"      "momentuHMM"     "mousetrack"     "mousetrap"     
[21] "movecost"       "moveVis"        "moveWindSpeed"  "oce"           
[25] "opentraj"       "psyosphere"     "recurse"        "rerddapXtracto"
[29] "riverdist"      "rpostgisLT"     "rsMove"         "saccades"      
[33] "SDLfilter"      "sf"             "SiMRiv"         "smam"          
[37] "SpaTimeClus"    "spatsoc"        "sphet"          "splm"          
[41] "stampr"         "stplanr"        "trackdem"       "trackdf"       
[45] "trackeRapp"     "trajectories"   "trajr"         
[1] "Installed packages: 57"
[1] "Not installed packages: 47"
[1] "Total packages: 104"
[1] "Installed percentage: 54.81 %"
```

## Errors

### `sf`

```R
> install.packages('sf')
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 7975k  100 7975k    0     0  83569      0  0:01:37  0:01:37 --:--:--  175k
* installing *source* package ‘sf’ ...
** package ‘sf’ successfully unpacked and MD5 sums checked
configure: CC: gcc -std=gnu99
configure: CXX: g++ -std=gnu++11
checking for gdal-config... /usr/bin/gdal-config
checking gdal-config usability... yes
configure: GDAL: 2.3.2
checking GDAL version >= 2.0.0... yes
checking for gcc... gcc -std=gnu99
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc -std=gnu99 accepts -g... yes
checking for gcc -std=gnu99 option to accept ISO C89... none needed
checking how to run the C preprocessor... gcc -std=gnu99 -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking gdal.h usability... yes
checking gdal.h presence... yes
checking for gdal.h... yes
checking GDAL: linking with --libs only... yes
checking GDAL: /usr/share/gdal/pcs.csv readable... yes
checking GDAL: checking whether PROJ is available for linking:... yes
checking GDAL: checking whether PROJ is available fur running:... yes
configure: pkg-config proj exists, will use it
checking proj_api.h usability... no
checking proj_api.h presence... no
checking for proj_api.h... no
configure: error: proj_api.h not found in standard or given locations.
ERROR: configuration failed for package ‘sf’
```