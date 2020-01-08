# GNU-R 3.6.1 on Fedora with Geospatial packages

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

### Spatiotemporal Packages

```R
[1] "Missing SpatioTemporal R packages are:"
[1] "bsam"    "lgcp"    "moveVis" "recurse"
[1] "Installed packages: 100"
[1] "Not installed packages: 4"
[1] "Total packages: 104"
[1] "Installed percentage: 96.15 %"
```

Notes: `recurse` is installable, but not worked when building the docker image.

## Erros (some)

### bsam

```R
** package 'rjags' successfully unpacked and MD5 sums checked
** using staged installation
checking for pkg-config... /usr/bin/pkg-config
configure: WARNING: pkg-config file for jags 4 unavailable
configure: WARNING: Consider adding the directory containing `jags.pc`
configure: WARNING: to the PKG_CONFIG_PATH environment variable
configure: Attempting legacy configuration of rjags
checking for jags... no
configure: error: "automatic detection of JAGS failed. Please use pkg-config to locate the JAGS library. See the INSTALL file for details."
ERROR: configuration failed for package 'rjags'
* removing '/usr/lib64/R/library/rjags'
ERROR: dependency 'rjags' is not available for package 'bsam'
* removing '/usr/lib64/R/library/bsam'

The downloaded source packages are in
	'/tmp/Rtmpgx0clj/downloaded_packages'
Updating HTML index of packages in '.Library'
Warning messages:
1: In install.packages("bsam") :
  installation of package 'rjags' had non-zero exit status
2: In install.packages("bsam") :
  installation of package 'bsam' had non-zero exit status
3: In file.create(f.tg) :
  cannot create file '/usr/share/doc/R/html/packages.html', reason 'No such file or directory'
4: In make.packages.html(.Library) : cannot update HTML package index

```

### moveVis (merely missing deps)

```R
* installing *source* package 'av' ...
** package 'av' successfully unpacked and MD5 sums checked
** using staged installation
Using PKG_CFLAGS=
Using PKG_LIBS=-lavfilter
------------------------- ANTICONF ERROR ---------------------------
Configuration failed because libavfilter was not found. Try installing:
 * deb: libavfilter-dev (Debian, Ubuntu 18.04 and up)
 * rpm: ffmpeg-devel (https://rpmfusion.org) (Fedora, CentOS, RHEL)
 * csw: ffmpeg_dev (Solaris)
For Ubuntu versions Trusty (14.04) and Xenial (16.04) use this PPA:
   sudo add-apt-repository -y ppa:cran/ffmpeg-3
   sudo apt-get update
   sudo apt-get install -y libavfilter-dev
If libavfilter is already installed, check that 'pkg-config' is in your
PATH and PKG_CONFIG_PATH contains a libavfilter.pc file. If pkg-config
is unavailable you can set INCLUDE_DIR and LIB_DIR manually via:
R CMD INSTALL --configure-vars='INCLUDE_DIR=... LIB_DIR=...'
--------------------------------------------------------------------
ERROR: configuration failed for package 'av'
* removing '/usr/lib64/R/library/av'
ERROR: dependency 'av' is not available for package 'moveVis'
* removing '/usr/lib64/R/library/moveVis'

The downloaded source packages are in
	'/tmp/Rtmpgx0clj/downloaded_packages'
Updating HTML index of packages in '.Library'
Warning messages:
1: In install.packages("moveVis") :
  installation of package 'av' had non-zero exit status
2: In install.packages("moveVis") :
  installation of package 'moveVis' had non-zero exit status
3: In file.create(f.tg) :
  cannot create file '/usr/share/doc/R/html/packages.html', reason 'No such file or directory'
4: In make.packages.html(.Library) : cannot update HTML package index

```

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
