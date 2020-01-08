# MRO 3.5.3 on Ubuntu with Geospatial R Packages

You can build it manually using this command from the current directory:

`make build-dockeRs`

Or pull from docker hub

`make pull-dockeRs`

Or run R from the docker image

`make run-dockeRs`

## Uninstalled packages

### Spatial Packages

```bash
[1] "Missing Spatial R packages are:"
[1] "geospt"            "OpenStreetMap"     "spatsurv"         
[4] "spcosa"            "UScensus2000tract"
[1] "Installed packages: 189"
[1] "Not installed packages: 5"
[1] "Total packages: 194"
[1] "Installed percentage: 97.42 %"
```

### SpatioTemporal Packages

```bash
[1] "Missing SpatioTemporal R packages are:"
 [1] "amt"            "anipaths"       "AtmRay"         "bsam"          
 [5] "caribou"        "EMbC"           "eyelinker"      "eyetracking"   
 [9] "eyetrackingR"   "foieGras"       "gazepath"       "lgcp"          
[13] "marcher"        "mdftracks"      "momentuHMM"     "mousetrack"    
[17] "mousetrap"      "movecost"       "moveVis"        "moveWindSpeed" 
[21] "oce"            "opentraj"       "psyosphere"     "recurse"       
[25] "rerddapXtracto" "riverdist"      "rpostgisLT"     "rsMove"        
[29] "saccades"       "SDLfilter"      "SiMRiv"         "SpaTimeClus"   
[33] "spatsoc"        "stampr"         "trackdem"       "trackdf"       
[37] "trackeRapp"     "trajectories"   "trajr"       

[1] "Installed packages: 65"
[1] "Not installed packages: 39"
[1] "Total packages: 104"
[1] "Installed percentage: 62.5 %"
```
