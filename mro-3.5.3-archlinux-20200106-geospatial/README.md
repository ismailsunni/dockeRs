# MRO 3.5.3 on Arch Linux 20200106 with Geospatial packages

You can build it manually using this command from the current directory:

`make build-dockeRs`

Or pull from docker hub

`make pull-dockeRs`

Or run R from the docker image

`make run-dockeRs`

Or run package completeness

`make check-dockeRs`

## Uninstalled packages

### Core Spatial Packages

```bash
[1] "Missing Spatial R Core packages are:"
[1] "DCluster"   "rgdal"      "sf"         "spatialreg" "spdep"     
[1] "Installed core packages: 13"
[1] "Not installed core packages: 5"
[1] "Total core packages: 18"
[1] "Installed core percentage: 72.22 %"
```

### Core Spatiotemporal Packages

```bash
[1] "Missing SpatioTemporal R Core packages are:"
[1] "adehabitatLT" "surveillance" "trip"        
[1] "Installed core packages: 6"
[1] "Not installed core packages: 3"
[1] "Total core packages: 9"
[1] "Installed core percentage: 66.67 %"
```

## Errors

### `sf`

The problem is because in MRO installs the pinned version of `sf` (based on R 3.5.3) on the snapshot. It expects to have GDAL 2.x which still has `pcs.csv`. This file is removed in GDAL 3.0 which is the current version in the latest Arch Linux.

Alternative solutions:

- Restore the packages (GDAL) to a specific version that is compatible with `sf` on MRO 3.5.3. See [here](https://wiki.archlinux.org/index.php/Arch_Linux_Archive#How_to_downgrade_one_package)

```R
checking GDAL: linking with --libs only... yes
checking GDAL: /usr/share/gdal/pcs.csv readable... no
configure: error: pcs.csv not found in GDAL data directory.
ERROR: configuration failed for package ‘sf’
* removing ‘/usr/lib/R/library/sf’

The downloaded source packages are in
        ‘/tmp/RtmpFkTSMi/downloaded_packages’
Updating HTML index of packages in '.Library'
Making 'packages.html' ... done
Warning message:
In install.packages("sf") :
  installation of package ‘sf’ had non-zero exit status
```


### v8

Error in instaling `v8`

```bash
==> Starting prepare()...
  -> Using: /tmp/packages/v8/src/bin/python
  -> Fetching V8 code
[E2020-01-03T17:51:01.207200Z 1382 0 annotate.go:241] original error: mkdir /home/docker/.vpython-root: permission denied
[E2020-01-03T17:51:01.207225Z 1382 0 annotate.go:241] 
[E2020-01-03T17:51:01.207251Z 1382 0 annotate.go:241] goroutine 1:
[E2020-01-03T17:51:01.207260Z 1382 0 annotate.go:241] #0 go.chromium.org/luci/common/system/filesystem/filesystem.go:37 - filesystem.MakeDirs()
[E2020-01-03T17:51:01.207269Z 1382 0 annotate.go:241] #1 go.chromium.org/luci/vpython/venv/config.go:199 - venv.(*Config).makeEnv()
[E2020-01-03T17:51:01.207277Z 1382 0 annotate.go:241]   reason: could not create environment root: /home/docker/.vpython-root
[E2020-01-03T17:51:01.207287Z 1382 0 annotate.go:241] 
[E2020-01-03T17:51:01.207298Z 1382 0 annotate.go:241] #2 go.chromium.org/luci/vpython/venv/venv.go:150 - venv.With()
[E2020-01-03T17:51:01.207309Z 1382 0 annotate.go:241]   reason: failed to initialize empty probe environment
[E2020-01-03T17:51:01.207320Z 1382 0 annotate.go:241] 
[E2020-01-03T17:51:01.207329Z 1382 0 annotate.go:241] #3 go.chromium.org/luci/vpython/run.go:62 - vpython.Run()
[E2020-01-03T17:51:01.207340Z 1382 0 annotate.go:241] #4 go.chromium.org/luci/vpython/application/application.go:312 - application.(*application).mainImpl()
[E2020-01-03T17:51:01.207352Z 1382 0 annotate.go:241] #5 go.chromium.org/luci/vpython/application/application.go:397 - application.(*Config).Main.func1()
[E2020-01-03T17:51:01.207363Z 1382 0 annotate.go:241] #6 go.chromium.org/luci/vpython/application/support.go:46 - application.run()
[E2020-01-03T17:51:01.207374Z 1382 0 annotate.go:241] #7 go.chromium.org/luci/vpython/application/application.go:396 - application.(*Config).Main()
[E2020-01-03T17:51:01.207383Z 1382 0 annotate.go:241] #8 vpython/main.go:105 - main.mainImpl()
[E2020-01-03T17:51:01.207394Z 1382 0 annotate.go:241] #9 vpython/main.go:111 - main.main()
[E2020-01-03T17:51:01.207404Z 1382 0 annotate.go:241] #10 runtime/proc.go:203 - runtime.main()
[E2020-01-03T17:51:01.207416Z 1382 0 annotate.go:241] #11 runtime/asm_amd64.s:1357 - runtime.goexit()
==> ERROR: A failure occurred in prepare().
```

### geojsonio

```bash
** using staged installation
'config' variable 'CXXCPP' is deprecated
Using PKG_CFLAGS=-I/usr/include/v8 -I/usr/include/v8-3.14
Using PKG_LIBS=-lv8 -lv8_libplatform
------------------------- ANTICONF ERROR ---------------------------
Configuration failed because  was not found. Try installing:
 * deb: libv8-dev or libnode-dev (Debian / Ubuntu)
 * rpm: v8-devel (Fedora, EPEL)
 * brew: v8 (OSX)
 * csw: libv8_dev (Solaris)
To use a custom libv8, set INCLUDE_DIR and LIB_DIR manually via:
R CMD INSTALL --configure-vars='INCLUDE_DIR=... LIB_DIR=...'
--------------------------------------------------------------------
ERROR: configuration failed for package ‘V8’
* removing ‘/usr/lib/R/library/V8’
ERROR: dependency ‘V8’ is not available for package ‘geojsonio’
* removing ‘/usr/lib/R/library/geojsonio’

The downloaded source packages are in
        ‘/tmp/Rtmp3TRkug/downloaded_packages’
Warning messages:
1: In install.packages("geojsonio") :
  installation of package ‘V8’ had non-zero exit status
2: In install.packages("geojsonio") :
  installation of package ‘geojsonio’ had non-zero exit status
```

### geoR

```bash
rror: .onLoad failed in loadNamespace() for 'tcltk', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/usr/lib/R/library/tcltk/libs/tcltk.so':
  libtk8.6.so: cannot open shared object file: No such file or directory
Execution halted
ERROR: lazy loading failed for package ‘geoR’
* removing ‘/usr/lib/R/library/geoR’

The downloaded source packages are in
        ‘/tmp/Rtmp3TRkug/downloaded_packages’
Warning message:
In install.packages("geoR") :
  installation of package ‘geoR’ had non-zero exit status
```

### trackeRapp

```bash
* installing *source* package ‘V8’ ...
** package ‘V8’ successfully unpacked and MD5 sums checked
** using staged installation
'config' variable 'CXXCPP' is deprecated
Using PKG_CFLAGS=-I/usr/include/v8 -I/usr/include/v8-3.14
Using PKG_LIBS=-lv8 -lv8_libplatform
------------------------- ANTICONF ERROR ---------------------------
Configuration failed because  was not found. Try installing:
 * deb: libv8-dev or libnode-dev (Debian / Ubuntu)
 * rpm: v8-devel (Fedora, EPEL)
 * brew: v8 (OSX)
 * csw: libv8_dev (Solaris)
To use a custom libv8, set INCLUDE_DIR and LIB_DIR manually via:
R CMD INSTALL --configure-vars='INCLUDE_DIR=... LIB_DIR=...'
--------------------------------------------------------------------
ERROR: configuration failed for package ‘V8’
* removing ‘/usr/lib/R/library/V8’
ERROR: dependency ‘V8’ is not available for package ‘trackeRapp’
* removing ‘/usr/lib/R/library/trackeRapp’

The downloaded source packages are in
        ‘/tmp/Rtmp3TRkug/downloaded_packages’
Warning messages:
1: In install.packages("trackeRapp") :
  installation of package ‘V8’ had non-zero exit status
2: In install.packages("trackeRapp") :
  installation of package ‘trackeRapp’ had non-zero exit status
```

## SDSR benchmark problem

```bash
label: world (with options) 
List of 4
 $ fig.cap: chr "Earth country boundaries; left: mapping long/lat to x and y; right: as seen from space"
 $ fig    : logi TRUE
 $ echo   : logi FALSE
 $ message: logi FALSE

Quitting from lines 3029-3066 (sds.Rmd) 
Error in geos_op2_geom("intersection", x, y) : 
  st_crs(x) == st_crs(y) is not TRUE
Calls: <Anonymous> ... handle -> withCallingHandlers -> withVisible -> eval -> eval

Execution halted
```
