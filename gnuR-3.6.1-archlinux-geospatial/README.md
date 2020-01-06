# GNU-R 3.6.1 on Arch Linux with Geospatial packages

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
[1] "Missing Spatial R packages are:"
 [1] "geojsonio"     "geoR"          "geoRglm"       "lawn"         
 [5] "OpenStreetMap" "PBSmodelling"  "rcosmo"        "RSurvey"      
 [9] "spatsurv"      "spcosa"       
[1] "Installed packages: 184"
[1] "Not installed packages: 10"
[1] "Total packages: 194"
[1] "Installed percentage: 94.85 %"
```

### Spatiotemporal Packages

```bash
[1] "Missing SpatioTemporal R packages are:"
[1] "crawl"      "lgcp"       "momentuHMM" "recurse"    "trackeRapp"
[1] "Installed packages: 99"
[1] "Not installed packages: 5"
[1] "Total packages: 104"
[1] "Installed percentage: 95.19 %"
```

TBA

### Errors

#### saga-gis

Not able to install saga-gis

```bash
libtool: compile:  g++ -std=gnu++11 -DHAVE_CONFIG_H -I. -I../../../.. -D_FORTIFY_SOURCE=2 -fPIC -I../../../../src/saga_core -I/usr/include -DUSE_GDAL_V2 -D_SAGA_LINUX -D_TYPEDEF_BYTE -D_TYPEDEF_WORD -fopenmp -lgomp -I/usr/lib/wx/include/gtk2-unicode-3.0 -I/usr/include/wx-3.0 -D_FILE_OFFSET_BITS=64 -DWXUSINGDLL -D__WXGTK__ -pthread -MT gdal_import_wms.lo -MD -MP -MF .deps/gdal_import_wms.Tpo -c gdal_import_wms.cpp -o gdal_import_wms.o >/dev/null 2>&1
make[5]: Leaving directory '/tmp/packages/saga-gis/src/saga-7.4.0/src/tools/io/io_gdal'
make[4]: *** [Makefile:412: all-recursive] Error 1
make[4]: Leaving directory '/tmp/packages/saga-gis/src/saga-7.4.0/src/tools/io'
make[3]: *** [Makefile:410: all-recursive] Error 1
make[3]: Leaving directory '/tmp/packages/saga-gis/src/saga-7.4.0/src/tools'
make[2]: *** [Makefile:410: all-recursive] Error 1
make[2]: Leaving directory '/tmp/packages/saga-gis/src/saga-7.4.0/src'
make[1]: *** [Makefile:516: all-recursive] Error 1
make[1]: Leaving directory '/tmp/packages/saga-gis/src/saga-7.4.0'
make: *** [Makefile:427: all] Error 2
==> ERROR: A failure occurred in build().
    Aborting...
The command '/bin/sh -c git clone https://aur.archlinux.org/saga-gis.git; cd saga-gis; makepkg -si --noconfirm;' returned a non-zero code: 4
```

#### v8

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
