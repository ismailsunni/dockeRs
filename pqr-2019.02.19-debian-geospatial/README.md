# pqR 2019-02-19 on Debian with Geospatial

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

```bash
[1] "Checking Spatial and SpatioTemporal packages completeness"
 [1] "areal"              "CARBayes"           "cartography"       
 [4] "cleangeo"           "constrainedKriging" "cshapes"           
 [7] "dbmss"              "DSpat"              "ExceedanceTools"   
[10] "FRK"                "gdalUtils"          "geoaxe"            
[13] "geogrid"            "geojson"            "geojsonio"         
[16] "geometa"            "geonapi"            "geoR"              
[19] "geoRglm"            "georob"             "geosapi"           
[22] "geospt"             "geostatsp"          "ggsn"              
[25] "GWmodel"            "HSAR"               "inlmisc"           
[28] "ipdw"               "landsat"            "landscapemetrics"  
[31] "lawn"               "lctools"            "leaflet"           
[34] "leafletR"           "lwgeom"             "magclass"          
[37] "mapedit"            "mapmisc"            "mapview"           
[40] "marmap"             "ModelMap"           "ngspatial"         
[43] "OasisR"             "OpenStreetMap"      "ows4R"             
[46] "PBSmodelling"       "plotKML"            "postGIStools"      
[49] "PReMiuM"            "ProbitSpatial"      "qualmap"           
[52] "quickmapr"          "RandomFields"       "rangeMapper"       
[55] "rcosmo"             "recmap"             "rgrass7"           
[58] "rnaturalearth"      "RNetCDF"            "rpostgis"          
[61] "RPostgreSQL"        "RPyGeo"             "RQGIS"             
[64] "RSurvey"            "sf"                 "shp2graph"         
[67] "siplab"             "smacpod"            "smerc"             
[70] "spaMM"              "spatial.tools"      "SpatialPosition"   
[73] "spatialreg"         "SpatialTools"       "spatsurv"          
[76] "spBayes"            "spBayesSurv"        "spcosa"            
[79] "spind"              "spm"                "spsann"            
[82] "spselect"           "SSN"                "starma"            
[85] "stars"              "statebins"          "stplanr"           
[88] "tidycensus"         "tigris"             "tmap"              
[91] "UScensus2000cdp"    "UScensus2000tract" 
[1] "Installed packages: 102"
[1] "Not installed packages: 92"
[1] "Total packages: 194"
[1] "Installed percentage: 52.58 %"
```

### Spatiotemporal Packages

 ```bash
[1] "Missing SpatioTemporal R packages are:"
 [1] "amt"            "anipaths"       "bcpa"           "bsam"          
 [5] "CARBayesST"     "cshapes"        "ctmm"           "EMbC"          
 [9] "eyelinker"      "eyetrackingR"   "FLightR"        "foieGras"      
[13] "gapfill"        "IDE"            "lgcp"           "M3"            
[17] "marcher"        "mkde"           "momentuHMM"     "mousetrack"    
[21] "mousetrap"      "move"           "movecost"       "moveHMM"       
[25] "moveVis"        "moveWindSpeed"  "openair"        "opentraj"      
[29] "pbdNCDF4"       "plotKML"        "psyosphere"     "RandomFields"  
[33] "recurse"        "rerddapXtracto" "riverdist"      "rmatio"        
[37] "RNetCDF"        "rpostgisLT"     "rsatscan"       "rsMove"        
[41] "SDLfilter"      "sf"             "SiMRiv"         "smam"          
[45] "SpaTimeClus"    "spatsoc"        "spBayes"        "stampr"        
[49] "stplanr"        "surveillance"   "trackdem"       "trackdf"       
[53] "trackeR"        "trackeRapp"     "trajectories"   "trajr"         
[57] "VTrack"        
[1] "Installed packages: 47"
[1] "Not installed packages: 57"
[1] "Total packages: 104"
[1] "Installed percentage: 45.19 %"

 ```

## Discussion

 The main reason of failed packages instalation (e.g. `sf`, `stars`, `RQIS`)is the packages are not available for R version 2.15.1 (the base of pqR 2019.02.19).
 