# TERR 5.0.0 on Debian with Geospatial packages

You can build it manually using this command from the current directory:

`make build-dockeRs`

Or run R from the docker image

`make run-dockeRs`

Or run package completeness

`make check-dockeRs`

## Uninstalled packages

### Spatial Packages

TBA

### Spatiotemporal Packages

TBA

## Problem

Can not install `sf`. The error message:
```
checking GDAL: checking whether PROJ is available fur running:... ./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/libgdal.so.20)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/libgdal.so.20)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/libgdal.so.20)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/libgdal.so.20)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/x86_64-linux-gnu/libdap.so.23)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/x86_64-linux-gnu/libdap.so.23)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/x86_64-linux-gnu/libdap.so.23)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/x86_64-linux-gnu/libspatialite.so.7)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/x86_64-linux-gnu/libspatialite.so.7)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/x86_64-linux-gnu/libspatialite.so.7)
./gdal_proj: /home/docker/tibco/lib/x86_64-unknown-linux-gnu/libxml2.so.2: no version information available (required by /usr/lib/x86_64-linux-gnu/libspatialite.so.7)
yes
configure: pkg-config proj exists, will use it
checking proj_api.h usability... yes
checking proj_api.h presence... yes
checking for proj_api.h... yes
configure: PROJ: 4.9.3
checking for pj_init_plus in -lproj... no
configure: error: libproj not found in standard or given locations.
* Removing directory 'sf' from library directory '/home/docker/tibco/site-library' because of installation error

```

I have installed `libproj-dev` and `libgdal-dev` though.

Another information:

- I can install `sf` on my TERR locally.
- I can install `sf` on GNU R on the same docker container (need to install it first, by running `apt install r-base`)
