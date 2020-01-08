# GNU-R 3.6.1 on Debian with Geospatial packages

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
[1] "All Spatial R packages are installed."
[1] "Installed packages: 194"
[1] "Not installed packages: 0"
[1] "Total packages: 194"
[1] "Installed percentage: 100 %"
```

### SpatioTemporal Packages

```R
[1] "Missing SpatioTemporal R packages are:"
[1] "lgcp"
[1] "Installed packages: 103"
[1] "Not installed packages: 1"
[1] "Total packages: 104"
[1] "Installed percentage: 99.04 %"
```

## Errors

### lgcp

```bash
no DISPLAY variable so Tk is not available 
Error in structure(.External(.C_dotTcl, ...), class = "tclObj") : 
  [tcl] no display name and no $DISPLAY environment variable.

Error: unable to load R code in package ‘rpanel’
Execution halted
ERROR: lazy loading failed for package ‘rpanel’
* removing ‘/usr/local/lib/R/site-library/rpanel’
ERROR: dependency ‘rpanel’ is not available for package ‘lgcp’
* removing ‘/usr/local/lib/R/site-library/lgcp’

The downloaded source packages are in
	‘/tmp/RtmpFSKV62/downloaded_packages’
Warning messages:
1: In install.packages("lgcp") :
  installation of package ‘rpanel’ had non-zero exit status
2: In install.packages("lgcp") :
  installation of package ‘lgcp’ had non-zero exit status
> 
```
